Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EBCD3C1428
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 15:21:36 +0200 (CEST)
Received: from localhost ([::1]:60924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1TyB-0008NX-4p
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 09:21:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1m1TpB-0002BA-6C
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 09:12:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41899)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1m1Tp0-0000fe-Kx
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 09:12:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625749925;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KrYVBHC3vnFNE5ZaL5/G6mEcyR9PcvRAlapWZn6AUoY=;
 b=HYpFUI6aN02XbjLTIIiZNq8gLZf3VsYOPuMdgurp0D3ozSBhGzpRf4EIkgWAGreDUk928U
 lSd43dLlLTXuG3be96aXj2hcQdezyAMt9YR3zsO3UW23QMEcV1xWqEYvjoXH2qBBZGZgPn
 8bGnZrc1yImdP+INblitoRRpEBM5S+0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-428-DRgt8TjaOfmm8mF2OJTQ1Q-1; Thu, 08 Jul 2021 09:11:56 -0400
X-MC-Unique: DRgt8TjaOfmm8mF2OJTQ1Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 181EF10A4043;
 Thu,  8 Jul 2021 13:11:55 +0000 (UTC)
Received: from localhost (ovpn-114-141.ams2.redhat.com [10.36.114.141])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 343E819C66;
 Thu,  8 Jul 2021 13:11:51 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 3/5] block/file-posix: Optimize for macOS
Date: Thu,  8 Jul 2021 14:11:41 +0100
Message-Id: <20210708131143.240647-4-stefanha@redhat.com>
In-Reply-To: <20210708131143.240647-1-stefanha@redhat.com>
References: <20210708131143.240647-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.45,
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

RnJvbTogQWtpaGlrbyBPZGFraSA8YWtpaGlrby5vZGFraUBnbWFpbC5jb20+CgpUaGlzIGNvbW1p
dCBpbnRyb2R1Y2VzICJwdW5jaCBob2xlIiBvcGVyYXRpb24gYW5kIG9wdGltaXplcyB0cmFuc2Zl
cgpibG9jayBzaXplIGZvciBtYWNPUy4KClRoYW5rcyB0byBLb25zdGFudGluIE5hemFyb3YgZm9y
IGRldGFpbGVkIGFuYWx5c2lzIG9mIGEgZmxhdyBpbiBhbgpvbGQgdmVyc2lvbiBvZiB0aGlzIGNo
YW5nZToKaHR0cHM6Ly9naXN0LmdpdGh1Yi5jb20vYWtpaGlrb2Rha2kvODdkZjQxNDllN2NhODdm
MThkYzU2ODA3ZWM1YTFiYzUjZ2lzdGNvbW1lbnQtMzY1NDY2NwoKU2lnbmVkLW9mZi1ieTogQWtp
aGlrbyBPZGFraSA8YWtpaGlrby5vZGFraUBnbWFpbC5jb20+Ck1lc3NhZ2UtaWQ6IDIwMjEwNzA1
MTMwNDU4Ljk3NjQyLTEtYWtpaGlrby5vZGFraUBnbWFpbC5jb20KU2lnbmVkLW9mZi1ieTogU3Rl
ZmFuIEhham5vY3ppIDxzdGVmYW5oYUByZWRoYXQuY29tPgotLS0KIGJsb2NrL2ZpbGUtcG9zaXgu
YyB8IDI3ICsrKysrKysrKysrKysrKysrKysrKysrKystLQogMSBmaWxlIGNoYW5nZWQsIDI1IGlu
c2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYmxvY2svZmlsZS1wb3Np
eC5jIGIvYmxvY2svZmlsZS1wb3NpeC5jCmluZGV4IGEyNmVhYjBhYzMuLmNiOWJmZmUwNDcgMTAw
NjQ0Ci0tLSBhL2Jsb2NrL2ZpbGUtcG9zaXguYworKysgYi9ibG9jay9maWxlLXBvc2l4LmMKQEAg
LTQ2LDYgKzQ2LDcgQEAKICNpZiBkZWZpbmVkKEhBVkVfSE9TVF9CTE9DS19ERVZJQ0UpCiAjaW5j
bHVkZSA8cGF0aHMuaD4KICNpbmNsdWRlIDxzeXMvcGFyYW0uaD4KKyNpbmNsdWRlIDxzeXMvbW91
bnQuaD4KICNpbmNsdWRlIDxJT0tpdC9JT0tpdExpYi5oPgogI2luY2x1ZGUgPElPS2l0L0lPQlNE
Lmg+CiAjaW5jbHVkZSA8SU9LaXQvc3RvcmFnZS9JT01lZGlhQlNEQ2xpZW50Lmg+CkBAIC0xMjU0
LDYgKzEyNTUsMTUgQEAgc3RhdGljIHZvaWQgcmF3X3JlZnJlc2hfbGltaXRzKEJsb2NrRHJpdmVy
U3RhdGUgKmJzLCBFcnJvciAqKmVycnApCiAgICAgICAgIHJldHVybjsKICAgICB9CiAKKyNpZiBk
ZWZpbmVkKF9fQVBQTEVfXykgJiYgKF9fTUFDSF9fKQorICAgIHN0cnVjdCBzdGF0ZnMgYnVmOwor
CisgICAgaWYgKCFmc3RhdGZzKHMtPmZkLCAmYnVmKSkgeworICAgICAgICBicy0+Ymwub3B0X3Ry
YW5zZmVyID0gYnVmLmZfaW9zaXplOworICAgICAgICBicy0+YmwucGRpc2NhcmRfYWxpZ25tZW50
ID0gYnVmLmZfYnNpemU7CisgICAgfQorI2VuZGlmCisKICAgICBpZiAoYnMtPnNnIHx8IFNfSVNC
TEsoc3Quc3RfbW9kZSkpIHsKICAgICAgICAgaW50IHJldCA9IGhkZXZfZ2V0X21heF9od190cmFu
c2ZlcihzLT5mZCwgJnN0KTsKIApAQCAtMTU5MSw2ICsxNjAxLDcgQEAgb3V0OgogICAgIH0KIH0K
IAorI2lmIGRlZmluZWQoQ09ORklHX0ZBTExPQ0FURSkgfHwgZGVmaW5lZChCTEtaRVJPT1VUKSB8
fCBkZWZpbmVkKEJMS0RJU0NBUkQpCiBzdGF0aWMgaW50IHRyYW5zbGF0ZV9lcnIoaW50IGVycikK
IHsKICAgICBpZiAoZXJyID09IC1FTk9ERVYgfHwgZXJyID09IC1FTk9TWVMgfHwgZXJyID09IC1F
T1BOT1RTVVBQIHx8CkBAIC0xNTk5LDYgKzE2MTAsNyBAQCBzdGF0aWMgaW50IHRyYW5zbGF0ZV9l
cnIoaW50IGVycikKICAgICB9CiAgICAgcmV0dXJuIGVycjsKIH0KKyNlbmRpZgogCiAjaWZkZWYg
Q09ORklHX0ZBTExPQ0FURQogc3RhdGljIGludCBkb19mYWxsb2NhdGUoaW50IGZkLCBpbnQgbW9k
ZSwgb2ZmX3Qgb2Zmc2V0LCBvZmZfdCBsZW4pCkBAIC0xODExLDE2ICsxODIzLDI3IEBAIHN0YXRp
YyBpbnQgaGFuZGxlX2Fpb2NiX2Rpc2NhcmQodm9pZCAqb3BhcXVlKQogICAgICAgICAgICAgfQog
ICAgICAgICB9IHdoaWxlIChlcnJubyA9PSBFSU5UUik7CiAKLSAgICAgICAgcmV0ID0gLWVycm5v
OworICAgICAgICByZXQgPSB0cmFuc2xhdGVfZXJyKC1lcnJubyk7CiAjZW5kaWYKICAgICB9IGVs
c2UgewogI2lmZGVmIENPTkZJR19GQUxMT0NBVEVfUFVOQ0hfSE9MRQogICAgICAgICByZXQgPSBk
b19mYWxsb2NhdGUocy0+ZmQsIEZBTExPQ19GTF9QVU5DSF9IT0xFIHwgRkFMTE9DX0ZMX0tFRVBf
U0laRSwKICAgICAgICAgICAgICAgICAgICAgICAgICAgIGFpb2NiLT5haW9fb2Zmc2V0LCBhaW9j
Yi0+YWlvX25ieXRlcyk7CisgICAgICAgIHJldCA9IHRyYW5zbGF0ZV9lcnIoLWVycm5vKTsKKyNl
bGlmIGRlZmluZWQoX19BUFBMRV9fKSAmJiAoX19NQUNIX18pCisgICAgICAgIGZwdW5jaGhvbGVf
dCBmcHVuY2hob2xlOworICAgICAgICBmcHVuY2hob2xlLmZwX2ZsYWdzID0gMDsKKyAgICAgICAg
ZnB1bmNoaG9sZS5yZXNlcnZlZCA9IDA7CisgICAgICAgIGZwdW5jaGhvbGUuZnBfb2Zmc2V0ID0g
YWlvY2ItPmFpb19vZmZzZXQ7CisgICAgICAgIGZwdW5jaGhvbGUuZnBfbGVuZ3RoID0gYWlvY2It
PmFpb19uYnl0ZXM7CisgICAgICAgIGlmIChmY250bChzLT5mZCwgRl9QVU5DSEhPTEUsICZmcHVu
Y2hob2xlKSA9PSAtMSkgeworICAgICAgICAgICAgcmV0ID0gZXJybm8gPT0gRU5PREVWID8gLUVO
T1RTVVAgOiAtZXJybm87CisgICAgICAgIH0gZWxzZSB7CisgICAgICAgICAgICByZXQgPSAwOwor
ICAgICAgICB9CiAjZW5kaWYKICAgICB9CiAKLSAgICByZXQgPSB0cmFuc2xhdGVfZXJyKHJldCk7
CiAgICAgaWYgKHJldCA9PSAtRU5PVFNVUCkgewogICAgICAgICBzLT5oYXNfZGlzY2FyZCA9IGZh
bHNlOwogICAgIH0KLS0gCjIuMzEuMQoK


