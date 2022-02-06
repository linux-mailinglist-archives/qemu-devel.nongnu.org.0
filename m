Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF3FD4AB2D8
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 00:59:55 +0100 (CET)
Received: from localhost ([::1]:55032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGrRi-0002xy-HH
	for lists+qemu-devel@lfdr.de; Sun, 06 Feb 2022 18:59:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1nGrP2-0000NJ-9G
 for qemu-devel@nongnu.org; Sun, 06 Feb 2022 18:57:08 -0500
Received: from alexa-out.qualcomm.com ([129.46.98.28]:61536)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1nGrP0-00084K-9u
 for qemu-devel@nongnu.org; Sun, 06 Feb 2022 18:57:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1644191826; x=1675727826;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=VlzZNBYsFeOpmhd95Vbk8PvEx3OutkbilmPhoCsdOco=;
 b=Cu0IzIEyizO2s1zCIhLa50AilrUWLpP6wP0+nW1gq84qwoHozCj+fnxU
 j0yVM+oqSIXzy8PUUTVrZnjUndFhXvWs4Ba/KJ7YVBYxppB8McWSxEUuW
 AiA/KH5Nxx/Kbqi+o8Z4qDWSnZ/5tMO2089et6bhxBQVmbwYE1qxmUXvz k=;
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
 by alexa-out.qualcomm.com with ESMTP; 06 Feb 2022 15:50:54 -0800
X-QCInternal: smtphost
Received: from hu-tsimpson-lv.qualcomm.com (HELO
 hu-devc-lv-u18-c.qualcomm.com) ([10.47.235.220])
 by ironmsg-lv-alpha.qualcomm.com with ESMTP; 06 Feb 2022 15:50:53 -0800
Received: by hu-devc-lv-u18-c.qualcomm.com (Postfix, from userid 47164)
 id 9967B500175; Sun,  6 Feb 2022 15:50:33 -0800 (PST)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/8] Hexagon bug fixes and additional tests
Date: Sun,  6 Feb 2022 15:50:22 -0800
Message-Id: <20220206235030.31493-1-tsimpson@quicinc.com>
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

Rml4IGJ1Z3MgcmVwb3J0ZWQgZnJvbSBIZXhhZ29uIHVzZXJzCgpUaGVyZSBpcyBhIHBhdHRlcm4g
b2YgaXNzdWVzIHNldHRpbmcgYml0cyBpbiB1c2VyIHN0YXR1cyByZWdpc3RlciAoVVNSKSwKc28g
SSBjcmVhdGVkIG5ldyB0ZXN0cyBkZWRpY2F0ZWQgdG8gaW5zdHJ1Y3Rpb25zIHRoYXQgbWlnaHQg
c2V0IFVTUi4KCgpNaWNoYWVsIExhbWJlcnQgKDEpOgogIEhleGFnb24gKHRhcmdldC9oZXhhZ29u
KSBmaXggYnVnIGluIGNpcmN1bGFyIGFkZHJlc3NpbmcKClRheWxvciBTaW1wc29uICg3KToKICBI
ZXhhZ29uIEhWWCAodGFyZ2V0L2hleGFnb24pKSBmaXggYnVnIGluIEhWWCBzYXR1cmF0ZSBpbnN0
cnVjdGlvbnMKICBIZXhhZ29uICh0YXJnZXQvaGV4YWdvbikgcHJvcGVybHkgc2V0IEZQSU5WRiBi
aXQgaW4gc2ZjbXAudW8gYW5kCiAgICBkZmNtcC51bwogIEhleGFnb24gKHRhcmdldC9oZXhhZ29u
KSBwcm9wZXJseSBoYW5kbGUgU05hTiBpbgogICAgZGZtaW4vZGZtYXgvc2ZtaW4vc2ZtYXgKICBI
ZXhhZ29uICh0YXJnZXQvaGV4YWdvbikgcHJvcGVybHkgaGFuZGxlIGRlbm9ybSBpbgogICAgYXJj
aF9zZl9yZWNpcF9jb21tb24KICBIZXhhZ29uICh0ZXN0cy90Y2cvaGV4YWdvbikgdGVzdCBpbnN0
cnVjdGlvbnMgdGhhdCBtaWdodCBzZXQgYml0cyBpbgogICAgVVNSCiAgSGV4YWdvbiAodGVzdHMv
dGNnL2hleGFnb24pIGFkZCBmbG9hdGluZyBwb2ludCBpbnN0cnVjdGlvbnMgdG8gdXNyLmMKICBI
ZXhhZ29uICh0ZXN0cy90Y2cvaGV4YWdvbikgdXBkYXRlIG92ZXJmbG93IHRlc3QKCiB0YXJnZXQv
aGV4YWdvbi9mbWFfZW11LmggICAgICAgICAgfCAgICA2ICstCiB0YXJnZXQvaGV4YWdvbi9tYWNy
b3MuaCAgICAgICAgICAgfCAgICA0ICstCiB0YXJnZXQvaGV4YWdvbi9hcmNoLmMgICAgICAgICAg
ICAgfCAgICA2ICstCiB0YXJnZXQvaGV4YWdvbi9vcF9oZWxwZXIuYyAgICAgICAgfCAgIDY2ICst
CiB0ZXN0cy90Y2cvaGV4YWdvbi9jaXJjLmMgICAgICAgICAgfCAgICA1ICstCiB0ZXN0cy90Y2cv
aGV4YWdvbi9mcHN0dWZmLmMgICAgICAgfCAgIDQ0ICstCiB0ZXN0cy90Y2cvaGV4YWdvbi9odnhf
bWlzYy5jICAgICAgfCAgIDcxICstCiB0ZXN0cy90Y2cvaGV4YWdvbi9vdmVyZmxvdy5jICAgICAg
fCAgIDYxICstCiB0ZXN0cy90Y2cvaGV4YWdvbi91c3IuYyAgICAgICAgICAgfCAxMTQxICsrKysr
KysrKysrKysrKysrKysrKysrKysrKysrCiB0ZXN0cy90Y2cvaGV4YWdvbi9NYWtlZmlsZS50YXJn
ZXQgfCAgICA4ICstCiAxMCBmaWxlcyBjaGFuZ2VkLCAxMzg1IGluc2VydGlvbnMoKyksIDI3IGRl
bGV0aW9ucygtKQogY3JlYXRlIG1vZGUgMTAwNjQ0IHRlc3RzL3RjZy9oZXhhZ29uL3Vzci5jCgot
LSAKMi4xNy4xCgo=

