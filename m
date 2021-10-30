Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 369B74406BA
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Oct 2021 03:33:15 +0200 (CEST)
Received: from localhost ([::1]:54408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgdFC-0006IT-Ad
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 21:33:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1mgd3d-00032d-7o
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 21:21:22 -0400
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:19382)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1mgd3Z-0001ck-Aq
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 21:21:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1635556873; x=1667092873;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JBCCN5H5bz4c67uJquQok+enn3m5jJcyBvEYEBA6Ros=;
 b=ebZl+foXiFi0kkDnsGhSuou0ou2O/FWeTu4cxJ3yWbvZl314MT8d3FCY
 2EKQEIEEfm32yiichjlkVyxR3WywIfij57WTWybooZXfXddCWTY3FMiCA
 LwC3usiumahY1WfMU1z3LwIqyFknOgcpv7oAtcyyBBKFddrYmPiqDtYDo I=;
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 29 Oct 2021 18:20:58 -0700
X-QCInternal: smtphost
Received: from vu-tsimpson-aus.qualcomm.com (HELO
 vu-tsimpson1-aus.qualcomm.com) ([10.222.150.1])
 by ironmsg01-sd.qualcomm.com with ESMTP; 29 Oct 2021 18:20:58 -0700
Received: by vu-tsimpson1-aus.qualcomm.com (Postfix, from userid 47164)
 id 1BF7A31C7; Fri, 29 Oct 2021 20:20:57 -0500 (CDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 19/30] Hexagon HVX (target/hexagon) helper overrides -
 vector logical ops
Date: Fri, 29 Oct 2021 20:20:38 -0500
Message-Id: <1635556849-18120-20-git-send-email-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1635556849-18120-1-git-send-email-tsimpson@quicinc.com>
References: <1635556849-18120-1-git-send-email-tsimpson@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=199.106.114.38;
 envelope-from=tsimpson@qualcomm.com; helo=alexa-out-sd-01.qualcomm.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Ci0tLQogdGFyZ2V0L2hleGFnb24vZ2VuX3RjZ19odnguaCB8IDQyICsrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDQyIGluc2VydGlvbnMo
KykKCmRpZmYgLS1naXQgYS90YXJnZXQvaGV4YWdvbi9nZW5fdGNnX2h2eC5oIGIvdGFyZ2V0L2hl
eGFnb24vZ2VuX3RjZ19odnguaAppbmRleCBmNTQ4NDA0Li5mNTNhN2YyIDEwMDY0NAotLS0gYS90
YXJnZXQvaGV4YWdvbi9nZW5fdGNnX2h2eC5oCisrKyBiL3RhcmdldC9oZXhhZ29uL2dlbl90Y2df
aHZ4LmgKQEAgLTM2MSw0ICszNjEsNDYgQEAgc3RhdGljIGlubGluZSB2b2lkIGFzc2VydF92aGlz
dF90bXAoRGlzYXNDb250ZXh0ICpjdHgpCiAgICAgdGNnX2dlbl9ndmVjX3VtaW4oTU9fOCwgVmRW
X29mZiwgVnVWX29mZiwgVnZWX29mZiwgXAogICAgICAgICAgICAgICAgICAgICAgIHNpemVvZihN
TVZlY3RvciksIHNpemVvZihNTVZlY3RvcikpCiAKKy8qIFZlY3RvciBsb2dpY2FsIG9wcyAqLwor
I2RlZmluZSBmR0VOX1RDR19WNl92eG9yKFNIT1JUQ09ERSkgXAorICAgIHRjZ19nZW5fZ3ZlY194
b3IoTU9fNjQsIFZkVl9vZmYsIFZ1Vl9vZmYsIFZ2Vl9vZmYsIFwKKyAgICAgICAgICAgICAgICAg
ICAgIHNpemVvZihNTVZlY3RvciksIHNpemVvZihNTVZlY3RvcikpCisKKyNkZWZpbmUgZkdFTl9U
Q0dfVjZfdmFuZChTSE9SVENPREUpIFwKKyAgICB0Y2dfZ2VuX2d2ZWNfYW5kKE1PXzY0LCBWZFZf
b2ZmLCBWdVZfb2ZmLCBWdlZfb2ZmLCBcCisgICAgICAgICAgICAgICAgICAgICBzaXplb2YoTU1W
ZWN0b3IpLCBzaXplb2YoTU1WZWN0b3IpKQorCisjZGVmaW5lIGZHRU5fVENHX1Y2X3ZvcihTSE9S
VENPREUpIFwKKyAgICB0Y2dfZ2VuX2d2ZWNfb3IoTU9fNjQsIFZkVl9vZmYsIFZ1Vl9vZmYsIFZ2
Vl9vZmYsIFwKKyAgICAgICAgICAgICAgICAgICAgc2l6ZW9mKE1NVmVjdG9yKSwgc2l6ZW9mKE1N
VmVjdG9yKSkKKworI2RlZmluZSBmR0VOX1RDR19WNl92bm90KFNIT1JUQ09ERSkgXAorICAgIHRj
Z19nZW5fZ3ZlY19ub3QoTU9fNjQsIFZkVl9vZmYsIFZ1Vl9vZmYsIFwKKyAgICAgICAgICAgICAg
ICAgICAgIHNpemVvZihNTVZlY3RvciksIHNpemVvZihNTVZlY3RvcikpCisKKy8qIFEgcmVnaXN0
ZXIgbG9naWNhbCBvcHMgKi8KKyNkZWZpbmUgZkdFTl9UQ0dfVjZfcHJlZF9vcihTSE9SVENPREUp
IFwKKyAgICB0Y2dfZ2VuX2d2ZWNfb3IoTU9fNjQsIFFkVl9vZmYsIFFzVl9vZmYsIFF0Vl9vZmYs
IFwKKyAgICAgICAgICAgICAgICAgICAgc2l6ZW9mKE1NUVJlZyksIHNpemVvZihNTVFSZWcpKQor
CisjZGVmaW5lIGZHRU5fVENHX1Y2X3ByZWRfYW5kKFNIT1JUQ09ERSkgXAorICAgIHRjZ19nZW5f
Z3ZlY19hbmQoTU9fNjQsIFFkVl9vZmYsIFFzVl9vZmYsIFF0Vl9vZmYsIFwKKyAgICAgICAgICAg
ICAgICAgICAgIHNpemVvZihNTVFSZWcpLCBzaXplb2YoTU1RUmVnKSkKKworI2RlZmluZSBmR0VO
X1RDR19WNl9wcmVkX3hvcihTSE9SVENPREUpIFwKKyAgICB0Y2dfZ2VuX2d2ZWNfeG9yKE1PXzY0
LCBRZFZfb2ZmLCBRc1Zfb2ZmLCBRdFZfb2ZmLCBcCisgICAgICAgICAgICAgICAgICAgICBzaXpl
b2YoTU1RUmVnKSwgc2l6ZW9mKE1NUVJlZykpCisKKyNkZWZpbmUgZkdFTl9UQ0dfVjZfcHJlZF9v
cl9uKFNIT1JUQ09ERSkgXAorICAgIHRjZ19nZW5fZ3ZlY19vcmMoTU9fNjQsIFFkVl9vZmYsIFFz
Vl9vZmYsIFF0Vl9vZmYsIFwKKyAgICAgICAgICAgICAgICAgICAgIHNpemVvZihNTVFSZWcpLCBz
aXplb2YoTU1RUmVnKSkKKworI2RlZmluZSBmR0VOX1RDR19WNl9wcmVkX2FuZF9uKFNIT1JUQ09E
RSkgXAorICAgIHRjZ19nZW5fZ3ZlY19hbmRjKE1PXzY0LCBRZFZfb2ZmLCBRc1Zfb2ZmLCBRdFZf
b2ZmLCBcCisgICAgICAgICAgICAgICAgICAgICAgc2l6ZW9mKE1NUVJlZyksIHNpemVvZihNTVFS
ZWcpKQorCisjZGVmaW5lIGZHRU5fVENHX1Y2X3ByZWRfbm90KFNIT1JUQ09ERSkgXAorICAgIHRj
Z19nZW5fZ3ZlY19ub3QoTU9fNjQsIFFkVl9vZmYsIFFzVl9vZmYsIFwKKyAgICAgICAgICAgICAg
ICAgICAgIHNpemVvZihNTVFSZWcpLCBzaXplb2YoTU1RUmVnKSkKKwogI2VuZGlmCi0tIAoyLjcu
NAoK

