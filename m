Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF86D3F8D6E
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 19:59:33 +0200 (CEST)
Received: from localhost ([::1]:54354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJJf2-00026b-OR
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 13:59:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1mJJJF-0005di-65
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 13:37:01 -0400
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:3083)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1mJJJA-00058v-TH
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 13:37:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1629999416; x=1661535416;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=y+iKEapQGIXZ6KxAULv6X6ALPG1phVGgFz5oDrQVbpk=;
 b=NPSwkBmbEIByvZUpEBwTPgwbB4jbqd2ZkFSqchjYmRahymadKP0wVOqs
 dfF3i6+7CUcWcltwQt18pQZoC6+c1ycOASL3qdUtAIHB0QWQktLjHflfa
 AQnorUIdCClE0QHece6Wit/YzgMlj8oNsHoiWHeT816PNZP9VHfLYStP+ E=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 26 Aug 2021 10:36:16 -0700
X-QCInternal: smtphost
Received: from vu-tsimpson-aus.qualcomm.com (HELO
 vu-tsimpson1-aus.qualcomm.com) ([10.222.150.1])
 by ironmsg04-sd.qualcomm.com with ESMTP; 26 Aug 2021 10:36:15 -0700
Received: by vu-tsimpson1-aus.qualcomm.com (Postfix, from userid 47164)
 id 7DC8F1657; Thu, 26 Aug 2021 12:36:13 -0500 (CDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 15/30] Hexagon HVX (target/hexagon) helper overrides -
 vector add & sub
Date: Thu, 26 Aug 2021 12:35:43 -0500
Message-Id: <1629999358-25304-16-git-send-email-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1629999358-25304-1-git-send-email-tsimpson@quicinc.com>
References: <1629999358-25304-1-git-send-email-tsimpson@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=199.106.114.38;
 envelope-from=tsimpson@qualcomm.com; helo=alexa-out-sd-01.qualcomm.com
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

U2lnbmVkLW9mZi1ieTogVGF5bG9yIFNpbXBzb24gPHRzaW1wc29uQHF1aWNpbmMuY29tPgotLS0K
IHRhcmdldC9oZXhhZ29uL2dlbl90Y2dfaHZ4LmggfCA1MCArKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDUwIGluc2VydGlvbnMoKykK
CmRpZmYgLS1naXQgYS90YXJnZXQvaGV4YWdvbi9nZW5fdGNnX2h2eC5oIGIvdGFyZ2V0L2hleGFn
b24vZ2VuX3RjZ19odnguaAppbmRleCBhYjA4OGRjLi4yOTNmZDBmIDEwMDY0NAotLS0gYS90YXJn
ZXQvaGV4YWdvbi9nZW5fdGNnX2h2eC5oCisrKyBiL3RhcmdldC9oZXhhZ29uL2dlbl90Y2dfaHZ4
LmgKQEAgLTE0MCw0ICsxNDAsNTQgQEAKICNkZWZpbmUgZkdFTl9UQ0dfVjZfdm5jbW92KFNIT1JU
Q09ERSkgXAogICAgIGZHRU5fVENHX1ZFQ19DTU9WKDApCiAKKy8qIFZlY3RvciBhZGQgLSB2YXJp
b3VzIGZvcm1zICovCisjZGVmaW5lIGZHRU5fVENHX1Y2X3ZhZGRiKFNIT1JUQ09ERSkgXAorICAg
IHRjZ19nZW5fZ3ZlY19hZGQoTU9fOCwgVmRWX29mZiwgVnVWX29mZiwgVnZWX29mZiwgXAorICAg
ICAgICAgICAgICAgICAgICAgc2l6ZW9mKE1NVmVjdG9yKSwgc2l6ZW9mKE1NVmVjdG9yKSkKKwor
I2RlZmluZSBmR0VOX1RDR19WNl92YWRkaChTSE9SVENZREUpIFwKKyAgICB0Y2dfZ2VuX2d2ZWNf
YWRkKE1PXzE2LCBWZFZfb2ZmLCBWdVZfb2ZmLCBWdlZfb2ZmLCBcCisgICAgICAgICAgICAgICAg
ICAgICBzaXplb2YoTU1WZWN0b3IpLCBzaXplb2YoTU1WZWN0b3IpKQorCisjZGVmaW5lIGZHRU5f
VENHX1Y2X3ZhZGR3KFNIT1JUQ09ERSkgXAorICAgIHRjZ19nZW5fZ3ZlY19hZGQoTU9fMzIsIFZk
Vl9vZmYsIFZ1Vl9vZmYsIFZ2Vl9vZmYsIFwKKyAgICAgICAgICAgICAgICAgICAgIHNpemVvZihN
TVZlY3RvciksIHNpemVvZihNTVZlY3RvcikpCisKKyNkZWZpbmUgZkdFTl9UQ0dfVjZfdmFkZGJf
ZHYoU0hPUlRDT0RFKSBcCisgICAgdGNnX2dlbl9ndmVjX2FkZChNT184LCBWZGRWX29mZiwgVnV1
Vl9vZmYsIFZ2dlZfb2ZmLCBcCisgICAgICAgICAgICAgICAgICAgICBzaXplb2YoTU1WZWN0b3Ip
ICogMiwgc2l6ZW9mKE1NVmVjdG9yKSAqIDIpCisKKyNkZWZpbmUgZkdFTl9UQ0dfVjZfdmFkZGhf
ZHYoU0hPUlRDWURFKSBcCisgICAgdGNnX2dlbl9ndmVjX2FkZChNT18xNiwgVmRkVl9vZmYsIFZ1
dVZfb2ZmLCBWdnZWX29mZiwgXAorICAgICAgICAgICAgICAgICAgICAgc2l6ZW9mKE1NVmVjdG9y
KSAqIDIsIHNpemVvZihNTVZlY3RvcikgKiAyKQorCisjZGVmaW5lIGZHRU5fVENHX1Y2X3ZhZGR3
X2R2KFNIT1JUQ09ERSkgXAorICAgIHRjZ19nZW5fZ3ZlY19hZGQoTU9fMzIsIFZkZFZfb2ZmLCBW
dXVWX29mZiwgVnZ2Vl9vZmYsIFwKKyAgICAgICAgICAgICAgICAgICAgIHNpemVvZihNTVZlY3Rv
cikgKiAyLCBzaXplb2YoTU1WZWN0b3IpICogMikKKworLyogVmVjdG9yIHN1YiAtIHZhcmlvdXMg
Zm9ybXMgKi8KKyNkZWZpbmUgZkdFTl9UQ0dfVjZfdnN1YmIoU0hPUlRDT0RFKSBcCisgICAgdGNn
X2dlbl9ndmVjX3N1YihNT184LCBWZFZfb2ZmLCBWdVZfb2ZmLCBWdlZfb2ZmLCBcCisgICAgICAg
ICAgICAgICAgICAgICBzaXplb2YoTU1WZWN0b3IpLCBzaXplb2YoTU1WZWN0b3IpKQorCisjZGVm
aW5lIGZHRU5fVENHX1Y2X3ZzdWJoKFNIT1JUQ09ERSkgXAorICAgIHRjZ19nZW5fZ3ZlY19zdWIo
TU9fMTYsIFZkVl9vZmYsIFZ1Vl9vZmYsIFZ2Vl9vZmYsIFwKKyAgICAgICAgICAgICAgICAgICAg
IHNpemVvZihNTVZlY3RvciksIHNpemVvZihNTVZlY3RvcikpCisKKyNkZWZpbmUgZkdFTl9UQ0df
VjZfdnN1YncoU0hPUlRDT0RFKSBcCisgICAgdGNnX2dlbl9ndmVjX3N1YihNT18zMiwgVmRWX29m
ZiwgVnVWX29mZiwgVnZWX29mZiwgXAorICAgICAgICAgICAgICAgICAgICAgc2l6ZW9mKE1NVmVj
dG9yKSwgc2l6ZW9mKE1NVmVjdG9yKSkKKworI2RlZmluZSBmR0VOX1RDR19WNl92c3ViYl9kdihT
SE9SVENPREUpIFwKKyAgICB0Y2dfZ2VuX2d2ZWNfc3ViKE1PXzgsIFZkZFZfb2ZmLCBWdXVWX29m
ZiwgVnZ2Vl9vZmYsIFwKKyAgICAgICAgICAgICAgICAgICAgIHNpemVvZihNTVZlY3RvcikgKiAy
LCBzaXplb2YoTU1WZWN0b3IpICogMikKKworI2RlZmluZSBmR0VOX1RDR19WNl92c3ViaF9kdihT
SE9SVENPREUpIFwKKyAgICB0Y2dfZ2VuX2d2ZWNfc3ViKE1PXzE2LCBWZGRWX29mZiwgVnV1Vl9v
ZmYsIFZ2dlZfb2ZmLCBcCisgICAgICAgICAgICAgICAgICAgICBzaXplb2YoTU1WZWN0b3IpICog
Miwgc2l6ZW9mKE1NVmVjdG9yKSAqIDIpCisKKyNkZWZpbmUgZkdFTl9UQ0dfVjZfdnN1YndfZHYo
U0hPUlRDT0RFKSBcCisgICAgdGNnX2dlbl9ndmVjX3N1YihNT18zMiwgVmRkVl9vZmYsIFZ1dVZf
b2ZmLCBWdnZWX29mZiwgXAorICAgICAgICAgICAgICAgICAgICAgc2l6ZW9mKE1NVmVjdG9yKSAq
IDIsIHNpemVvZihNTVZlY3RvcikgKiAyKQorCiAjZW5kaWYKLS0gCjIuNy40Cgo=

