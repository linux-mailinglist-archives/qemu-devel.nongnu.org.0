Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD0E73DA8E9
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 18:24:57 +0200 (CEST)
Received: from localhost ([::1]:50724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m98q8-0002Bf-DS
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 12:24:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1m98oT-000090-0d
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 12:23:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40845)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1m98oQ-0003rj-9a
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 12:23:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627575787;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E70hcumEd06EYROSNanewRw6T+3jhjiFt0oTiqiUHvE=;
 b=bB9U6H7OELNL2nweWspO6XpPvENBNPwKSkb1jRPROIZOl13qo4OCusSr2lqyvMwQ/jE4eg
 2IJbh8pjkY4U5mzc1CJr9n1hHP6EEvmgxh3Z50GwxLbbfYTG4gP6arRmapIQTZUlXVpvUq
 URBPjhMSp32wdEVtZuGbytOllEG9d/c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-141-CdS8qUppNuyFdQZxkglJPw-1; Thu, 29 Jul 2021 12:23:06 -0400
X-MC-Unique: CdS8qUppNuyFdQZxkglJPw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 727BF1006C81;
 Thu, 29 Jul 2021 16:23:04 +0000 (UTC)
Received: from localhost (unknown [10.39.194.40])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 551145D9CA;
 Thu, 29 Jul 2021 16:22:57 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL for-6.1 2/3] block/io_uring: resubmit when result is -EAGAIN
Date: Thu, 29 Jul 2021 17:22:38 +0100
Message-Id: <20210729162239.932125-3-stefanha@redhat.com>
In-Reply-To: <20210729162239.932125-1-stefanha@redhat.com>
References: <20210729162239.932125-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MIME_BASE64_TEXT=1.741, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Stefan Hajnoczi <stefanha@gmail.com>, Julia Suvorova <jusual@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Fabian Ebner <f.ebner@proxmox.com>, Aarushi Mehta <mehta.aaru20@gmail.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

RnJvbTogRmFiaWFuIEVibmVyIDxmLmVibmVyQHByb3htb3guY29tPgoKTGludXggU0NTSSBjYW4g
dGhyb3cgc3B1cmlvdXMgLUVBR0FJTiBpbiBzb21lIGNvcm5lciBjYXNlcyBpbiBpdHMKY29tcGxl
dGlvbiBwYXRoLCB3aGljaCB3aWxsIGVuZCB1cCBiZWluZyB0aGUgcmVzdWx0IGluIHRoZSBjb21w
bGV0ZWQKaW9fdXJpbmcgcmVxdWVzdC4KClJlc3VibWl0dGluZyBzdWNoIHJlcXVlc3RzIHNob3Vs
ZCBhbGxvdyBibG9jayBqb2JzIHRvIGNvbXBsZXRlLCBldmVuCmlmIHN1Y2ggc3B1cmlvdXMgZXJy
b3JzIGFyZSBlbmNvdW50ZXJlZC4KCkNvLWF1dGhvcmVkLWJ5OiBTdGVmYW4gSGFqbm9jemkgPHN0
ZWZhbmhhQGdtYWlsLmNvbT4KUmV2aWV3ZWQtYnk6IFN0ZWZhbm8gR2FyemFyZWxsYSA8c2dhcnph
cmVAcmVkaGF0LmNvbT4KU2lnbmVkLW9mZi1ieTogRmFiaWFuIEVibmVyIDxmLmVibmVyQHByb3ht
b3guY29tPgpNZXNzYWdlLWlkOiAyMDIxMDcyOTA5MTAyOS42NTM2OS0xLWYuZWJuZXJAcHJveG1v
eC5jb20KU2lnbmVkLW9mZi1ieTogU3RlZmFuIEhham5vY3ppIDxzdGVmYW5oYUByZWRoYXQuY29t
PgotLS0KIGJsb2NrL2lvX3VyaW5nLmMgfCAxNiArKysrKysrKysrKysrKystCiAxIGZpbGUgY2hh
bmdlZCwgMTUgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2Jsb2Nr
L2lvX3VyaW5nLmMgYi9ibG9jay9pb191cmluZy5jCmluZGV4IDAwYTNlZTlmYjguLmRmYTQ3NWNj
ODcgMTAwNjQ0Ci0tLSBhL2Jsb2NrL2lvX3VyaW5nLmMKKysrIGIvYmxvY2svaW9fdXJpbmcuYwpA
QCAtMTY1LDcgKzE2NSwyMSBAQCBzdGF0aWMgdm9pZCBsdXJpbmdfcHJvY2Vzc19jb21wbGV0aW9u
cyhMdXJpbmdTdGF0ZSAqcykKICAgICAgICAgdG90YWxfYnl0ZXMgPSByZXQgKyBsdXJpbmdjYi0+
dG90YWxfcmVhZDsKIAogICAgICAgICBpZiAocmV0IDwgMCkgewotICAgICAgICAgICAgaWYgKHJl
dCA9PSAtRUlOVFIpIHsKKyAgICAgICAgICAgIC8qCisgICAgICAgICAgICAgKiBPbmx5IHdyaXRl
di9yZWFkdi9mc3luYyByZXF1ZXN0cyBvbiByZWd1bGFyIGZpbGVzIG9yIGhvc3QgYmxvY2sKKyAg
ICAgICAgICAgICAqIGRldmljZXMgYXJlIHN1Ym1pdHRlZC4gVGhlcmVmb3JlIC1FQUdBSU4gaXMg
bm90IGV4cGVjdGVkIGJ1dCBpdCdzCisgICAgICAgICAgICAgKiBrbm93biB0byBoYXBwZW4gc29t
ZXRpbWVzIHdpdGggTGludXggU0NTSS4gU3VibWl0IGFnYWluIGFuZCBob3BlCisgICAgICAgICAg
ICAgKiB0aGUgcmVxdWVzdCBjb21wbGV0ZXMgc3VjY2Vzc2Z1bGx5LgorICAgICAgICAgICAgICoK
KyAgICAgICAgICAgICAqIEZvciBtb3JlIGluZm9ybWF0aW9uLCBzZWU6CisgICAgICAgICAgICAg
KiBodHRwczovL2xvcmUua2VybmVsLm9yZy9pby11cmluZy8yMDIxMDcyNzE2NTgxMS4yODQ1MTAt
My1heGJvZUBrZXJuZWwuZGsvVC8jdQorICAgICAgICAgICAgICoKKyAgICAgICAgICAgICAqIElm
IHRoZSBjb2RlIGlzIGNoYW5nZWQgdG8gc3VibWl0IG90aGVyIHR5cGVzIG9mIHJlcXVlc3RzIGlu
IHRoZQorICAgICAgICAgICAgICogZnV0dXJlLCB0aGVuIHRoaXMgd29ya2Fyb3VuZCBtYXkgbmVl
ZCB0byBiZSBleHRlbmRlZCB0byBkZWFsIHdpdGgKKyAgICAgICAgICAgICAqIGdlbnVpbmUgLUVB
R0FJTiByZXN1bHRzIHRoYXQgc2hvdWxkIG5vdCBiZSByZXN1Ym1pdHRlZAorICAgICAgICAgICAg
ICogaW1tZWRpYXRlbHkuCisgICAgICAgICAgICAgKi8KKyAgICAgICAgICAgIGlmIChyZXQgPT0g
LUVJTlRSIHx8IHJldCA9PSAtRUFHQUlOKSB7CiAgICAgICAgICAgICAgICAgbHVyaW5nX3Jlc3Vi
bWl0KHMsIGx1cmluZ2NiKTsKICAgICAgICAgICAgICAgICBjb250aW51ZTsKICAgICAgICAgICAg
IH0KLS0gCjIuMzEuMQoK


