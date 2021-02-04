Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA61530F6CE
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 16:52:57 +0100 (CET)
Received: from localhost ([::1]:35852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7gwC-0006ek-Pz
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 10:52:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l7gp1-0008OC-Jo
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 10:45:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48451)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l7goo-0004v2-1W
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 10:45:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612453517;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q6S+bwv6sVqXK5Yoc4akTXfIDYr+AbSMZxFLSEk+rRw=;
 b=Z4zjJgF4F8CvahrolriEUrdkB4LdDIVpMqQBZdIhmWlZ1mlttXGQ7aVECMAh97eApb2E1V
 nK1L5Snn1iMLSsLj3DsENuEMVduHXlLhrjNdJkk44bJnsIblQFAVolMyfQl6tOooQHajT6
 74GisyFIXuYz+ckyMibuMFf9qLtwE0Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-13-m0SYcl8XOeCddtsbKP_jag-1; Thu, 04 Feb 2021 10:45:13 -0500
X-MC-Unique: m0SYcl8XOeCddtsbKP_jag-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3D315107ACE3;
 Thu,  4 Feb 2021 15:45:11 +0000 (UTC)
Received: from localhost (ovpn-115-89.ams2.redhat.com [10.36.115.89])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BF88719709;
 Thu,  4 Feb 2021 15:45:10 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL v2 10/27] multi-process: Add config option for multi-process
 QEMU
Date: Thu,  4 Feb 2021 15:43:10 +0000
Message-Id: <20210204154327.386529-11-stefanha@redhat.com>
In-Reply-To: <20210204154327.386529-1-stefanha@redhat.com>
References: <20210204154327.386529-1-stefanha@redhat.com>
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
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MIME_BASE64_TEXT=1.741, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>, Thomas Huth <thuth@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, "Denis V. Lunev" <den@openvz.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Fam Zheng <fam@euphon.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

RnJvbTogSmFnYW5uYXRoYW4gUmFtYW4gPGphZy5yYW1hbkBvcmFjbGUuY29tPgoKQWRkIGNvbmZp
Z3VyYXRpb24gb3B0aW9ucyB0byBlbmFibGUgb3IgZGlzYWJsZSBtdWx0aXByb2Nlc3MgUUVNVSBj
b2RlCgpTaWduZWQtb2ZmLWJ5OiBKb2huIEcgSm9obnNvbiA8am9obi5nLmpvaG5zb25Ab3JhY2xl
LmNvbT4KU2lnbmVkLW9mZi1ieTogSmFnYW5uYXRoYW4gUmFtYW4gPGphZy5yYW1hbkBvcmFjbGUu
Y29tPgpTaWduZWQtb2ZmLWJ5OiBFbGVuYSBVZmltdHNldmEgPGVsZW5hLnVmaW10c2V2YUBvcmFj
bGUuY29tPgpSZXZpZXdlZC1ieTogU3RlZmFuIEhham5vY3ppIDxzdGVmYW5oYUByZWRoYXQuY29t
PgpNZXNzYWdlLWlkOiA2Y2MzNzI1M2UzNTQxOGViZDdiNjc1YTMxYTNkZjZlM2M3YTEyZGMxLjE2
MTE5MzgzMTkuZ2l0LmphZy5yYW1hbkBvcmFjbGUuY29tClNpZ25lZC1vZmYtYnk6IFN0ZWZhbiBI
YWpub2N6aSA8c3RlZmFuaGFAcmVkaGF0LmNvbT4KLS0tCiBjb25maWd1cmUgICAgICAgICB8IDEw
ICsrKysrKysrKysKIG1lc29uLmJ1aWxkICAgICAgIHwgIDQgKysrLQogS2NvbmZpZy5ob3N0ICAg
ICAgfCAgNCArKysrCiBody9LY29uZmlnICAgICAgICB8ICAxICsKIGh3L3JlbW90ZS9LY29uZmln
IHwgIDMgKysrCiA1IGZpbGVzIGNoYW5nZWQsIDIxIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24o
LSkKIGNyZWF0ZSBtb2RlIDEwMDY0NCBody9yZW1vdGUvS2NvbmZpZwoKZGlmZiAtLWdpdCBhL2Nv
bmZpZ3VyZSBiL2NvbmZpZ3VyZQppbmRleCBlODVkNmJhZjhmLi5hNzM4Njk4NjBiIDEwMDc1NQot
LS0gYS9jb25maWd1cmUKKysrIGIvY29uZmlndXJlCkBAIC00NjMsNiArNDYzLDcgQEAgc2tpcF9t
ZXNvbj1ubwogZ2V0dGV4dD0iYXV0byIKIGZ1c2U9ImF1dG8iCiBmdXNlX2xzZWVrPSJhdXRvIgor
bXVsdGlwcm9jZXNzPSJubyIKIAogbWFsbG9jX3RyaW09ImF1dG8iCiAKQEAgLTc5Nyw2ICs3OTgs
NyBAQCBMaW51eCkKICAgbGludXg9InllcyIKICAgbGludXhfdXNlcj0ieWVzIgogICB2aG9zdF91
c2VyPSR7ZGVmYXVsdF9mZWF0dXJlOi15ZXN9CisgIG11bHRpcHJvY2Vzcz0ke2RlZmF1bHRfZmVh
dHVyZToteWVzfQogOzsKIGVzYWMKIApAQCAtMTU1Niw2ICsxNTU4LDEwIEBAIGZvciBvcHQgZG8K
ICAgOzsKICAgLS1kaXNhYmxlLWZ1c2UtbHNlZWspIGZ1c2VfbHNlZWs9ImRpc2FibGVkIgogICA7
OworICAtLWVuYWJsZS1tdWx0aXByb2Nlc3MpIG11bHRpcHJvY2Vzcz0ieWVzIgorICA7OworICAt
LWRpc2FibGUtbXVsdGlwcm9jZXNzKSBtdWx0aXByb2Nlc3M9Im5vIgorICA7OwogICAqKQogICAg
ICAgZWNobyAiRVJST1I6IHVua25vd24gb3B0aW9uICRvcHQiCiAgICAgICBlY2hvICJUcnkgJyQw
IC0taGVscCcgZm9yIG1vcmUgaW5mb3JtYXRpb24iCkBAIC0xOTA4LDYgKzE5MTQsNyBAQCBkaXNh
YmxlZCB3aXRoIC0tZGlzYWJsZS1GRUFUVVJFLCBkZWZhdWx0IGlzIGVuYWJsZWQgaWYgYXZhaWxh
YmxlCiAgIGxpYmRheGN0bCAgICAgICBsaWJkYXhjdGwgc3VwcG9ydAogICBmdXNlICAgICAgICAg
ICAgRlVTRSBibG9jayBkZXZpY2UgZXhwb3J0CiAgIGZ1c2UtbHNlZWsgICAgICBTRUVLX0hPTEUv
U0VFS19EQVRBIHN1cHBvcnQgZm9yIEZVU0UgZXhwb3J0cworICBtdWx0aXByb2Nlc3MgICAgTXVs
dGlwcm9jZXNzIFFFTVUgc3VwcG9ydAogCiBOT1RFOiBUaGUgb2JqZWN0IGZpbGVzIGFyZSBidWls
dCBhdCB0aGUgcGxhY2Ugd2hlcmUgY29uZmlndXJlIGlzIGxhdW5jaGVkCiBFT0YKQEAgLTYwODIs
NiArNjA4OSw5IEBAIGZpCiBpZiB0ZXN0ICIkaGF2ZV9tbG9ja2FsbCIgPSAieWVzIiA7IHRoZW4K
ICAgZWNobyAiSEFWRV9NTE9DS0FMTD15IiA+PiAkY29uZmlnX2hvc3RfbWFrCiBmaQoraWYgdGVz
dCAiJG11bHRpcHJvY2VzcyIgPSAieWVzIiA7IHRoZW4KKyAgZWNobyAiQ09ORklHX01VTFRJUFJP
Q0VTU19BTExPV0VEPXkiID4+ICRjb25maWdfaG9zdF9tYWsKK2ZpCiBpZiB0ZXN0ICIkZnV6emlu
ZyIgPSAieWVzIiA7IHRoZW4KICAgIyBJZiBMSUJfRlVaWklOR19FTkdJTkUgaXMgc2V0LCBhc3N1
bWUgd2UgYXJlIHJ1bm5pbmcgb24gT1NTLUZ1enosIGFuZCB0aGUKICAgIyBuZWVkZWQgQ0ZMQUdT
IGhhdmUgYWxyZWFkeSBiZWVuIHByb3ZpZGVkCmRpZmYgLS1naXQgYS9tZXNvbi5idWlsZCBiL21l
c29uLmJ1aWxkCmluZGV4IDJkOGI0MzNmZjAuLjdhNzI4M2E5N2QgMTAwNjQ0Ci0tLSBhL21lc29u
LmJ1aWxkCisrKyBiL21lc29uLmJ1aWxkCkBAIC0xMjEwLDcgKzEyMTAsOCBAQCBob3N0X2tjb25m
aWcgPSBcCiAgICgnQ09ORklHX1ZIT1NUX0tFUk5FTCcgaW4gY29uZmlnX2hvc3QgPyBbJ0NPTkZJ
R19WSE9TVF9LRVJORUw9eSddIDogW10pICsgXAogICAoaGF2ZV92aXJ0ZnMgPyBbJ0NPTkZJR19W
SVJURlM9eSddIDogW10pICsgXAogICAoJ0NPTkZJR19MSU5VWCcgaW4gY29uZmlnX2hvc3QgPyBb
J0NPTkZJR19MSU5VWD15J10gOiBbXSkgKyBcCi0gICgnQ09ORklHX1BWUkRNQScgaW4gY29uZmln
X2hvc3QgPyBbJ0NPTkZJR19QVlJETUE9eSddIDogW10pCisgICgnQ09ORklHX1BWUkRNQScgaW4g
Y29uZmlnX2hvc3QgPyBbJ0NPTkZJR19QVlJETUE9eSddIDogW10pICsgXAorICAoJ0NPTkZJR19N
VUxUSVBST0NFU1NfQUxMT1dFRCcgaW4gY29uZmlnX2hvc3QgPyBbJ0NPTkZJR19NVUxUSVBST0NF
U1NfQUxMT1dFRD15J10gOiBbXSkKIAogaWdub3JlZCA9IFsgJ1RBUkdFVF9YTUxfRklMRVMnLCAn
VEFSR0VUX0FCSV9ESVInLCAnVEFSR0VUX0FSQ0gnIF0KIApAQCAtMjYyNiw2ICsyNjI3LDcgQEAg
c3VtbWFyeV9pbmZvICs9IHsnbGlicG1lbSBzdXBwb3J0JzogICBjb25maWdfaG9zdC5oYXNfa2V5
KCdDT05GSUdfTElCUE1FTScpfQogc3VtbWFyeV9pbmZvICs9IHsnbGliZGF4Y3RsIHN1cHBvcnQn
OiBjb25maWdfaG9zdC5oYXNfa2V5KCdDT05GSUdfTElCREFYQ1RMJyl9CiBzdW1tYXJ5X2luZm8g
Kz0geydsaWJ1ZGV2JzogICAgICAgICAgIGxpYnVkZXYuZm91bmQoKX0KIHN1bW1hcnlfaW5mbyAr
PSB7J0ZVU0UgbHNlZWsnOiAgICAgICAgZnVzZV9sc2Vlay5mb3VuZCgpfQorc3VtbWFyeV9pbmZv
ICs9IHsnTXVsdGlwcm9jZXNzIFFFTVUnOiBjb25maWdfaG9zdC5oYXNfa2V5KCdDT05GSUdfTVVM
VElQUk9DRVNTX0FMTE9XRUQnKX0KIHN1bW1hcnkoc3VtbWFyeV9pbmZvLCBib29sX3luOiB0cnVl
LCBzZWN0aW9uOiAnRGVwZW5kZW5jaWVzJykKIAogaWYgbm90IHN1cHBvcnRlZF9jcHVzLmNvbnRh
aW5zKGNwdSkKZGlmZiAtLWdpdCBhL0tjb25maWcuaG9zdCBiL0tjb25maWcuaG9zdAppbmRleCBh
OWE1NWE5YzMxLi4yNDI1NWVmNDQxIDEwMDY0NAotLS0gYS9LY29uZmlnLmhvc3QKKysrIGIvS2Nv
bmZpZy5ob3N0CkBAIC0zNywzICszNyw3IEBAIGNvbmZpZyBWSVJURlMKIAogY29uZmlnIFBWUkRN
QQogICAgIGJvb2wKKworY29uZmlnIE1VTFRJUFJPQ0VTU19BTExPV0VECisgICAgYm9vbAorICAg
IGltcGx5IE1VTFRJUFJPQ0VTUwpkaWZmIC0tZ2l0IGEvaHcvS2NvbmZpZyBiL2h3L0tjb25maWcK
aW5kZXggZDRjZWM5ZTQ3Ni4uOGVhMjY0NzljNCAxMDA2NDQKLS0tIGEvaHcvS2NvbmZpZworKysg
Yi9ody9LY29uZmlnCkBAIC0yNyw2ICsyNyw3IEBAIHNvdXJjZSBwY2ktaG9zdC9LY29uZmlnCiBz
b3VyY2UgcGNtY2lhL0tjb25maWcKIHNvdXJjZSBwY2kvS2NvbmZpZwogc291cmNlIHJkbWEvS2Nv
bmZpZworc291cmNlIHJlbW90ZS9LY29uZmlnCiBzb3VyY2UgcnRjL0tjb25maWcKIHNvdXJjZSBz
Y3NpL0tjb25maWcKIHNvdXJjZSBzZC9LY29uZmlnCmRpZmYgLS1naXQgYS9ody9yZW1vdGUvS2Nv
bmZpZyBiL2h3L3JlbW90ZS9LY29uZmlnCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAw
MDAwMDAuLjU0ODQ0NDY3YTAKLS0tIC9kZXYvbnVsbAorKysgYi9ody9yZW1vdGUvS2NvbmZpZwpA
QCAtMCwwICsxLDMgQEAKK2NvbmZpZyBNVUxUSVBST0NFU1MKKyAgICBib29sCisgICAgZGVwZW5k
cyBvbiBQQ0kgJiYgS1ZNCi0tIAoyLjI5LjIKCg==


