Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2CBF444A2F
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 22:24:10 +0100 (CET)
Received: from localhost ([::1]:33668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miNjt-00085g-PK
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 17:24:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1miNdb-0002k0-P4
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 17:17:39 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:11447)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1miNda-0007Cy-1M
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 17:17:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1635974258; x=1667510258;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JBCCN5H5bz4c67uJquQok+enn3m5jJcyBvEYEBA6Ros=;
 b=FfdKTzR64rFN6F0i36O7z0b5C3mADRdGSGBn6hI4k5cN9yk0VVMthO3v
 jZKAJc9P2kBfWALP/lE3nNCtsokMxdWJ01kUoyyotUvRAhQc7AIMZKcK1
 8mhI7aU7DPx9nnDHYEc4WOO2GALyUiEw9sBPjHfBP2jQ8TwXkvNPsK0ha A=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 03 Nov 2021 14:17:30 -0700
X-QCInternal: smtphost
Received: from vu-tsimpson-aus.qualcomm.com (HELO
 vu-tsimpson1-aus.qualcomm.com) ([10.222.150.1])
 by ironmsg-SD-alpha.qualcomm.com with ESMTP; 03 Nov 2021 14:17:30 -0700
Received: by vu-tsimpson1-aus.qualcomm.com (Postfix, from userid 47164)
 id C1760308E; Wed,  3 Nov 2021 16:17:28 -0500 (CDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 19/30] Hexagon HVX (target/hexagon) helper overrides -
 vector logical ops
Date: Wed,  3 Nov 2021 16:17:16 -0500
Message-Id: <1635974247-1820-20-git-send-email-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1635974247-1820-1-git-send-email-tsimpson@quicinc.com>
References: <1635974247-1820-1-git-send-email-tsimpson@quicinc.com>
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
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, tsimpson@quicinc.com,
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

