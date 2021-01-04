Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21D032E9732
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jan 2021 15:25:39 +0100 (CET)
Received: from localhost ([::1]:34736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwQni-00043H-5D
	for lists+qemu-devel@lfdr.de; Mon, 04 Jan 2021 09:25:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kwQlX-0002fe-GI
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 09:23:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:53980)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kwQlV-0006JE-Tj
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 09:23:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609770200;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NV3wRtHJvfSofd6wt7m1krpaUvC5iIObOvg/qGbj0Xk=;
 b=aPaLr6yhrUW1xpWeB50K9Su1ZG9hz3GU6ZwxF3YRoGFRZDVMwz8+gEgTyroHlL4lyARgLG
 ewXfTulzwHT87x2hnI84ZhEAoRkFcc02ixZKbC3QGP8CxZOYD7YW/jzEP/m/QbEGaHsxNw
 +TlH9YiTpd/njcshxQfeOw/Kkc5IxW8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-480-6XO5_qk_PYOzaC5C4UwzIA-1; Mon, 04 Jan 2021 09:23:16 -0500
X-MC-Unique: 6XO5_qk_PYOzaC5C4UwzIA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 93ECB8143EA;
 Mon,  4 Jan 2021 14:23:15 +0000 (UTC)
Received: from localhost (ovpn-113-37.ams2.redhat.com [10.36.113.37])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 47C7960C04;
 Mon,  4 Jan 2021 14:23:11 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 1/1] readline: Fix possible array index out of bounds in
 readline_hist_add()
Date: Mon,  4 Jan 2021 14:23:04 +0000
Message-Id: <20210104142304.461097-2-stefanha@redhat.com>
In-Reply-To: <20210104142304.461097-1-stefanha@redhat.com>
References: <20210104142304.461097-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MIME_BASE64_TEXT=1.741, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Alex Chen <alex.chen@huawei.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 qemu-block@nongnu.org, Euler Robot <euler.robot@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

RnJvbTogQWxleCBDaGVuIDxhbGV4LmNoZW5AaHVhd2VpLmNvbT4KCldoZW4gdGhlICdjbWRsaW5l
JyBpcyB0aGUgbGFzdCBlbnRyeSBpbiAncnMtPmhpc3RvcnknIGFycmF5LCB0aGVyZSBpcwpubyBu
ZWVkIHRvIHB1dCB0aGlzIGVudHJ5IHRvIHRoZSBlbmQgb2YgdGhlIGFycmF5LCBwYXJ0bHkgYmVj
YXVzZSBpdCBpcwp0aGUgbGFzdCBlbnRyeSwgYW5kIHBhcnRseSBiZWNhdXNlIHRoZSBuZXh0IG9w
ZXJpdGlvbiB3aWxsIGxlYWQgdG8gYXJyYXkKaW5kZXggb3V0IG9mIGJvdW5kcy4KClJlcG9ydGVk
LWJ5OiBFdWxlciBSb2JvdCA8ZXVsZXIucm9ib3RAaHVhd2VpLmNvbT4KU2lnbmVkLW9mZi1ieTog
QWxleCBDaGVuIDxhbGV4LmNoZW5AaHVhd2VpLmNvbT4KTWVzc2FnZS1pZDogMjAyMDEyMDMxMzUw
NDMuMTE3MDcyLTEtYWxleC5jaGVuQGh1YXdlaS5jb20KU2lnbmVkLW9mZi1ieTogU3RlZmFuIEhh
am5vY3ppIDxzdGVmYW5oYUByZWRoYXQuY29tPgotLS0KIHV0aWwvcmVhZGxpbmUuYyB8IDMgKysr
CiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvdXRpbC9yZWFk
bGluZS5jIGIvdXRpbC9yZWFkbGluZS5jCmluZGV4IGU1MzQ0NjBkYTYuLmYxYWM2ZTQ3NjkgMTAw
NjQ0Ci0tLSBhL3V0aWwvcmVhZGxpbmUuYworKysgYi91dGlsL3JlYWRsaW5lLmMKQEAgLTI0MCw2
ICsyNDAsOSBAQCBzdGF0aWMgdm9pZCByZWFkbGluZV9oaXN0X2FkZChSZWFkTGluZVN0YXRlICpy
cywgY29uc3QgY2hhciAqY21kbGluZSkKICAgICAgICAgfQogICAgICAgICBpZiAoc3RyY21wKGhp
c3RfZW50cnksIGNtZGxpbmUpID09IDApIHsKICAgICAgICAgc2FtZV9lbnRyeToKKyAgICAgICAg
ICAgIGlmIChpZHggPT0gUkVBRExJTkVfTUFYX0NNRFMgLSAxKSB7CisgICAgICAgICAgICAgICAg
cmV0dXJuOworICAgICAgICAgICAgfQogICAgICAgICAgICAgbmV3X2VudHJ5ID0gaGlzdF9lbnRy
eTsKICAgICAgICAgICAgIC8qIFB1dCB0aGlzIGVudHJ5IGF0IHRoZSBlbmQgb2YgaGlzdG9yeSAq
LwogICAgICAgICAgICAgbWVtbW92ZSgmcnMtPmhpc3RvcnlbaWR4XSwgJnJzLT5oaXN0b3J5W2lk
eCArIDFdLAotLSAKMi4yOS4yCgo=


