Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52063283BB2
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Oct 2020 17:53:28 +0200 (CEST)
Received: from localhost ([::1]:57540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kPSnn-0000MD-D9
	for lists+qemu-devel@lfdr.de; Mon, 05 Oct 2020 11:53:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kPSeV-0005A5-5z
 for qemu-devel@nongnu.org; Mon, 05 Oct 2020 11:43:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24898)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kPSeS-0008Ax-BB
 for qemu-devel@nongnu.org; Mon, 05 Oct 2020 11:43:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601912627;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Dy0DQR+vsfbFZ1MRj051Z8ZJyIxAhZwRFkrx6m0gxQY=;
 b=UU7+SoV8a6dQupRu2hhxXmaYUl8sICmSC0PDpeIlakdryjNV2utwk6OZ4qiM74oCaLlAHR
 z3Pbl0ZmDArXvpMpIy6SOOpTCrxvA8ehVT8iBEcBvU6tHMCJ6AjT43oTMcS1rAOG1I5thA
 74/4brVPDMkzSwOKcu/2Dmw/BxUZjGs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-593-QpqiFEdQObOZRrbbZ4Hs_w-1; Mon, 05 Oct 2020 11:43:44 -0400
X-MC-Unique: QpqiFEdQObOZRrbbZ4Hs_w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 87224801AE3;
 Mon,  5 Oct 2020 15:43:43 +0000 (UTC)
Received: from localhost (ovpn-112-117.ams2.redhat.com [10.36.112.117])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 04C9A5D9CC;
 Mon,  5 Oct 2020 15:43:39 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL v2 04/17] block/nvme: Drop NVMeRegs structure,
 directly use NvmeBar
Date: Mon,  5 Oct 2020 16:43:10 +0100
Message-Id: <20201005154323.31347-5-stefanha@redhat.com>
In-Reply-To: <20201005154323.31347-1-stefanha@redhat.com>
References: <20201005154323.31347-1-stefanha@redhat.com>
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
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/05 02:11:31
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.733,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

RnJvbTogUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPHBoaWxtZEByZWRoYXQuY29tPgoKTlZNZVJl
Z3Mgb25seSBjb250YWlucyBOdm1lQmFyLiBTaW1wbGlmeSB0aGUgY29kZSBieSB1c2luZyBOdm1l
QmFyCmRpcmVjdGx5LgoKVGhpcyB0cmlnZ2VycyBhIGNoZWNrcGF0Y2gucGwgZXJyb3I6CgogIEVS
Uk9SOiBVc2Ugb2Ygdm9sYXRpbGUgaXMgdXN1YWxseSB3cm9uZywgcGxlYXNlIGFkZCBhIGNvbW1l
bnQKICAjMzA6IEZJTEU6IGJsb2NrL252bWUuYzo2OTE6CiAgKyAgICB2b2xhdGlsZSBOdm1lQmFy
ICpyZWdzOwoKVGhpcyBpcyBhIGZhbHNlIHBvc2l0aXZlIGFzIGluIG91ciBjYXNlIHdlIGFyZSB1
c2luZyBJL08gcmVnaXN0ZXJzLApzbyB0aGUgJ3ZvbGF0aWxlJyB1c2UgaXMganVzdGlmaWVkLgoK
U2lnbmVkLW9mZi1ieTogUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPHBoaWxtZEByZWRoYXQuY29t
PgpTaWduZWQtb2ZmLWJ5OiBTdGVmYW4gSGFqbm9jemkgPHN0ZWZhbmhhQHJlZGhhdC5jb20+Ck1l
c3NhZ2UtSWQ6IDwyMDIwMDkyMjA4MzgyMS41Nzg1MTktNS1waGlsbWRAcmVkaGF0LmNvbT4KLS0t
CiBibG9jay9udm1lLmMgfCAyMyArKysrKysrKystLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5n
ZWQsIDkgaW5zZXJ0aW9ucygrKSwgMTQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYmxvY2sv
bnZtZS5jIGIvYmxvY2svbnZtZS5jCmluZGV4IGU1MTdjNzUzOWYuLmJkODI5OTBiNjYgMTAwNjQ0
Ci0tLSBhL2Jsb2NrL252bWUuYworKysgYi9ibG9jay9udm1lLmMKQEAgLTgxLDExICs4MSw2IEBA
IHR5cGVkZWYgc3RydWN0IHsKICAgICBRRU1VQkggICAgICAqY29tcGxldGlvbl9iaDsKIH0gTlZN
ZVF1ZXVlUGFpcjsKIAotLyogTWVtb3J5IG1hcHBlZCByZWdpc3RlcnMgKi8KLXR5cGVkZWYgdm9s
YXRpbGUgc3RydWN0IHsKLSAgICBOdm1lQmFyIGN0cmw7Ci19IE5WTWVSZWdzOwotCiAjZGVmaW5l
IElOREVYX0FETUlOICAgICAwCiAjZGVmaW5lIElOREVYX0lPKG4pICAgICAoMSArIG4pCiAKQEAg
LTY5NCw3ICs2ODksNyBAQCBzdGF0aWMgaW50IG52bWVfaW5pdChCbG9ja0RyaXZlclN0YXRlICpi
cywgY29uc3QgY2hhciAqZGV2aWNlLCBpbnQgbmFtZXNwYWNlLAogICAgIHVpbnQ2NF90IHRpbWVv
dXRfbXM7CiAgICAgdWludDY0X3QgZGVhZGxpbmUsIG5vdzsKICAgICBFcnJvciAqbG9jYWxfZXJy
ID0gTlVMTDsKLSAgICBOVk1lUmVncyAqcmVnczsKKyAgICB2b2xhdGlsZSBOdm1lQmFyICpyZWdz
ID0gTlVMTDsKIAogICAgIHFlbXVfY29fbXV0ZXhfaW5pdCgmcy0+ZG1hX21hcF9sb2NrKTsKICAg
ICBxZW11X2NvX3F1ZXVlX2luaXQoJnMtPmRtYV9mbHVzaF9xdWV1ZSk7CkBAIC03MjIsNyArNzE3
LDcgQEAgc3RhdGljIGludCBudm1lX2luaXQoQmxvY2tEcml2ZXJTdGF0ZSAqYnMsIGNvbnN0IGNo
YXIgKmRldmljZSwgaW50IG5hbWVzcGFjZSwKICAgICAvKiBQZXJmb3JtIGluaXRpYWxpemUgc2Vx
dWVuY2UgYXMgZGVzY3JpYmVkIGluIE5WTWUgc3BlYyAiNy42LjEKICAgICAgKiBJbml0aWFsaXph
dGlvbiIuICovCiAKLSAgICBjYXAgPSBsZTY0X3RvX2NwdShyZWdzLT5jdHJsLmNhcCk7CisgICAg
Y2FwID0gbGU2NF90b19jcHUocmVncy0+Y2FwKTsKICAgICBpZiAoIShjYXAgJiAoMVVMTCA8PCAz
NykpKSB7CiAgICAgICAgIGVycm9yX3NldGcoZXJycCwgIkRldmljZSBkb2Vzbid0IHN1cHBvcnQg
TlZNZSBjb21tYW5kIHNldCIpOwogICAgICAgICByZXQgPSAtRUlOVkFMOwpAQCAtNzM1LDEwICs3
MzAsMTAgQEAgc3RhdGljIGludCBudm1lX2luaXQoQmxvY2tEcml2ZXJTdGF0ZSAqYnMsIGNvbnN0
IGNoYXIgKmRldmljZSwgaW50IG5hbWVzcGFjZSwKICAgICB0aW1lb3V0X21zID0gTUlOKDUwMCAq
ICgoY2FwID4+IDI0KSAmIDB4RkYpLCAzMDAwMCk7CiAKICAgICAvKiBSZXNldCBkZXZpY2UgdG8g
Z2V0IGEgY2xlYW4gc3RhdGUuICovCi0gICAgcmVncy0+Y3RybC5jYyA9IGNwdV90b19sZTMyKGxl
MzJfdG9fY3B1KHJlZ3MtPmN0cmwuY2MpICYgMHhGRSk7CisgICAgcmVncy0+Y2MgPSBjcHVfdG9f
bGUzMihsZTMyX3RvX2NwdShyZWdzLT5jYykgJiAweEZFKTsKICAgICAvKiBXYWl0IGZvciBDU1RT
LlJEWSA9IDAuICovCiAgICAgZGVhZGxpbmUgPSBxZW11X2Nsb2NrX2dldF9ucyhRRU1VX0NMT0NL
X1JFQUxUSU1FKSArIHRpbWVvdXRfbXMgKiBTQ0FMRV9NUzsKLSAgICB3aGlsZSAobGUzMl90b19j
cHUocmVncy0+Y3RybC5jc3RzKSAmIDB4MSkgeworICAgIHdoaWxlIChsZTMyX3RvX2NwdShyZWdz
LT5jc3RzKSAmIDB4MSkgewogICAgICAgICBpZiAocWVtdV9jbG9ja19nZXRfbnMoUUVNVV9DTE9D
S19SRUFMVElNRSkgPiBkZWFkbGluZSkgewogICAgICAgICAgICAgZXJyb3Jfc2V0ZyhlcnJwLCAi
VGltZW91dCB3aGlsZSB3YWl0aW5nIGZvciBkZXZpY2UgdG8gcmVzZXQgKCUiCiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIFBSSWQ2NCAiIG1zKSIsCkBAIC03NjYsMTggKzc2MSwxOCBAQCBz
dGF0aWMgaW50IG52bWVfaW5pdChCbG9ja0RyaXZlclN0YXRlICpicywgY29uc3QgY2hhciAqZGV2
aWNlLCBpbnQgbmFtZXNwYWNlLAogICAgIH0KICAgICBzLT5ucl9xdWV1ZXMgPSAxOwogICAgIFFF
TVVfQlVJTERfQlVHX09OKE5WTUVfUVVFVUVfU0laRSAmIDB4RjAwMCk7Ci0gICAgcmVncy0+Y3Ry
bC5hcWEgPSBjcHVfdG9fbGUzMigoTlZNRV9RVUVVRV9TSVpFIDw8IDE2KSB8IE5WTUVfUVVFVUVf
U0laRSk7Ci0gICAgcmVncy0+Y3RybC5hc3EgPSBjcHVfdG9fbGU2NChzLT5xdWV1ZXNbSU5ERVhf
QURNSU5dLT5zcS5pb3ZhKTsKLSAgICByZWdzLT5jdHJsLmFjcSA9IGNwdV90b19sZTY0KHMtPnF1
ZXVlc1tJTkRFWF9BRE1JTl0tPmNxLmlvdmEpOworICAgIHJlZ3MtPmFxYSA9IGNwdV90b19sZTMy
KChOVk1FX1FVRVVFX1NJWkUgPDwgMTYpIHwgTlZNRV9RVUVVRV9TSVpFKTsKKyAgICByZWdzLT5h
c3EgPSBjcHVfdG9fbGU2NChzLT5xdWV1ZXNbSU5ERVhfQURNSU5dLT5zcS5pb3ZhKTsKKyAgICBy
ZWdzLT5hY3EgPSBjcHVfdG9fbGU2NChzLT5xdWV1ZXNbSU5ERVhfQURNSU5dLT5jcS5pb3ZhKTsK
IAogICAgIC8qIEFmdGVyIHNldHRpbmcgdXAgYWxsIGNvbnRyb2wgcmVnaXN0ZXJzIHdlIGNhbiBl
bmFibGUgZGV2aWNlIG5vdy4gKi8KLSAgICByZWdzLT5jdHJsLmNjID0gY3B1X3RvX2xlMzIoKGN0
ejMyKE5WTUVfQ1FfRU5UUllfQllURVMpIDw8IDIwKSB8CisgICAgcmVncy0+Y2MgPSBjcHVfdG9f
bGUzMigoY3R6MzIoTlZNRV9DUV9FTlRSWV9CWVRFUykgPDwgMjApIHwKICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIChjdHozMihOVk1FX1NRX0VOVFJZX0JZVEVTKSA8PCAxNikgfAogICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgMHgxKTsKICAgICAvKiBXYWl0IGZvciBDU1RTLlJE
WSA9IDEuICovCiAgICAgbm93ID0gcWVtdV9jbG9ja19nZXRfbnMoUUVNVV9DTE9DS19SRUFMVElN
RSk7CiAgICAgZGVhZGxpbmUgPSBub3cgKyB0aW1lb3V0X21zICogMTAwMDAwMDsKLSAgICB3aGls
ZSAoIShsZTMyX3RvX2NwdShyZWdzLT5jdHJsLmNzdHMpICYgMHgxKSkgeworICAgIHdoaWxlICgh
KGxlMzJfdG9fY3B1KHJlZ3MtPmNzdHMpICYgMHgxKSkgewogICAgICAgICBpZiAocWVtdV9jbG9j
a19nZXRfbnMoUUVNVV9DTE9DS19SRUFMVElNRSkgPiBkZWFkbGluZSkgewogICAgICAgICAgICAg
ZXJyb3Jfc2V0ZyhlcnJwLCAiVGltZW91dCB3aGlsZSB3YWl0aW5nIGZvciBkZXZpY2UgdG8gc3Rh
cnQgKCUiCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFBSSWQ2NCAiIG1zKSIsCi0tIAoy
LjI2LjIKCg==


