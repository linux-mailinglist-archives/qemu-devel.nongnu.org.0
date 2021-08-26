Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3DDF3F8D62
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 19:55:33 +0200 (CEST)
Received: from localhost ([::1]:41600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJJbA-0001We-PY
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 13:55:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1mJJJ0-0005N8-QC
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 13:36:46 -0400
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:48465)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1mJJIw-00058q-E8
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 13:36:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1629999402; x=1661535402;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YBxHbH+LWJ5pTRN83OO3w/6EN5c6YE5/kcM+59gg7Wo=;
 b=XPm1mqh9zbwHCFsvqAoKpZwN8kubKcrUWd74hB33KJVcFs8GtXzlgPTu
 h5Oc4d7uIa76nF8QpfQTeXSq3QL9UMYFMGZCm3jRiMhv/OzijR2eYjjQJ
 82ffCnV/14k0lBCtLcBqjJ5qrbo8J6b9lj96FxLnXb47R/9H16+RdmdGp k=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 26 Aug 2021 10:36:16 -0700
X-QCInternal: smtphost
Received: from vu-tsimpson-aus.qualcomm.com (HELO
 vu-tsimpson1-aus.qualcomm.com) ([10.222.150.1])
 by ironmsg-SD-alpha.qualcomm.com with ESMTP; 26 Aug 2021 10:36:15 -0700
Received: by vu-tsimpson1-aus.qualcomm.com (Postfix, from userid 47164)
 id 89B5E168E; Thu, 26 Aug 2021 12:36:13 -0500 (CDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 20/30] Hexagon HVX (target/hexagon) helper overrides -
 vector splat and abs
Date: Thu, 26 Aug 2021 12:35:48 -0500
Message-Id: <1629999358-25304-21-git-send-email-tsimpson@quicinc.com>
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
IHRhcmdldC9oZXhhZ29uL2dlbl90Y2dfaHZ4LmggfCAyNiArKysrKysrKysrKysrKysrKysrKysr
KysrKwogMSBmaWxlIGNoYW5nZWQsIDI2IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS90YXJn
ZXQvaGV4YWdvbi9nZW5fdGNnX2h2eC5oIGIvdGFyZ2V0L2hleGFnb24vZ2VuX3RjZ19odnguaApp
bmRleCBjODk0ZWY1Li40NTc4MTk1IDEwMDY0NAotLS0gYS90YXJnZXQvaGV4YWdvbi9nZW5fdGNn
X2h2eC5oCisrKyBiL3RhcmdldC9oZXhhZ29uL2dlbl90Y2dfaHZ4LmgKQEAgLTUwMSw0ICs1MDEs
MzAgQEAKICNkZWZpbmUgZkdFTl9UQ0dfVjZfdmVxYl94b3IoU0hPUlRDT0RFKSBcCiAgICAgZkdF
Tl9UQ0dfVkVDX0NNUF9PUChUQ0dfQ09ORF9FUSwgTU9fOCwgMSwgdGNnX2dlbl9ndmVjX3hvcikK
IAorLyogVmVjdG9yIHNwbGF0IC0gdmFyaW91cyBmb3JtcyAqLworI2RlZmluZSBmR0VOX1RDR19W
Nl9sdnNwbGF0dyhTSE9SVENPREUpIFwKKyAgICB0Y2dfZ2VuX2d2ZWNfZHVwX2kzMihNT18zMiwg
VmRWX29mZiwgXAorICAgICAgICAgICAgICAgICAgICAgICAgIHNpemVvZihNTVZlY3RvciksIHNp
emVvZihNTVZlY3RvciksIFJ0VikKKworI2RlZmluZSBmR0VOX1RDR19WNl9sdnNwbGF0aChTSE9S
VENPREUpIFwKKyAgICB0Y2dfZ2VuX2d2ZWNfZHVwX2kzMihNT18xNiwgVmRWX29mZiwgXAorICAg
ICAgICAgICAgICAgICAgICAgICAgIHNpemVvZihNTVZlY3RvciksIHNpemVvZihNTVZlY3Rvciks
IFJ0VikKKworI2RlZmluZSBmR0VOX1RDR19WNl9sdnNwbGF0YihTSE9SVENPREUpIFwKKyAgICB0
Y2dfZ2VuX2d2ZWNfZHVwX2kzMihNT184LCBWZFZfb2ZmLCBcCisgICAgICAgICAgICAgICAgICAg
ICAgICAgc2l6ZW9mKE1NVmVjdG9yKSwgc2l6ZW9mKE1NVmVjdG9yKSwgUnRWKQorCisvKiBWZWN0
b3IgYWJzb2x1dGUgdmFsdWUgLSB2YXJpb3VzIGZvcm1zICovCisjZGVmaW5lIGZHRU5fVENHX1Y2
X3ZhYnNiKFNIT1JUQ09ERSkgXAorICAgIHRjZ19nZW5fZ3ZlY19hYnMoTU9fOCwgVmRWX29mZiwg
VnVWX29mZiwgXAorICAgICAgICAgICAgICAgICAgICAgc2l6ZW9mKE1NVmVjdG9yKSwgc2l6ZW9m
KE1NVmVjdG9yKSkKKworI2RlZmluZSBmR0VOX1RDR19WNl92YWJzaChTSE9SVENPREUpIFwKKyAg
ICB0Y2dfZ2VuX2d2ZWNfYWJzKE1PXzE2LCBWZFZfb2ZmLCBWdVZfb2ZmLCBcCisgICAgICAgICAg
ICAgICAgICAgICBzaXplb2YoTU1WZWN0b3IpLCBzaXplb2YoTU1WZWN0b3IpKQorCisjZGVmaW5l
IGZHRU5fVENHX1Y2X3ZhYnN3KFNIT1JUQ09ERSkgXAorICAgIHRjZ19nZW5fZ3ZlY19hYnMoTU9f
MzIsIFZkVl9vZmYsIFZ1Vl9vZmYsIFwKKyAgICAgICAgICAgICAgICAgICAgIHNpemVvZihNTVZl
Y3RvciksIHNpemVvZihNTVZlY3RvcikpCisKICNlbmRpZgotLSAKMi43LjQKCg==

