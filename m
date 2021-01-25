Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A825A302457
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 12:37:22 +0100 (CET)
Received: from localhost ([::1]:43650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l40BN-0004gn-Ow
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 06:37:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l409Z-0003kF-Hq
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 06:35:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52400)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l409X-0002zr-Sh
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 06:35:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611574527;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d/aykXlkLd0n8nnI15viAOdgTCd1N6P/sSNIwLhHXec=;
 b=AApiR6Y+rtDiGktzA6zLbHLHF0OXPzvzl901q3DUc0AdGxrFsjNtuqtPjcCQPa7P3I0PlV
 mnMDEDcujTJTjoqBOH+TxGeWVxEyvWy2VLDlgWaTUV3xDUDZqN2JEB7YYREyOoEhfACm8I
 w9kZ8AYxoa9s76qN169nSqibrh1phzs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-131-kIVCh70wOmymI9mLnSpGbA-1; Mon, 25 Jan 2021 06:35:23 -0500
X-MC-Unique: kIVCh70wOmymI9mLnSpGbA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 977F7107ACE6;
 Mon, 25 Jan 2021 11:35:22 +0000 (UTC)
Received: from localhost (ovpn-115-94.ams2.redhat.com [10.36.115.94])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C705D19727;
 Mon, 25 Jan 2021 11:35:18 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] trace: make the 'log' backend timestamp configurable
Date: Mon, 25 Jan 2021 11:35:07 +0000
Message-Id: <20210125113507.224287-3-stefanha@redhat.com>
In-Reply-To: <20210125113507.224287-1-stefanha@redhat.com>
References: <20210125113507.224287-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MIME_BASE64_TEXT=1.741, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Daniel Berrange <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

VGltZXN0YW1wcyBpbiB0cmFjaW5nIG91dHB1dCBjYW4gYmUgZGlzdHJhY3RpbmcuIE1ha2UgaXQg
cG9zc2libGUgdG8KY29udHJvbCB0aWQvdGltZXN0YW1wIHByaW50aW5nIHdpdGggLW1zZyB0aW1l
c3RhbXA9b258b2ZmLiBUaGUgZGVmYXVsdAppcyBubyB0aWQvdGltZXN0YW1wcy4gUHJldmlvdXNs
eSB0aGV5IHdlcmUgYWx3YXlzIHByaW50ZWQuCgpTdWdnZXN0ZWQtYnk6IEJBTEFUT04gWm9sdGFu
IDxiYWxhdG9uQGVpay5ibWUuaHU+ClNpZ25lZC1vZmYtYnk6IFN0ZWZhbiBIYWpub2N6aSA8c3Rl
ZmFuaGFAcmVkaGF0LmNvbT4KLS0tCiBkb2NzL2RldmVsL3RyYWNpbmcudHh0ICAgICAgICAgICB8
ICAzICsrKwogc2NyaXB0cy90cmFjZXRvb2wvYmFja2VuZC9sb2cucHkgfCAxOSArKysrKysrKysr
KysrLS0tLS0tCiAyIGZpbGVzIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEvZG9jcy9kZXZlbC90cmFjaW5nLnR4dCBiL2RvY3MvZGV2ZWwvdHJh
Y2luZy50eHQKaW5kZXggZGJhNDNmYzdhNC4uY2Q3NDRjMDQyOSAxMDA2NDQKLS0tIGEvZG9jcy9k
ZXZlbC90cmFjaW5nLnR4dAorKysgYi9kb2NzL2RldmVsL3RyYWNpbmcudHh0CkBAIC0yMTEsNiAr
MjExLDkgQEAgZWZmZWN0aXZlbHkgdHVybnMgdHJhY2UgZXZlbnRzIGludG8gZGVidWcgcHJpbnRm
cy4KIFRoaXMgaXMgdGhlIHNpbXBsZXN0IGJhY2tlbmQgYW5kIGNhbiBiZSB1c2VkIHRvZ2V0aGVy
IHdpdGggZXhpc3RpbmcgY29kZSB0aGF0CiB1c2VzIERQUklOVEYoKS4KIAorVGhlIC1tc2cgdGlt
ZXN0YW1wPW9ufG9mZiBjb21tYW5kLWxpbmUgb3B0aW9uIGNvbnRyb2xzIHdoZXRoZXIgb3Igbm90
IHRvIHByaW50Cit0aGUgdGlkL3RpbWVzdGFtcCBwcmVmaXggZm9yIGVhY2ggdHJhY2UgZXZlbnQu
CisKID09PSBTaW1wbGV0cmFjZSA9PT0KIAogVGhlICJzaW1wbGUiIGJhY2tlbmQgc3VwcG9ydHMg
Y29tbW9uIHVzZSBjYXNlcyBhbmQgY29tZXMgYXMgcGFydCBvZiB0aGUgUUVNVQpkaWZmIC0tZ2l0
IGEvc2NyaXB0cy90cmFjZXRvb2wvYmFja2VuZC9sb2cucHkgYi9zY3JpcHRzL3RyYWNldG9vbC9i
YWNrZW5kL2xvZy5weQppbmRleCBiYzQzZGJiNGY0Li4xN2JhMWNkOTBlIDEwMDY0NAotLS0gYS9z
Y3JpcHRzL3RyYWNldG9vbC9iYWNrZW5kL2xvZy5weQorKysgYi9zY3JpcHRzL3RyYWNldG9vbC9i
YWNrZW5kL2xvZy5weQpAQCAtMjAsNiArMjAsNyBAQCBQVUJMSUMgPSBUcnVlCiAKIGRlZiBnZW5l
cmF0ZV9oX2JlZ2luKGV2ZW50cywgZ3JvdXApOgogICAgIG91dCgnI2luY2x1ZGUgInFlbXUvbG9n
LWZvci10cmFjZS5oIicsCisgICAgICAgICcjaW5jbHVkZSAicWVtdS9lcnJvci1yZXBvcnQuaCIn
LAogICAgICAgICAnJykKIAogCkBAIC0zNSwxNCArMzYsMjAgQEAgZGVmIGdlbmVyYXRlX2goZXZl
bnQsIGdyb3VwKToKICAgICAgICAgY29uZCA9ICJ0cmFjZV9ldmVudF9nZXRfc3RhdGUoJXMpIiAl
ICgiVFJBQ0VfIiArIGV2ZW50Lm5hbWUudXBwZXIoKSkKIAogICAgIG91dCgnICAgIGlmICglKGNv
bmQpcyAmJiBxZW11X2xvZ2xldmVsX21hc2soTE9HX1RSQUNFKSkgeycsCi0gICAgICAgICcgICAg
ICAgIHN0cnVjdCB0aW1ldmFsIF9ub3c7JywKLSAgICAgICAgJyAgICAgICAgZ2V0dGltZW9mZGF5
KCZfbm93LCBOVUxMKTsnLAorICAgICAgICAnICAgICAgICBpZiAobWVzc2FnZV93aXRoX3RpbWVz
dGFtcCkgeycsCisgICAgICAgICcgICAgICAgICAgICBzdHJ1Y3QgdGltZXZhbCBfbm93OycsCisg
ICAgICAgICcgICAgICAgICAgICBnZXR0aW1lb2ZkYXkoJl9ub3csIE5VTEwpOycsCiAgICAgICAg
ICcjbGluZSAlKGV2ZW50X2xpbmVubylkICIlKGV2ZW50X2ZpbGVuYW1lKXMiJywKLSAgICAgICAg
JyAgICAgICAgcWVtdV9sb2coIiUlZEAlJXp1LiUlMDZ6dTolKG5hbWUpcyAiICUoZm10KXMgIlxc
biIsJywKLSAgICAgICAgJyAgICAgICAgICAgICAgICAgcWVtdV9nZXRfdGhyZWFkX2lkKCksJywK
LSAgICAgICAgJyAgICAgICAgICAgICAgICAgKHNpemVfdClfbm93LnR2X3NlYywgKHNpemVfdClf
bm93LnR2X3VzZWMnLAotICAgICAgICAnICAgICAgICAgICAgICAgICAlKGFyZ25hbWVzKXMpOycs
CisgICAgICAgICcgICAgICAgICAgICBxZW11X2xvZygiJSVkQCUlenUuJSUwNnp1OiUobmFtZSlz
ICIgJShmbXQpcyAiXFxuIiwnLAorICAgICAgICAnICAgICAgICAgICAgICAgICAgICAgcWVtdV9n
ZXRfdGhyZWFkX2lkKCksJywKKyAgICAgICAgJyAgICAgICAgICAgICAgICAgICAgIChzaXplX3Qp
X25vdy50dl9zZWMsIChzaXplX3QpX25vdy50dl91c2VjJywKKyAgICAgICAgJyAgICAgICAgICAg
ICAgICAgICAgICUoYXJnbmFtZXMpcyk7JywKICAgICAgICAgJyNsaW5lICUob3V0X25leHRfbGlu
ZW5vKWQgIiUob3V0X2ZpbGVuYW1lKXMiJywKKyAgICAgICAgJyAgICAgICAgfSBlbHNlIHsnLAor
ICAgICAgICAnI2xpbmUgJShldmVudF9saW5lbm8pZCAiJShldmVudF9maWxlbmFtZSlzIicsCisg
ICAgICAgICcgICAgICAgICAgICBxZW11X2xvZygiJShuYW1lKXMgIiAlKGZtdClzICJcXG4iJShh
cmduYW1lcylzKTsnLAorICAgICAgICAnI2xpbmUgJShvdXRfbmV4dF9saW5lbm8pZCAiJShvdXRf
ZmlsZW5hbWUpcyInLAorICAgICAgICAnICAgICAgICB9JywKICAgICAgICAgJyAgICB9JywKICAg
ICAgICAgY29uZD1jb25kLAogICAgICAgICBldmVudF9saW5lbm89ZXZlbnQubGluZW5vLAotLSAK
Mi4yOS4yCgo=


