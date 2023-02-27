Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAC956A4537
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 15:53:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWerl-0000My-SY; Mon, 27 Feb 2023 09:52:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <m.tyutin@yadro.com>)
 id 1pWerj-0000Jf-E6
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:52:35 -0500
Received: from mta-02.yadro.com ([89.207.88.252] helo=mta-01.yadro.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <m.tyutin@yadro.com>)
 id 1pWerg-00028d-Lw
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:52:35 -0500
Received: from mta-01.yadro.com (localhost.localdomain [127.0.0.1])
 by mta-01.yadro.com (Proxmox) with ESMTP id 0B9FB341E10;
 Mon, 27 Feb 2023 17:52:25 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yadro.com; h=cc
 :cc:content-id:content-transfer-encoding:content-type
 :content-type:date:from:from:message-id:mime-version:reply-to
 :subject:subject:to:to; s=mta-01; bh=A/5HbFpKmVBGuKv4DKXRJS6Zbt5
 sPFHq53aK+cT3HHI=; b=WJCVN1K0YkOQkpVl3LW7zjygZdFgltxwmJeTvGqMy0D
 EAOogX/CkndbQVMsJxt3HvLestbM81RS+fHxiGZJD+OVt+qte5AsdHiFfViTu7+J
 gkkKSKMLAzTWBqGXnnnjEFjfbpTmiBvjm/qbDOmr8LXchpMvEssPumo1TMU+FReA
 =
Received: from T-EXCH-07.corp.yadro.com (unknown [172.17.10.14])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Proxmox) with ESMTPS id 0040B341DE9;
 Mon, 27 Feb 2023 17:52:25 +0300 (MSK)
Received: from T-EXCH-06.corp.yadro.com (172.17.10.110) by
 T-EXCH-07.corp.yadro.com (172.17.11.57) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.1118.9; Mon, 27 Feb 2023 17:52:24 +0300
Received: from T-EXCH-08.corp.yadro.com (172.17.11.58) by
 T-EXCH-06.corp.yadro.com (172.17.10.110) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.15; Mon, 27 Feb 2023 17:52:24 +0300
Received: from T-EXCH-08.corp.yadro.com ([172.17.11.58]) by
 T-EXCH-08.corp.yadro.com ([172.17.11.58]) with mapi id 15.02.1118.009; Mon,
 27 Feb 2023 17:52:24 +0300
From: Mikhail Tyutin <m.tyutin@yadro.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: "palmer@dabbelt.com" <palmer@dabbelt.com>, "Alistair.Francis@wdc.com"
 <Alistair.Francis@wdc.com>
Subject: [PATCH] Fix incorrect register name in RISC-V disassembler for
 fmv,fabs,fneg instructions
Thread-Topic: [PATCH] Fix incorrect register name in RISC-V disassembler for
 fmv,fabs,fneg instructions
Thread-Index: AQHZSrsaDBsB9Kl0mU+V/0lxkmCMsw==
Date: Mon, 27 Feb 2023 14:52:24 +0000
Message-ID: <f625f89c-c0d5-ad7f-778e-b717261afc53@yadro.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.17.10.14]
Content-Type: text/plain; charset="utf-8"
Content-ID: <EDC13B8042E52440915665E6C204E4B0@yadro.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Received-SPF: pass client-ip=89.207.88.252; envelope-from=m.tyutin@yadro.com;
 helo=mta-01.yadro.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Rml4IGluY29ycmVjdCByZWdpc3RlciBuYW1lIGluIFJJU0MtViBkaXNhc3NlbWJsZXIgZm9yIGZt
dixmYWJzLGZuZWcgaW5zdHJ1Y3Rpb25zDQoNClNpZ25lZC1vZmYtYnk6IE1pa2hhaWwgVHl1dGlu
IDxtLnR5dXRpbkB5YWRyby5jb20+DQotLS0NCiAgZGlzYXMvcmlzY3YuYyB8IDE5ICsrKysrKysr
KystLS0tLS0tLS0NCiAgMSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDkgZGVsZXRp
b25zKC0pDQoNCmRpZmYgLS1naXQgYS9kaXNhcy9yaXNjdi5jIGIvZGlzYXMvcmlzY3YuYw0KaW5k
ZXggZGRkYTY4N2MxMy4uNThhZDNkZjI0ZCAxMDA2NDQNCi0tLSBhL2Rpc2FzL3Jpc2N2LmMNCisr
KyBiL2Rpc2FzL3Jpc2N2LmMNCkBAIC0xMDE0LDYgKzEwMTQsNyBAQCBzdGF0aWMgY29uc3QgY2hh
ciBydl92cmVnX25hbWVfc3ltWzMyXVs0XSA9IHsNCiAgI2RlZmluZSBydl9mbXRfcmRfb2Zmc2V0
ICAgICAgICAgICAgICAiT1x0MCxvIg0KICAjZGVmaW5lIHJ2X2ZtdF9yZF9yczFfcnMyICAgICAg
ICAgICAgICJPXHQwLDEsMiINCiAgI2RlZmluZSBydl9mbXRfZnJkX3JzMSAgICAgICAgICAgICAg
ICAiT1x0MywxIg0KKyNkZWZpbmUgcnZfZm10X2ZyZF9mcnMxICAgICAgICAgICAgICAgIk9cdDMs
NCINCiAgI2RlZmluZSBydl9mbXRfcmRfZnJzMSAgICAgICAgICAgICAgICAiT1x0MCw0Ig0KICAj
ZGVmaW5lIHJ2X2ZtdF9yZF9mcnMxX2ZyczIgICAgICAgICAgICJPXHQwLDQsNSINCiAgI2RlZmlu
ZSBydl9mbXRfZnJkX2ZyczFfZnJzMiAgICAgICAgICAiT1x0Myw0LDUiDQpAQCAtMTU4MCwxNSAr
MTU4MSwxNSBAQCBjb25zdCBydl9vcGNvZGVfZGF0YSBvcGNvZGVfZGF0YVtdID0gew0KICAgICAg
eyAic25leiIsIHJ2X2NvZGVjX3IsIHJ2X2ZtdF9yZF9yczIsIE5VTEwsIDAsIDAsIDAgfSwNCiAg
ICAgIHsgInNsdHoiLCBydl9jb2RlY19yLCBydl9mbXRfcmRfcnMxLCBOVUxMLCAwLCAwLCAwIH0s
DQogICAgICB7ICJzZ3R6IiwgcnZfY29kZWNfciwgcnZfZm10X3JkX3JzMiwgTlVMTCwgMCwgMCwg
MCB9LA0KLSAgICB7ICJmbXYucyIsIHJ2X2NvZGVjX3IsIHJ2X2ZtdF9yZF9yczEsIE5VTEwsIDAs
IDAsIDAgfSwNCi0gICAgeyAiZmFicy5zIiwgcnZfY29kZWNfciwgcnZfZm10X3JkX3JzMSwgTlVM
TCwgMCwgMCwgMCB9LA0KLSAgICB7ICJmbmVnLnMiLCBydl9jb2RlY19yLCBydl9mbXRfcmRfcnMx
LCBOVUxMLCAwLCAwLCAwIH0sDQotICAgIHsgImZtdi5kIiwgcnZfY29kZWNfciwgcnZfZm10X3Jk
X3JzMSwgTlVMTCwgMCwgMCwgMCB9LA0KLSAgICB7ICJmYWJzLmQiLCBydl9jb2RlY19yLCBydl9m
bXRfcmRfcnMxLCBOVUxMLCAwLCAwLCAwIH0sDQotICAgIHsgImZuZWcuZCIsIHJ2X2NvZGVjX3Is
IHJ2X2ZtdF9yZF9yczEsIE5VTEwsIDAsIDAsIDAgfSwNCi0gICAgeyAiZm12LnEiLCBydl9jb2Rl
Y19yLCBydl9mbXRfcmRfcnMxLCBOVUxMLCAwLCAwLCAwIH0sDQotICAgIHsgImZhYnMucSIsIHJ2
X2NvZGVjX3IsIHJ2X2ZtdF9yZF9yczEsIE5VTEwsIDAsIDAsIDAgfSwNCi0gICAgeyAiZm5lZy5x
IiwgcnZfY29kZWNfciwgcnZfZm10X3JkX3JzMSwgTlVMTCwgMCwgMCwgMCB9LA0KKyAgICB7ICJm
bXYucyIsIHJ2X2NvZGVjX3IsIHJ2X2ZtdF9mcmRfZnJzMSwgTlVMTCwgMCwgMCwgMCB9LA0KKyAg
ICB7ICJmYWJzLnMiLCBydl9jb2RlY19yLCBydl9mbXRfZnJkX2ZyczEsIE5VTEwsIDAsIDAsIDAg
fSwNCisgICAgeyAiZm5lZy5zIiwgcnZfY29kZWNfciwgcnZfZm10X2ZyZF9mcnMxLCBOVUxMLCAw
LCAwLCAwIH0sDQorICAgIHsgImZtdi5kIiwgcnZfY29kZWNfciwgcnZfZm10X2ZyZF9mcnMxLCBO
VUxMLCAwLCAwLCAwIH0sDQorICAgIHsgImZhYnMuZCIsIHJ2X2NvZGVjX3IsIHJ2X2ZtdF9mcmRf
ZnJzMSwgTlVMTCwgMCwgMCwgMCB9LA0KKyAgICB7ICJmbmVnLmQiLCBydl9jb2RlY19yLCBydl9m
bXRfZnJkX2ZyczEsIE5VTEwsIDAsIDAsIDAgfSwNCisgICAgeyAiZm12LnEiLCBydl9jb2RlY19y
LCBydl9mbXRfZnJkX2ZyczEsIE5VTEwsIDAsIDAsIDAgfSwNCisgICAgeyAiZmFicy5xIiwgcnZf
Y29kZWNfciwgcnZfZm10X2ZyZF9mcnMxLCBOVUxMLCAwLCAwLCAwIH0sDQorICAgIHsgImZuZWcu
cSIsIHJ2X2NvZGVjX3IsIHJ2X2ZtdF9mcmRfZnJzMSwgTlVMTCwgMCwgMCwgMCB9LA0KICAgICAg
eyAiYmVxeiIsIHJ2X2NvZGVjX3NiLCBydl9mbXRfcnMxX29mZnNldCwgTlVMTCwgMCwgMCwgMCB9
LA0KICAgICAgeyAiYm5leiIsIHJ2X2NvZGVjX3NiLCBydl9mbXRfcnMxX29mZnNldCwgTlVMTCwg
MCwgMCwgMCB9LA0KICAgICAgeyAiYmxleiIsIHJ2X2NvZGVjX3NiLCBydl9mbXRfcnMyX29mZnNl
dCwgTlVMTCwgMCwgMCwgMCB9LA0KLS0gDQoyLjM0LjENCg0KDQo=


