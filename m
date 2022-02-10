Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E79614B0345
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 03:21:33 +0100 (CET)
Received: from localhost ([::1]:57648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHz5R-0001jQ-2A
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 21:21:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1nHz1F-0007IC-Vi
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 21:17:14 -0500
Received: from alexa-out.qualcomm.com ([129.46.98.28]:16931)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1nHz1D-0000Af-TL
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 21:17:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1644459432; x=1675995432;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=WLvb1NQwWyGKCOoZqZycYKMwFRZOaFyAdQSvHlIOjGo=;
 b=UYvcfCnx4CPjDSXA3W/aitos5j/08JSODcKPHCDNdunLCxrsEnFQd5gZ
 Yz+nPTaM830QHHPPaup/Hd3FZmMdkQd+mhgBq96zO3N/EMChR4nJeqD9p
 MakXvyqfRSq42A7tubp2QZRn1noRD4eaVLKGPLKKkCsqBfMGycw2Z9rAZ w=;
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
 by alexa-out.qualcomm.com with ESMTP; 09 Feb 2022 18:16:43 -0800
X-QCInternal: smtphost
Received: from hu-tsimpson-lv.qualcomm.com (HELO
 hu-devc-lv-u18-c.qualcomm.com) ([10.47.235.220])
 by ironmsg-lv-alpha.qualcomm.com with ESMTP; 09 Feb 2022 18:16:41 -0800
Received: by hu-devc-lv-u18-c.qualcomm.com (Postfix, from userid 47164)
 id DF271500175; Wed,  9 Feb 2022 18:16:01 -0800 (PST)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 00/12] Hexagon bug fixes and additional tests
Date: Wed,  9 Feb 2022 18:15:44 -0800
Message-Id: <20220210021556.9217-1-tsimpson@quicinc.com>
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

Rml4IGJ1Z3MgcmVwb3J0ZWQgZnJvbSBIZXhhZ29uIHVzZXJzCgpUaGVyZSBpcyBhIHBhdHRlcm4g
b2YgaXNzdWVzIHNldHRpbmcgYml0cyBpbiB1c2VyIHN0YXR1cyByZWdpc3RlciAoVVNSKSwKc28g
SSBjcmVhdGVkIG5ldyB0ZXN0cyBkZWRpY2F0ZWQgdG8gaW5zdHJ1Y3Rpb25zIHRoYXQgbWlnaHQg
c2V0IFVTUi4KCioqKioqKioqIENoYW5nZXMgaW4gdjIgKioqKioqKioKTWFrZSB0aGUgX2Nob3Ag
dmVyc2lvbnMgb2YgZmxvYXQtdG8taW50IGNvbnZlcnNpb25zIHVzZSA6Y2hvcCBpbnNucyBpbiB1
c3IuYwpBZGRpdGlvbmFsIGJ1ZyBmaXhlcwogICAgRml4IGlubGluZSAgYXNtIGluIHByZWdfYWxp
YXMgdGVzdAogICAgQnVnIGluIGNvbnZfZGYydXdfY2hvcAogICAgTWFrZSBWeVYgb3BlcmFuZHMg
dXNlIGEgdW5pcXVlIHRlbXAKICAgIEFzc2lnbm1lbnQgdG8gYzQgc2hvdWxkIHdhaXQgdW50aWwg
cGFja2V0IGNvbW1pdAoKCgpNaWNoYWVsIExhbWJlcnQgKDEpOgogIEhleGFnb24gKHRhcmdldC9o
ZXhhZ29uKSBmaXggYnVnIGluIGNpcmN1bGFyIGFkZHJlc3NpbmcKClRheWxvciBTaW1wc29uICgx
MSk6CiAgSGV4YWdvbiBIVlggKHRhcmdldC9oZXhhZ29uKSBmaXggYnVnIGluIEhWWCBzYXR1cmF0
ZSBpbnN0cnVjdGlvbnMKICBIZXhhZ29uICh0YXJnZXQvaGV4YWdvbikgcHJvcGVybHkgc2V0IEZQ
SU5WRiBiaXQgaW4gc2ZjbXAudW8gYW5kCiAgICBkZmNtcC51bwogIEhleGFnb24gKHRhcmdldC9o
ZXhhZ29uKSBwcm9wZXJseSBoYW5kbGUgU05hTiBpbgogICAgZGZtaW4vZGZtYXgvc2ZtaW4vc2Zt
YXgKICBIZXhhZ29uICh0YXJnZXQvaGV4YWdvbikgcHJvcGVybHkgaGFuZGxlIGRlbm9ybSBpbgog
ICAgYXJjaF9zZl9yZWNpcF9jb21tb24KICBIZXhhZ29uICh0ZXN0cy90Y2cvaGV4YWdvbikgdGVz
dCBpbnN0cnVjdGlvbnMgdGhhdCBtaWdodCBzZXQgYml0cyBpbgogICAgVVNSCiAgSGV4YWdvbiAo
dGVzdHMvdGNnL2hleGFnb24pIGFkZCBmbG9hdGluZyBwb2ludCBpbnN0cnVjdGlvbnMgdG8gdXNy
LmMKICBIZXhhZ29uICh0ZXN0cy90Y2cvaGV4YWdvbikgdXBkYXRlIG92ZXJmbG93IHRlc3QKICBI
ZXhhZ29uICh0ZXN0cy90Y2cvaGV4YWdvbikgZml4IGlubGluZSBhc20gaW4gcHJlZ19hbGlhcy5j
CiAgSGV4YWdvbiAodGFyZ2V0L2hleGFnb24pIGZpeCBidWcgaW4gY29udl9kZjJ1d19jaG9wCiAg
SGV4YWdvbiAodGFyZ2V0L2hleGFnb24pIG1ha2UgVnlWIG9wZXJhbmRzIHVzZSBhIHVuaXF1ZSB0
ZW1wCiAgSGV4YWdvbiAodGFyZ2V0L2hleGFnb24pIGFzc2lnbm1lbnQgdG8gYzQgc2hvdWxkIHdh
aXQgdW50aWwgcGFja2V0CiAgICBjb21taXQKCiB0YXJnZXQvaGV4YWdvbi9mbWFfZW11LmggICAg
ICAgICAgfCAgICA2ICstCiB0YXJnZXQvaGV4YWdvbi9tYWNyb3MuaCAgICAgICAgICAgfCAgICA0
ICstCiB0YXJnZXQvaGV4YWdvbi9hcmNoLmMgICAgICAgICAgICAgfCAgICA2ICstCiB0YXJnZXQv
aGV4YWdvbi9nZW5wdHIuYyAgICAgICAgICAgfCAgIDE0ICstCiB0YXJnZXQvaGV4YWdvbi9vcF9o
ZWxwZXIuYyAgICAgICAgfCAgIDY4ICstCiB0ZXN0cy90Y2cvaGV4YWdvbi9jaXJjLmMgICAgICAg
ICAgfCAgICA1ICstCiB0ZXN0cy90Y2cvaGV4YWdvbi9mcHN0dWZmLmMgICAgICAgfCAgIDQ0ICst
CiB0ZXN0cy90Y2cvaGV4YWdvbi9odnhfbWlzYy5jICAgICAgfCAgMTE2ICsrLQogdGVzdHMvdGNn
L2hleGFnb24vb3ZlcmZsb3cuYyAgICAgIHwgICA2MSArLQogdGVzdHMvdGNnL2hleGFnb24vcHJl
Z19hbGlhcy5jICAgIHwgICA4NCArKy0KIHRlc3RzL3RjZy9oZXhhZ29uL3Vzci5jICAgICAgICAg
ICB8IDExNDUgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKIHRhcmdldC9oZXhhZ29uL2dl
bl90Y2dfZnVuY3MucHkgICB8ICAgIDkgKy0KIHRlc3RzL3RjZy9oZXhhZ29uL01ha2VmaWxlLnRh
cmdldCB8ICAgIDggKy0KIDEzIGZpbGVzIGNoYW5nZWQsIDE1MDggaW5zZXJ0aW9ucygrKSwgNjIg
ZGVsZXRpb25zKC0pCiBjcmVhdGUgbW9kZSAxMDA2NDQgdGVzdHMvdGNnL2hleGFnb24vdXNyLmMK
Ci0tIAoyLjE3LjEKCg==

