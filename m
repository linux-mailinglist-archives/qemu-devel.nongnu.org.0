Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 798C04B2431
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 12:21:37 +0100 (CET)
Received: from localhost ([::1]:34196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nITzc-00022E-Id
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 06:21:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1nITw4-0007SO-F5
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 06:17:56 -0500
Received: from alexa-out.qualcomm.com ([129.46.98.28]:17131)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1nITw2-00017S-Mc
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 06:17:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1644578274; x=1676114274;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sL8u3HZIBgfeu6bcC03NTDMCeFwUq/kjDc+Byt++HQc=;
 b=dNXlEZkAdGaUiF6feo1rZ7bHOv1S27CmTlznBvZGTw2lEDb/yf8m6j36
 ep/mM/FhxMBAvv7tPP/K+GzwEOh2+Q6kyOOmLDMTGnclevy4/taCxEvPf
 jgeTZSqyb8Q/HOgmQijxYV49t2tA63p0kmWmsZFTQmjnhd1DuJjkUo8mU s=;
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
 by alexa-out.qualcomm.com with ESMTP; 11 Feb 2022 03:17:44 -0800
X-QCInternal: smtphost
Received: from hu-tsimpson-lv.qualcomm.com (HELO
 hu-devc-lv-u18-c.qualcomm.com) ([10.47.235.220])
 by ironmsg07-lv.qualcomm.com with ESMTP; 11 Feb 2022 03:17:44 -0800
Received: by hu-devc-lv-u18-c.qualcomm.com (Postfix, from userid 47164)
 id 9261750059A; Fri, 11 Feb 2022 03:17:24 -0800 (PST)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Subject: [PULL 03/12] Hexagon (target/hexagon) properly set FPINVF bit in
 sfcmp.uo and dfcmp.uo
Date: Fri, 11 Feb 2022 03:17:13 -0800
Message-Id: <20220211111722.31036-4-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220211111722.31036-1-tsimpson@quicinc.com>
References: <20220211111722.31036-1-tsimpson@quicinc.com>
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
Cc: peter.maydell@linaro.org, tsimpson@quicinc.com,
 richard.henderson@linaro.org, f4bug@amsat.org, zongyuan.li@smartx.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

SW5zdGVhZCBvZiBjaGVja2luZyBmb3IgbmFuIGFyZ3VtZW50cywgdXNlIGZsb2F0Pz9fdW5vcmRl
cmVkX3F1aWV0Cgp0ZXN0IGNhc2VzIGFkZGVkIGluIGEgc3Vic2VxdWVudCBwYXRjaCB0byBtb3Jl
IGV4dGVuc2l2ZWx5IHRlc3QgVVNSIGJpdHMKClNpZ25lZC1vZmYtYnk6IFRheWxvciBTaW1wc29u
IDx0c2ltcHNvbkBxdWljaW5jLmNvbT4KTWVzc2FnZS1JZDogPDIwMjIwMjEwMDIxNTU2LjkyMTct
NC10c2ltcHNvbkBxdWljaW5jLmNvbT4KUmV2aWV3ZWQtYnk6IFJpY2hhcmQgSGVuZGVyc29uIDxy
aWNoYXJkLmhlbmRlcnNvbkBsaW5hcm8ub3JnPgotLS0KIHRhcmdldC9oZXhhZ29uL29wX2hlbHBl
ci5jIHwgNiArKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDQgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvdGFyZ2V0L2hleGFnb24vb3BfaGVscGVyLmMgYi90YXJnZXQv
aGV4YWdvbi9vcF9oZWxwZXIuYwppbmRleCA0N2JkNTFlMGNhLi43NWRjMGYyM2YwIDEwMDY0NAot
LS0gYS90YXJnZXQvaGV4YWdvbi9vcF9oZWxwZXIuYworKysgYi90YXJnZXQvaGV4YWdvbi9vcF9o
ZWxwZXIuYwpAQCAtOTM4LDggKzkzOCw3IEBAIGludDMyX3QgSEVMUEVSKHNmY21wdW8pKENQVUhl
eGFnb25TdGF0ZSAqZW52LCBmbG9hdDMyIFJzViwgZmxvYXQzMiBSdFYpCiB7CiAgICAgaW50MzJf
dCBQZFY7CiAgICAgYXJjaF9mcG9wX3N0YXJ0KGVudik7Ci0gICAgUGRWID0gZjhCSVRTT0YoZmxv
YXQzMl9pc19hbnlfbmFuKFJzVikgfHwKLSAgICAgICAgICAgICAgICAgICBmbG9hdDMyX2lzX2Fu
eV9uYW4oUnRWKSk7CisgICAgUGRWID0gZjhCSVRTT0YoZmxvYXQzMl91bm9yZGVyZWRfcXVpZXQo
UnNWLCBSdFYsICZlbnYtPmZwX3N0YXR1cykpOwogICAgIGFyY2hfZnBvcF9lbmQoZW52KTsKICAg
ICByZXR1cm4gUGRWOwogfQpAQCAtMTA5Nyw4ICsxMDk2LDcgQEAgaW50MzJfdCBIRUxQRVIoZGZj
bXB1bykoQ1BVSGV4YWdvblN0YXRlICplbnYsIGZsb2F0NjQgUnNzViwgZmxvYXQ2NCBSdHRWKQog
ewogICAgIGludDMyX3QgUGRWOwogICAgIGFyY2hfZnBvcF9zdGFydChlbnYpOwotICAgIFBkViA9
IGY4QklUU09GKGZsb2F0NjRfaXNfYW55X25hbihSc3NWKSB8fAotICAgICAgICAgICAgICAgICAg
IGZsb2F0NjRfaXNfYW55X25hbihSdHRWKSk7CisgICAgUGRWID0gZjhCSVRTT0YoZmxvYXQ2NF91
bm9yZGVyZWRfcXVpZXQoUnNzViwgUnR0ViwgJmVudi0+ZnBfc3RhdHVzKSk7CiAgICAgYXJjaF9m
cG9wX2VuZChlbnYpOwogICAgIHJldHVybiBQZFY7CiB9Ci0tIAoyLjE3LjEKCg==

