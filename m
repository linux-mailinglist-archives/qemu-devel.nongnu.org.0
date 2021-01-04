Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81B1A2E975A
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jan 2021 15:35:44 +0100 (CET)
Received: from localhost ([::1]:42734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwQxT-0007q2-1S
	for lists+qemu-devel@lfdr.de; Mon, 04 Jan 2021 09:35:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kwQu0-00069k-Bd
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 09:32:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:22090)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kwQty-0000xf-Iw
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 09:32:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609770725;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=FRGseRQ7AbIyAlQSXliVXp2Z/j0bgPMaJyD1eVTBneU=;
 b=iU/wXPjx6FJQ1d4S8rz4uMcbTW6nsUgNU86JD6Ru0J6j68LBnofXQY7woZeHet1mVBN+3L
 VJR8+2j0jZUPNpknH017d8z9apTROEh5f86cbdpu7zVzB0RwStpl//IO9exymxtZZlBvue
 nHpOlgg9a48WXexmDkwkybCjpavIHK8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-496-lNk9E8a7MnSzKLG8yhBIFA-1; Mon, 04 Jan 2021 09:32:00 -0500
X-MC-Unique: lNk9E8a7MnSzKLG8yhBIFA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 097C8800D53;
 Mon,  4 Jan 2021 14:31:59 +0000 (UTC)
Received: from localhost (ovpn-113-37.ams2.redhat.com [10.36.113.37])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 303CC60BE5;
 Mon,  4 Jan 2021 14:31:54 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/5] Tracing patches
Date: Mon,  4 Jan 2021 14:31:49 +0000
Message-Id: <20210104143154.462212-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

VGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCA0MTE5MmRiMzM4NTg4MDUxZjIxNTAx
YWJjMTM3NDNlNjJiMGE1NjA1Og0KDQogIE1lcmdlIHJlbW90ZS10cmFja2luZyBicmFuY2ggJ3Jl
bW90ZXMvZWhhYmtvc3QtZ2wvdGFncy9tYWNoaW5lLW5leHQtcHVsbC1yZXF1ZXN0JyBpbnRvIHN0
YWdpbmcgKDIwMjEtMDEtMDEgMjI6NTc6MTUgKzAwMDApDQoNCmFyZSBhdmFpbGFibGUgaW4gdGhl
IEdpdCByZXBvc2l0b3J5IGF0Og0KDQogIGh0dHBzOi8vZ2l0bGFiLmNvbS9zdGVmYW5oYS9xZW11
LmdpdCB0YWdzL3RyYWNpbmctcHVsbC1yZXF1ZXN0DQoNCmZvciB5b3UgdG8gZmV0Y2ggY2hhbmdl
cyB1cCB0byA3ZmI0OGMwZWUxYmJmNWNjNGM5MDVlOTAwYjA1NDA5NjI1MGU5ZjM5Og0KDQogIHRy
YWNldG9vbDogc2hvdyB0cmFjZS1ldmVudHMgZmlsZW5hbWUvbGluZW5vIGluIGZtdCBzdHJpbmcg
ZXJyb3JzICgyMDIxLTAxLTA0IDE0OjI0OjU4ICswMDAwKQ0KDQotLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQpQdWxsIHJlcXVl
c3QNCg0KU2hvdyB0cmFjZS1ldmVudHMgZmlsZW5hbWUvbGluZW5vIGluIGZtdCBzdHJpbmcgZXJy
b3JzIGFuZCBzZW5kIC1kIHRyYWNlOmhlbHANCm91dHB1dCB0byBzdGRvdXQgZm9yIGNvbnNpc3Rl
bmN5Lg0KDQotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tDQoNCkRvdWcgRXZhbnMgKDEpOg0KICB0cmFjZTogU2VuZCAiLWQgdHJh
Y2U6aGVscCIgb3V0cHV0IHRvIHN0ZG91dA0KDQpTdGVmYW4gSGFqbm9jemkgKDQpOg0KICB0cmFj
ZXRvb2w6IGFkZCBvdXRwdXQgZmlsZW5hbWUgY29tbWFuZC1saW5lIGFyZ3VtZW50DQogIHRyYWNl
dG9vbDogYWRkIG91dF9saW5lbm8gYW5kIG91dF9uZXh0X2xpbmVubyB0byBvdXQoKQ0KICB0cmFj
ZXRvb2w6IGFkZCBpbnB1dCBmaWxlbmFtZSBhbmQgbGluZSBudW1iZXIgdG8gRXZlbnQNCiAgdHJh
Y2V0b29sOiBzaG93IHRyYWNlLWV2ZW50cyBmaWxlbmFtZS9saW5lbm8gaW4gZm10IHN0cmluZyBl
cnJvcnMNCg0KIGRvY3MvZGV2ZWwvdHJhY2luZy50eHQgICAgICAgICAgICAgIHwgIDMgKy0NCiBt
ZXNvbi5idWlsZCAgICAgICAgICAgICAgICAgICAgICAgICB8ICAzICstDQogdHJhY2UvY29udHJv
bC5oICAgICAgICAgICAgICAgICAgICAgfCAgMyArLQ0KIHRyYWNlL2NvbnRyb2wuYyAgICAgICAg
ICAgICAgICAgICAgIHwgMTIgKysrLS0tLQ0KIHNjcmlwdHMvdHJhY2V0b29sLnB5ICAgICAgICAg
ICAgICAgIHwgMTIgKysrKy0tLQ0KIHNjcmlwdHMvdHJhY2V0b29sL19faW5pdF9fLnB5ICAgICAg
IHwgNTMgKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0NCiBzY3JpcHRzL3RyYWNldG9vbC9i
YWNrZW5kL2Z0cmFjZS5weSB8ICA0ICsrKw0KIHNjcmlwdHMvdHJhY2V0b29sL2JhY2tlbmQvbG9n
LnB5ICAgIHwgIDQgKysrDQogc2NyaXB0cy90cmFjZXRvb2wvYmFja2VuZC9zeXNsb2cucHkgfCAg
NCArKysNCiB0cmFjZS9tZXNvbi5idWlsZCAgICAgICAgICAgICAgICAgICB8IDIxICsrKystLS0t
LS0tLQ0KIDEwIGZpbGVzIGNoYW5nZWQsIDgzIGluc2VydGlvbnMoKyksIDM2IGRlbGV0aW9ucygt
KQ0KDQotLSANCjIuMjkuMg0KDQo=


