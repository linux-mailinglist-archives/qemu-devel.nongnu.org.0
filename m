Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35AF0412860
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 23:45:10 +0200 (CEST)
Received: from localhost ([::1]:59856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSR65-00013J-7P
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 17:45:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1mSQmh-0002bR-64
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 17:25:08 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:9859)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1mSQme-00021x-EX
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 17:25:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1632173104; x=1663709104;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=P64XMd6ewfWIGNQ5ffd/uEbuu0BWHV2Zt/Fnnl/wPqM=;
 b=MtmR2cm3whLFN2O2BqaU5OG2BuktTMCuHKvbF0pLqmCVQfuWOvPJbKiP
 0w7RRLCtmALDXv2/mZRNXFZeW088LXpl++zq6/9uF7cDOYiCZtIm0SoI0
 PI40b3ywZMXhwEdFFYPwiHWV4pRYO4D6izWWMbhM3fIhVKtkyuphu2aKF Q=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 20 Sep 2021 14:24:37 -0700
X-QCInternal: smtphost
Received: from vu-tsimpson-aus.qualcomm.com (HELO
 vu-tsimpson1-aus.qualcomm.com) ([10.222.150.1])
 by ironmsg02-sd.qualcomm.com with ESMTP; 20 Sep 2021 14:24:37 -0700
Received: by vu-tsimpson1-aus.qualcomm.com (Postfix, from userid 47164)
 id BCFA816AF; Mon, 20 Sep 2021 16:24:35 -0500 (CDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 18/30] Hexagon HVX (target/hexagon) helper overrides -
 vector max/min
Date: Mon, 20 Sep 2021 16:24:13 -0500
Message-Id: <1632173065-18522-19-git-send-email-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1632173065-18522-1-git-send-email-tsimpson@quicinc.com>
References: <1632173065-18522-1-git-send-email-tsimpson@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=199.106.114.39;
 envelope-from=tsimpson@qualcomm.com; helo=alexa-out-sd-02.qualcomm.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X2h2eC5oCmluZGV4IGE3NzQ4YWEuLjAwNmJhNzQgMTAwNjQ0Ci0tLSBhL3RhcmdldC9oZXhhZ29u
L2dlbl90Y2dfaHZ4LmgKKysrIGIvdGFyZ2V0L2hleGFnb24vZ2VuX3RjZ19odnguaApAQCAtMzI5
LDQgKzMyOSwzOCBAQCBzdGF0aWMgaW5saW5lIHZvaWQgYXNzZXJ0X3ZoaXN0X3RtcChEaXNhc0Nv
bnRleHQgKmN0eCkKICAgICAgICAgdGNnX3RlbXBfZnJlZShzaGlmdCk7IFwKICAgICB9IHdoaWxl
ICgwKQogCisvKiBWZWN0b3IgbWF4IC0gdmFyaW91cyBmb3JtcyAqLworI2RlZmluZSBmR0VOX1RD
R19WNl92bWF4dyhTSE9SVENPREUpIFwKKyAgICB0Y2dfZ2VuX2d2ZWNfc21heChNT18zMiwgVmRW
X29mZiwgVnVWX29mZiwgVnZWX29mZiwgXAorICAgICAgICAgICAgICAgICAgICAgIHNpemVvZihN
TVZlY3RvciksIHNpemVvZihNTVZlY3RvcikpCisjZGVmaW5lIGZHRU5fVENHX1Y2X3ZtYXhoKFNI
T1JUQ09ERSkgXAorICAgIHRjZ19nZW5fZ3ZlY19zbWF4KE1PXzE2LCBWZFZfb2ZmLCBWdVZfb2Zm
LCBWdlZfb2ZmLCBcCisgICAgICAgICAgICAgICAgICAgICAgc2l6ZW9mKE1NVmVjdG9yKSwgc2l6
ZW9mKE1NVmVjdG9yKSkKKyNkZWZpbmUgZkdFTl9UQ0dfVjZfdm1heHVoKFNIT1JUQ09ERSkgXAor
ICAgIHRjZ19nZW5fZ3ZlY191bWF4KE1PXzE2LCBWZFZfb2ZmLCBWdVZfb2ZmLCBWdlZfb2ZmLCBc
CisgICAgICAgICAgICAgICAgICAgICAgc2l6ZW9mKE1NVmVjdG9yKSwgc2l6ZW9mKE1NVmVjdG9y
KSkKKyNkZWZpbmUgZkdFTl9UQ0dfVjZfdm1heGIoU0hPUlRDT0RFKSBcCisgICAgdGNnX2dlbl9n
dmVjX3NtYXgoTU9fOCwgVmRWX29mZiwgVnVWX29mZiwgVnZWX29mZiwgXAorICAgICAgICAgICAg
ICAgICAgICAgIHNpemVvZihNTVZlY3RvciksIHNpemVvZihNTVZlY3RvcikpCisjZGVmaW5lIGZH
RU5fVENHX1Y2X3ZtYXh1YihTSE9SVENPREUpIFwKKyAgICB0Y2dfZ2VuX2d2ZWNfdW1heChNT184
LCBWZFZfb2ZmLCBWdVZfb2ZmLCBWdlZfb2ZmLCBcCisgICAgICAgICAgICAgICAgICAgICAgc2l6
ZW9mKE1NVmVjdG9yKSwgc2l6ZW9mKE1NVmVjdG9yKSkKKworLyogVmVjdG9yIG1pbiAtIHZhcmlv
dXMgZm9ybXMgKi8KKyNkZWZpbmUgZkdFTl9UQ0dfVjZfdm1pbncoU0hPUlRDT0RFKSBcCisgICAg
dGNnX2dlbl9ndmVjX3NtaW4oTU9fMzIsIFZkVl9vZmYsIFZ1Vl9vZmYsIFZ2Vl9vZmYsIFwKKyAg
ICAgICAgICAgICAgICAgICAgICBzaXplb2YoTU1WZWN0b3IpLCBzaXplb2YoTU1WZWN0b3IpKQor
I2RlZmluZSBmR0VOX1RDR19WNl92bWluaChTSE9SVENPREUpIFwKKyAgICB0Y2dfZ2VuX2d2ZWNf
c21pbihNT18xNiwgVmRWX29mZiwgVnVWX29mZiwgVnZWX29mZiwgXAorICAgICAgICAgICAgICAg
ICAgICAgIHNpemVvZihNTVZlY3RvciksIHNpemVvZihNTVZlY3RvcikpCisjZGVmaW5lIGZHRU5f
VENHX1Y2X3ZtaW51aChTSE9SVENPREUpIFwKKyAgICB0Y2dfZ2VuX2d2ZWNfdW1pbihNT18xNiwg
VmRWX29mZiwgVnVWX29mZiwgVnZWX29mZiwgXAorICAgICAgICAgICAgICAgICAgICAgIHNpemVv
ZihNTVZlY3RvciksIHNpemVvZihNTVZlY3RvcikpCisjZGVmaW5lIGZHRU5fVENHX1Y2X3ZtaW5i
KFNIT1JUQ09ERSkgXAorICAgIHRjZ19nZW5fZ3ZlY19zbWluKE1PXzgsIFZkVl9vZmYsIFZ1Vl9v
ZmYsIFZ2Vl9vZmYsIFwKKyAgICAgICAgICAgICAgICAgICAgICBzaXplb2YoTU1WZWN0b3IpLCBz
aXplb2YoTU1WZWN0b3IpKQorI2RlZmluZSBmR0VOX1RDR19WNl92bWludWIoU0hPUlRDT0RFKSBc
CisgICAgdGNnX2dlbl9ndmVjX3VtaW4oTU9fOCwgVmRWX29mZiwgVnVWX29mZiwgVnZWX29mZiwg
XAorICAgICAgICAgICAgICAgICAgICAgIHNpemVvZihNTVZlY3RvciksIHNpemVvZihNTVZlY3Rv
cikpCisKICNlbmRpZgotLSAKMi43LjQKCg==

