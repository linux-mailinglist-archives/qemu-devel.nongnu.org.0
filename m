Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FBE6312A5F
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 07:02:56 +0100 (CET)
Received: from localhost ([::1]:53152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8zdP-0001Xu-Ga
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 01:02:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1l8zOf-0008Pr-Bx
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 00:47:41 -0500
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:14438)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1l8zOc-0006ST-Va
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 00:47:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1612763259; x=1644299259;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2UOA8UXQuVe6cGLaWcz2GMFFjzCoeDBOzabSoAliZJ8=;
 b=C+IFOyN7kVRAVCJUky0vfMcZ3VHUTcOtsYG39MUFWlcGwGrXfO3aAxRR
 NxTYENB11VIsIGfpGY5LxdnI8ClSyM5XIu+jr0Rj5+1Gc4QaF1WZkdodG
 NpUDshBBrQLp/5ksHT1u8IpN0GnE5fkODhFpzZTL7TEkPnHz/HbiH2Eg0 0=;
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 07 Feb 2021 21:46:55 -0800
X-QCInternal: smtphost
Received: from vu-tsimpson-aus.qualcomm.com (HELO
 vu-tsimpson1-aus.qualcomm.com) ([10.222.150.1])
 by ironmsg01-sd.qualcomm.com with ESMTP; 07 Feb 2021 21:46:32 -0800
Received: by vu-tsimpson1-aus.qualcomm.com (Postfix, from userid 47164)
 id 1CE9B3348; Sun,  7 Feb 2021 23:46:29 -0600 (CST)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 08/35] Hexagon (target/hexagon) GDB Stub
Date: Sun,  7 Feb 2021 23:45:58 -0600
Message-Id: <1612763186-18161-9-git-send-email-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1612763186-18161-1-git-send-email-tsimpson@quicinc.com>
References: <1612763186-18161-1-git-send-email-tsimpson@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=199.106.114.38;
 envelope-from=tsimpson@qualcomm.com; helo=alexa-out-sd-01.qualcomm.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: ale@rev.ng, bcain@quicinc.com, philmd@redhat.com,
 richard.henderson@linaro.org, laurent@vivier.eu, tsimpson@quicinc.com,
 alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

R0RCIHJlZ2lzdGVyIHJlYWQgYW5kIHdyaXRlIHJvdXRpbmVzCgpTaWduZWQtb2ZmLWJ5OiBUYXls
b3IgU2ltcHNvbiA8dHNpbXBzb25AcXVpY2luYy5jb20+ClJldmlld2VkLWJ5OiBSaWNoYXJkIEhl
bmRlcnNvbiA8cmljaGFyZC5oZW5kZXJzb25AbGluYXJvLm9yZz4KUmV2aWV3ZWQtYnk6IFBoaWxp
cHBlIE1hdGhpZXUtRGF1ZMOpIDxmNGJ1Z0BhbXNhdC5vcmc+Ci0tLQogdGFyZ2V0L2hleGFnb24v
aW50ZXJuYWwuaCB8ICAyICsrCiB0YXJnZXQvaGV4YWdvbi9nZGJzdHViLmMgIHwgNDcgKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKIDIgZmlsZXMgY2hhbmdl
ZCwgNDkgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IHRhcmdldC9oZXhhZ29uL2dk
YnN0dWIuYwoKZGlmZiAtLWdpdCBhL3RhcmdldC9oZXhhZ29uL2ludGVybmFsLmggYi90YXJnZXQv
aGV4YWdvbi9pbnRlcm5hbC5oCmluZGV4IGM4Mzk3OTYuLjJkYTg1YzggMTAwNjQ0Ci0tLSBhL3Rh
cmdldC9oZXhhZ29uL2ludGVybmFsLmgKKysrIGIvdGFyZ2V0L2hleGFnb24vaW50ZXJuYWwuaApA
QCAtMjgsNiArMjgsOCBAQAogI2RlZmluZSBIRVhfREVCVUdfTE9HKC4uLikgZG8geyB9IHdoaWxl
ICgwKQogI2VuZGlmCiAKK2ludCBoZXhhZ29uX2dkYl9yZWFkX3JlZ2lzdGVyKENQVVN0YXRlICpj
cHUsIEdCeXRlQXJyYXkgKmJ1ZiwgaW50IHJlZyk7CitpbnQgaGV4YWdvbl9nZGJfd3JpdGVfcmVn
aXN0ZXIoQ1BVU3RhdGUgKmNwdSwgdWludDhfdCAqYnVmLCBpbnQgcmVnKTsKIHZvaWQgaGV4YWdv
bl9kZWJ1ZyhDUFVIZXhhZ29uU3RhdGUgKmVudik7CiAKIGV4dGVybiBjb25zdCBjaGFyICogY29u
c3QgaGV4YWdvbl9yZWduYW1lc1tUT1RBTF9QRVJfVEhSRUFEX1JFR1NdOwpkaWZmIC0tZ2l0IGEv
dGFyZ2V0L2hleGFnb24vZ2Ric3R1Yi5jIGIvdGFyZ2V0L2hleGFnb24vZ2Ric3R1Yi5jCm5ldyBm
aWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAuLjljOGMwNGMKLS0tIC9kZXYvbnVsbAorKysg
Yi90YXJnZXQvaGV4YWdvbi9nZGJzdHViLmMKQEAgLTAsMCArMSw0NyBAQAorLyoKKyAqICBDb3B5
cmlnaHQoYykgMjAxOS0yMDIxIFF1YWxjb21tIElubm92YXRpb24gQ2VudGVyLCBJbmMuIEFsbCBS
aWdodHMgUmVzZXJ2ZWQuCisgKgorICogIFRoaXMgcHJvZ3JhbSBpcyBmcmVlIHNvZnR3YXJlOyB5
b3UgY2FuIHJlZGlzdHJpYnV0ZSBpdCBhbmQvb3IgbW9kaWZ5CisgKiAgaXQgdW5kZXIgdGhlIHRl
cm1zIG9mIHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSBhcyBwdWJsaXNoZWQgYnkKKyAq
ICB0aGUgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uOyBlaXRoZXIgdmVyc2lvbiAyIG9mIHRoZSBM
aWNlbnNlLCBvcgorICogIChhdCB5b3VyIG9wdGlvbikgYW55IGxhdGVyIHZlcnNpb24uCisgKgor
ICogIFRoaXMgcHJvZ3JhbSBpcyBkaXN0cmlidXRlZCBpbiB0aGUgaG9wZSB0aGF0IGl0IHdpbGwg
YmUgdXNlZnVsLAorICogIGJ1dCBXSVRIT1VUIEFOWSBXQVJSQU5UWTsgd2l0aG91dCBldmVuIHRo
ZSBpbXBsaWVkIHdhcnJhbnR5IG9mCisgKiAgTUVSQ0hBTlRBQklMSVRZIG9yIEZJVE5FU1MgRk9S
IEEgUEFSVElDVUxBUiBQVVJQT1NFLiAgU2VlIHRoZQorICogIEdOVSBHZW5lcmFsIFB1YmxpYyBM
aWNlbnNlIGZvciBtb3JlIGRldGFpbHMuCisgKgorICogIFlvdSBzaG91bGQgaGF2ZSByZWNlaXZl
ZCBhIGNvcHkgb2YgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlCisgKiAgYWxvbmcgd2l0
aCB0aGlzIHByb2dyYW07IGlmIG5vdCwgc2VlIDxodHRwOi8vd3d3LmdudS5vcmcvbGljZW5zZXMv
Pi4KKyAqLworCisjaW5jbHVkZSAicWVtdS9vc2RlcC5oIgorI2luY2x1ZGUgInFlbXUtY29tbW9u
LmgiCisjaW5jbHVkZSAiZXhlYy9nZGJzdHViLmgiCisjaW5jbHVkZSAiY3B1LmgiCisjaW5jbHVk
ZSAiaW50ZXJuYWwuaCIKKworaW50IGhleGFnb25fZ2RiX3JlYWRfcmVnaXN0ZXIoQ1BVU3RhdGUg
KmNzLCBHQnl0ZUFycmF5ICptZW1fYnVmLCBpbnQgbikKK3sKKyAgICBIZXhhZ29uQ1BVICpjcHUg
PSBIRVhBR09OX0NQVShjcyk7CisgICAgQ1BVSGV4YWdvblN0YXRlICplbnYgPSAmY3B1LT5lbnY7
CisKKyAgICBpZiAobiA8IFRPVEFMX1BFUl9USFJFQURfUkVHUykgeworICAgICAgICByZXR1cm4g
Z2RiX2dldF9yZWdsKG1lbV9idWYsIGVudi0+Z3ByW25dKTsKKyAgICB9CisKKyAgICBnX2Fzc2Vy
dF9ub3RfcmVhY2hlZCgpOworfQorCitpbnQgaGV4YWdvbl9nZGJfd3JpdGVfcmVnaXN0ZXIoQ1BV
U3RhdGUgKmNzLCB1aW50OF90ICptZW1fYnVmLCBpbnQgbikKK3sKKyAgICBIZXhhZ29uQ1BVICpj
cHUgPSBIRVhBR09OX0NQVShjcyk7CisgICAgQ1BVSGV4YWdvblN0YXRlICplbnYgPSAmY3B1LT5l
bnY7CisKKyAgICBpZiAobiA8IFRPVEFMX1BFUl9USFJFQURfUkVHUykgeworICAgICAgICBlbnYt
PmdwcltuXSA9IGxkdHVsX3AobWVtX2J1Zik7CisgICAgICAgIHJldHVybiBzaXplb2YodGFyZ2V0
X3Vsb25nKTsKKyAgICB9CisKKyAgICBnX2Fzc2VydF9ub3RfcmVhY2hlZCgpOworfQotLSAKMi43
LjQKCg==

