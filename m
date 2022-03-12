Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 514234D70C6
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Mar 2022 21:17:47 +0100 (CET)
Received: from localhost ([::1]:34124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nT8BO-00034G-Dv
	for lists+qemu-devel@lfdr.de; Sat, 12 Mar 2022 15:17:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1nT87G-0003aj-6p
 for qemu-devel@nongnu.org; Sat, 12 Mar 2022 15:13:30 -0500
Received: from alexa-out.qualcomm.com ([129.46.98.28]:37881)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1nT87E-0008O9-IP
 for qemu-devel@nongnu.org; Sat, 12 Mar 2022 15:13:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1647116008; x=1678652008;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sL8u3HZIBgfeu6bcC03NTDMCeFwUq/kjDc+Byt++HQc=;
 b=ce6MJVYIjfLn9AhHv7AKwM5653RhQWwsHYBZJT4JRMhmp4mE3ziVr7vx
 by6j9pcVh/TR/Vjjf/7sIP8B03gVQqNonmTlM+Ge/PQyTmiSlxsc3/YZ0
 5PgKYfZ8qKhlXpoTJMPEI5H0Pjwj7gBYwJyfMimx5oCHhZfd5XKiP5MtG w=;
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
 by alexa-out.qualcomm.com with ESMTP; 12 Mar 2022 12:13:21 -0800
X-QCInternal: smtphost
Received: from hu-tsimpson-lv.qualcomm.com (HELO
 hu-devc-lv-u18-c.qualcomm.com) ([10.47.235.220])
 by ironmsg07-lv.qualcomm.com with ESMTP; 12 Mar 2022 12:13:20 -0800
Received: by hu-devc-lv-u18-c.qualcomm.com (Postfix, from userid 47164)
 id 9FF6C5005B8; Sat, 12 Mar 2022 12:13:20 -0800 (PST)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 03/12] Hexagon (target/hexagon) properly set FPINVF bit in
 sfcmp.uo and dfcmp.uo
Date: Sat, 12 Mar 2022 12:13:10 -0800
Message-Id: <20220312201319.29040-4-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220312201319.29040-1-tsimpson@quicinc.com>
References: <20220312201319.29040-1-tsimpson@quicinc.com>
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

