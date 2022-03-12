Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C1E14D70C7
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Mar 2022 21:19:13 +0100 (CET)
Received: from localhost ([::1]:40084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nT8Cm-000723-Bq
	for lists+qemu-devel@lfdr.de; Sat, 12 Mar 2022 15:19:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1nT87E-0003Yy-8D
 for qemu-devel@nongnu.org; Sat, 12 Mar 2022 15:13:28 -0500
Received: from alexa-out.qualcomm.com ([129.46.98.28]:37881)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1nT87C-0008O9-By
 for qemu-devel@nongnu.org; Sat, 12 Mar 2022 15:13:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1647116006; x=1678652006;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Qn1ZDC8EU92Es3chakpXGIS1SqYy9pagVZph9n+8LIc=;
 b=YgjFugxRYoPWncoVQ6jwuimNI+Elb7C+nobu6Y/wch1XWmyZxP1S4OLi
 L14lg9D9mkHFxtkqjV4k5AzERel7+amvjMVo2Lz7IzEEj5f8lbmvFYKyo
 BZ3VXxs6SoOBv4pkVKANOsKH8TxNNdMqFT5H1wCY85FeGBSIQFhlslOiS k=;
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
 by alexa-out.qualcomm.com with ESMTP; 12 Mar 2022 12:13:21 -0800
X-QCInternal: smtphost
Received: from hu-tsimpson-lv.qualcomm.com (HELO
 hu-devc-lv-u18-c.qualcomm.com) ([10.47.235.220])
 by ironmsg07-lv.qualcomm.com with ESMTP; 12 Mar 2022 12:13:20 -0800
Received: by hu-devc-lv-u18-c.qualcomm.com (Postfix, from userid 47164)
 id BEF135005B8; Sat, 12 Mar 2022 12:13:20 -0800 (PST)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 10/12] Hexagon (target/hexagon) fix bug in conv_df2uw_chop
Date: Sat, 12 Mar 2022 12:13:17 -0800
Message-Id: <20220312201319.29040-11-tsimpson@quicinc.com>
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

Rml4IHR5cG8gdGhhdCBjaGVja2VkIGZvciAzMiBiaXQgbmFuIGluc3RlYWQgb2YgNjQgYml0CgpU
ZXN0IGNhc2UgYWRkZWQgaW4gdGVzdHMvdGNnL2hleGFnb24vdXNyLmMKClNpZ25lZC1vZmYtYnk6
IFRheWxvciBTaW1wc29uIDx0c2ltcHNvbkBxdWljaW5jLmNvbT4KTWVzc2FnZS1JZDogPDIwMjIw
MjEwMDIxNTU2LjkyMTctMTEtdHNpbXBzb25AcXVpY2luYy5jb20+ClJldmlld2VkLWJ5OiBSaWNo
YXJkIEhlbmRlcnNvbiA8cmljaGFyZC5oZW5kZXJzb25AbGluYXJvLm9yZz4KLS0tCiB0YXJnZXQv
aGV4YWdvbi9vcF9oZWxwZXIuYyB8IDIgKy0KIHRlc3RzL3RjZy9oZXhhZ29uL3Vzci5jICAgIHwg
NCArKysrCiAyIGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoK
ZGlmZiAtLWdpdCBhL3RhcmdldC9oZXhhZ29uL29wX2hlbHBlci5jIGIvdGFyZ2V0L2hleGFnb24v
b3BfaGVscGVyLmMKaW5kZXggMzY2Y2FmOWVjOC4uNjNlNWFkNWQ2OCAxMDA2NDQKLS0tIGEvdGFy
Z2V0L2hleGFnb24vb3BfaGVscGVyLmMKKysrIGIvdGFyZ2V0L2hleGFnb24vb3BfaGVscGVyLmMK
QEAgLTgyOSw3ICs4MjksNyBAQCB1aW50MzJfdCBIRUxQRVIoY29udl9kZjJ1d19jaG9wKShDUFVI
ZXhhZ29uU3RhdGUgKmVudiwgZmxvYXQ2NCBSc3NWKQogICAgIHVpbnQzMl90IFJkVjsKICAgICBh
cmNoX2Zwb3Bfc3RhcnQoZW52KTsKICAgICAvKiBIZXhhZ29uIGNoZWNrcyB0aGUgc2lnbiBiZWZv
cmUgcm91bmRpbmcgKi8KLSAgICBpZiAoZmxvYXQ2NF9pc19uZWcoUnNzVikgJiYgIWZsb2F0MzJf
aXNfYW55X25hbihSc3NWKSkgeworICAgIGlmIChmbG9hdDY0X2lzX25lZyhSc3NWKSAmJiAhZmxv
YXQ2NF9pc19hbnlfbmFuKFJzc1YpKSB7CiAgICAgICAgIGZsb2F0X3JhaXNlKGZsb2F0X2ZsYWdf
aW52YWxpZCwgJmVudi0+ZnBfc3RhdHVzKTsKICAgICAgICAgUmRWID0gMDsKICAgICB9IGVsc2Ug
ewpkaWZmIC0tZ2l0IGEvdGVzdHMvdGNnL2hleGFnb24vdXNyLmMgYi90ZXN0cy90Y2cvaGV4YWdv
bi91c3IuYwppbmRleCAxMTQxNWY4Mjk1Li5hNTMxNTExY2VjIDEwMDY0NAotLS0gYS90ZXN0cy90
Y2cvaGV4YWdvbi91c3IuYworKysgYi90ZXN0cy90Y2cvaGV4YWdvbi91c3IuYwpAQCAtMTA2OCw2
ICsxMDY4LDEwIEBAIGludCBtYWluKCkKICAgICBURVNUX1BfT1BfUChjb252X2RmMmQsICAgICAg
ICBERl9TTmFOLCAgMHhmZmZmZmZmZmZmZmZmZmZmVUxMLCAgVVNSX0ZQSU5WRik7CiAgICAgVEVT
VF9SX09QX1AoY29udl9kZjJ1d19jaG9wLCAgREZfUU5hTiwgIDB4ZmZmZmZmZmYsICAgICAgICAg
ICAgIFVTUl9GUElOVkYpOwogICAgIFRFU1RfUl9PUF9QKGNvbnZfZGYydXdfY2hvcCwgIERGX1NO
YU4sICAweGZmZmZmZmZmLCAgICAgICAgICAgICBVU1JfRlBJTlZGKTsKKworICAgIC8qIFRlc3Qg
Zm9yIHR5cG8gaW4gSEVMUEVSKGNvbnZfZGYydXdfY2hvcCkgKi8KKyAgICBURVNUX1JfT1BfUChj
b252X2RmMnV3X2Nob3AsIDB4ZmZmZmZmN2YwMDAwMDAwMVVMTCwgMHhmZmZmZmZmZiwgVVNSX0ZQ
SU5WRik7CisKICAgICBURVNUX1JfT1BfUChjb252X2RmMndfY2hvcCwgICBERl9RTmFOLCAgMHhm
ZmZmZmZmZiwgICAgICAgICAgICAgVVNSX0ZQSU5WRik7CiAgICAgVEVTVF9SX09QX1AoY29udl9k
ZjJ3X2Nob3AsICAgREZfU05hTiwgIDB4ZmZmZmZmZmYsICAgICAgICAgICAgIFVTUl9GUElOVkYp
OwogICAgIFRFU1RfUF9PUF9QKGNvbnZfZGYydWRfY2hvcCwgIERGX1FOYU4sICAweGZmZmZmZmZm
ZmZmZmZmZmZVTEwsICBVU1JfRlBJTlZGKTsKLS0gCjIuMTcuMQoK

