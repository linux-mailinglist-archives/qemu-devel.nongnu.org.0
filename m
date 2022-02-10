Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6512C4B0342
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 03:21:28 +0100 (CET)
Received: from localhost ([::1]:57166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHz5L-0001Qr-1g
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 21:21:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1nHz0t-0007Az-J5
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 21:16:53 -0500
Received: from alexa-out.qualcomm.com ([129.46.98.28]:16931)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1nHz0p-0000Af-Lv
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 21:16:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1644459408; x=1675995408;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=k/5Urfi4GJ0sZuOH1r0cPP5ci41bxwL8lylUp2KS7VA=;
 b=tux1LrL+NKmND07YiQkEmr8mHaEsN3dfpedDRUrWe42m/ccyjKFaChfG
 7IoJPmTgbnhXfe80h03VKPKeIt25QmWSmbDdMg3+1eLO//Pg/uWQQAdIh
 5vS19+uIVzEWfI3YdnchVskm95NKwTAQ2K1N7KhlIt813LD+Ntl4GOkLn s=;
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
 by alexa-out.qualcomm.com with ESMTP; 09 Feb 2022 18:16:02 -0800
X-QCInternal: smtphost
Received: from hu-tsimpson-lv.qualcomm.com (HELO
 hu-devc-lv-u18-c.qualcomm.com) ([10.47.235.220])
 by ironmsg08-lv.qualcomm.com with ESMTP; 09 Feb 2022 18:16:02 -0800
Received: by hu-devc-lv-u18-c.qualcomm.com (Postfix, from userid 47164)
 id 0529C5005A1; Wed,  9 Feb 2022 18:16:02 -0800 (PST)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 10/12] Hexagon (target/hexagon) fix bug in conv_df2uw_chop
Date: Wed,  9 Feb 2022 18:15:54 -0800
Message-Id: <20220210021556.9217-11-tsimpson@quicinc.com>
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

Rml4IHR5cG8gdGhhdCBjaGVja2VkIGZvciAzMiBiaXQgbmFuIGluc3RlYWQgb2YgNjQgYml0CgpU
ZXN0IGNhc2UgYWRkZWQgaW4gdGVzdHMvdGNnL2hleGFnb24vdXNyLmMKClNpZ25lZC1vZmYtYnk6
IFRheWxvciBTaW1wc29uIDx0c2ltcHNvbkBxdWljaW5jLmNvbT4KLS0tCiB0YXJnZXQvaGV4YWdv
bi9vcF9oZWxwZXIuYyB8IDIgKy0KIHRlc3RzL3RjZy9oZXhhZ29uL3Vzci5jICAgIHwgNCArKysr
CiAyIGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAt
LWdpdCBhL3RhcmdldC9oZXhhZ29uL29wX2hlbHBlci5jIGIvdGFyZ2V0L2hleGFnb24vb3BfaGVs
cGVyLmMKaW5kZXggN2Y0MGUwOTQ4Ni4uNDc3MjlhNDhiZCAxMDA2NDQKLS0tIGEvdGFyZ2V0L2hl
eGFnb24vb3BfaGVscGVyLmMKKysrIGIvdGFyZ2V0L2hleGFnb24vb3BfaGVscGVyLmMKQEAgLTgy
OSw3ICs4MjksNyBAQCB1aW50MzJfdCBIRUxQRVIoY29udl9kZjJ1d19jaG9wKShDUFVIZXhhZ29u
U3RhdGUgKmVudiwgZmxvYXQ2NCBSc3NWKQogICAgIHVpbnQzMl90IFJkVjsKICAgICBhcmNoX2Zw
b3Bfc3RhcnQoZW52KTsKICAgICAvKiBIZXhhZ29uIGNoZWNrcyB0aGUgc2lnbiBiZWZvcmUgcm91
bmRpbmcgKi8KLSAgICBpZiAoZmxvYXQ2NF9pc19uZWcoUnNzVikgJiYgIWZsb2F0MzJfaXNfYW55
X25hbihSc3NWKSkgeworICAgIGlmIChmbG9hdDY0X2lzX25lZyhSc3NWKSAmJiAhZmxvYXQ2NF9p
c19hbnlfbmFuKFJzc1YpKSB7CiAgICAgICAgIGZsb2F0X3JhaXNlKGZsb2F0X2ZsYWdfaW52YWxp
ZCwgJmVudi0+ZnBfc3RhdHVzKTsKICAgICAgICAgUmRWID0gMDsKICAgICB9IGVsc2UgewpkaWZm
IC0tZ2l0IGEvdGVzdHMvdGNnL2hleGFnb24vdXNyLmMgYi90ZXN0cy90Y2cvaGV4YWdvbi91c3Iu
YwppbmRleCBhMDAwNmRhMjVhLi4xYjdkNDNiYWY0IDEwMDY0NAotLS0gYS90ZXN0cy90Y2cvaGV4
YWdvbi91c3IuYworKysgYi90ZXN0cy90Y2cvaGV4YWdvbi91c3IuYwpAQCAtMTA3Miw2ICsxMDcy
LDEwIEBAIGludCBtYWluKCkKICAgICBURVNUX1BfT1BfUChjb252X2RmMmQsICAgICAgICBERl9T
TmFOLCAgMHhmZmZmZmZmZmZmZmZmZmZmVUxMLCAgVVNSX0ZQSU5WRik7CiAgICAgVEVTVF9SX09Q
X1AoY29udl9kZjJ1d19jaG9wLCAgREZfUU5hTiwgIDB4ZmZmZmZmZmYsICAgICAgICAgICAgIFVT
Ul9GUElOVkYpOwogICAgIFRFU1RfUl9PUF9QKGNvbnZfZGYydXdfY2hvcCwgIERGX1NOYU4sICAw
eGZmZmZmZmZmLCAgICAgICAgICAgICBVU1JfRlBJTlZGKTsKKworICAgIC8qIFRlc3QgZm9yIHR5
cG8gaW4gSEVMUEVSKGNvbnZfZGYydXdfY2hvcCkgKi8KKyAgICBURVNUX1JfT1BfUChjb252X2Rm
MnV3X2Nob3AsIDB4ZmZmZmZmN2YwMDAwMDAwMVVMTCwgMHhmZmZmZmZmZiwgVVNSX0ZQSU5WRik7
CisKICAgICBURVNUX1JfT1BfUChjb252X2RmMndfY2hvcCwgICBERl9RTmFOLCAgMHhmZmZmZmZm
ZiwgICAgICAgICAgICAgVVNSX0ZQSU5WRik7CiAgICAgVEVTVF9SX09QX1AoY29udl9kZjJ3X2No
b3AsICAgREZfU05hTiwgIDB4ZmZmZmZmZmYsICAgICAgICAgICAgIFVTUl9GUElOVkYpOwogICAg
IFRFU1RfUF9PUF9QKGNvbnZfZGYydWRfY2hvcCwgIERGX1FOYU4sICAweGZmZmZmZmZmZmZmZmZm
ZmZVTEwsICBVU1JfRlBJTlZGKTsKLS0gCjIuMTcuMQoK

