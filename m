Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD23E2E95E4
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jan 2021 14:27:43 +0100 (CET)
Received: from localhost ([::1]:58644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwPte-0003jv-Tc
	for lists+qemu-devel@lfdr.de; Mon, 04 Jan 2021 08:27:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1kwPqP-0002vB-IJ
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 08:24:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:29318)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1kwPqO-0003KA-0O
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 08:24:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609766659;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=1C557u5sVE+XJyn2gK6hnOJdgpj3YsIyejstga5bZX0=;
 b=gtGjBYmVV5D5u+xFj2n8+t6cCkbl+PgfltvfNj5QvifS2xnFR4bPyQjKY94Vmclh/W80PT
 p7MSqbVoxzqkaogHIdU40mUGhSzmEnCtIT/PKDmKptXXLB8vsN+EAv0La7J6lCMctFMvN7
 wgW0xdj/RnKDgF1hZd+LO6GD6Tv0gSM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-218-EfgXxH9pNTaO3p_nza93Fg-1; Mon, 04 Jan 2021 08:24:15 -0500
X-MC-Unique: EfgXxH9pNTaO3p_nza93Fg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 25280180A095;
 Mon,  4 Jan 2021 13:24:14 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-113-132.ams2.redhat.com
 [10.36.113.132])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DB1685F9B8;
 Mon,  4 Jan 2021 13:24:02 +0000 (UTC)
From: Laszlo Ersek <lersek@redhat.com>
To: qemu devel list <qemu-devel@nongnu.org>
Subject: [PATCH] vhost-user-fs: add the "bootindex" property
Date: Mon,  4 Jan 2021 14:24:01 +0100
Message-Id: <20210104132401.5100-1-lersek@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lersek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=lersek@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MIME_BASE64_TEXT=1.741, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: virtio-fs@redhat.com, "Michael S. Tsirkin" <mst@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

dmlydGlvLWZzIHF1YWxpZmllcyBhcyBhIGJvb3RhYmxlIGRldmljZSBtaW5pbWFsbHkgdW5kZXIg
T1ZNRiwgYnV0CmN1cnJlbnRseSB0aGUgbmVjZXNzYXJ5ICJib290aW5kZXgiIHByb3BlcnR5IGlz
IG1pc3NpbmcgKGZ3X2NmZyBrZXJuZWwKYm9vdCBub3R3aXRoc3RhbmRpbmcpLgoKQWRkIHRoZSBw
cm9wZXJ0eS4gRm9yIGNvbXBsZXRlbmVzcywgYWRkIGl0IHRvIHRoZSBDQ1cgZGV2aWNlIGFzIHdl
bGw7Cm90aGVyIHZpcnRpby1jY3cgZGV2aWNlcyBzZWVtIHRvIGhhdmUgImJvb3RpbmRleCIgcHJv
cGVydGllcyB0b28uCgpFeGFtcGxlIE9wZW5GaXJtd2FyZSBkZXZpY2UgcGF0aCBmb3IgdGhlICJ2
aG9zdC11c2VyLWZzLXBjaSIgZGV2aWNlIGluIHRoZQoiYm9vdG9yZGVyIiBmd19jZmcgZmlsZToK
CiAgL3BjaUBpMGNmOC9wY2ktYnJpZGdlQDEsNi9wY2kxYWY0LDEwNWFAMC9maWxlc3lzdGVtQDAK
CkNjOiAiRHIuIERhdmlkIEFsYW4gR2lsYmVydCIgPGRnaWxiZXJ0QHJlZGhhdC5jb20+CkNjOiAi
TWljaGFlbCBTLiBUc2lya2luIiA8bXN0QHJlZGhhdC5jb20+CkNjOiBDaHJpc3RpYW4gQm9ybnRy
YWVnZXIgPGJvcm50cmFlZ2VyQGRlLmlibS5jb20+CkNjOiBDb3JuZWxpYSBIdWNrIDxjb2h1Y2tA
cmVkaGF0LmNvbT4KQ2M6IEhhbGlsIFBhc2ljIDxwYXNpY0BsaW51eC5pYm0uY29tPgpDYzogU3Rl
ZmFuIEhham5vY3ppIDxzdGVmYW5oYUByZWRoYXQuY29tPgpDYzogcWVtdS1zMzkweEBub25nbnUu
b3JnCkNjOiB2aXJ0aW8tZnNAcmVkaGF0LmNvbQpTaWduZWQtb2ZmLWJ5OiBMYXN6bG8gRXJzZWsg
PGxlcnNla0ByZWRoYXQuY29tPgotLS0KIGluY2x1ZGUvaHcvdmlydGlvL3Zob3N0LXVzZXItZnMu
aCB8ICAxICsKIGh3L3MzOTB4L3Zob3N0LXVzZXItZnMtY2N3LmMgICAgICB8ICAyICsrCiBody92
aXJ0aW8vdmhvc3QtdXNlci1mcy1wY2kuYyAgICAgfCAgMiArKwogaHcvdmlydGlvL3Zob3N0LXVz
ZXItZnMuYyAgICAgICAgIHwgMTAgKysrKysrKysrKwogNCBmaWxlcyBjaGFuZ2VkLCAxNSBpbnNl
cnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9ody92aXJ0aW8vdmhvc3QtdXNlci1mcy5o
IGIvaW5jbHVkZS9ody92aXJ0aW8vdmhvc3QtdXNlci1mcy5oCmluZGV4IDY5ODU3NTI3NzEwMS4u
MGQ2MjgzNGMyNTEwIDEwMDY0NAotLS0gYS9pbmNsdWRlL2h3L3ZpcnRpby92aG9zdC11c2VyLWZz
LmgKKysrIGIvaW5jbHVkZS9ody92aXJ0aW8vdmhvc3QtdXNlci1mcy5oCkBAIC0zOSw2ICszOSw3
IEBAIHN0cnVjdCBWSG9zdFVzZXJGUyB7CiAgICAgVmhvc3RVc2VyU3RhdGUgdmhvc3RfdXNlcjsK
ICAgICBWaXJ0UXVldWUgKipyZXFfdnFzOwogICAgIFZpcnRRdWV1ZSAqaGlwcmlvX3ZxOworICAg
IGludDMyX3QgYm9vdGluZGV4OwogCiAgICAgLyo8IHB1YmxpYyA+Ki8KIH07CmRpZmYgLS1naXQg
YS9ody9zMzkweC92aG9zdC11c2VyLWZzLWNjdy5jIGIvaHcvczM5MHgvdmhvc3QtdXNlci1mcy1j
Y3cuYwppbmRleCA2YzZmMjY5MjkzMDEuLjQ3NGU5N2U5MzdiOCAxMDA2NDQKLS0tIGEvaHcvczM5
MHgvdmhvc3QtdXNlci1mcy1jY3cuYworKysgYi9ody9zMzkweC92aG9zdC11c2VyLWZzLWNjdy5j
CkBAIC00Nyw2ICs0Nyw4IEBAIHN0YXRpYyB2b2lkIHZob3N0X3VzZXJfZnNfY2N3X2luc3RhbmNl
X2luaXQoT2JqZWN0ICpvYmopCiAgICAgY2N3X2Rldi0+Zm9yY2VfcmV2aXNpb25fMSA9IHRydWU7
CiAgICAgdmlydGlvX2luc3RhbmNlX2luaXRfY29tbW9uKG9iaiwgJmRldi0+dmRldiwgc2l6ZW9m
KGRldi0+dmRldiksCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFRZUEVfVkhPU1Rf
VVNFUl9GUyk7CisgICAgb2JqZWN0X3Byb3BlcnR5X2FkZF9hbGlhcyhvYmosICJib290aW5kZXgi
LCBPQkpFQ1QoJmRldi0+dmRldiksCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAiYm9v
dGluZGV4Iik7CiB9CiAKIHN0YXRpYyB2b2lkIHZob3N0X3VzZXJfZnNfY2N3X2NsYXNzX2luaXQo
T2JqZWN0Q2xhc3MgKmtsYXNzLCB2b2lkICpkYXRhKQpkaWZmIC0tZ2l0IGEvaHcvdmlydGlvL3Zo
b3N0LXVzZXItZnMtcGNpLmMgYi9ody92aXJ0aW8vdmhvc3QtdXNlci1mcy1wY2kuYwppbmRleCA4
YmIzODliZDI4MmEuLjJlZDg0OTJiM2ZhMyAxMDA2NDQKLS0tIGEvaHcvdmlydGlvL3Zob3N0LXVz
ZXItZnMtcGNpLmMKKysrIGIvaHcvdmlydGlvL3Zob3N0LXVzZXItZnMtcGNpLmMKQEAgLTY4LDYg
KzY4LDggQEAgc3RhdGljIHZvaWQgdmhvc3RfdXNlcl9mc19wY2lfaW5zdGFuY2VfaW5pdChPYmpl
Y3QgKm9iaikKIAogICAgIHZpcnRpb19pbnN0YW5jZV9pbml0X2NvbW1vbihvYmosICZkZXYtPnZk
ZXYsIHNpemVvZihkZXYtPnZkZXYpLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBU
WVBFX1ZIT1NUX1VTRVJfRlMpOworICAgIG9iamVjdF9wcm9wZXJ0eV9hZGRfYWxpYXMob2JqLCAi
Ym9vdGluZGV4IiwgT0JKRUNUKCZkZXYtPnZkZXYpLAorICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgImJvb3RpbmRleCIpOwogfQogCiBzdGF0aWMgY29uc3QgVmlydGlvUENJRGV2aWNlVHlw
ZUluZm8gdmhvc3RfdXNlcl9mc19wY2lfaW5mbyA9IHsKZGlmZiAtLWdpdCBhL2h3L3ZpcnRpby92
aG9zdC11c2VyLWZzLmMgYi9ody92aXJ0aW8vdmhvc3QtdXNlci1mcy5jCmluZGV4IGVkMDM2YWQ5
YzEzZi4uYWM0ZmMzNGIzNmEyIDEwMDY0NAotLS0gYS9ody92aXJ0aW8vdmhvc3QtdXNlci1mcy5j
CisrKyBiL2h3L3ZpcnRpby92aG9zdC11c2VyLWZzLmMKQEAgLTIyLDYgKzIyLDcgQEAKICNpbmNs
dWRlICJxZW11L2Vycm9yLXJlcG9ydC5oIgogI2luY2x1ZGUgImh3L3ZpcnRpby92aG9zdC11c2Vy
LWZzLmgiCiAjaW5jbHVkZSAibW9uaXRvci9tb25pdG9yLmgiCisjaW5jbHVkZSAic3lzZW11L3N5
c2VtdS5oIgogCiBzdGF0aWMgdm9pZCB2dWZfZ2V0X2NvbmZpZyhWaXJ0SU9EZXZpY2UgKnZkZXYs
IHVpbnQ4X3QgKmNvbmZpZykKIHsKQEAgLTI3OSw2ICsyODAsMTQgQEAgc3RhdGljIFByb3BlcnR5
IHZ1Zl9wcm9wZXJ0aWVzW10gPSB7CiAgICAgREVGSU5FX1BST1BfRU5EX09GX0xJU1QoKSwKIH07
CiAKK3N0YXRpYyB2b2lkIHZ1Zl9pbnN0YW5jZV9pbml0KE9iamVjdCAqb2JqKQoreworICAgIFZI
b3N0VXNlckZTICpmcyA9IFZIT1NUX1VTRVJfRlMob2JqKTsKKworICAgIGRldmljZV9hZGRfYm9v
dGluZGV4X3Byb3BlcnR5KG9iaiwgJmZzLT5ib290aW5kZXgsICJib290aW5kZXgiLAorICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICIvZmlsZXN5c3RlbUAwIiwgREVWSUNFKG9iaikp
OworfQorCiBzdGF0aWMgdm9pZCB2dWZfY2xhc3NfaW5pdChPYmplY3RDbGFzcyAqa2xhc3MsIHZv
aWQgKmRhdGEpCiB7CiAgICAgRGV2aWNlQ2xhc3MgKmRjID0gREVWSUNFX0NMQVNTKGtsYXNzKTsK
QEAgLTMwMCw2ICszMDksNyBAQCBzdGF0aWMgY29uc3QgVHlwZUluZm8gdnVmX2luZm8gPSB7CiAg
ICAgLm5hbWUgPSBUWVBFX1ZIT1NUX1VTRVJfRlMsCiAgICAgLnBhcmVudCA9IFRZUEVfVklSVElP
X0RFVklDRSwKICAgICAuaW5zdGFuY2Vfc2l6ZSA9IHNpemVvZihWSG9zdFVzZXJGUyksCisgICAg
Lmluc3RhbmNlX2luaXQgPSB2dWZfaW5zdGFuY2VfaW5pdCwKICAgICAuY2xhc3NfaW5pdCA9IHZ1
Zl9jbGFzc19pbml0LAogfTsKIAotLSAKMi4xOS4xLjMuZzMwMjQ3YWE1ZDIwMQoK


