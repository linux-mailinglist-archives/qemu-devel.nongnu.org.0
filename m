Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F1655861F9
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Aug 2022 01:34:56 +0200 (CEST)
Received: from localhost ([::1]:46316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIISU-0003cJ-Of
	for lists+qemu-devel@lfdr.de; Sun, 31 Jul 2022 19:34:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1oIIQQ-00080i-7W
 for qemu-devel@nongnu.org; Sun, 31 Jul 2022 19:32:46 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:54485)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1oIIQK-0000Zn-Px
 for qemu-devel@nongnu.org; Sun, 31 Jul 2022 19:32:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1659310361; x=1690846361;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=9GuUH6DPOICmLp1x7/Cl6g+pmIVae1KtaEMVWl3v7NU=;
 b=gMFekgo1sD2LCLLjC5nIZrFCqht1CVkx51uVnswR3smqatXWDSXzWEFv
 8Nfkg3tZq20uS46/uFxtBIoK77goOiy8m1sTtvAZFH+tihparUi0qKMQs
 tcIn6u7IkpAS78oY6tpxtf4mS3qMbjvNXlusg5PdidqigcSStWA7cJcMY A=;
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
 by alexa-out.qualcomm.com with ESMTP; 31 Jul 2022 16:32:34 -0700
X-QCInternal: smtphost
Received: from hu-tsimpson-lv.qualcomm.com (HELO
 hu-devc-lv-u18-c.qualcomm.com) ([10.47.235.220])
 by ironmsg09-lv.qualcomm.com with ESMTP; 31 Jul 2022 16:32:34 -0700
Received: by hu-devc-lv-u18-c.qualcomm.com (Postfix, from userid 47164)
 id F0D545000B9; Sun, 31 Jul 2022 16:32:33 -0700 (PDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Cc: tsimpson@quicinc.com, richard.henderson@linaro.org, f4bug@amsat.org,
 peter.maydell@linaro.org
Subject: [PULL 0/3] Hexagon bug fixes and test improvements
Date: Sun, 31 Jul 2022 16:32:29 -0700
Message-Id: <20220731233232.2473-1-tsimpson@quicinc.com>
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

VGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCAzOTE2NjAzZTBjMWQ5MDllMTRlMDlk
NWViY2JkYWE5YzllMjFhZGYzOgoKICBNZXJnZSB0YWcgJ3B1bGwtbGEtMjAyMjA3MjknIG9mIGh0
dHBzOi8vZ2l0bGFiLmNvbS9ydGg3NjgwL3FlbXUgaW50byBzdGFnaW5nICgyMDIyLTA3LTI5IDE3
OjM5OjE3IC0wNzAwKQoKYXJlIGF2YWlsYWJsZSBpbiB0aGUgR2l0IHJlcG9zaXRvcnkgYXQ6Cgog
IGh0dHBzOi8vZ2l0aHViLmNvbS9xdWljL3FlbXUgdGFncy9wdWxsLWhleC0yMDIyMDczMQoKZm9y
IHlvdSB0byBmZXRjaCBjaGFuZ2VzIHVwIHRvIDdlYWJiMDUwZWE3N2U1MjlmNTQ5ZWExZGRhYWEx
OGU5MWFlMDFlMzQ6CgogIEhleGFnb24gKHRlc3RzL3RjZy9oZXhhZ29uKSByZWZlcmVuY2UgZmls
ZSBmb3IgZmxvYXRfY29udmQgKDIwMjItMDctMzEgMTY6MjI6MDkgLTA3MDApCgotLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCkhl
eGFnb24gYnVnIGZpeGVzIGFuZCB0ZXN0IGltcHJvdmVtZW50cwoKMSkgRml4ZXMgYSBidWcgaW4g
cWVtdS1oZXhhZ29uCjIpIEZpeGVzIGEgYnVnIGluIGEgdGVzdCBjYXNlCjMpIEFkZHMgcmVmZXJl
bmNlIGZpbGUgZm9yIGZsb2F0X2NvbnZkIHRlc3QgY2FzZQoKLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpUYXlsb3IgU2ltcHNv
biAoMyk6CiAgICAgIEhleGFnb24gKHRhcmdldC9oZXhhZ29uKSBtYWtlIFZ5ViBvcGVyYW5kcyB1
c2UgYSB1bmlxdWUgdGVtcAogICAgICBIZXhhZ29uICh0ZXN0cy90Y2cvaGV4YWdvbikgRml4IGFs
aWdubWVudCBpbiBsb2FkX3VucGFjay5jCiAgICAgIEhleGFnb24gKHRlc3RzL3RjZy9oZXhhZ29u
KSByZWZlcmVuY2UgZmlsZSBmb3IgZmxvYXRfY29udmQKCiB0ZXN0cy90Y2cvaGV4YWdvbi9odnhf
bWlzYy5jICAgICAgfCAgNDUgKysKIHRlc3RzL3RjZy9oZXhhZ29uL2xvYWRfdW5wYWNrLmMgICB8
ICAxNCArLQogdGFyZ2V0L2hleGFnb24vZ2VuX3RjZ19mdW5jcy5weSAgIHwgICA5ICstCiB0ZXN0
cy90Y2cvaGV4YWdvbi9mbG9hdF9jb252ZC5yZWYgfCA5ODggKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysKIDQgZmlsZXMgY2hhbmdlZCwgMTA0NCBpbnNlcnRpb25zKCspLCAx
MiBkZWxldGlvbnMoLSkKIGNyZWF0ZSBtb2RlIDEwMDY0NCB0ZXN0cy90Y2cvaGV4YWdvbi9mbG9h
dF9jb252ZC5yZWYK

