Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A56024406B9
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Oct 2021 03:33:09 +0200 (CEST)
Received: from localhost ([::1]:54022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgdF6-00061e-MH
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 21:33:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1mgd3j-000343-3g
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 21:21:24 -0400
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:19382)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1mgd3e-0001ck-1s
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 21:21:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1635556878; x=1667092878;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ObK4YZmk5896JVm5DYR19L0vZgkvxXdQAUzClPnIKF4=;
 b=W7WCP0KWdNQnB3+R8n+IpmLql9iPVxuZXsJhDB8MXLsrmtic43EGnkb0
 EsQeRedlhEF6hYy+T+St2YHGXZ6l60m8ojifDmlHfPiohISQP2KNFVRd8
 2CRPxzmkvv/Bze160ZwWUzTnen1uGGtfF1JxhVWeSL7m9mncCXKPxYIg4 A=;
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 29 Oct 2021 18:20:59 -0700
X-QCInternal: smtphost
Received: from vu-tsimpson-aus.qualcomm.com (HELO
 vu-tsimpson1-aus.qualcomm.com) ([10.222.150.1])
 by ironmsg01-sd.qualcomm.com with ESMTP; 29 Oct 2021 18:20:58 -0700
Received: by vu-tsimpson1-aus.qualcomm.com (Postfix, from userid 47164)
 id 12EC23083; Fri, 29 Oct 2021 20:20:57 -0500 (CDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 15/30] Hexagon HVX (target/hexagon) helper overrides -
 vector assign & cmov
Date: Fri, 29 Oct 2021 20:20:34 -0500
Message-Id: <1635556849-18120-16-git-send-email-tsimpson@quicinc.com>
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
Ci0tLQogdGFyZ2V0L2hleGFnb24vZ2VuX3RjZ19odnguaCB8IDMxICsrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAzMSBpbnNlcnRpb25zKCspCgpkaWZmIC0t
Z2l0IGEvdGFyZ2V0L2hleGFnb24vZ2VuX3RjZ19odnguaCBiL3RhcmdldC9oZXhhZ29uL2dlbl90
Y2dfaHZ4LmgKaW5kZXggYTU2MDUwNC4uOTE2MjMwZSAxMDA2NDQKLS0tIGEvdGFyZ2V0L2hleGFn
b24vZ2VuX3RjZ19odnguaAorKysgYi90YXJnZXQvaGV4YWdvbi9nZW5fdGNnX2h2eC5oCkBAIC0x
MjQsNCArMTI0LDM1IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBhc3NlcnRfdmhpc3RfdG1wKERpc2Fz
Q29udGV4dCAqY3R4KQogICAgIH0gd2hpbGUgKDApCiAKIAorI2RlZmluZSBmR0VOX1RDR19WNl92
YXNzaWduKFNIT1JUQ09ERSkgXAorICAgIHRjZ19nZW5fZ3ZlY19tb3YoTU9fNjQsIFZkVl9vZmYs
IFZ1Vl9vZmYsIFwKKyAgICAgICAgICAgICAgICAgICAgIHNpemVvZihNTVZlY3RvciksIHNpemVv
ZihNTVZlY3RvcikpCisKKy8qIFZlY3RvciBjb25kaXRpb25hbCBtb3ZlICovCisjZGVmaW5lIGZH
RU5fVENHX1ZFQ19DTU9WKFBSRUQpIFwKKyAgICBkbyB7IFwKKyAgICAgICAgVENHdiBsc2IgPSB0
Y2dfdGVtcF9uZXcoKTsgXAorICAgICAgICBUQ0dMYWJlbCAqZmFsc2VfbGFiZWwgPSBnZW5fbmV3
X2xhYmVsKCk7IFwKKyAgICAgICAgVENHTGFiZWwgKmVuZF9sYWJlbCA9IGdlbl9uZXdfbGFiZWwo
KTsgXAorICAgICAgICB0Y2dfZ2VuX2FuZGlfdGwobHNiLCBQc1YsIDEpOyBcCisgICAgICAgIHRj
Z19nZW5fYnJjb25kaV90bChUQ0dfQ09ORF9ORSwgbHNiLCBQUkVELCBmYWxzZV9sYWJlbCk7IFwK
KyAgICAgICAgdGNnX3RlbXBfZnJlZShsc2IpOyBcCisgICAgICAgIHRjZ19nZW5fZ3ZlY19tb3Yo
TU9fNjQsIFZkVl9vZmYsIFZ1Vl9vZmYsIFwKKyAgICAgICAgICAgICAgICAgICAgICAgICBzaXpl
b2YoTU1WZWN0b3IpLCBzaXplb2YoTU1WZWN0b3IpKTsgXAorICAgICAgICB0Y2dfZ2VuX2JyKGVu
ZF9sYWJlbCk7IFwKKyAgICAgICAgZ2VuX3NldF9sYWJlbChmYWxzZV9sYWJlbCk7IFwKKyAgICAg
ICAgdGNnX2dlbl9vcmlfdGwoaGV4X3Nsb3RfY2FuY2VsbGVkLCBoZXhfc2xvdF9jYW5jZWxsZWQs
IFwKKyAgICAgICAgICAgICAgICAgICAgICAgMSA8PCBpbnNuLT5zbG90KTsgXAorICAgICAgICBn
ZW5fc2V0X2xhYmVsKGVuZF9sYWJlbCk7IFwKKyAgICB9IHdoaWxlICgwKQorCisKKy8qIFZlY3Rv
ciBjb25kaXRpb25hbCBtb3ZlICh0cnVlKSAqLworI2RlZmluZSBmR0VOX1RDR19WNl92Y21vdihT
SE9SVENPREUpIFwKKyAgICBmR0VOX1RDR19WRUNfQ01PVigxKQorCisvKiBWZWN0b3IgY29uZGl0
aW9uYWwgbW92ZSAoZmFsc2UpICovCisjZGVmaW5lIGZHRU5fVENHX1Y2X3ZuY21vdihTSE9SVENP
REUpIFwKKyAgICBmR0VOX1RDR19WRUNfQ01PVigwKQorCiAjZW5kaWYKLS0gCjIuNy40Cgo=

