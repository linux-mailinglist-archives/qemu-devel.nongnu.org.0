Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD1D62B835F
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 18:50:57 +0100 (CET)
Received: from localhost ([::1]:43562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfRbc-0004Gf-KU
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 12:50:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kfRZI-0002vr-7x
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 12:48:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:58019)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kfRZB-00066L-Av
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 12:48:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605721701;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=lZgIjar1NGJFLnfYQJ2qL73zqFaHJXDnBPzvme9TW9U=;
 b=CsuArevB5CTFVEwb1Lq8s1GQTInS88m+34j/OG0QeTlWW4ln/gf0Mts7rzNUnF5KiJDyo7
 AMhTB0S8OCnvfs2UIXtThK1jPht+lvmE1oMVqKk3V1FsUEHP8c6SmxSH2ccseArqH19NHE
 8EMQ2EwKR+bfEDXrFnAkHN4ErBc4ov4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-208-6FHuctyfMZG4DaqrORxNgg-1; Wed, 18 Nov 2020 12:48:17 -0500
X-MC-Unique: 6FHuctyfMZG4DaqrORxNgg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C85956D24D;
 Wed, 18 Nov 2020 17:48:16 +0000 (UTC)
Received: from localhost (ovpn-114-60.ams2.redhat.com [10.36.114.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 68BD51964D;
 Wed, 18 Nov 2020 17:48:10 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] trace: use STAP_SDT_V2 to work around symbol visibility
Date: Wed, 18 Nov 2020 17:48:09 +0000
Message-Id: <20201118174809.686094-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 19:41:43
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
ZmluZSBTVEFQX1NEVF9WMiBzbyAvdXNyL2Jpbi9kdHJhY2UgcHJvZHVjZXMKYW4gLm8gZmlsZSB3
aXRoICdkZWZhdWx0JyBzeW1ib2wgdmlzaWJpbGl0eSBpbnN0ZWFkIG9mICdoaWRkZW4nLiBUaGlz
Cndvcmthcm91bmQgaXMgc21hbGwgYW5kIGVhc2llciB0byBtZXJnZSBmb3IgUUVNVSA1LjIuCgpD
YzogRGFuaWVsIFAuIEJlcnJhbmfDqSA8YmVycmFuZ2VAcmVkaGF0LmNvbT4KQ2M6IHdjb2hlbkBy
ZWRoYXQuY29tCkNjOiBmY2hlQHJlZGhhdC5jb20KQ2M6IGtyYXhlbEByZWRoYXQuY29tCkNjOiBy
am9uZXNAcmVkaGF0LmNvbQpDYzogbXJlemFuaW5AcmVkaGF0LmNvbQpDYzogZGRlcGF1bGFAcmVk
aGF0LmNvbQpTaWduZWQtb2ZmLWJ5OiBTdGVmYW4gSGFqbm9jemkgPHN0ZWZhbmhhQHJlZGhhdC5j
b20+Ci0tLQogdHJhY2UvbWVzb24uYnVpbGQgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS90cmFjZS9tZXNvbi5idWlsZCBi
L3RyYWNlL21lc29uLmJ1aWxkCmluZGV4IGQ1ZmM0NWM2MjguLjUyYmU3YzViMmMgMTAwNjQ0Ci0t
LSBhL3RyYWNlL21lc29uLmJ1aWxkCisrKyBiL3RyYWNlL21lc29uLmJ1aWxkCkBAIC00NCw3ICs0
NCw3IEBAIGZvcmVhY2ggZGlyIDogWyAnLicgXSArIHRyYWNlX2V2ZW50c19zdWJkaXJzCiAgICAg
ICB0cmFjZV9kdHJhY2VfbyA9IGN1c3RvbV90YXJnZXQoZm10LmZvcm1hdCgndHJhY2UtZHRyYWNl
JywgJ28nKSwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBvdXRwdXQ6IGZt
dC5mb3JtYXQoJ3RyYWNlLWR0cmFjZScsICdvJyksCiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgaW5wdXQ6IHRyYWNlX2R0cmFjZSwKLSAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBjb21tYW5kOiBbICdkdHJhY2UnLCAnLW8nLCAnQE9VVFBVVEAnLCAnLUcn
LCAnLXMnLCAnQElOUFVUQCcgXSkKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBjb21tYW5kOiBbICdkdHJhY2UnLCAnLURTVEFQX1NEVF9WMicsICctbycsICdAT1VUUFVUQCcs
ICctRycsICctcycsICdASU5QVVRAJyBdKQogICAgICAgdHJhY2Vfc3MuYWRkKHRyYWNlX2R0cmFj
ZV9vKQogICAgIGVuZGlmCiAKLS0gCjIuMjguMAoK


