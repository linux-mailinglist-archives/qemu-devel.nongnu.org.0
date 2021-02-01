Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C39B730ABF2
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 16:51:50 +0100 (CET)
Received: from localhost ([::1]:48822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6bUT-0002jP-FP
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 10:51:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l6bSM-0000la-2s
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 10:49:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:53218)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l6bSK-0007mf-CV
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 10:49:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612194575;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=73uBYVRRcxgfeu3r32bOVLrje9nFitg8jGnSEEElw7A=;
 b=QF5hXX4y23vvyCKRupu8LQeG3q0MmZEl+pLvyIbVgwEcuFdIN4eBf171ztyIWt5FKOnM+0
 TMd01wPcmLznaHd1BzAeRIVXZUuP9w9SlAAqB/KeUmOYKe3IMTcXSpEUBJO0iLoHWgdC0T
 77q72hRTKCTYguFxZit1orUmGF6Hzrg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-426-P2xqJbWNMb6d6FcPsQFnlw-1; Mon, 01 Feb 2021 10:49:32 -0500
X-MC-Unique: P2xqJbWNMb6d6FcPsQFnlw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A63B010F551A;
 Mon,  1 Feb 2021 15:48:02 +0000 (UTC)
Received: from localhost (ovpn-115-140.ams2.redhat.com [10.36.115.140])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9A81336FA;
 Mon,  1 Feb 2021 15:48:01 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 07/11] error: rename error_with_timestamp to
 message_with_timestamp
Date: Mon,  1 Feb 2021 15:46:59 +0000
Message-Id: <20210201154703.180022-8-stefanha@redhat.com>
In-Reply-To: <20210201154703.180022-1-stefanha@redhat.com>
References: <20210201154703.180022-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

VGhlIC1tc2cgdGltZXN0YW1wPW9ufG9mZiBvcHRpb24gY29udHJvbHMgd2hldGhlciBhIHRpbWVz
dGFtcCBpcyBwcmludGVkCndpdGggZXJyb3JfcmVwb3J0KCkgbWVzc2FnZXMuIFRoZSAiLW1zZyIg
bmFtZSBzdWdnZXN0cyB0aGF0IHRoaXMgb3B0aW9uCmhhcyBhIHdpZGVyIGVmZmVjdCB0aGFuIGp1
c3QgZXJyb3JfcmVwb3J0KCkuIFRoZSBuZXh0IHBhdGNoIGV4dGVuZHMgaXQKdG8gdGhlICdsb2cn
IHRyYWNlIGJhY2tlbmQsIHNvIHJlbmFtZSB0aGUgdmFyaWFibGUgZnJvbQplcnJvcl93aXRoX3Rp
bWVzdGFtcCB0byBtZXNzYWdlX3dpdGhfdGltZXN0YW1wLgoKU2lnbmVkLW9mZi1ieTogU3RlZmFu
IEhham5vY3ppIDxzdGVmYW5oYUByZWRoYXQuY29tPgpUZXN0ZWQtYnk6IFBoaWxpcHBlIE1hdGhp
ZXUtRGF1ZMOpIDxwaGlsbWRAcmVkaGF0LmNvbT4KVGVzdGVkLWJ5OiBCQUxBVE9OIFpvbHRhbiA8
YmFsYXRvbkBlaWsuYm1lLmh1PgpSZXZpZXdlZC1ieTogUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kg
PHBoaWxtZEByZWRoYXQuY29tPgpNZXNzYWdlLWlkOiAyMDIxMDEyNTExMzUwNy4yMjQyODctMi1z
dGVmYW5oYUByZWRoYXQuY29tClNpZ25lZC1vZmYtYnk6IFN0ZWZhbiBIYWpub2N6aSA8c3RlZmFu
aGFAcmVkaGF0LmNvbT4KLS0tCiBpbmNsdWRlL3FlbXUvZXJyb3ItcmVwb3J0LmggfCAyICstCiBz
b2Z0bW11L3ZsLmMgICAgICAgICAgICAgICAgfCAyICstCiB1dGlsL3FlbXUtZXJyb3IuYyAgICAg
ICAgICAgfCA0ICsrLS0KIDMgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL2luY2x1ZGUvcWVtdS9lcnJvci1yZXBvcnQuaCBiL2luY2x1
ZGUvcWVtdS9lcnJvci1yZXBvcnQuaAppbmRleCBhNWFkOTVmZjFiLi45ZDE5N2RhY2EzIDEwMDY0
NAotLS0gYS9pbmNsdWRlL3FlbXUvZXJyb3ItcmVwb3J0LmgKKysrIGIvaW5jbHVkZS9xZW11L2Vy
cm9yLXJlcG9ydC5oCkBAIC03NCw3ICs3NCw3IEBAIHZvaWQgZXJyb3JfaW5pdChjb25zdCBjaGFy
ICphcmd2MCk7CiAKIGNvbnN0IGNoYXIgKmVycm9yX2dldF9wcm9nbmFtZSh2b2lkKTsKIAotZXh0
ZXJuIGJvb2wgZXJyb3Jfd2l0aF90aW1lc3RhbXA7CitleHRlcm4gYm9vbCBtZXNzYWdlX3dpdGhf
dGltZXN0YW1wOwogZXh0ZXJuIGJvb2wgZXJyb3Jfd2l0aF9ndWVzdG5hbWU7CiBleHRlcm4gY29u
c3QgY2hhciAqZXJyb3JfZ3Vlc3RfbmFtZTsKIApkaWZmIC0tZ2l0IGEvc29mdG1tdS92bC5jIGIv
c29mdG1tdS92bC5jCmluZGV4IGE4ODc2Yjg5NjUuLmJkNTU0Njg2NjkgMTAwNjQ0Ci0tLSBhL3Nv
ZnRtbXUvdmwuYworKysgYi9zb2Z0bW11L3ZsLmMKQEAgLTczNyw3ICs3MzcsNyBAQCBzdGF0aWMg
dm9pZCByZWFsdGltZV9pbml0KHZvaWQpCiAKIHN0YXRpYyB2b2lkIGNvbmZpZ3VyZV9tc2coUWVt
dU9wdHMgKm9wdHMpCiB7Ci0gICAgZXJyb3Jfd2l0aF90aW1lc3RhbXAgPSBxZW11X29wdF9nZXRf
Ym9vbChvcHRzLCAidGltZXN0YW1wIiwgZmFsc2UpOworICAgIG1lc3NhZ2Vfd2l0aF90aW1lc3Rh
bXAgPSBxZW11X29wdF9nZXRfYm9vbChvcHRzLCAidGltZXN0YW1wIiwgZmFsc2UpOwogICAgIGVy
cm9yX3dpdGhfZ3Vlc3RuYW1lID0gcWVtdV9vcHRfZ2V0X2Jvb2wob3B0cywgImd1ZXN0LW5hbWUi
LCBmYWxzZSk7CiB9CiAKZGlmZiAtLWdpdCBhL3V0aWwvcWVtdS1lcnJvci5jIGIvdXRpbC9xZW11
LWVycm9yLmMKaW5kZXggYWEzMGYwMzU2NC4uNTJhOWUwMTNjNCAxMDA2NDQKLS0tIGEvdXRpbC9x
ZW11LWVycm9yLmMKKysrIGIvdXRpbC9xZW11LWVycm9yLmMKQEAgLTI1LDcgKzI1LDcgQEAgdHlw
ZWRlZiBlbnVtIHsKIH0gcmVwb3J0X3R5cGU7CiAKIC8qIFByZXBlbmQgdGltZXN0YW1wIHRvIG1l
c3NhZ2VzICovCi1ib29sIGVycm9yX3dpdGhfdGltZXN0YW1wOworYm9vbCBtZXNzYWdlX3dpdGhf
dGltZXN0YW1wOwogYm9vbCBlcnJvcl93aXRoX2d1ZXN0bmFtZTsKIGNvbnN0IGNoYXIgKmVycm9y
X2d1ZXN0X25hbWU7CiAKQEAgLTIwOCw3ICsyMDgsNyBAQCBzdGF0aWMgdm9pZCB2cmVwb3J0KHJl
cG9ydF90eXBlIHR5cGUsIGNvbnN0IGNoYXIgKmZtdCwgdmFfbGlzdCBhcCkKICAgICBHVGltZVZh
bCB0djsKICAgICBnY2hhciAqdGltZXN0cjsKIAotICAgIGlmIChlcnJvcl93aXRoX3RpbWVzdGFt
cCAmJiAhbW9uaXRvcl9jdXIoKSkgeworICAgIGlmIChtZXNzYWdlX3dpdGhfdGltZXN0YW1wICYm
ICFtb25pdG9yX2N1cigpKSB7CiAgICAgICAgIGdfZ2V0X2N1cnJlbnRfdGltZSgmdHYpOwogICAg
ICAgICB0aW1lc3RyID0gZ190aW1lX3ZhbF90b19pc284NjAxKCZ0dik7CiAgICAgICAgIGVycm9y
X3ByaW50ZigiJXMgIiwgdGltZXN0cik7Ci0tIAoyLjI5LjIKCg==


