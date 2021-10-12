Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2663442A29C
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 12:48:03 +0200 (CEST)
Received: from localhost ([::1]:59692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maFKD-0008JP-Ro
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 06:48:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1maEl6-0000bd-7S
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 06:11:44 -0400
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:12894)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1maEl0-0007HY-Qe
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 06:11:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1634033498; x=1665569498;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=flPwfRbNTm91MihUfAOICNVj2XY+hfsyfSN2ovxtNcQ=;
 b=Faf9O8JQ08k+fdu/EeE6mi+MnC4n3tdN4GeXL4espAMTPBHoN0JSzaWt
 57A5Y5Zq2+SVQMNTamAmgVOPwWuPgwVI0Op8xgAZwll46vOR/APS93WwF
 lZR8UfEU6zWO3FXxl/eZQmADwyB+IK5CzIrww/o1xHk/cjSvDN1waBEPZ w=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 12 Oct 2021 03:11:25 -0700
X-QCInternal: smtphost
Received: from vu-tsimpson-aus.qualcomm.com (HELO
 vu-tsimpson1-aus.qualcomm.com) ([10.222.150.1])
 by ironmsg02-sd.qualcomm.com with ESMTP; 12 Oct 2021 03:11:23 -0700
Received: by vu-tsimpson1-aus.qualcomm.com (Postfix, from userid 47164)
 id 678A11712; Tue, 12 Oct 2021 05:11:22 -0500 (CDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 19/30] Hexagon HVX (target/hexagon) helper overrides -
 vector logical ops
Date: Tue, 12 Oct 2021 05:10:57 -0500
Message-Id: <1634033468-23566-20-git-send-email-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1634033468-23566-1-git-send-email-tsimpson@quicinc.com>
References: <1634033468-23566-1-git-send-email-tsimpson@quicinc.com>
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
IHRhcmdldC9oZXhhZ29uL2dlbl90Y2dfaHZ4LmggfCA0MiArKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA0MiBpbnNlcnRpb25zKCspCgpk
aWZmIC0tZ2l0IGEvdGFyZ2V0L2hleGFnb24vZ2VuX3RjZ19odnguaCBiL3RhcmdldC9oZXhhZ29u
L2dlbl90Y2dfaHZ4LmgKaW5kZXggZjU0ODQwNC4uZjUzYTdmMiAxMDA2NDQKLS0tIGEvdGFyZ2V0
L2hleGFnb24vZ2VuX3RjZ19odnguaAorKysgYi90YXJnZXQvaGV4YWdvbi9nZW5fdGNnX2h2eC5o
CkBAIC0zNjEsNCArMzYxLDQ2IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBhc3NlcnRfdmhpc3RfdG1w
KERpc2FzQ29udGV4dCAqY3R4KQogICAgIHRjZ19nZW5fZ3ZlY191bWluKE1PXzgsIFZkVl9vZmYs
IFZ1Vl9vZmYsIFZ2Vl9vZmYsIFwKICAgICAgICAgICAgICAgICAgICAgICBzaXplb2YoTU1WZWN0
b3IpLCBzaXplb2YoTU1WZWN0b3IpKQogCisvKiBWZWN0b3IgbG9naWNhbCBvcHMgKi8KKyNkZWZp
bmUgZkdFTl9UQ0dfVjZfdnhvcihTSE9SVENPREUpIFwKKyAgICB0Y2dfZ2VuX2d2ZWNfeG9yKE1P
XzY0LCBWZFZfb2ZmLCBWdVZfb2ZmLCBWdlZfb2ZmLCBcCisgICAgICAgICAgICAgICAgICAgICBz
aXplb2YoTU1WZWN0b3IpLCBzaXplb2YoTU1WZWN0b3IpKQorCisjZGVmaW5lIGZHRU5fVENHX1Y2
X3ZhbmQoU0hPUlRDT0RFKSBcCisgICAgdGNnX2dlbl9ndmVjX2FuZChNT182NCwgVmRWX29mZiwg
VnVWX29mZiwgVnZWX29mZiwgXAorICAgICAgICAgICAgICAgICAgICAgc2l6ZW9mKE1NVmVjdG9y
KSwgc2l6ZW9mKE1NVmVjdG9yKSkKKworI2RlZmluZSBmR0VOX1RDR19WNl92b3IoU0hPUlRDT0RF
KSBcCisgICAgdGNnX2dlbl9ndmVjX29yKE1PXzY0LCBWZFZfb2ZmLCBWdVZfb2ZmLCBWdlZfb2Zm
LCBcCisgICAgICAgICAgICAgICAgICAgIHNpemVvZihNTVZlY3RvciksIHNpemVvZihNTVZlY3Rv
cikpCisKKyNkZWZpbmUgZkdFTl9UQ0dfVjZfdm5vdChTSE9SVENPREUpIFwKKyAgICB0Y2dfZ2Vu
X2d2ZWNfbm90KE1PXzY0LCBWZFZfb2ZmLCBWdVZfb2ZmLCBcCisgICAgICAgICAgICAgICAgICAg
ICBzaXplb2YoTU1WZWN0b3IpLCBzaXplb2YoTU1WZWN0b3IpKQorCisvKiBRIHJlZ2lzdGVyIGxv
Z2ljYWwgb3BzICovCisjZGVmaW5lIGZHRU5fVENHX1Y2X3ByZWRfb3IoU0hPUlRDT0RFKSBcCisg
ICAgdGNnX2dlbl9ndmVjX29yKE1PXzY0LCBRZFZfb2ZmLCBRc1Zfb2ZmLCBRdFZfb2ZmLCBcCisg
ICAgICAgICAgICAgICAgICAgIHNpemVvZihNTVFSZWcpLCBzaXplb2YoTU1RUmVnKSkKKworI2Rl
ZmluZSBmR0VOX1RDR19WNl9wcmVkX2FuZChTSE9SVENPREUpIFwKKyAgICB0Y2dfZ2VuX2d2ZWNf
YW5kKE1PXzY0LCBRZFZfb2ZmLCBRc1Zfb2ZmLCBRdFZfb2ZmLCBcCisgICAgICAgICAgICAgICAg
ICAgICBzaXplb2YoTU1RUmVnKSwgc2l6ZW9mKE1NUVJlZykpCisKKyNkZWZpbmUgZkdFTl9UQ0df
VjZfcHJlZF94b3IoU0hPUlRDT0RFKSBcCisgICAgdGNnX2dlbl9ndmVjX3hvcihNT182NCwgUWRW
X29mZiwgUXNWX29mZiwgUXRWX29mZiwgXAorICAgICAgICAgICAgICAgICAgICAgc2l6ZW9mKE1N
UVJlZyksIHNpemVvZihNTVFSZWcpKQorCisjZGVmaW5lIGZHRU5fVENHX1Y2X3ByZWRfb3JfbihT
SE9SVENPREUpIFwKKyAgICB0Y2dfZ2VuX2d2ZWNfb3JjKE1PXzY0LCBRZFZfb2ZmLCBRc1Zfb2Zm
LCBRdFZfb2ZmLCBcCisgICAgICAgICAgICAgICAgICAgICBzaXplb2YoTU1RUmVnKSwgc2l6ZW9m
KE1NUVJlZykpCisKKyNkZWZpbmUgZkdFTl9UQ0dfVjZfcHJlZF9hbmRfbihTSE9SVENPREUpIFwK
KyAgICB0Y2dfZ2VuX2d2ZWNfYW5kYyhNT182NCwgUWRWX29mZiwgUXNWX29mZiwgUXRWX29mZiwg
XAorICAgICAgICAgICAgICAgICAgICAgIHNpemVvZihNTVFSZWcpLCBzaXplb2YoTU1RUmVnKSkK
KworI2RlZmluZSBmR0VOX1RDR19WNl9wcmVkX25vdChTSE9SVENPREUpIFwKKyAgICB0Y2dfZ2Vu
X2d2ZWNfbm90KE1PXzY0LCBRZFZfb2ZmLCBRc1Zfb2ZmLCBcCisgICAgICAgICAgICAgICAgICAg
ICBzaXplb2YoTU1RUmVnKSwgc2l6ZW9mKE1NUVJlZykpCisKICNlbmRpZgotLSAKMi43LjQKCg==

