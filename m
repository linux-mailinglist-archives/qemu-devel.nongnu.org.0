Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2B912B90E5
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 12:28:52 +0100 (CET)
Received: from localhost ([::1]:36340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfi7P-00037u-U6
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 06:28:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kfi5x-0002Cc-LH
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 06:27:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:47717)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kfi5v-0000rq-Kw
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 06:27:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605785238;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=s3e7RN6XePwlt4NiR61ABnh/RV7jhx9K+idD2OCiqcI=;
 b=Yo5MzSOjjl7CQyHAqlv9zE7RR8voEq21vogAjD34Y+2EeXJ9w5sO8m68isLRZoBAnrgVJh
 clwAZ4LcRhEFl9d6yBqEzz9/V3kMd0KfC+1ae6AQWjuE1SgOuc77RIoE/q4A6+xRTeflUb
 xTJmGd+EspfbfEjJaV4I/8KUJiTe8Xw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-582-6avniYfUPQmwUlVIcGEOzg-1; Thu, 19 Nov 2020 06:27:16 -0500
X-MC-Unique: 6avniYfUPQmwUlVIcGEOzg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ADB69801B16;
 Thu, 19 Nov 2020 11:27:15 +0000 (UTC)
Received: from localhost (ovpn-115-68.ams2.redhat.com [10.36.115.68])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C5F861346F;
 Thu, 19 Nov 2020 11:27:05 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] trace: use STAP_SDT_V2 to work around symbol visibility
Date: Thu, 19 Nov 2020 11:27:04 +0000
Message-Id: <20201119112704.837423-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
 Stefan Hajnoczi <stefanha@redhat.com>, wcohen@redhat.com, mrezanin@redhat.com,
 ddepaula@redhat.com
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
b3VuZCBpcyBzbWFsbCBhbmQgZWFzaWVyIHRvIG1lcmdlIGZvciBRRU1VIDUuMi4KCkNjOiBEYW5p
ZWwgUC4gQmVycmFuZ8OpIDxiZXJyYW5nZUByZWRoYXQuY29tPgpDYzogd2NvaGVuQHJlZGhhdC5j
b20KQ2M6IGZjaGVAcmVkaGF0LmNvbQpDYzoga3JheGVsQHJlZGhhdC5jb20KQ2M6IHJqb25lc0By
ZWRoYXQuY29tCkNjOiBtcmV6YW5pbkByZWRoYXQuY29tCkNjOiBkZGVwYXVsYUByZWRoYXQuY29t
ClNpZ25lZC1vZmYtYnk6IFN0ZWZhbiBIYWpub2N6aSA8c3RlZmFuaGFAcmVkaGF0LmNvbT4KLS0t
CnYyOgogKiBEZWZpbmUgU1RBUF9TRFRfVjIgZXZlcnl3aGVyZSBbZGFucGJdCi0tLQogY29uZmln
dXJlICAgICAgICAgfCAxICsKIHRyYWNlL21lc29uLmJ1aWxkIHwgNCArKy0tCiAyIGZpbGVzIGNo
YW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9jb25m
aWd1cmUgYi9jb25maWd1cmUKaW5kZXggNzE0ZTc1YjVkOC4uNWQ5MWQ0OWM3YiAxMDA3NTUKLS0t
IGEvY29uZmlndXJlCisrKyBiL2NvbmZpZ3VyZQpAQCAtNDgzMiw2ICs0ODMyLDcgQEAgaWYgaGF2
ZV9iYWNrZW5kICJkdHJhY2UiOyB0aGVuCiAgIHRyYWNlX2JhY2tlbmRfc3RhcD0ibm8iCiAgIGlm
IGhhcyAnc3RhcCcgOyB0aGVuCiAgICAgdHJhY2VfYmFja2VuZF9zdGFwPSJ5ZXMiCisgICAgUUVN
VV9DRkxBR1M9IiRRRU1VX0NGTEFHUyAtRFNUQVBfU0RUX1YyIgogICBmaQogZmkKIApkaWZmIC0t
Z2l0IGEvdHJhY2UvbWVzb24uYnVpbGQgYi90cmFjZS9tZXNvbi5idWlsZAppbmRleCBkNWZjNDVj
NjI4Li44NDNlYTE0NDk1IDEwMDY0NAotLS0gYS90cmFjZS9tZXNvbi5idWlsZAorKysgYi90cmFj
ZS9tZXNvbi5idWlsZApAQCAtMzgsMTMgKzM4LDEzIEBAIGZvcmVhY2ggZGlyIDogWyAnLicgXSAr
IHRyYWNlX2V2ZW50c19zdWJkaXJzCiAgICAgdHJhY2VfZHRyYWNlX2ggPSBjdXN0b21fdGFyZ2V0
KGZtdC5mb3JtYXQoJ3RyYWNlLWR0cmFjZScsICdoJyksCiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIG91dHB1dDogZm10LmZvcm1hdCgndHJhY2UtZHRyYWNlJywgJ2gnKSwKICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaW5wdXQ6IHRyYWNlX2R0cmFjZSwKLSAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29tbWFuZDogWyAnZHRyYWNlJywgJy1v
JywgJ0BPVVRQVVRAJywgJy1oJywgJy1zJywgJ0BJTlBVVEAnIF0pCisgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIGNvbW1hbmQ6IFsgJ2R0cmFjZScsICctRFNUQVBfU0RUX1YyJywg
Jy1vJywgJ0BPVVRQVVRAJywgJy1oJywgJy1zJywgJ0BJTlBVVEAnIF0pCiAgICAgdHJhY2Vfc3Mu
YWRkKHRyYWNlX2R0cmFjZV9oKQogICAgIGlmIGhvc3RfbWFjaGluZS5zeXN0ZW0oKSAhPSAnZGFy
d2luJwogICAgICAgdHJhY2VfZHRyYWNlX28gPSBjdXN0b21fdGFyZ2V0KGZtdC5mb3JtYXQoJ3Ry
YWNlLWR0cmFjZScsICdvJyksCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
b3V0cHV0OiBmbXQuZm9ybWF0KCd0cmFjZS1kdHJhY2UnLCAnbycpLAogICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIGlucHV0OiB0cmFjZV9kdHJhY2UsCi0gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgY29tbWFuZDogWyAnZHRyYWNlJywgJy1vJywgJ0BPVVRQ
VVRAJywgJy1HJywgJy1zJywgJ0BJTlBVVEAnIF0pCisgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgY29tbWFuZDogWyAnZHRyYWNlJywgJy1EU1RBUF9TRFRfVjInLCAnLW8nLCAn
QE9VVFBVVEAnLCAnLUcnLCAnLXMnLCAnQElOUFVUQCcgXSkKICAgICAgIHRyYWNlX3NzLmFkZCh0
cmFjZV9kdHJhY2VfbykKICAgICBlbmRpZgogCi0tIAoyLjI4LjAKCg==


