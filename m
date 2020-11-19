Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB3832B9456
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 15:16:12 +0100 (CET)
Received: from localhost ([::1]:59586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfkjL-0001qR-VK
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 09:16:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kfkiP-0001RP-8p
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 09:15:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:40033)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kfkiM-0001tQ-DC
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 09:15:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605795308;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Hk90cAx+BnvNJ2el+M2/xor9fG5P5c/myVKGWc3ze90=;
 b=KrLReM/9iolg2e2NhFYd6emZgvP9LnDLux7KPf6n6POiXYy/tfERBMhdbxJRFFRQgK8MtU
 Ct2NdcOkPR9wn3ePHv6Q+nBZomY4uVWI4vgn6/djJwfbAMlcz3Mx7f9CHhfXGm9j/qLgIM
 ltAYftKBOAUVLsxxJKMmzJOB/hmU27k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-368-2G4j1ZjTN5O3YVnnZdf1Fg-1; Thu, 19 Nov 2020 09:15:05 -0500
X-MC-Unique: 2G4j1ZjTN5O3YVnnZdf1Fg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6BB6B107ACFB;
 Thu, 19 Nov 2020 14:15:04 +0000 (UTC)
Received: from localhost (ovpn-115-68.ams2.redhat.com [10.36.115.68])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 061D55D9C2;
 Thu, 19 Nov 2020 14:14:57 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3] trace: use STAP_SDT_V2 to work around symbol visibility
Date: Thu, 19 Nov 2020 14:14:57 +0000
Message-Id: <20201119141457.844452-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/18 23:36:20
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 rjones@redhat.com, fche@redhat.com, kraxel@redhat.com,
 Stefan Hajnoczi <stefanha@redhat.com>, wcohen@redhat.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Miroslav Rezanina <mrezanin@redhat.com>, ddepaula@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UUVNVSBiaW5hcmllcyBubyBsb25nZXIgbGF1bmNoIHN1Y2Nlc3NmdWxseSB3aXRoIHJlY2VudCBT
eXN0ZW1UYXAKcmVsZWFzZXMuIFRoaXMgaXMgYmVjYXVzZSBtb2R1bGFyIFFFTVUgYnVpbGRzIGxp
bmsgdGhlIHNkdCBzZW1hcGhvcmVzCmludG8gdGhlIG1haW4gYmluYXJ5IGluc3RlYWQgb2YgaW50
byB0aGUgc2hhcmVkIG9iamVjdHMgd2hlcmUgdGhleSBhcmUKdXNlZC4gVGhlIHN5bWJvbCB2aXNp
YmlsaXR5IG9mIHNlbWFwaG9yZXMgaXMgJ2hpZGRlbicgYW5kIHRoZSBkeW5hbWljCmxpbmtlciBw
cmludHMgYW4gZXJyb3IgZHVyaW5nIG1vZHVsZSBsb2FkaW5nOgoKICAkIC4vY29uZmlndXJlIC0t
ZW5hYmxlLXRyYWNlLWJhY2tlbmRzPWR0cmFjZSAtLWVuYWJsZS1tb2R1bGVzIC4uLgogIC4uLgog
IEZhaWxlZCB0byBvcGVuIG1vZHVsZTogL2J1aWxkZGlyL2J1aWxkL0JVSUxEL3FlbXUtNC4yLjAv
czM5MHgtc29mdG1tdS8uLi9ibG9jay1jdXJsLnNvOiB1bmRlZmluZWQgc3ltYm9sOiBxZW11X2N1
cmxfY2xvc2Vfc2VtYXBob3JlCgpUaGUgbG9uZy10ZXJtIHNvbHV0aW9uIGlzIHRvIGdlbmVyYXRl
IHBlci1tb2R1bGUgZHRyYWNlIC5vIGZpbGVzIGFuZApsaW5rIHRoZW0gaW50byB0aGUgbW9kdWxl
IGluc3RlYWQgb2YgdGhlIG1haW4gYmluYXJ5LgoKSW4gdGhlIHNob3J0IHRlcm0gd2UgY2FuIGRl
ZmluZSBTVEFQX1NEVF9WMiBzbyBkdHJhY2UoMSkgcHJvZHVjZXMgYSAubwpmaWxlIHdpdGggJ2Rl
ZmF1bHQnIHN5bWJvbCB2aXNpYmlsaXR5IGluc3RlYWQgb2YgJ2hpZGRlbicuIFRoaXMKd29ya2Fy
b3VuZCBpcyBzbWFsbCBhbmQgZWFzaWVyIHRvIG1lcmdlIGZvciBRRU1VIDUuMiBhbmQgZG93bnN0
cmVhbQpiYWNrcG9ydHMuCgpCdWdsaW5rOiBodHRwczovL2J1Z3ppbGxhLnJlZGhhdC5jb20vc2hv
d19idWcuY2dpP2lkPTE4OTg3MDAKQ2M6IHdjb2hlbkByZWRoYXQuY29tCkNjOiBmY2hlQHJlZGhh
dC5jb20KQ2M6IGtyYXhlbEByZWRoYXQuY29tCkNjOiByam9uZXNAcmVkaGF0LmNvbQpDYzogZGRl
cGF1bGFAcmVkaGF0LmNvbQpTaWduZWQtb2ZmLWJ5OiBTdGVmYW4gSGFqbm9jemkgPHN0ZWZhbmhh
QHJlZGhhdC5jb20+ClJldmlld2VkLWJ5OiBEYW5pZWwgUC4gQmVycmFuZ8OpIDxiZXJyYW5nZUBy
ZWRoYXQuY29tPgpSZXZpZXdlZC1ieTogUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPHBoaWxtZEBy
ZWRoYXQuY29tPgpSZXZpZXdlZC1ieTogTWlyb3NsYXYgUmV6YW5pbmEgPG1yZXphbmluQHJlZGhh
dC5jb20+Ci0tLQp2MzoKICogVHdlYWsgY29tbWl0IGRlc2NyaXB0aW9uIGZvciBjbGFyaXR5IFtk
YW5wYl0KICogQWRkIEJ1Z2xpbmsgdGFnCiAqIEFkZCBleHBsYW5hdGlvbiBjb21tZW50IGludG8g
Li9jb25maWd1cmUgW1BoaWxpcHBlXQogKiBBZGQgUmV2aWV3ZWQtYnkgdGFncwp2MjoKICogRGVm
aW5lIFNUQVBfU0RUX1YyIGV2ZXJ5d2hlcmUgW2RhbnBiXQotLS0KIGNvbmZpZ3VyZSAgICAgICAg
IHwgNyArKysrKysrCiB0cmFjZS9tZXNvbi5idWlsZCB8IDQgKystLQogMiBmaWxlcyBjaGFuZ2Vk
LCA5IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvY29uZmlndXJl
IGIvY29uZmlndXJlCmluZGV4IDcxNGU3NWI1ZDguLjc5NmNlYzE0ZGUgMTAwNzU1Ci0tLSBhL2Nv
bmZpZ3VyZQorKysgYi9jb25maWd1cmUKQEAgLTQ4MzIsNiArNDgzMiwxMyBAQCBpZiBoYXZlX2Jh
Y2tlbmQgImR0cmFjZSI7IHRoZW4KICAgdHJhY2VfYmFja2VuZF9zdGFwPSJubyIKICAgaWYgaGFz
ICdzdGFwJyA7IHRoZW4KICAgICB0cmFjZV9iYWNrZW5kX3N0YXA9InllcyIKKworICAgICMgV29y
a2Fyb3VuZCB0byBhdm9pZCBkdHJhY2UoMSkgcHJvZHVjaW5nIGEgZmlsZSB3aXRoICdoaWRkZW4n
IHN5bWJvbAorICAgICMgdmlzaWJpbGl0eS4gRGVmaW5lIFNUQVBfU0RUX1YyIHRvIHByb2R1Y2Ug
J2RlZmF1bHQnIHN5bWJvbCB2aXNpYmlsaXR5CisgICAgIyBpbnN0ZWFkLiBRRU1VIC0tZW5hYmxl
LW1vZHVsZXMgZGVwZW5kcyBvbiB0aGlzIGJlY2F1c2UgdGhlIFN5c3RlbVRhcAorICAgICMgc2Vt
YXBob3JlcyBhcmUgbGlua2VkIGludG8gdGhlIG1haW4gYmluYXJ5IGFuZCBub3QgdGhlIG1vZHVs
ZSdzIHNoYXJlZAorICAgICMgb2JqZWN0LgorICAgIFFFTVVfQ0ZMQUdTPSIkUUVNVV9DRkxBR1Mg
LURTVEFQX1NEVF9WMiIKICAgZmkKIGZpCiAKZGlmZiAtLWdpdCBhL3RyYWNlL21lc29uLmJ1aWxk
IGIvdHJhY2UvbWVzb24uYnVpbGQKaW5kZXggZDVmYzQ1YzYyOC4uODQzZWExNDQ5NSAxMDA2NDQK
LS0tIGEvdHJhY2UvbWVzb24uYnVpbGQKKysrIGIvdHJhY2UvbWVzb24uYnVpbGQKQEAgLTM4LDEz
ICszOCwxMyBAQCBmb3JlYWNoIGRpciA6IFsgJy4nIF0gKyB0cmFjZV9ldmVudHNfc3ViZGlycwog
ICAgIHRyYWNlX2R0cmFjZV9oID0gY3VzdG9tX3RhcmdldChmbXQuZm9ybWF0KCd0cmFjZS1kdHJh
Y2UnLCAnaCcpLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBvdXRwdXQ6IGZt
dC5mb3JtYXQoJ3RyYWNlLWR0cmFjZScsICdoJyksCiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIGlucHV0OiB0cmFjZV9kdHJhY2UsCi0gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIGNvbW1hbmQ6IFsgJ2R0cmFjZScsICctbycsICdAT1VUUFVUQCcsICctaCcsICct
cycsICdASU5QVVRAJyBdKQorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb21t
YW5kOiBbICdkdHJhY2UnLCAnLURTVEFQX1NEVF9WMicsICctbycsICdAT1VUUFVUQCcsICctaCcs
ICctcycsICdASU5QVVRAJyBdKQogICAgIHRyYWNlX3NzLmFkZCh0cmFjZV9kdHJhY2VfaCkKICAg
ICBpZiBob3N0X21hY2hpbmUuc3lzdGVtKCkgIT0gJ2RhcndpbicKICAgICAgIHRyYWNlX2R0cmFj
ZV9vID0gY3VzdG9tX3RhcmdldChmbXQuZm9ybWF0KCd0cmFjZS1kdHJhY2UnLCAnbycpLAogICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG91dHB1dDogZm10LmZvcm1hdCgndHJh
Y2UtZHRyYWNlJywgJ28nKSwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBp
bnB1dDogdHJhY2VfZHRyYWNlLAotICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IGNvbW1hbmQ6IFsgJ2R0cmFjZScsICctbycsICdAT1VUUFVUQCcsICctRycsICctcycsICdASU5Q
VVRAJyBdKQorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbW1hbmQ6IFsg
J2R0cmFjZScsICctRFNUQVBfU0RUX1YyJywgJy1vJywgJ0BPVVRQVVRAJywgJy1HJywgJy1zJywg
J0BJTlBVVEAnIF0pCiAgICAgICB0cmFjZV9zcy5hZGQodHJhY2VfZHRyYWNlX28pCiAgICAgZW5k
aWYKIAotLSAKMi4yOC4wCgo=


