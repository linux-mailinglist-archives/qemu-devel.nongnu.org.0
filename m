Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AD432B988A
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 17:51:55 +0100 (CET)
Received: from localhost ([::1]:60082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfnA2-0006E3-L8
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 11:51:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kfn6V-0002jL-Of
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 11:48:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24854)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kfn6T-00011G-P2
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 11:48:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605804490;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iJ2c7VHlsuEBiPWbf8iJnuabLnBFp7FEI3X8dsoTglw=;
 b=VbdTyxkgM/LzHzYNivqwgPV3UrpJH9Eg9RLMEWqoMcrQzqW4eSLrdj22alSmU9TcNBqD9X
 Y3KU4ztWVatcPWtZv9x9oouLzKbK6E8qSRyEiz66sQRe5GH6H3WsLbXa9n38CnKXpJnW87
 l2p9C0oHImV3HJn+2cfBgIjsglWxemM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-419-L_9kKoudNtGyQFnaAtn0BQ-1; Thu, 19 Nov 2020 11:48:05 -0500
X-MC-Unique: L_9kKoudNtGyQFnaAtn0BQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4AA691019999;
 Thu, 19 Nov 2020 16:48:02 +0000 (UTC)
Received: from localhost (ovpn-115-68.ams2.redhat.com [10.36.115.68])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 94B616A253;
 Thu, 19 Nov 2020 16:48:01 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL for-5.2 1/1] trace: use STAP_SDT_V2 to work around symbol
 visibility
Date: Thu, 19 Nov 2020 16:47:58 +0000
Message-Id: <20201119164758.939980-2-stefanha@redhat.com>
In-Reply-To: <20201119164758.939980-1-stefanha@redhat.com>
References: <20201119164758.939980-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, rjones@redhat.com, fche@redhat.com, kraxel@redhat.com,
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
dC5jb20+Ck1lc3NhZ2UtaWQ6IDIwMjAxMTE5MTQxNDU3Ljg0NDQ1Mi0xLXN0ZWZhbmhhQHJlZGhh
dC5jb20KU2lnbmVkLW9mZi1ieTogU3RlZmFuIEhham5vY3ppIDxzdGVmYW5oYUByZWRoYXQuY29t
PgotLS0KIGNvbmZpZ3VyZSAgICAgICAgIHwgNyArKysrKysrCiB0cmFjZS9tZXNvbi5idWlsZCB8
IDQgKystLQogMiBmaWxlcyBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEvY29uZmlndXJlIGIvY29uZmlndXJlCmluZGV4IDcxNGU3NWI1ZDguLjc5
NmNlYzE0ZGUgMTAwNzU1Ci0tLSBhL2NvbmZpZ3VyZQorKysgYi9jb25maWd1cmUKQEAgLTQ4MzIs
NiArNDgzMiwxMyBAQCBpZiBoYXZlX2JhY2tlbmQgImR0cmFjZSI7IHRoZW4KICAgdHJhY2VfYmFj
a2VuZF9zdGFwPSJubyIKICAgaWYgaGFzICdzdGFwJyA7IHRoZW4KICAgICB0cmFjZV9iYWNrZW5k
X3N0YXA9InllcyIKKworICAgICMgV29ya2Fyb3VuZCB0byBhdm9pZCBkdHJhY2UoMSkgcHJvZHVj
aW5nIGEgZmlsZSB3aXRoICdoaWRkZW4nIHN5bWJvbAorICAgICMgdmlzaWJpbGl0eS4gRGVmaW5l
IFNUQVBfU0RUX1YyIHRvIHByb2R1Y2UgJ2RlZmF1bHQnIHN5bWJvbCB2aXNpYmlsaXR5CisgICAg
IyBpbnN0ZWFkLiBRRU1VIC0tZW5hYmxlLW1vZHVsZXMgZGVwZW5kcyBvbiB0aGlzIGJlY2F1c2Ug
dGhlIFN5c3RlbVRhcAorICAgICMgc2VtYXBob3JlcyBhcmUgbGlua2VkIGludG8gdGhlIG1haW4g
YmluYXJ5IGFuZCBub3QgdGhlIG1vZHVsZSdzIHNoYXJlZAorICAgICMgb2JqZWN0LgorICAgIFFF
TVVfQ0ZMQUdTPSIkUUVNVV9DRkxBR1MgLURTVEFQX1NEVF9WMiIKICAgZmkKIGZpCiAKZGlmZiAt
LWdpdCBhL3RyYWNlL21lc29uLmJ1aWxkIGIvdHJhY2UvbWVzb24uYnVpbGQKaW5kZXggZDVmYzQ1
YzYyOC4uODQzZWExNDQ5NSAxMDA2NDQKLS0tIGEvdHJhY2UvbWVzb24uYnVpbGQKKysrIGIvdHJh
Y2UvbWVzb24uYnVpbGQKQEAgLTM4LDEzICszOCwxMyBAQCBmb3JlYWNoIGRpciA6IFsgJy4nIF0g
KyB0cmFjZV9ldmVudHNfc3ViZGlycwogICAgIHRyYWNlX2R0cmFjZV9oID0gY3VzdG9tX3Rhcmdl
dChmbXQuZm9ybWF0KCd0cmFjZS1kdHJhY2UnLCAnaCcpLAogICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBvdXRwdXQ6IGZtdC5mb3JtYXQoJ3RyYWNlLWR0cmFjZScsICdoJyksCiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGlucHV0OiB0cmFjZV9kdHJhY2UsCi0g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbW1hbmQ6IFsgJ2R0cmFjZScsICct
bycsICdAT1VUUFVUQCcsICctaCcsICctcycsICdASU5QVVRAJyBdKQorICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBjb21tYW5kOiBbICdkdHJhY2UnLCAnLURTVEFQX1NEVF9WMics
ICctbycsICdAT1VUUFVUQCcsICctaCcsICctcycsICdASU5QVVRAJyBdKQogICAgIHRyYWNlX3Nz
LmFkZCh0cmFjZV9kdHJhY2VfaCkKICAgICBpZiBob3N0X21hY2hpbmUuc3lzdGVtKCkgIT0gJ2Rh
cndpbicKICAgICAgIHRyYWNlX2R0cmFjZV9vID0gY3VzdG9tX3RhcmdldChmbXQuZm9ybWF0KCd0
cmFjZS1kdHJhY2UnLCAnbycpLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IG91dHB1dDogZm10LmZvcm1hdCgndHJhY2UtZHRyYWNlJywgJ28nKSwKICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBpbnB1dDogdHJhY2VfZHRyYWNlLAotICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIGNvbW1hbmQ6IFsgJ2R0cmFjZScsICctbycsICdAT1VU
UFVUQCcsICctRycsICctcycsICdASU5QVVRAJyBdKQorICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIGNvbW1hbmQ6IFsgJ2R0cmFjZScsICctRFNUQVBfU0RUX1YyJywgJy1vJywg
J0BPVVRQVVRAJywgJy1HJywgJy1zJywgJ0BJTlBVVEAnIF0pCiAgICAgICB0cmFjZV9zcy5hZGQo
dHJhY2VfZHRyYWNlX28pCiAgICAgZW5kaWYKIAotLSAKMi4yOC4wCgo=


