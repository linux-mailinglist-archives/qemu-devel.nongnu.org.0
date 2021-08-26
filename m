Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CC413F8D60
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 19:54:59 +0200 (CEST)
Received: from localhost ([::1]:39222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJJac-0008NY-Ad
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 13:54:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1mJJIm-0004SV-4w
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 13:36:32 -0400
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:54743)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1mJJIh-00059Z-7R
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 13:36:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1629999387; x=1661535387;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2u1UycTKkKoRLKijtY8VPLcKPtdNoJpKhgXy/ZwxKUk=;
 b=ISF0zK1T4gXq2rKV6SRfmy1cwwWbHd7oj7BqRtrwxhPyjitmUCQLSDy/
 SQw435yABNDOZGH0gpuQJeSfxN65Y4lPaM1wz63ucnqftRT1orCqhRD14
 cq/yYYsAG2zOdUMfK/8FH5E7TR4YHWtEWD4Jm/AzRTruShoTYQREDSyGm Q=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 26 Aug 2021 10:36:15 -0700
X-QCInternal: smtphost
Received: from vu-tsimpson-aus.qualcomm.com (HELO
 vu-tsimpson1-aus.qualcomm.com) ([10.222.150.1])
 by ironmsg02-sd.qualcomm.com with ESMTP; 26 Aug 2021 10:36:15 -0700
Received: by vu-tsimpson1-aus.qualcomm.com (Postfix, from userid 47164)
 id 7B7451639; Thu, 26 Aug 2021 12:36:13 -0500 (CDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 14/30] Hexagon HVX (target/hexagon) helper overrides -
 vector assign & cmov
Date: Thu, 26 Aug 2021 12:35:42 -0500
Message-Id: <1629999358-25304-15-git-send-email-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1629999358-25304-1-git-send-email-tsimpson@quicinc.com>
References: <1629999358-25304-1-git-send-email-tsimpson@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=199.106.114.38;
 envelope-from=tsimpson@qualcomm.com; helo=alexa-out-sd-01.qualcomm.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
IHRhcmdldC9oZXhhZ29uL2dlbl90Y2dfaHZ4LmggfCAzMSArKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMzEgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBh
L3RhcmdldC9oZXhhZ29uL2dlbl90Y2dfaHZ4LmggYi90YXJnZXQvaGV4YWdvbi9nZW5fdGNnX2h2
eC5oCmluZGV4IDQwZmNiNTQuLmFiMDg4ZGMgMTAwNjQ0Ci0tLSBhL3RhcmdldC9oZXhhZ29uL2dl
bl90Y2dfaHZ4LmgKKysrIGIvdGFyZ2V0L2hleGFnb24vZ2VuX3RjZ19odnguaApAQCAtMTA5LDQg
KzEwOSwzNSBAQAogICAgIH0gd2hpbGUgKDApCiAKIAorI2RlZmluZSBmR0VOX1RDR19WNl92YXNz
aWduKFNIT1JUQ09ERSkgXAorICAgIHRjZ19nZW5fZ3ZlY19tb3YoTU9fNjQsIFZkVl9vZmYsIFZ1
Vl9vZmYsIFwKKyAgICAgICAgICAgICAgICAgICAgIHNpemVvZihNTVZlY3RvciksIHNpemVvZihN
TVZlY3RvcikpCisKKy8qIFZlY3RvciBjb25kaXRpb25hbCBtb3ZlICovCisjZGVmaW5lIGZHRU5f
VENHX1ZFQ19DTU9WKFBSRUQpIFwKKyAgICBkbyB7IFwKKyAgICAgICAgVENHdiBsc2IgPSB0Y2df
dGVtcF9uZXcoKTsgXAorICAgICAgICBUQ0dMYWJlbCAqZmFsc2VfbGFiZWwgPSBnZW5fbmV3X2xh
YmVsKCk7IFwKKyAgICAgICAgVENHTGFiZWwgKmVuZF9sYWJlbCA9IGdlbl9uZXdfbGFiZWwoKTsg
XAorICAgICAgICB0Y2dfZ2VuX2FuZGlfdGwobHNiLCBQc1YsIDEpOyBcCisgICAgICAgIHRjZ19n
ZW5fYnJjb25kaV90bChUQ0dfQ09ORF9ORSwgbHNiLCBQUkVELCBmYWxzZV9sYWJlbCk7IFwKKyAg
ICAgICAgdGNnX3RlbXBfZnJlZShsc2IpOyBcCisgICAgICAgIHRjZ19nZW5fZ3ZlY19tb3YoTU9f
NjQsIFZkVl9vZmYsIFZ1Vl9vZmYsIFwKKyAgICAgICAgICAgICAgICAgICAgICAgICBzaXplb2Yo
TU1WZWN0b3IpLCBzaXplb2YoTU1WZWN0b3IpKTsgXAorICAgICAgICB0Y2dfZ2VuX2JyKGVuZF9s
YWJlbCk7IFwKKyAgICAgICAgZ2VuX3NldF9sYWJlbChmYWxzZV9sYWJlbCk7IFwKKyAgICAgICAg
dGNnX2dlbl9vcmlfdGwoaGV4X3Nsb3RfY2FuY2VsbGVkLCBoZXhfc2xvdF9jYW5jZWxsZWQsIFwK
KyAgICAgICAgICAgICAgICAgICAgICAgMSA8PCBpbnNuLT5zbG90KTsgXAorICAgICAgICBnZW5f
c2V0X2xhYmVsKGVuZF9sYWJlbCk7IFwKKyAgICB9IHdoaWxlICgwKQorCisKKy8qIFZlY3RvciBj
b25kaXRpb25hbCBtb3ZlICh0cnVlKSAqLworI2RlZmluZSBmR0VOX1RDR19WNl92Y21vdihTSE9S
VENPREUpIFwKKyAgICBmR0VOX1RDR19WRUNfQ01PVigxKQorCisvKiBWZWN0b3IgY29uZGl0aW9u
YWwgbW92ZSAoZmFsc2UpICovCisjZGVmaW5lIGZHRU5fVENHX1Y2X3ZuY21vdihTSE9SVENPREUp
IFwKKyAgICBmR0VOX1RDR19WRUNfQ01PVigwKQorCiAjZW5kaWYKLS0gCjIuNy40Cgo=

