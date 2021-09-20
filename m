Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FCB9412843
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 23:42:11 +0200 (CEST)
Received: from localhost ([::1]:52940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSR3C-0004iC-EX
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 17:42:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1mSQmf-0002Yb-86
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 17:25:05 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:9862)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1mSQmc-00023A-99
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 17:25:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1632173102; x=1663709102;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GFXG4X9+e1YR/zPVhEO6ZVJyMEYwqPnGeB5pCx4/dmk=;
 b=VDp9A9Ssf8Gdymodf2YQSlg1NhwGAW3VBKzxxIbPLDrK1MpXi0ekG6ig
 /TOoGS9GEQveF1V6NQZjK5LLbufML5b2sGvtVsVufzwhsB/6f42/EvUPV
 jOu8V3mW+psAH6X7iILnPAKYb9rKQBCs5zUz+tTDRbpuTv4uAXWpKOLMK E=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 20 Sep 2021 14:24:37 -0700
X-QCInternal: smtphost
Received: from vu-tsimpson-aus.qualcomm.com (HELO
 vu-tsimpson1-aus.qualcomm.com) ([10.222.150.1])
 by ironmsg-SD-alpha.qualcomm.com with ESMTP; 20 Sep 2021 14:24:37 -0700
Received: by vu-tsimpson1-aus.qualcomm.com (Postfix, from userid 47164)
 id B8524169F; Mon, 20 Sep 2021 16:24:35 -0500 (CDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 16/30] Hexagon HVX (target/hexagon) helper overrides -
 vector add & sub
Date: Mon, 20 Sep 2021 16:24:11 -0500
Message-Id: <1632173065-18522-17-git-send-email-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1632173065-18522-1-git-send-email-tsimpson@quicinc.com>
References: <1632173065-18522-1-git-send-email-tsimpson@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=199.106.114.39;
 envelope-from=tsimpson@qualcomm.com; helo=alexa-out-sd-02.qualcomm.com
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

U2lnbmVkLW9mZi1ieTogVGF5bG9yIFNpbXBzb24gPHRzaW1wc29uQHF1aWNpbmMuY29tPgotLS0K
IHRhcmdldC9oZXhhZ29uL2dlbl90Y2dfaHZ4LmggfCA1MCArKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDUwIGluc2VydGlvbnMoKykK
CmRpZmYgLS1naXQgYS90YXJnZXQvaGV4YWdvbi9nZW5fdGNnX2h2eC5oIGIvdGFyZ2V0L2hleGFn
b24vZ2VuX3RjZ19odnguaAppbmRleCBiY2Q1M2Q0Li5jMmRiMGFkIDEwMDY0NAotLS0gYS90YXJn
ZXQvaGV4YWdvbi9nZW5fdGNnX2h2eC5oCisrKyBiL3RhcmdldC9oZXhhZ29uL2dlbl90Y2dfaHZ4
LmgKQEAgLTE1Nyw0ICsxNTcsNTQgQEAgc3RhdGljIGlubGluZSB2b2lkIGFzc2VydF92aGlzdF90
bXAoRGlzYXNDb250ZXh0ICpjdHgpCiAjZGVmaW5lIGZHRU5fVENHX1Y2X3ZuY21vdihTSE9SVENP
REUpIFwKICAgICBmR0VOX1RDR19WRUNfQ01PVigwKQogCisvKiBWZWN0b3IgYWRkIC0gdmFyaW91
cyBmb3JtcyAqLworI2RlZmluZSBmR0VOX1RDR19WNl92YWRkYihTSE9SVENPREUpIFwKKyAgICB0
Y2dfZ2VuX2d2ZWNfYWRkKE1PXzgsIFZkVl9vZmYsIFZ1Vl9vZmYsIFZ2Vl9vZmYsIFwKKyAgICAg
ICAgICAgICAgICAgICAgIHNpemVvZihNTVZlY3RvciksIHNpemVvZihNTVZlY3RvcikpCisKKyNk
ZWZpbmUgZkdFTl9UQ0dfVjZfdmFkZGgoU0hPUlRDWURFKSBcCisgICAgdGNnX2dlbl9ndmVjX2Fk
ZChNT18xNiwgVmRWX29mZiwgVnVWX29mZiwgVnZWX29mZiwgXAorICAgICAgICAgICAgICAgICAg
ICAgc2l6ZW9mKE1NVmVjdG9yKSwgc2l6ZW9mKE1NVmVjdG9yKSkKKworI2RlZmluZSBmR0VOX1RD
R19WNl92YWRkdyhTSE9SVENPREUpIFwKKyAgICB0Y2dfZ2VuX2d2ZWNfYWRkKE1PXzMyLCBWZFZf
b2ZmLCBWdVZfb2ZmLCBWdlZfb2ZmLCBcCisgICAgICAgICAgICAgICAgICAgICBzaXplb2YoTU1W
ZWN0b3IpLCBzaXplb2YoTU1WZWN0b3IpKQorCisjZGVmaW5lIGZHRU5fVENHX1Y2X3ZhZGRiX2R2
KFNIT1JUQ09ERSkgXAorICAgIHRjZ19nZW5fZ3ZlY19hZGQoTU9fOCwgVmRkVl9vZmYsIFZ1dVZf
b2ZmLCBWdnZWX29mZiwgXAorICAgICAgICAgICAgICAgICAgICAgc2l6ZW9mKE1NVmVjdG9yKSAq
IDIsIHNpemVvZihNTVZlY3RvcikgKiAyKQorCisjZGVmaW5lIGZHRU5fVENHX1Y2X3ZhZGRoX2R2
KFNIT1JUQ1lERSkgXAorICAgIHRjZ19nZW5fZ3ZlY19hZGQoTU9fMTYsIFZkZFZfb2ZmLCBWdXVW
X29mZiwgVnZ2Vl9vZmYsIFwKKyAgICAgICAgICAgICAgICAgICAgIHNpemVvZihNTVZlY3Rvcikg
KiAyLCBzaXplb2YoTU1WZWN0b3IpICogMikKKworI2RlZmluZSBmR0VOX1RDR19WNl92YWRkd19k
dihTSE9SVENPREUpIFwKKyAgICB0Y2dfZ2VuX2d2ZWNfYWRkKE1PXzMyLCBWZGRWX29mZiwgVnV1
Vl9vZmYsIFZ2dlZfb2ZmLCBcCisgICAgICAgICAgICAgICAgICAgICBzaXplb2YoTU1WZWN0b3Ip
ICogMiwgc2l6ZW9mKE1NVmVjdG9yKSAqIDIpCisKKy8qIFZlY3RvciBzdWIgLSB2YXJpb3VzIGZv
cm1zICovCisjZGVmaW5lIGZHRU5fVENHX1Y2X3ZzdWJiKFNIT1JUQ09ERSkgXAorICAgIHRjZ19n
ZW5fZ3ZlY19zdWIoTU9fOCwgVmRWX29mZiwgVnVWX29mZiwgVnZWX29mZiwgXAorICAgICAgICAg
ICAgICAgICAgICAgc2l6ZW9mKE1NVmVjdG9yKSwgc2l6ZW9mKE1NVmVjdG9yKSkKKworI2RlZmlu
ZSBmR0VOX1RDR19WNl92c3ViaChTSE9SVENPREUpIFwKKyAgICB0Y2dfZ2VuX2d2ZWNfc3ViKE1P
XzE2LCBWZFZfb2ZmLCBWdVZfb2ZmLCBWdlZfb2ZmLCBcCisgICAgICAgICAgICAgICAgICAgICBz
aXplb2YoTU1WZWN0b3IpLCBzaXplb2YoTU1WZWN0b3IpKQorCisjZGVmaW5lIGZHRU5fVENHX1Y2
X3ZzdWJ3KFNIT1JUQ09ERSkgXAorICAgIHRjZ19nZW5fZ3ZlY19zdWIoTU9fMzIsIFZkVl9vZmYs
IFZ1Vl9vZmYsIFZ2Vl9vZmYsIFwKKyAgICAgICAgICAgICAgICAgICAgIHNpemVvZihNTVZlY3Rv
ciksIHNpemVvZihNTVZlY3RvcikpCisKKyNkZWZpbmUgZkdFTl9UQ0dfVjZfdnN1YmJfZHYoU0hP
UlRDT0RFKSBcCisgICAgdGNnX2dlbl9ndmVjX3N1YihNT184LCBWZGRWX29mZiwgVnV1Vl9vZmYs
IFZ2dlZfb2ZmLCBcCisgICAgICAgICAgICAgICAgICAgICBzaXplb2YoTU1WZWN0b3IpICogMiwg
c2l6ZW9mKE1NVmVjdG9yKSAqIDIpCisKKyNkZWZpbmUgZkdFTl9UQ0dfVjZfdnN1YmhfZHYoU0hP
UlRDT0RFKSBcCisgICAgdGNnX2dlbl9ndmVjX3N1YihNT18xNiwgVmRkVl9vZmYsIFZ1dVZfb2Zm
LCBWdnZWX29mZiwgXAorICAgICAgICAgICAgICAgICAgICAgc2l6ZW9mKE1NVmVjdG9yKSAqIDIs
IHNpemVvZihNTVZlY3RvcikgKiAyKQorCisjZGVmaW5lIGZHRU5fVENHX1Y2X3ZzdWJ3X2R2KFNI
T1JUQ09ERSkgXAorICAgIHRjZ19nZW5fZ3ZlY19zdWIoTU9fMzIsIFZkZFZfb2ZmLCBWdXVWX29m
ZiwgVnZ2Vl9vZmYsIFwKKyAgICAgICAgICAgICAgICAgICAgIHNpemVvZihNTVZlY3RvcikgKiAy
LCBzaXplb2YoTU1WZWN0b3IpICogMikKKwogI2VuZGlmCi0tIAoyLjcuNAoK

