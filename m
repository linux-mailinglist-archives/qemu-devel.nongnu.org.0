Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D4CD444A50
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 22:36:28 +0100 (CET)
Received: from localhost ([::1]:36532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miNvn-0005g1-Dr
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 17:36:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1miNde-0002tB-Pv
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 17:17:42 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:11447)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1miNdc-0007Cy-1B
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 17:17:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1635974260; x=1667510260;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NxDDV113CFZXsxo7zX18MC24YodgmP4D9k+eeDd23K4=;
 b=PVStKKnqmxoaKFn+R/xLBXKi8yHEDbBaTvECtYpzZsjOImm6PCxoQ5+i
 mE97vVMjne5apYy70GETUypxbkK5+1J8E+ByTpKj5Aue5MJo8hE+xed6H
 w+jfIsCc0hfnBB8MvcNrvsCAn8vTzIFAXqYDMmDwWdAeM4qvT6LNGMJwT g=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 03 Nov 2021 14:17:30 -0700
X-QCInternal: smtphost
Received: from vu-tsimpson-aus.qualcomm.com (HELO
 vu-tsimpson1-aus.qualcomm.com) ([10.222.150.1])
 by ironmsg02-sd.qualcomm.com with ESMTP; 03 Nov 2021 14:17:30 -0700
Received: by vu-tsimpson1-aus.qualcomm.com (Postfix, from userid 47164)
 id BF3843083; Wed,  3 Nov 2021 16:17:28 -0500 (CDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 18/30] Hexagon HVX (target/hexagon) helper overrides -
 vector max/min
Date: Wed,  3 Nov 2021 16:17:15 -0500
Message-Id: <1635974247-1820-19-git-send-email-tsimpson@quicinc.com>
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
Ci0tLQogdGFyZ2V0L2hleGFnb24vZ2VuX3RjZ19odnguaCB8IDM0ICsrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAzNCBpbnNlcnRpb25zKCspCgpkaWZm
IC0tZ2l0IGEvdGFyZ2V0L2hleGFnb24vZ2VuX3RjZ19odnguaCBiL3RhcmdldC9oZXhhZ29uL2dl
bl90Y2dfaHZ4LmgKaW5kZXggZTg2NTQxMC4uZjU0ODQwNCAxMDA2NDQKLS0tIGEvdGFyZ2V0L2hl
eGFnb24vZ2VuX3RjZ19odnguaAorKysgYi90YXJnZXQvaGV4YWdvbi9nZW5fdGNnX2h2eC5oCkBA
IC0zMjcsNCArMzI3LDM4IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBhc3NlcnRfdmhpc3RfdG1wKERp
c2FzQ29udGV4dCAqY3R4KQogICAgICAgICB0Y2dfdGVtcF9mcmVlKHNoaWZ0KTsgXAogICAgIH0g
d2hpbGUgKDApCiAKKy8qIFZlY3RvciBtYXggLSB2YXJpb3VzIGZvcm1zICovCisjZGVmaW5lIGZH
RU5fVENHX1Y2X3ZtYXh3KFNIT1JUQ09ERSkgXAorICAgIHRjZ19nZW5fZ3ZlY19zbWF4KE1PXzMy
LCBWZFZfb2ZmLCBWdVZfb2ZmLCBWdlZfb2ZmLCBcCisgICAgICAgICAgICAgICAgICAgICAgc2l6
ZW9mKE1NVmVjdG9yKSwgc2l6ZW9mKE1NVmVjdG9yKSkKKyNkZWZpbmUgZkdFTl9UQ0dfVjZfdm1h
eGgoU0hPUlRDT0RFKSBcCisgICAgdGNnX2dlbl9ndmVjX3NtYXgoTU9fMTYsIFZkVl9vZmYsIFZ1
Vl9vZmYsIFZ2Vl9vZmYsIFwKKyAgICAgICAgICAgICAgICAgICAgICBzaXplb2YoTU1WZWN0b3Ip
LCBzaXplb2YoTU1WZWN0b3IpKQorI2RlZmluZSBmR0VOX1RDR19WNl92bWF4dWgoU0hPUlRDT0RF
KSBcCisgICAgdGNnX2dlbl9ndmVjX3VtYXgoTU9fMTYsIFZkVl9vZmYsIFZ1Vl9vZmYsIFZ2Vl9v
ZmYsIFwKKyAgICAgICAgICAgICAgICAgICAgICBzaXplb2YoTU1WZWN0b3IpLCBzaXplb2YoTU1W
ZWN0b3IpKQorI2RlZmluZSBmR0VOX1RDR19WNl92bWF4YihTSE9SVENPREUpIFwKKyAgICB0Y2df
Z2VuX2d2ZWNfc21heChNT184LCBWZFZfb2ZmLCBWdVZfb2ZmLCBWdlZfb2ZmLCBcCisgICAgICAg
ICAgICAgICAgICAgICAgc2l6ZW9mKE1NVmVjdG9yKSwgc2l6ZW9mKE1NVmVjdG9yKSkKKyNkZWZp
bmUgZkdFTl9UQ0dfVjZfdm1heHViKFNIT1JUQ09ERSkgXAorICAgIHRjZ19nZW5fZ3ZlY191bWF4
KE1PXzgsIFZkVl9vZmYsIFZ1Vl9vZmYsIFZ2Vl9vZmYsIFwKKyAgICAgICAgICAgICAgICAgICAg
ICBzaXplb2YoTU1WZWN0b3IpLCBzaXplb2YoTU1WZWN0b3IpKQorCisvKiBWZWN0b3IgbWluIC0g
dmFyaW91cyBmb3JtcyAqLworI2RlZmluZSBmR0VOX1RDR19WNl92bWludyhTSE9SVENPREUpIFwK
KyAgICB0Y2dfZ2VuX2d2ZWNfc21pbihNT18zMiwgVmRWX29mZiwgVnVWX29mZiwgVnZWX29mZiwg
XAorICAgICAgICAgICAgICAgICAgICAgIHNpemVvZihNTVZlY3RvciksIHNpemVvZihNTVZlY3Rv
cikpCisjZGVmaW5lIGZHRU5fVENHX1Y2X3ZtaW5oKFNIT1JUQ09ERSkgXAorICAgIHRjZ19nZW5f
Z3ZlY19zbWluKE1PXzE2LCBWZFZfb2ZmLCBWdVZfb2ZmLCBWdlZfb2ZmLCBcCisgICAgICAgICAg
ICAgICAgICAgICAgc2l6ZW9mKE1NVmVjdG9yKSwgc2l6ZW9mKE1NVmVjdG9yKSkKKyNkZWZpbmUg
ZkdFTl9UQ0dfVjZfdm1pbnVoKFNIT1JUQ09ERSkgXAorICAgIHRjZ19nZW5fZ3ZlY191bWluKE1P
XzE2LCBWZFZfb2ZmLCBWdVZfb2ZmLCBWdlZfb2ZmLCBcCisgICAgICAgICAgICAgICAgICAgICAg
c2l6ZW9mKE1NVmVjdG9yKSwgc2l6ZW9mKE1NVmVjdG9yKSkKKyNkZWZpbmUgZkdFTl9UQ0dfVjZf
dm1pbmIoU0hPUlRDT0RFKSBcCisgICAgdGNnX2dlbl9ndmVjX3NtaW4oTU9fOCwgVmRWX29mZiwg
VnVWX29mZiwgVnZWX29mZiwgXAorICAgICAgICAgICAgICAgICAgICAgIHNpemVvZihNTVZlY3Rv
ciksIHNpemVvZihNTVZlY3RvcikpCisjZGVmaW5lIGZHRU5fVENHX1Y2X3ZtaW51YihTSE9SVENP
REUpIFwKKyAgICB0Y2dfZ2VuX2d2ZWNfdW1pbihNT184LCBWZFZfb2ZmLCBWdVZfb2ZmLCBWdlZf
b2ZmLCBcCisgICAgICAgICAgICAgICAgICAgICAgc2l6ZW9mKE1NVmVjdG9yKSwgc2l6ZW9mKE1N
VmVjdG9yKSkKKwogI2VuZGlmCi0tIAoyLjcuNAoK

