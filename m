Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA27F30AC13
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 16:55:56 +0100 (CET)
Received: from localhost ([::1]:33010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6bYR-00085n-VL
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 10:55:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l6bSQ-0000uS-0C
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 10:49:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30282)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l6bSO-0007oR-Aj
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 10:49:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612194579;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=V2siTzbf01pyuThv++BE9dEp37MxGwow0EfIN02qHnE=;
 b=Z27I05DS1TBDBhkaqTNcLsVGzat0RO7Ut6Vq3vUR0ol2ytb1fOl66YSn8lkQr52LErec4O
 AkDxMjC5CRF0M8ssdfiGqJVsVvDRvF45+C/TiNkusWZKMRAATTwlBBZVd0zr2rZHX9G5ar
 o826pSoU101z7JdcLtXuXw/t6NaBTN0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-491-GWrWrRUSNZS_-tPLajmRKA-1; Mon, 01 Feb 2021 10:49:35 -0500
X-MC-Unique: GWrWrRUSNZS_-tPLajmRKA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4942A10F6F83;
 Mon,  1 Feb 2021 15:48:04 +0000 (UTC)
Received: from localhost (ovpn-115-140.ams2.redhat.com [10.36.115.140])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D369D5DA6F;
 Mon,  1 Feb 2021 15:48:03 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 08/11] trace: make the 'log' backend timestamp configurable
Date: Mon,  1 Feb 2021 15:47:00 +0000
Message-Id: <20210201154703.180022-9-stefanha@redhat.com>
In-Reply-To: <20210201154703.180022-1-stefanha@redhat.com>
References: <20210201154703.180022-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

VGltZXN0YW1wcyBpbiB0cmFjaW5nIG91dHB1dCBjYW4gYmUgZGlzdHJhY3RpbmcuIE1ha2UgaXQg
cG9zc2libGUgdG8KY29udHJvbCB0aWQvdGltZXN0YW1wIHByaW50aW5nIHdpdGggLW1zZyB0aW1l
c3RhbXA9b258b2ZmLiBUaGUgZGVmYXVsdAppcyBubyB0aWQvdGltZXN0YW1wcy4gUHJldmlvdXNs
eSB0aGV5IHdlcmUgYWx3YXlzIHByaW50ZWQuCgpTdWdnZXN0ZWQtYnk6IEJBTEFUT04gWm9sdGFu
IDxiYWxhdG9uQGVpay5ibWUuaHU+ClNpZ25lZC1vZmYtYnk6IFN0ZWZhbiBIYWpub2N6aSA8c3Rl
ZmFuaGFAcmVkaGF0LmNvbT4KVGVzdGVkLWJ5OiBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSA8cGhp
bG1kQHJlZGhhdC5jb20+ClRlc3RlZC1ieTogQkFMQVRPTiBab2x0YW4gPGJhbGF0b25AZWlrLmJt
ZS5odT4KUmV2aWV3ZWQtYnk6IFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIDxwaGlsbWRAcmVkaGF0
LmNvbT4KTWVzc2FnZS1pZDogMjAyMTAxMjUxMTM1MDcuMjI0Mjg3LTMtc3RlZmFuaGFAcmVkaGF0
LmNvbQpTaWduZWQtb2ZmLWJ5OiBTdGVmYW4gSGFqbm9jemkgPHN0ZWZhbmhhQHJlZGhhdC5jb20+
Ci0tLQogZG9jcy9kZXZlbC90cmFjaW5nLnJzdCAgICAgICAgICAgfCAgMyArKysKIHNjcmlwdHMv
dHJhY2V0b29sL2JhY2tlbmQvbG9nLnB5IHwgMTkgKysrKysrKysrKysrKy0tLS0tLQogMiBmaWxl
cyBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L2RvY3MvZGV2ZWwvdHJhY2luZy5yc3QgYi9kb2NzL2RldmVsL3RyYWNpbmcucnN0CmluZGV4IDRl
YmY4ZTM4ZWEuLmFmMzk1ZTk1N2QgMTAwNjQ0Ci0tLSBhL2RvY3MvZGV2ZWwvdHJhY2luZy5yc3QK
KysrIGIvZG9jcy9kZXZlbC90cmFjaW5nLnJzdApAQCAtMjI0LDYgKzIyNCw5IEBAIGVmZmVjdGl2
ZWx5IHR1cm5zIHRyYWNlIGV2ZW50cyBpbnRvIGRlYnVnIHByaW50ZnMuCiBUaGlzIGlzIHRoZSBz
aW1wbGVzdCBiYWNrZW5kIGFuZCBjYW4gYmUgdXNlZCB0b2dldGhlciB3aXRoIGV4aXN0aW5nIGNv
ZGUgdGhhdAogdXNlcyBEUFJJTlRGKCkuCiAKK1RoZSAtbXNnIHRpbWVzdGFtcD1vbnxvZmYgY29t
bWFuZC1saW5lIG9wdGlvbiBjb250cm9scyB3aGV0aGVyIG9yIG5vdCB0byBwcmludAordGhlIHRp
ZC90aW1lc3RhbXAgcHJlZml4IGZvciBlYWNoIHRyYWNlIGV2ZW50LgorCiBTaW1wbGV0cmFjZQog
LS0tLS0tLS0tLS0KIApkaWZmIC0tZ2l0IGEvc2NyaXB0cy90cmFjZXRvb2wvYmFja2VuZC9sb2cu
cHkgYi9zY3JpcHRzL3RyYWNldG9vbC9iYWNrZW5kL2xvZy5weQppbmRleCBiYzQzZGJiNGY0Li4x
N2JhMWNkOTBlIDEwMDY0NAotLS0gYS9zY3JpcHRzL3RyYWNldG9vbC9iYWNrZW5kL2xvZy5weQor
KysgYi9zY3JpcHRzL3RyYWNldG9vbC9iYWNrZW5kL2xvZy5weQpAQCAtMjAsNiArMjAsNyBAQCBQ
VUJMSUMgPSBUcnVlCiAKIGRlZiBnZW5lcmF0ZV9oX2JlZ2luKGV2ZW50cywgZ3JvdXApOgogICAg
IG91dCgnI2luY2x1ZGUgInFlbXUvbG9nLWZvci10cmFjZS5oIicsCisgICAgICAgICcjaW5jbHVk
ZSAicWVtdS9lcnJvci1yZXBvcnQuaCInLAogICAgICAgICAnJykKIAogCkBAIC0zNSwxNCArMzYs
MjAgQEAgZGVmIGdlbmVyYXRlX2goZXZlbnQsIGdyb3VwKToKICAgICAgICAgY29uZCA9ICJ0cmFj
ZV9ldmVudF9nZXRfc3RhdGUoJXMpIiAlICgiVFJBQ0VfIiArIGV2ZW50Lm5hbWUudXBwZXIoKSkK
IAogICAgIG91dCgnICAgIGlmICglKGNvbmQpcyAmJiBxZW11X2xvZ2xldmVsX21hc2soTE9HX1RS
QUNFKSkgeycsCi0gICAgICAgICcgICAgICAgIHN0cnVjdCB0aW1ldmFsIF9ub3c7JywKLSAgICAg
ICAgJyAgICAgICAgZ2V0dGltZW9mZGF5KCZfbm93LCBOVUxMKTsnLAorICAgICAgICAnICAgICAg
ICBpZiAobWVzc2FnZV93aXRoX3RpbWVzdGFtcCkgeycsCisgICAgICAgICcgICAgICAgICAgICBz
dHJ1Y3QgdGltZXZhbCBfbm93OycsCisgICAgICAgICcgICAgICAgICAgICBnZXR0aW1lb2ZkYXko
Jl9ub3csIE5VTEwpOycsCiAgICAgICAgICcjbGluZSAlKGV2ZW50X2xpbmVubylkICIlKGV2ZW50
X2ZpbGVuYW1lKXMiJywKLSAgICAgICAgJyAgICAgICAgcWVtdV9sb2coIiUlZEAlJXp1LiUlMDZ6
dTolKG5hbWUpcyAiICUoZm10KXMgIlxcbiIsJywKLSAgICAgICAgJyAgICAgICAgICAgICAgICAg
cWVtdV9nZXRfdGhyZWFkX2lkKCksJywKLSAgICAgICAgJyAgICAgICAgICAgICAgICAgKHNpemVf
dClfbm93LnR2X3NlYywgKHNpemVfdClfbm93LnR2X3VzZWMnLAotICAgICAgICAnICAgICAgICAg
ICAgICAgICAlKGFyZ25hbWVzKXMpOycsCisgICAgICAgICcgICAgICAgICAgICBxZW11X2xvZygi
JSVkQCUlenUuJSUwNnp1OiUobmFtZSlzICIgJShmbXQpcyAiXFxuIiwnLAorICAgICAgICAnICAg
ICAgICAgICAgICAgICAgICAgcWVtdV9nZXRfdGhyZWFkX2lkKCksJywKKyAgICAgICAgJyAgICAg
ICAgICAgICAgICAgICAgIChzaXplX3QpX25vdy50dl9zZWMsIChzaXplX3QpX25vdy50dl91c2Vj
JywKKyAgICAgICAgJyAgICAgICAgICAgICAgICAgICAgICUoYXJnbmFtZXMpcyk7JywKICAgICAg
ICAgJyNsaW5lICUob3V0X25leHRfbGluZW5vKWQgIiUob3V0X2ZpbGVuYW1lKXMiJywKKyAgICAg
ICAgJyAgICAgICAgfSBlbHNlIHsnLAorICAgICAgICAnI2xpbmUgJShldmVudF9saW5lbm8pZCAi
JShldmVudF9maWxlbmFtZSlzIicsCisgICAgICAgICcgICAgICAgICAgICBxZW11X2xvZygiJShu
YW1lKXMgIiAlKGZtdClzICJcXG4iJShhcmduYW1lcylzKTsnLAorICAgICAgICAnI2xpbmUgJShv
dXRfbmV4dF9saW5lbm8pZCAiJShvdXRfZmlsZW5hbWUpcyInLAorICAgICAgICAnICAgICAgICB9
JywKICAgICAgICAgJyAgICB9JywKICAgICAgICAgY29uZD1jb25kLAogICAgICAgICBldmVudF9s
aW5lbm89ZXZlbnQubGluZW5vLAotLSAKMi4yOS4yCgo=


