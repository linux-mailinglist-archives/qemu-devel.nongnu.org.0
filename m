Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 618374B0343
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 03:21:31 +0100 (CET)
Received: from localhost ([::1]:57356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHz5O-0001Xp-Eh
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 21:21:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1nHz0y-0007BW-W7
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 21:16:57 -0500
Received: from alexa-out.qualcomm.com ([129.46.98.28]:61267)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1nHz0p-0008Vc-He
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 21:16:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1644459407; x=1675995407;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8IDN+aKaVaX9p6KFZi2lBMATObnNzzUpXHUJo3eefxQ=;
 b=YAxRBwBOg10/pK70STmuTsKxUdrHxf+xMl+DSHnjv47vIFNboVklYEb/
 opXeT0cmwfSeJM+Y5tiL3S+8EohxMUmJLz4S5sH2H5oBZ+QUEi+tD4bYA
 ezZ0f8jD06jrv6IXbqODzXM5wF2GQtiIpc6obblsuzv5bUwsCbO0FpN48 Y=;
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
 by alexa-out.qualcomm.com with ESMTP; 09 Feb 2022 18:16:22 -0800
X-QCInternal: smtphost
Received: from hu-tsimpson-lv.qualcomm.com (HELO
 hu-devc-lv-u18-c.qualcomm.com) ([10.47.235.220])
 by ironmsg08-lv.qualcomm.com with ESMTP; 09 Feb 2022 18:16:22 -0800
Received: by hu-devc-lv-u18-c.qualcomm.com (Postfix, from userid 47164)
 id E610750059A; Wed,  9 Feb 2022 18:16:01 -0800 (PST)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 03/12] Hexagon (target/hexagon) properly set FPINVF bit in
 sfcmp.uo and dfcmp.uo
Date: Wed,  9 Feb 2022 18:15:47 -0800
Message-Id: <20220210021556.9217-4-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220210021556.9217-1-tsimpson@quicinc.com>
References: <20220210021556.9217-1-tsimpson@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=129.46.98.28; envelope-from=tsimpson@qualcomm.com;
 helo=alexa-out.qualcomm.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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

