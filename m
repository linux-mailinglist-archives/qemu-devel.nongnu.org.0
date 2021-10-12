Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17C6242A246
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 12:36:54 +0200 (CEST)
Received: from localhost ([::1]:46610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maF9R-0007gY-4t
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 06:36:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1maElK-0000pS-HT
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 06:11:58 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:64084)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1maElH-0006yI-Ph
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 06:11:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1634033515; x=1665569515;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=J1q6N7eroWTogI5P3k1kl74rt4nIu/OpnQAPpp9LGg8=;
 b=o4eBk01xNM2VEGx7s9HbaPzopNAF3VyTRr6HwzY1/BOSps3kp7+kwLms
 abMARaqIiNuHEZiqIUj+GK0waHbZCBTql5jkrN3DZ0JormzYx3goAE4WZ
 rW5bDH4KbGiOMlOgkdW8HIPnblEI2Lbafyao6xpYM4TMaA/kYyeJs2J+3 0=;
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 12 Oct 2021 03:11:24 -0700
X-QCInternal: smtphost
Received: from vu-tsimpson-aus.qualcomm.com (HELO
 vu-tsimpson1-aus.qualcomm.com) ([10.222.150.1])
 by ironmsg01-sd.qualcomm.com with ESMTP; 12 Oct 2021 03:11:23 -0700
Received: by vu-tsimpson1-aus.qualcomm.com (Postfix, from userid 47164)
 id 6C4561750; Tue, 12 Oct 2021 05:11:22 -0500 (CDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 21/30] Hexagon HVX (target/hexagon) helper overrides -
 vector splat and abs
Date: Tue, 12 Oct 2021 05:10:59 -0500
Message-Id: <1634033468-23566-22-git-send-email-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1634033468-23566-1-git-send-email-tsimpson@quicinc.com>
References: <1634033468-23566-1-git-send-email-tsimpson@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=199.106.114.39;
 envelope-from=tsimpson@qualcomm.com; helo=alexa-out-sd-02.qualcomm.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: ale@rev.ng, bcain@quicinc.com, tsimpson@quicinc.com,
 richard.henderson@linaro.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UmV2aWV3ZWQtYnk6IFJpY2hhcmQgSGVuZGVyc29uIDxyaWNoYXJkLmhlbmRlcnNvbkBsaW5hcm8u
b3JnPgpTaWduZWQtb2ZmLWJ5OiBUYXlsb3IgU2ltcHNvbiA8dHNpbXBzb25AcXVpY2luYy5jb20+
Ci0tLQogdGFyZ2V0L2hleGFnb24vZ2VuX3RjZ19odnguaCB8IDI2ICsrKysrKysrKysrKysrKysr
KysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMjYgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBh
L3RhcmdldC9oZXhhZ29uL2dlbl90Y2dfaHZ4LmggYi90YXJnZXQvaGV4YWdvbi9nZW5fdGNnX2h2
eC5oCmluZGV4IDMyZjhlMjAuLjQzNWM3YjUgMTAwNjQ0Ci0tLSBhL3RhcmdldC9oZXhhZ29uL2dl
bl90Y2dfaHZ4LmgKKysrIGIvdGFyZ2V0L2hleGFnb24vZ2VuX3RjZ19odnguaApAQCAtNTA2LDQg
KzUwNiwzMCBAQCBzdGF0aWMgaW5saW5lIHZvaWQgYXNzZXJ0X3ZoaXN0X3RtcChEaXNhc0NvbnRl
eHQgKmN0eCkKICNkZWZpbmUgZkdFTl9UQ0dfVjZfdmVxYl94b3IoU0hPUlRDT0RFKSBcCiAgICAg
ZkdFTl9UQ0dfVkVDX0NNUF9PUChUQ0dfQ09ORF9FUSwgTU9fOCwgMSwgdGNnX2dlbl9ndmVjX3hv
cikKIAorLyogVmVjdG9yIHNwbGF0IC0gdmFyaW91cyBmb3JtcyAqLworI2RlZmluZSBmR0VOX1RD
R19WNl9sdnNwbGF0dyhTSE9SVENPREUpIFwKKyAgICB0Y2dfZ2VuX2d2ZWNfZHVwX2kzMihNT18z
MiwgVmRWX29mZiwgXAorICAgICAgICAgICAgICAgICAgICAgICAgIHNpemVvZihNTVZlY3Rvciks
IHNpemVvZihNTVZlY3RvciksIFJ0VikKKworI2RlZmluZSBmR0VOX1RDR19WNl9sdnNwbGF0aChT
SE9SVENPREUpIFwKKyAgICB0Y2dfZ2VuX2d2ZWNfZHVwX2kzMihNT18xNiwgVmRWX29mZiwgXAor
ICAgICAgICAgICAgICAgICAgICAgICAgIHNpemVvZihNTVZlY3RvciksIHNpemVvZihNTVZlY3Rv
ciksIFJ0VikKKworI2RlZmluZSBmR0VOX1RDR19WNl9sdnNwbGF0YihTSE9SVENPREUpIFwKKyAg
ICB0Y2dfZ2VuX2d2ZWNfZHVwX2kzMihNT184LCBWZFZfb2ZmLCBcCisgICAgICAgICAgICAgICAg
ICAgICAgICAgc2l6ZW9mKE1NVmVjdG9yKSwgc2l6ZW9mKE1NVmVjdG9yKSwgUnRWKQorCisvKiBW
ZWN0b3IgYWJzb2x1dGUgdmFsdWUgLSB2YXJpb3VzIGZvcm1zICovCisjZGVmaW5lIGZHRU5fVENH
X1Y2X3ZhYnNiKFNIT1JUQ09ERSkgXAorICAgIHRjZ19nZW5fZ3ZlY19hYnMoTU9fOCwgVmRWX29m
ZiwgVnVWX29mZiwgXAorICAgICAgICAgICAgICAgICAgICAgc2l6ZW9mKE1NVmVjdG9yKSwgc2l6
ZW9mKE1NVmVjdG9yKSkKKworI2RlZmluZSBmR0VOX1RDR19WNl92YWJzaChTSE9SVENPREUpIFwK
KyAgICB0Y2dfZ2VuX2d2ZWNfYWJzKE1PXzE2LCBWZFZfb2ZmLCBWdVZfb2ZmLCBcCisgICAgICAg
ICAgICAgICAgICAgICBzaXplb2YoTU1WZWN0b3IpLCBzaXplb2YoTU1WZWN0b3IpKQorCisjZGVm
aW5lIGZHRU5fVENHX1Y2X3ZhYnN3KFNIT1JUQ09ERSkgXAorICAgIHRjZ19nZW5fZ3ZlY19hYnMo
TU9fMzIsIFZkVl9vZmYsIFZ1Vl9vZmYsIFwKKyAgICAgICAgICAgICAgICAgICAgIHNpemVvZihN
TVZlY3RvciksIHNpemVvZihNTVZlY3RvcikpCisKICNlbmRpZgotLSAKMi43LjQKCg==

