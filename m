Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22B0A4AB2DD
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 01:03:02 +0100 (CET)
Received: from localhost ([::1]:33076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGrUj-0007ET-8X
	for lists+qemu-devel@lfdr.de; Sun, 06 Feb 2022 19:03:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1nGrP4-0000PX-OI
 for qemu-devel@nongnu.org; Sun, 06 Feb 2022 18:57:10 -0500
Received: from alexa-out.qualcomm.com ([129.46.98.28]:55064)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1nGrP1-00084W-CW
 for qemu-devel@nongnu.org; Sun, 06 Feb 2022 18:57:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1644191827; x=1675727827;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tNqqqrBfxkzf1q8B88OdtnWymC8vC3Fcezde/EkrMuU=;
 b=dtV1Srz4sOLZ2U/k1nL5SKMRrnnGVF6qI6jqESWfovT1fmt1V+tjwbvN
 K4Q8JqIVdo0IEi1SIZGL2lz+P8NKotgPWkpbqcMeNzRCy40QXYCzvzMoq
 vvtPOUYr8IInmmbVYGDw633NVQe6N4Foe+MwU6a6EMKdki8066QESCf6d E=;
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
 by alexa-out.qualcomm.com with ESMTP; 06 Feb 2022 15:50:54 -0800
X-QCInternal: smtphost
Received: from hu-tsimpson-lv.qualcomm.com (HELO
 hu-devc-lv-u18-c.qualcomm.com) ([10.47.235.220])
 by ironmsg08-lv.qualcomm.com with ESMTP; 06 Feb 2022 15:50:53 -0800
Received: by hu-devc-lv-u18-c.qualcomm.com (Postfix, from userid 47164)
 id A3A4150059B; Sun,  6 Feb 2022 15:50:33 -0800 (PST)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/8] Hexagon (target/hexagon) properly handle SNaN in
 dfmin/dfmax/sfmin/sfmax
Date: Sun,  6 Feb 2022 15:50:26 -0800
Message-Id: <20220206235030.31493-5-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220206235030.31493-1-tsimpson@quicinc.com>
References: <20220206235030.31493-1-tsimpson@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=129.46.98.28; envelope-from=tsimpson@qualcomm.com;
 helo=alexa-out.qualcomm.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: ale@rev.ng, bcain@quicinc.com, richard.henderson@linaro.org,
 f4bug@amsat.org, tsimpson@quicinc.com, mlambert@quicinc.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

VGhlIGZsb2F0Pz9fbWlubnVtIGltcGxlbWVudGF0aW9uIGRpZmZlcnMgZnJvbSBIZXhhZ29uIGZv
ciBTTmFOLAppdCByZXR1cm5zIE5hTiwgYnV0IEhleGFnb24gcmV0dXJucyB0aGUgb3RoZXIgaW5w
dXQuICBTbywgd2UgYWRkCmNoZWNrcyBmb3IgTmFOIGJlZm9yZSBjYWxsaW5nIGl0LgoKdGVzdCBj
YXNlcyBhZGRlZCBpbiBhIHN1YnNlcXVlbnQgcGF0Y2ggdG8gbW9yZSBleHRlbnNpdmVseSB0ZXN0
IFVTUiBiaXRzCgpTaWduZWQtb2ZmLWJ5OiBUYXlsb3IgU2ltcHNvbiA8dHNpbXBzb25AcXVpY2lu
Yy5jb20+Ci0tLQogdGFyZ2V0L2hleGFnb24vb3BfaGVscGVyLmMgfCA1NCArKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKystLS0tLQogMSBmaWxlIGNoYW5nZWQsIDQ4IGluc2VydGlvbnMo
KyksIDYgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvdGFyZ2V0L2hleGFnb24vb3BfaGVscGVy
LmMgYi90YXJnZXQvaGV4YWdvbi9vcF9oZWxwZXIuYwppbmRleCA3NWRjMGYyM2YwLi43ZjQwZTA5
NDg2IDEwMDY0NAotLS0gYS90YXJnZXQvaGV4YWdvbi9vcF9oZWxwZXIuYworKysgYi90YXJnZXQv
aGV4YWdvbi9vcF9oZWxwZXIuYwpAQCAtOTQ3LDcgKzk0NywxNyBAQCBmbG9hdDMyIEhFTFBFUihz
Zm1heCkoQ1BVSGV4YWdvblN0YXRlICplbnYsIGZsb2F0MzIgUnNWLCBmbG9hdDMyIFJ0VikKIHsK
ICAgICBmbG9hdDMyIFJkVjsKICAgICBhcmNoX2Zwb3Bfc3RhcnQoZW52KTsKLSAgICBSZFYgPSBm
bG9hdDMyX21heG51bShSc1YsIFJ0ViwgJmVudi0+ZnBfc3RhdHVzKTsKKyAgICBpZiAoZmxvYXQz
Ml9pc19zaWduYWxpbmdfbmFuKFJzViwgJmVudi0+ZnBfc3RhdHVzKSAmJgorICAgICAgICAhZmxv
YXQzMl9pc19hbnlfbmFuKFJ0VikpIHsKKyAgICAgICAgUmRWID0gUnRWOworICAgICAgICBmbG9h
dF9yYWlzZShmbG9hdF9mbGFnX2ludmFsaWQsICZlbnYtPmZwX3N0YXR1cyk7CisgICAgfSBlbHNl
IGlmICghZmxvYXQzMl9pc19hbnlfbmFuKFJzVikgJiYKKyAgICAgICAgICAgICAgIGZsb2F0MzJf
aXNfc2lnbmFsaW5nX25hbihSdFYsICZlbnYtPmZwX3N0YXR1cykpIHsKKyAgICAgICAgUmRWID0g
UnNWOworICAgICAgICBmbG9hdF9yYWlzZShmbG9hdF9mbGFnX2ludmFsaWQsICZlbnYtPmZwX3N0
YXR1cyk7CisgICAgfSBlbHNlIHsKKyAgICAgICAgUmRWID0gZmxvYXQzMl9tYXhudW0oUnNWLCBS
dFYsICZlbnYtPmZwX3N0YXR1cyk7CisgICAgfQogICAgIGFyY2hfZnBvcF9lbmQoZW52KTsKICAg
ICByZXR1cm4gUmRWOwogfQpAQCAtOTU2LDcgKzk2NiwxNyBAQCBmbG9hdDMyIEhFTFBFUihzZm1p
bikoQ1BVSGV4YWdvblN0YXRlICplbnYsIGZsb2F0MzIgUnNWLCBmbG9hdDMyIFJ0VikKIHsKICAg
ICBmbG9hdDMyIFJkVjsKICAgICBhcmNoX2Zwb3Bfc3RhcnQoZW52KTsKLSAgICBSZFYgPSBmbG9h
dDMyX21pbm51bShSc1YsIFJ0ViwgJmVudi0+ZnBfc3RhdHVzKTsKKyAgICBpZiAoZmxvYXQzMl9p
c19zaWduYWxpbmdfbmFuKFJzViwgJmVudi0+ZnBfc3RhdHVzKSAmJgorICAgICAgICAhZmxvYXQz
Ml9pc19hbnlfbmFuKFJ0VikpIHsKKyAgICAgICAgUmRWID0gUnRWOworICAgICAgICBmbG9hdF9y
YWlzZShmbG9hdF9mbGFnX2ludmFsaWQsICZlbnYtPmZwX3N0YXR1cyk7CisgICAgfSBlbHNlIGlm
ICghZmxvYXQzMl9pc19hbnlfbmFuKFJzVikgJiYKKyAgICAgICAgICAgICAgIGZsb2F0MzJfaXNf
c2lnbmFsaW5nX25hbihSdFYsICZlbnYtPmZwX3N0YXR1cykpIHsKKyAgICAgICAgUmRWID0gUnNW
OworICAgICAgICBmbG9hdF9yYWlzZShmbG9hdF9mbGFnX2ludmFsaWQsICZlbnYtPmZwX3N0YXR1
cyk7CisgICAgfSBlbHNlIHsKKyAgICAgICAgUmRWID0gZmxvYXQzMl9taW5udW0oUnNWLCBSdFYs
ICZlbnYtPmZwX3N0YXR1cyk7CisgICAgfQogICAgIGFyY2hfZnBvcF9lbmQoZW52KTsKICAgICBy
ZXR1cm4gUmRWOwogfQpAQCAtMTA0MCw5ICsxMDYwLDIwIEBAIGZsb2F0NjQgSEVMUEVSKGRmbWF4
KShDUFVIZXhhZ29uU3RhdGUgKmVudiwgZmxvYXQ2NCBSc3NWLCBmbG9hdDY0IFJ0dFYpCiB7CiAg
ICAgZmxvYXQ2NCBSZGRWOwogICAgIGFyY2hfZnBvcF9zdGFydChlbnYpOwotICAgIFJkZFYgPSBm
bG9hdDY0X21heG51bShSc3NWLCBSdHRWLCAmZW52LT5mcF9zdGF0dXMpOwotICAgIGlmIChmbG9h
dDY0X2lzX2FueV9uYW4oUnNzVikgfHwgZmxvYXQ2NF9pc19hbnlfbmFuKFJ0dFYpKSB7CisgICAg
aWYgKGZsb2F0NjRfaXNfc2lnbmFsaW5nX25hbihSc3NWLCAmZW52LT5mcF9zdGF0dXMpICYmCisg
ICAgICAgICFmbG9hdDY0X2lzX2FueV9uYW4oUnR0VikpIHsKKyAgICAgICAgUmRkViA9IFJ0dFY7
CiAgICAgICAgIGZsb2F0X3JhaXNlKGZsb2F0X2ZsYWdfaW52YWxpZCwgJmVudi0+ZnBfc3RhdHVz
KTsKKyAgICB9IGVsc2UgaWYgKCFmbG9hdDY0X2lzX2FueV9uYW4oUnNzVikgJiYKKyAgICAgICAg
ICAgICAgIGZsb2F0NjRfaXNfc2lnbmFsaW5nX25hbihSdHRWLCAmZW52LT5mcF9zdGF0dXMpKSB7
CisgICAgICAgIFJkZFYgPSBSc3NWOworICAgICAgICBmbG9hdF9yYWlzZShmbG9hdF9mbGFnX2lu
dmFsaWQsICZlbnYtPmZwX3N0YXR1cyk7CisgICAgfSBlbHNlIHsKKyAgICAgICAgUmRkViA9IGZs
b2F0NjRfbWF4bnVtKFJzc1YsIFJ0dFYsICZlbnYtPmZwX3N0YXR1cyk7CisgICAgICAgIGlmIChm
bG9hdDY0X2lzX3F1aWV0X25hbihSc3NWLCAmZW52LT5mcF9zdGF0dXMpIHx8CisgICAgICAgICAg
ICBmbG9hdDY0X2lzX3F1aWV0X25hbihSdHRWLCAmZW52LT5mcF9zdGF0dXMpKSB7CisgICAgICAg
ICAgICBmbG9hdF9yYWlzZShmbG9hdF9mbGFnX2ludmFsaWQsICZlbnYtPmZwX3N0YXR1cyk7Cisg
ICAgICAgIH0KICAgICB9CiAgICAgYXJjaF9mcG9wX2VuZChlbnYpOwogICAgIHJldHVybiBSZGRW
OwpAQCAtMTA1Miw5ICsxMDgzLDIwIEBAIGZsb2F0NjQgSEVMUEVSKGRmbWluKShDUFVIZXhhZ29u
U3RhdGUgKmVudiwgZmxvYXQ2NCBSc3NWLCBmbG9hdDY0IFJ0dFYpCiB7CiAgICAgZmxvYXQ2NCBS
ZGRWOwogICAgIGFyY2hfZnBvcF9zdGFydChlbnYpOwotICAgIFJkZFYgPSBmbG9hdDY0X21pbm51
bShSc3NWLCBSdHRWLCAmZW52LT5mcF9zdGF0dXMpOwotICAgIGlmIChmbG9hdDY0X2lzX2FueV9u
YW4oUnNzVikgfHwgZmxvYXQ2NF9pc19hbnlfbmFuKFJ0dFYpKSB7CisgICAgaWYgKGZsb2F0NjRf
aXNfc2lnbmFsaW5nX25hbihSc3NWLCAmZW52LT5mcF9zdGF0dXMpICYmCisgICAgICAgICFmbG9h
dDY0X2lzX2FueV9uYW4oUnR0VikpIHsKKyAgICAgICAgUmRkViA9IFJ0dFY7CiAgICAgICAgIGZs
b2F0X3JhaXNlKGZsb2F0X2ZsYWdfaW52YWxpZCwgJmVudi0+ZnBfc3RhdHVzKTsKKyAgICB9IGVs
c2UgaWYgKCFmbG9hdDY0X2lzX2FueV9uYW4oUnNzVikgJiYKKyAgICAgICAgICAgICAgIGZsb2F0
NjRfaXNfc2lnbmFsaW5nX25hbihSdHRWLCAmZW52LT5mcF9zdGF0dXMpKSB7CisgICAgICAgIFJk
ZFYgPSBSc3NWOworICAgICAgICBmbG9hdF9yYWlzZShmbG9hdF9mbGFnX2ludmFsaWQsICZlbnYt
PmZwX3N0YXR1cyk7CisgICAgfSBlbHNlIHsKKyAgICAgICAgUmRkViA9IGZsb2F0NjRfbWlubnVt
KFJzc1YsIFJ0dFYsICZlbnYtPmZwX3N0YXR1cyk7CisgICAgICAgIGlmIChmbG9hdDY0X2lzX3F1
aWV0X25hbihSc3NWLCAmZW52LT5mcF9zdGF0dXMpIHx8CisgICAgICAgICAgICBmbG9hdDY0X2lz
X3F1aWV0X25hbihSdHRWLCAmZW52LT5mcF9zdGF0dXMpKSB7CisgICAgICAgICAgICBmbG9hdF9y
YWlzZShmbG9hdF9mbGFnX2ludmFsaWQsICZlbnYtPmZwX3N0YXR1cyk7CisgICAgICAgIH0KICAg
ICB9CiAgICAgYXJjaF9mcG9wX2VuZChlbnYpOwogICAgIHJldHVybiBSZGRWOwotLSAKMi4xNy4x
Cgo=

