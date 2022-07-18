Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6111578E0F
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 01:07:19 +0200 (CEST)
Received: from localhost ([::1]:46850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDZpf-00085r-3r
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 19:07:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1oDZlz-0001Ok-CF
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 19:03:31 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:11937)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1oDZlw-0005RS-PT
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 19:03:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1658185409; x=1689721409;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=MJzTw19Rf5f0+6a/w6JupM1d95v4rM6VX6IR6qxAGso=;
 b=Edk4U+0th7YirNuxyIgxOh0WD7WuC6q4VZ7eat6zXCWwmm7ORxZo8F21
 LMTUmstkAhahWdvW9sRfXI7Bd9nW8QxN4+nBF2QR9tdUMlo2f05XGbEIk
 u8iUroLJELf6WHRjz40gjvjY5py3ltMcbWbiBTaYqb9rxVRr8iN9MpdW2 w=;
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
 by alexa-out.qualcomm.com with ESMTP; 18 Jul 2022 16:03:22 -0700
X-QCInternal: smtphost
Received: from hu-tsimpson-lv.qualcomm.com (HELO
 hu-devc-lv-u18-c.qualcomm.com) ([10.47.235.220])
 by ironmsg-lv-alpha.qualcomm.com with ESMTP; 18 Jul 2022 16:03:22 -0700
Received: by hu-devc-lv-u18-c.qualcomm.com (Postfix, from userid 47164)
 id 4988E5005B6; Mon, 18 Jul 2022 16:03:22 -0700 (PDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Cc: tsimpson@quicinc.com, richard.henderson@linaro.org, f4bug@amsat.org,
 ale@rev.ng, anjo@rev.ng, bcain@quicinc.com, mlambert@quicinc.com
Subject: [PATCH 0/3] Hexagon bug fixes and test improvements
Date: Mon, 18 Jul 2022 16:03:17 -0700
Message-Id: <20220718230320.24444-1-tsimpson@quicinc.com>
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

MSkgRml4ZXMgYSBidWcgaW4gcWVtdS1oZXhhZ29uCjIpIEZpeGVzIGEgYnVnIGluIGEgdGVzdCBj
YXNlCjMpIEFkZHMgcmVmZXJlbmNlIGZpbGUgZm9yIGZsb2F0X2NvbnZkIHRlc3QgY2FzZQoKVGF5
bG9yIFNpbXBzb24gKDMpOgogIEhleGFnb24gKHRhcmdldC9oZXhhZ29uKSBtYWtlIFZ5ViBvcGVy
YW5kcyB1c2UgYSB1bmlxdWUgdGVtcAogIEhleGFnb24gKHRlc3RzL3RjZy9oZXhhZ29uKSBGaXgg
YWxpZ25tZW50IGluIGxvYWRfdW5wYWNrLmMKICBIZXhhZ29uICh0ZXN0cy90Y2cvaGV4YWdvbikg
cmVmZXJlbmNlIGZpbGUgZm9yIGZsb2F0X2NvbnZkCgogdGVzdHMvdGNnL2hleGFnb24vaHZ4X21p
c2MuYyAgICAgIHwgIDQ1ICsrCiB0ZXN0cy90Y2cvaGV4YWdvbi9sb2FkX3VucGFjay5jICAgfCAg
MTQgKy0KIHRhcmdldC9oZXhhZ29uL2dlbl90Y2dfZnVuY3MucHkgICB8ICAgOSArLQogdGVzdHMv
dGNnL2hleGFnb24vZmxvYXRfY29udmQucmVmIHwgOTg4ICsrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKwogNCBmaWxlcyBjaGFuZ2VkLCAxMDQ0IGluc2VydGlvbnMoKyksIDEyIGRlbGV0aW9u
cygtKQogY3JlYXRlIG1vZGUgMTAwNjQ0IHRlc3RzL3RjZy9oZXhhZ29uL2Zsb2F0X2NvbnZkLnJl
ZgoKLS0gCjIuMTcuMQoK

