Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 743154B7FA1
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 05:44:04 +0100 (CET)
Received: from localhost ([::1]:48290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKCAc-0002em-6M
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 23:44:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1nKC72-0000ub-Ms
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 23:40:20 -0500
Received: from alexa-out.qualcomm.com ([129.46.98.28]:33401)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1nKC6x-0008Nt-Sw
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 23:40:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1644986416; x=1676522416;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=CExAMf+wd/5TiLcSzLGf7MBhLvo0oLC4fy4LHaCOXxo=;
 b=UjODYzHaS4n5Nj1CQ1iiAnsI2mjY9M+rw7mMYrfryZe1gZt9qTlqdpC3
 x84fIs0QbmyIqouJJUwFfXqScyXAI9acn8kuMhd6po8UIFQxkAqKx42Eh
 wDZ5T6R7dSzQyU7GaLxYg4a/u3uFifH/HbB4ql37AJ3mAtq1hzmx2X4Kl M=;
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
 by alexa-out.qualcomm.com with ESMTP; 15 Feb 2022 20:40:01 -0800
X-QCInternal: smtphost
Received: from hu-tsimpson-lv.qualcomm.com (HELO
 hu-devc-lv-u18-c.qualcomm.com) ([10.47.235.220])
 by ironmsg09-lv.qualcomm.com with ESMTP; 15 Feb 2022 20:40:02 -0800
Received: by hu-devc-lv-u18-c.qualcomm.com (Postfix, from userid 47164)
 id 1774D500172; Tue, 15 Feb 2022 20:39:41 -0800 (PST)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3] Hexagon (target/hexagon) properly handle NaN in
 dfmin/dfmax/sfmin/sfmax
Date: Tue, 15 Feb 2022 20:39:39 -0800
Message-Id: <20220216043939.25339-1-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=129.46.98.28; envelope-from=tsimpson@qualcomm.com;
 helo=alexa-out.qualcomm.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
dXQuICBTbywgd2UgdXNlCmZsb2F0Pz9fbWluaW11bV9udW1iZXIuICBGb3IgZG91YmxlIHByZWNp
c2lvbiwgd2UgY2hlY2sgZm9yIFFOYU4gYW5kCnJhaXNlIHRoZSBpbnZhbGlkIGZsYWcuCgp0ZXN0
IGNhc2VzIGFkZGVkIGluIGEgc3Vic2VxdWVudCBwYXRjaCB0byBtb3JlIGV4dGVuc2l2ZWx5IHRl
c3QgVVNSIGJpdHMKClNpZ25lZC1vZmYtYnk6IFRheWxvciBTaW1wc29uIDx0c2ltcHNvbkBxdWlj
aW5jLmNvbT4KLS0tCiB0YXJnZXQvaGV4YWdvbi9vcF9oZWxwZXIuYyB8IDE0ICsrKysrKysrLS0t
LS0tCiAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQoKZGlm
ZiAtLWdpdCBhL3RhcmdldC9oZXhhZ29uL29wX2hlbHBlci5jIGIvdGFyZ2V0L2hleGFnb24vb3Bf
aGVscGVyLmMKaW5kZXggMDU3YmFmOWE0OC4uZGFmMGIwZDM0OCAxMDA2NDQKLS0tIGEvdGFyZ2V0
L2hleGFnb24vb3BfaGVscGVyLmMKKysrIGIvdGFyZ2V0L2hleGFnb24vb3BfaGVscGVyLmMKQEAg
LTk0OCw3ICs5NDgsNyBAQCBmbG9hdDMyIEhFTFBFUihzZm1heCkoQ1BVSGV4YWdvblN0YXRlICpl
bnYsIGZsb2F0MzIgUnNWLCBmbG9hdDMyIFJ0VikKIHsKICAgICBmbG9hdDMyIFJkVjsKICAgICBh
cmNoX2Zwb3Bfc3RhcnQoZW52KTsKLSAgICBSZFYgPSBmbG9hdDMyX21heG51bShSc1YsIFJ0Viwg
JmVudi0+ZnBfc3RhdHVzKTsKKyAgICBSZFYgPSBmbG9hdDMyX21heGltdW1fbnVtYmVyKFJzViwg
UnRWLCAmZW52LT5mcF9zdGF0dXMpOwogICAgIGFyY2hfZnBvcF9lbmQoZW52KTsKICAgICByZXR1
cm4gUmRWOwogfQpAQCAtOTU3LDcgKzk1Nyw3IEBAIGZsb2F0MzIgSEVMUEVSKHNmbWluKShDUFVI
ZXhhZ29uU3RhdGUgKmVudiwgZmxvYXQzMiBSc1YsIGZsb2F0MzIgUnRWKQogewogICAgIGZsb2F0
MzIgUmRWOwogICAgIGFyY2hfZnBvcF9zdGFydChlbnYpOwotICAgIFJkViA9IGZsb2F0MzJfbWlu
bnVtKFJzViwgUnRWLCAmZW52LT5mcF9zdGF0dXMpOworICAgIFJkViA9IGZsb2F0MzJfbWluaW11
bV9udW1iZXIoUnNWLCBSdFYsICZlbnYtPmZwX3N0YXR1cyk7CiAgICAgYXJjaF9mcG9wX2VuZChl
bnYpOwogICAgIHJldHVybiBSZFY7CiB9CkBAIC0xMDQxLDggKzEwNDEsOSBAQCBmbG9hdDY0IEhF
TFBFUihkZm1heCkoQ1BVSGV4YWdvblN0YXRlICplbnYsIGZsb2F0NjQgUnNzViwgZmxvYXQ2NCBS
dHRWKQogewogICAgIGZsb2F0NjQgUmRkVjsKICAgICBhcmNoX2Zwb3Bfc3RhcnQoZW52KTsKLSAg
ICBSZGRWID0gZmxvYXQ2NF9tYXhudW0oUnNzViwgUnR0ViwgJmVudi0+ZnBfc3RhdHVzKTsKLSAg
ICBpZiAoZmxvYXQ2NF9pc19hbnlfbmFuKFJzc1YpIHx8IGZsb2F0NjRfaXNfYW55X25hbihSdHRW
KSkgeworICAgIFJkZFYgPSBmbG9hdDY0X21heGltdW1fbnVtYmVyKFJzc1YsIFJ0dFYsICZlbnYt
PmZwX3N0YXR1cyk7CisgICAgaWYgKGZsb2F0NjRfaXNfcXVpZXRfbmFuKFJzc1YsICZlbnYtPmZw
X3N0YXR1cykgfHwKKyAgICAgICAgZmxvYXQ2NF9pc19xdWlldF9uYW4oUnR0ViwgJmVudi0+ZnBf
c3RhdHVzKSkgewogICAgICAgICBmbG9hdF9yYWlzZShmbG9hdF9mbGFnX2ludmFsaWQsICZlbnYt
PmZwX3N0YXR1cyk7CiAgICAgfQogICAgIGFyY2hfZnBvcF9lbmQoZW52KTsKQEAgLTEwNTMsOCAr
MTA1NCw5IEBAIGZsb2F0NjQgSEVMUEVSKGRmbWluKShDUFVIZXhhZ29uU3RhdGUgKmVudiwgZmxv
YXQ2NCBSc3NWLCBmbG9hdDY0IFJ0dFYpCiB7CiAgICAgZmxvYXQ2NCBSZGRWOwogICAgIGFyY2hf
ZnBvcF9zdGFydChlbnYpOwotICAgIFJkZFYgPSBmbG9hdDY0X21pbm51bShSc3NWLCBSdHRWLCAm
ZW52LT5mcF9zdGF0dXMpOwotICAgIGlmIChmbG9hdDY0X2lzX2FueV9uYW4oUnNzVikgfHwgZmxv
YXQ2NF9pc19hbnlfbmFuKFJ0dFYpKSB7CisgICAgUmRkViA9IGZsb2F0NjRfbWluaW11bV9udW1i
ZXIoUnNzViwgUnR0ViwgJmVudi0+ZnBfc3RhdHVzKTsKKyAgICBpZiAoZmxvYXQ2NF9pc19xdWll
dF9uYW4oUnNzViwgJmVudi0+ZnBfc3RhdHVzKSB8fAorICAgICAgICBmbG9hdDY0X2lzX3F1aWV0
X25hbihSdHRWLCAmZW52LT5mcF9zdGF0dXMpKSB7CiAgICAgICAgIGZsb2F0X3JhaXNlKGZsb2F0
X2ZsYWdfaW52YWxpZCwgJmVudi0+ZnBfc3RhdHVzKTsKICAgICB9CiAgICAgYXJjaF9mcG9wX2Vu
ZChlbnYpOwotLSAKMi4xNy4xCgo=

