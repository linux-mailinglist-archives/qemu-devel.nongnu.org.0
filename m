Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B93542A15F
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 11:49:03 +0200 (CEST)
Received: from localhost ([::1]:47676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maEP7-0002Mi-BW
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 05:49:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1maE8O-00087n-DJ
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 05:31:44 -0400
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:6317)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1maE8M-00073g-Do
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 05:31:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1634031102; x=1665567102;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=MgBRJUhgkrdIUFZPXTehly2hrLUpDXOVInMfahFe2nM=;
 b=Uctl6HDJamJnSfM7q/e9jn4r1lFrYVrRcILixC20a0PVnSCmJu7Fl4lM
 XryD9aP4b6lKf44ddgrO+ipoePa1J5xL92glQX9nMPs2bo6c4i7QENIsA
 6M2Ic6LAl4uKtcEDfQT5n4J4JgS2K26eQPjHQqmvLI4y7XToSA55JmPMu M=;
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 12 Oct 2021 02:31:38 -0700
X-QCInternal: smtphost
Received: from vu-tsimpson-aus.qualcomm.com (HELO
 vu-tsimpson1-aus.qualcomm.com) ([10.222.150.1])
 by ironmsg01-sd.qualcomm.com with ESMTP; 12 Oct 2021 02:31:38 -0700
Received: by vu-tsimpson1-aus.qualcomm.com (Postfix, from userid 47164)
 id CB1791132; Tue, 12 Oct 2021 04:31:37 -0500 (CDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] Hexagon (target/hexagon) cleanup and bug fix
Date: Tue, 12 Oct 2021 04:31:18 -0500
Message-Id: <1634031081-25450-1-git-send-email-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=199.106.114.38;
 envelope-from=tsimpson@qualcomm.com; helo=alexa-out-sd-01.qualcomm.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: ale@rev.ng, bcain@quicinc.com, tsimpson@quicinc.com,
 richard.henderson@linaro.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Rm9sbG93dXAgdG8gcmVwbGFjZSBtb3JlIHRjZ19jb25zdF8qIHdpdGggdGNnX2NvbnN0YW50X3Rs
KgpGaXggYnVnIHRvIGRlbGF5IHdyaXRlcyB0byBVU1IgdW50aWwgcGFja2V0IGNvbW1pdAoKVGF5
bG9yIFNpbXBzb24gKDIpOgogIEhleGFnb24gKHRhcmdldC9oZXhhZ29uKSBtb3JlIHRjZ19jb25z
dGFudF8qCiAgSGV4YWdvbiAodGFyZ2V0L2hleGFnb24pIHB1dCB3cml0ZXMgdG8gVVNSIGludG8g
dGVtcCB1bnRpbCBjb21taXQKCiB0YXJnZXQvaGV4YWdvbi9nZW5fdGNnLmggICAgICAgICAgfCAg
IDkgKystLQogdGFyZ2V0L2hleGFnb24vbWFjcm9zLmggICAgICAgICAgIHwgICA5ICsrLS0KIHRh
cmdldC9oZXhhZ29uL2F0dHJpYnNfZGVmLmguaW5jICB8ICAgMSArCiB0YXJnZXQvaGV4YWdvbi90
cmFuc2xhdGUuYyAgICAgICAgfCAgMTIgKysrLS0KIHRlc3RzL3RjZy9oZXhhZ29uL292ZXJmbG93
LmMgICAgICB8IDEwNyArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwogdGFy
Z2V0L2hleGFnb24vZ2VuX3RjZ19mdW5jcy5weSAgIHwgIDExICstLS0KIHRhcmdldC9oZXhhZ29u
L2hleF9jb21tb24ucHkgICAgICB8ICAgMiArCiB0ZXN0cy90Y2cvaGV4YWdvbi9NYWtlZmlsZS50
YXJnZXQgfCAgIDEgKwogOCBmaWxlcyBjaGFuZ2VkLCAxMjkgaW5zZXJ0aW9ucygrKSwgMjMgZGVs
ZXRpb25zKC0pCiBjcmVhdGUgbW9kZSAxMDA2NDQgdGVzdHMvdGNnL2hleGFnb24vb3ZlcmZsb3cu
YwoKLS0gCjIuNy40Cgo=

