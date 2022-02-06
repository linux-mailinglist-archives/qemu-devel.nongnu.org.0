Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4AC84AB2DC
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 01:03:00 +0100 (CET)
Received: from localhost ([::1]:33162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGrUh-0007Hb-W0
	for lists+qemu-devel@lfdr.de; Sun, 06 Feb 2022 19:03:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1nGrP4-0000PY-OJ
 for qemu-devel@nongnu.org; Sun, 06 Feb 2022 18:57:10 -0500
Received: from alexa-out.qualcomm.com ([129.46.98.28]:32989)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1nGrP1-000845-LD
 for qemu-devel@nongnu.org; Sun, 06 Feb 2022 18:57:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1644191828; x=1675727828;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8IDN+aKaVaX9p6KFZi2lBMATObnNzzUpXHUJo3eefxQ=;
 b=R/gWi1qME9y6gVBfDlwOzkafU/iB1Hx8vfZRCQET/4oIrAiQxYKN94u8
 PFAF84t+TGvco4BzbWNxHSQ9RMXsDXD9Upvq8eWfYs+liH0R2AaHFVd0Y
 eNLLjd3poQcNrGh4V9ZMmRVbG50pxW9rsH8xJxMRMo2g/wNA66NYZadML w=;
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
 by alexa-out.qualcomm.com with ESMTP; 06 Feb 2022 15:50:54 -0800
X-QCInternal: smtphost
Received: from hu-tsimpson-lv.qualcomm.com (HELO
 hu-devc-lv-u18-c.qualcomm.com) ([10.47.235.220])
 by ironmsg07-lv.qualcomm.com with ESMTP; 06 Feb 2022 15:50:54 -0800
Received: by hu-devc-lv-u18-c.qualcomm.com (Postfix, from userid 47164)
 id A0FF650059A; Sun,  6 Feb 2022 15:50:33 -0800 (PST)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/8] Hexagon (target/hexagon) properly set FPINVF bit in
 sfcmp.uo and dfcmp.uo
Date: Sun,  6 Feb 2022 15:50:25 -0800
Message-Id: <20220206235030.31493-4-tsimpson@quicinc.com>
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

SW5zdGVhZCBvZiBjaGVja2luZyBmb3IgbmFuIGFyZ3VtZW50cywgdXNlIGZsb2F0Pz9fdW5vcmRl
cmVkX3F1aWV0Cgp0ZXN0IGNhc2VzIGFkZGVkIGluIGEgc3Vic2VxdWVudCBwYXRjaCB0byBtb3Jl
IGV4dGVuc2l2ZWx5IHRlc3QgVVNSIGJpdHMKClNpZ25lZC1vZmYtYnk6IFRheWxvciBTaW1wc29u
IDx0c2ltcHNvbkBxdWljaW5jLmNvbT4KLS0tCiB0YXJnZXQvaGV4YWdvbi9vcF9oZWxwZXIuYyB8
IDYgKystLS0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL3RhcmdldC9oZXhhZ29uL29wX2hlbHBlci5jIGIvdGFyZ2V0L2hleGFn
b24vb3BfaGVscGVyLmMKaW5kZXggNDdiZDUxZTBjYS4uNzVkYzBmMjNmMCAxMDA2NDQKLS0tIGEv
dGFyZ2V0L2hleGFnb24vb3BfaGVscGVyLmMKKysrIGIvdGFyZ2V0L2hleGFnb24vb3BfaGVscGVy
LmMKQEAgLTkzOCw4ICs5MzgsNyBAQCBpbnQzMl90IEhFTFBFUihzZmNtcHVvKShDUFVIZXhhZ29u
U3RhdGUgKmVudiwgZmxvYXQzMiBSc1YsIGZsb2F0MzIgUnRWKQogewogICAgIGludDMyX3QgUGRW
OwogICAgIGFyY2hfZnBvcF9zdGFydChlbnYpOwotICAgIFBkViA9IGY4QklUU09GKGZsb2F0MzJf
aXNfYW55X25hbihSc1YpIHx8Ci0gICAgICAgICAgICAgICAgICAgZmxvYXQzMl9pc19hbnlfbmFu
KFJ0VikpOworICAgIFBkViA9IGY4QklUU09GKGZsb2F0MzJfdW5vcmRlcmVkX3F1aWV0KFJzViwg
UnRWLCAmZW52LT5mcF9zdGF0dXMpKTsKICAgICBhcmNoX2Zwb3BfZW5kKGVudik7CiAgICAgcmV0
dXJuIFBkVjsKIH0KQEAgLTEwOTcsOCArMTA5Niw3IEBAIGludDMyX3QgSEVMUEVSKGRmY21wdW8p
KENQVUhleGFnb25TdGF0ZSAqZW52LCBmbG9hdDY0IFJzc1YsIGZsb2F0NjQgUnR0VikKIHsKICAg
ICBpbnQzMl90IFBkVjsKICAgICBhcmNoX2Zwb3Bfc3RhcnQoZW52KTsKLSAgICBQZFYgPSBmOEJJ
VFNPRihmbG9hdDY0X2lzX2FueV9uYW4oUnNzVikgfHwKLSAgICAgICAgICAgICAgICAgICBmbG9h
dDY0X2lzX2FueV9uYW4oUnR0VikpOworICAgIFBkViA9IGY4QklUU09GKGZsb2F0NjRfdW5vcmRl
cmVkX3F1aWV0KFJzc1YsIFJ0dFYsICZlbnYtPmZwX3N0YXR1cykpOwogICAgIGFyY2hfZnBvcF9l
bmQoZW52KTsKICAgICByZXR1cm4gUGRWOwogfQotLSAKMi4xNy4xCgo=

