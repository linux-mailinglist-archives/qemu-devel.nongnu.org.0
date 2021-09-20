Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA0A441286E
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 23:49:06 +0200 (CEST)
Received: from localhost ([::1]:39902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSR9t-0006us-Tl
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 17:49:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1mSQn6-00035I-B8
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 17:25:35 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:9859)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1mSQn4-00021x-Fb
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 17:25:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1632173130; x=1663709130;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Q4f+FZsuQT01T1ulhqdPvhig+jOWAw8WoXVNVRUvn3s=;
 b=nCsI47OuvfIoNoBDzR0hHZfdNowZ98fqUW1CCql9U21yBRE/K4miLhBO
 HHta5tt6wP+GGkiDEgbU/aFVy/ZvDFLkAmhr5quiVrJjM4srIfvM8PV60
 P3GBez0FKofD3XfFAoQT0xjC3tD9EOxbBu7dzrrkjtxEMlmvHDc33Vd76 g=;
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 20 Sep 2021 14:24:38 -0700
X-QCInternal: smtphost
Received: from vu-tsimpson-aus.qualcomm.com (HELO
 vu-tsimpson1-aus.qualcomm.com) ([10.222.150.1])
 by ironmsg01-sd.qualcomm.com with ESMTP; 20 Sep 2021 14:24:37 -0700
Received: by vu-tsimpson1-aus.qualcomm.com (Postfix, from userid 47164)
 id C3D4E16EA; Mon, 20 Sep 2021 16:24:35 -0500 (CDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 21/30] Hexagon HVX (target/hexagon) helper overrides -
 vector splat and abs
Date: Mon, 20 Sep 2021 16:24:16 -0500
Message-Id: <1632173065-18522-22-git-send-email-tsimpson@quicinc.com>
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
IHRhcmdldC9oZXhhZ29uL2dlbl90Y2dfaHZ4LmggfCAyNiArKysrKysrKysrKysrKysrKysrKysr
KysrKwogMSBmaWxlIGNoYW5nZWQsIDI2IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS90YXJn
ZXQvaGV4YWdvbi9nZW5fdGNnX2h2eC5oIGIvdGFyZ2V0L2hleGFnb24vZ2VuX3RjZ19odnguaApp
bmRleCBhYTM4Mzk4Li5lMTBlNDEwIDEwMDY0NAotLS0gYS90YXJnZXQvaGV4YWdvbi9nZW5fdGNn
X2h2eC5oCisrKyBiL3RhcmdldC9oZXhhZ29uL2dlbl90Y2dfaHZ4LmgKQEAgLTUxOCw0ICs1MTgs
MzAgQEAgc3RhdGljIGlubGluZSB2b2lkIGFzc2VydF92aGlzdF90bXAoRGlzYXNDb250ZXh0ICpj
dHgpCiAjZGVmaW5lIGZHRU5fVENHX1Y2X3ZlcWJfeG9yKFNIT1JUQ09ERSkgXAogICAgIGZHRU5f
VENHX1ZFQ19DTVBfT1AoVENHX0NPTkRfRVEsIE1PXzgsIDEsIHRjZ19nZW5fZ3ZlY194b3IpCiAK
Ky8qIFZlY3RvciBzcGxhdCAtIHZhcmlvdXMgZm9ybXMgKi8KKyNkZWZpbmUgZkdFTl9UQ0dfVjZf
bHZzcGxhdHcoU0hPUlRDT0RFKSBcCisgICAgdGNnX2dlbl9ndmVjX2R1cF9pMzIoTU9fMzIsIFZk
Vl9vZmYsIFwKKyAgICAgICAgICAgICAgICAgICAgICAgICBzaXplb2YoTU1WZWN0b3IpLCBzaXpl
b2YoTU1WZWN0b3IpLCBSdFYpCisKKyNkZWZpbmUgZkdFTl9UQ0dfVjZfbHZzcGxhdGgoU0hPUlRD
T0RFKSBcCisgICAgdGNnX2dlbl9ndmVjX2R1cF9pMzIoTU9fMTYsIFZkVl9vZmYsIFwKKyAgICAg
ICAgICAgICAgICAgICAgICAgICBzaXplb2YoTU1WZWN0b3IpLCBzaXplb2YoTU1WZWN0b3IpLCBS
dFYpCisKKyNkZWZpbmUgZkdFTl9UQ0dfVjZfbHZzcGxhdGIoU0hPUlRDT0RFKSBcCisgICAgdGNn
X2dlbl9ndmVjX2R1cF9pMzIoTU9fOCwgVmRWX29mZiwgXAorICAgICAgICAgICAgICAgICAgICAg
ICAgIHNpemVvZihNTVZlY3RvciksIHNpemVvZihNTVZlY3RvciksIFJ0VikKKworLyogVmVjdG9y
IGFic29sdXRlIHZhbHVlIC0gdmFyaW91cyBmb3JtcyAqLworI2RlZmluZSBmR0VOX1RDR19WNl92
YWJzYihTSE9SVENPREUpIFwKKyAgICB0Y2dfZ2VuX2d2ZWNfYWJzKE1PXzgsIFZkVl9vZmYsIFZ1
Vl9vZmYsIFwKKyAgICAgICAgICAgICAgICAgICAgIHNpemVvZihNTVZlY3RvciksIHNpemVvZihN
TVZlY3RvcikpCisKKyNkZWZpbmUgZkdFTl9UQ0dfVjZfdmFic2goU0hPUlRDT0RFKSBcCisgICAg
dGNnX2dlbl9ndmVjX2FicyhNT18xNiwgVmRWX29mZiwgVnVWX29mZiwgXAorICAgICAgICAgICAg
ICAgICAgICAgc2l6ZW9mKE1NVmVjdG9yKSwgc2l6ZW9mKE1NVmVjdG9yKSkKKworI2RlZmluZSBm
R0VOX1RDR19WNl92YWJzdyhTSE9SVENPREUpIFwKKyAgICB0Y2dfZ2VuX2d2ZWNfYWJzKE1PXzMy
LCBWZFZfb2ZmLCBWdVZfb2ZmLCBcCisgICAgICAgICAgICAgICAgICAgICBzaXplb2YoTU1WZWN0
b3IpLCBzaXplb2YoTU1WZWN0b3IpKQorCiAjZW5kaWYKLS0gCjIuNy40Cgo=

