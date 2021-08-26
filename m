Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37F553F8D69
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 19:57:19 +0200 (CEST)
Received: from localhost ([::1]:45566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJJcd-0004NK-7l
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 13:57:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1mJJIm-0004Up-MS
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 13:36:32 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:10212)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1mJJIk-0005GW-FB
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 13:36:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1629999390; x=1661535390;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8xnOSOOXvveMXi5YV1Hxop4HoC1ERPJzo4hfpKqGFq4=;
 b=JFDiu9TlIDgoJpGc7oZZ+hwJQwisX/e51FZWz4Ik/8P89Ms6j/q84jz0
 7f62/EXho9fn37kZoyARSttT4XTpqADez3qs1SgllVz+kNjYHbDkeC2B2
 Q2Jq4WpkTTDQVBSBLNFiD4G9ElOEP3bB5SPAtG14Bi0cUhywTEruQkigd 4=;
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 26 Aug 2021 10:36:16 -0700
X-QCInternal: smtphost
Received: from vu-tsimpson-aus.qualcomm.com (HELO
 vu-tsimpson1-aus.qualcomm.com) ([10.222.150.1])
 by ironmsg01-sd.qualcomm.com with ESMTP; 26 Aug 2021 10:36:15 -0700
Received: by vu-tsimpson1-aus.qualcomm.com (Postfix, from userid 47164)
 id 82E171678; Thu, 26 Aug 2021 12:36:13 -0500 (CDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 17/30] Hexagon HVX (target/hexagon) helper overrides -
 vector max/min
Date: Thu, 26 Aug 2021 12:35:45 -0500
Message-Id: <1629999358-25304-18-git-send-email-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1629999358-25304-1-git-send-email-tsimpson@quicinc.com>
References: <1629999358-25304-1-git-send-email-tsimpson@quicinc.com>
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

U2lnbmVkLW9mZi1ieTogVGF5bG9yIFNpbXBzb24gPHRzaW1wc29uQHF1aWNpbmMuY29tPgotLS0K
IHRhcmdldC9oZXhhZ29uL2dlbl90Y2dfaHZ4LmggfCAzNCArKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMzQgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdp
dCBhL3RhcmdldC9oZXhhZ29uL2dlbl90Y2dfaHZ4LmggYi90YXJnZXQvaGV4YWdvbi9nZW5fdGNn
X2h2eC5oCmluZGV4IDNlZjFhZTAuLmFhMzlmOTIgMTAwNjQ0Ci0tLSBhL3RhcmdldC9oZXhhZ29u
L2dlbl90Y2dfaHZ4LmgKKysrIGIvdGFyZ2V0L2hleGFnb24vZ2VuX3RjZ19odnguaApAQCAtMzEy
LDQgKzMxMiwzOCBAQAogICAgICAgICB0Y2dfdGVtcF9mcmVlKHNoaWZ0KTsgXAogICAgIH0gd2hp
bGUgKDApCiAKKy8qIFZlY3RvciBtYXggLSB2YXJpb3VzIGZvcm1zICovCisjZGVmaW5lIGZHRU5f
VENHX1Y2X3ZtYXh3KFNIT1JUQ09ERSkgXAorICAgIHRjZ19nZW5fZ3ZlY19zbWF4KE1PXzMyLCBW
ZFZfb2ZmLCBWdVZfb2ZmLCBWdlZfb2ZmLCBcCisgICAgICAgICAgICAgICAgICAgICAgc2l6ZW9m
KE1NVmVjdG9yKSwgc2l6ZW9mKE1NVmVjdG9yKSkKKyNkZWZpbmUgZkdFTl9UQ0dfVjZfdm1heGgo
U0hPUlRDT0RFKSBcCisgICAgdGNnX2dlbl9ndmVjX3NtYXgoTU9fMTYsIFZkVl9vZmYsIFZ1Vl9v
ZmYsIFZ2Vl9vZmYsIFwKKyAgICAgICAgICAgICAgICAgICAgICBzaXplb2YoTU1WZWN0b3IpLCBz
aXplb2YoTU1WZWN0b3IpKQorI2RlZmluZSBmR0VOX1RDR19WNl92bWF4dWgoU0hPUlRDT0RFKSBc
CisgICAgdGNnX2dlbl9ndmVjX3VtYXgoTU9fMTYsIFZkVl9vZmYsIFZ1Vl9vZmYsIFZ2Vl9vZmYs
IFwKKyAgICAgICAgICAgICAgICAgICAgICBzaXplb2YoTU1WZWN0b3IpLCBzaXplb2YoTU1WZWN0
b3IpKQorI2RlZmluZSBmR0VOX1RDR19WNl92bWF4YihTSE9SVENPREUpIFwKKyAgICB0Y2dfZ2Vu
X2d2ZWNfc21heChNT184LCBWZFZfb2ZmLCBWdVZfb2ZmLCBWdlZfb2ZmLCBcCisgICAgICAgICAg
ICAgICAgICAgICAgc2l6ZW9mKE1NVmVjdG9yKSwgc2l6ZW9mKE1NVmVjdG9yKSkKKyNkZWZpbmUg
ZkdFTl9UQ0dfVjZfdm1heHViKFNIT1JUQ09ERSkgXAorICAgIHRjZ19nZW5fZ3ZlY191bWF4KE1P
XzgsIFZkVl9vZmYsIFZ1Vl9vZmYsIFZ2Vl9vZmYsIFwKKyAgICAgICAgICAgICAgICAgICAgICBz
aXplb2YoTU1WZWN0b3IpLCBzaXplb2YoTU1WZWN0b3IpKQorCisvKiBWZWN0b3IgbWluIC0gdmFy
aW91cyBmb3JtcyAqLworI2RlZmluZSBmR0VOX1RDR19WNl92bWludyhTSE9SVENPREUpIFwKKyAg
ICB0Y2dfZ2VuX2d2ZWNfc21pbihNT18zMiwgVmRWX29mZiwgVnVWX29mZiwgVnZWX29mZiwgXAor
ICAgICAgICAgICAgICAgICAgICAgIHNpemVvZihNTVZlY3RvciksIHNpemVvZihNTVZlY3Rvcikp
CisjZGVmaW5lIGZHRU5fVENHX1Y2X3ZtaW5oKFNIT1JUQ09ERSkgXAorICAgIHRjZ19nZW5fZ3Zl
Y19zbWluKE1PXzE2LCBWZFZfb2ZmLCBWdVZfb2ZmLCBWdlZfb2ZmLCBcCisgICAgICAgICAgICAg
ICAgICAgICAgc2l6ZW9mKE1NVmVjdG9yKSwgc2l6ZW9mKE1NVmVjdG9yKSkKKyNkZWZpbmUgZkdF
Tl9UQ0dfVjZfdm1pbnVoKFNIT1JUQ09ERSkgXAorICAgIHRjZ19nZW5fZ3ZlY191bWluKE1PXzE2
LCBWZFZfb2ZmLCBWdVZfb2ZmLCBWdlZfb2ZmLCBcCisgICAgICAgICAgICAgICAgICAgICAgc2l6
ZW9mKE1NVmVjdG9yKSwgc2l6ZW9mKE1NVmVjdG9yKSkKKyNkZWZpbmUgZkdFTl9UQ0dfVjZfdm1p
bmIoU0hPUlRDT0RFKSBcCisgICAgdGNnX2dlbl9ndmVjX3NtaW4oTU9fOCwgVmRWX29mZiwgVnVW
X29mZiwgVnZWX29mZiwgXAorICAgICAgICAgICAgICAgICAgICAgIHNpemVvZihNTVZlY3Rvciks
IHNpemVvZihNTVZlY3RvcikpCisjZGVmaW5lIGZHRU5fVENHX1Y2X3ZtaW51YihTSE9SVENPREUp
IFwKKyAgICB0Y2dfZ2VuX2d2ZWNfdW1pbihNT184LCBWZFZfb2ZmLCBWdVZfb2ZmLCBWdlZfb2Zm
LCBcCisgICAgICAgICAgICAgICAgICAgICAgc2l6ZW9mKE1NVmVjdG9yKSwgc2l6ZW9mKE1NVmVj
dG9yKSkKKwogI2VuZGlmCi0tIAoyLjcuNAoK

