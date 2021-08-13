Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8906E3EAEC9
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Aug 2021 05:08:54 +0200 (CEST)
Received: from localhost ([::1]:43904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mENYz-0007qh-II
	for lists+qemu-devel@lfdr.de; Thu, 12 Aug 2021 23:08:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1mENXo-0006L9-7c
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 23:07:40 -0400
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:34416)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1mENXj-0007iI-An
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 23:07:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1628824055; x=1660360055;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ihQKrtqOqUYNxkvphuOkZwbWlZsYHuemRu741WPaWPs=;
 b=IaVEUx2Ng4cA0K36QJyRn+06QvcAv4Pzx0pC1VKPIxGV7mwv7eb6Fi3Q
 hIfZTHQq84zEbn+nCRNgwzm6U2TczFKfK/zCM/+clSkbGAaJo2s1j2Jbt
 tB10DxRIlxYBxvQzmr8KJ3WtNnEMwA4ZoZRv57YXuCd8TwC32NlMlF+wi g=;
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 12 Aug 2021 20:07:32 -0700
X-QCInternal: smtphost
Received: from vu-tsimpson-aus.qualcomm.com (HELO
 vu-tsimpson1-aus.qualcomm.com) ([10.222.150.1])
 by ironmsg01-sd.qualcomm.com with ESMTP; 12 Aug 2021 20:07:31 -0700
Received: by vu-tsimpson1-aus.qualcomm.com (Postfix, from userid 47164)
 id 8BC61A4E; Thu, 12 Aug 2021 22:07:31 -0500 (CDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/1] Hexagon (disas/hexagon) fix memory leak for early exit
Date: Thu, 12 Aug 2021 22:07:29 -0500
Message-Id: <1628824050-15249-1-git-send-email-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=199.106.114.38;
 envelope-from=tsimpson@qualcomm.com; helo=alexa-out-sd-01.qualcomm.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: peter.maydell@linaro.org, tsimpson@quicinc.com,
 richard.henderson@linaro.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

VGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCA3MDNlOGNkNjE4OWNmNjk5YzhkNWMw
OTRiYzY4YjVmM2FmYTZhZDcxOgoKICBVcGRhdGUgdmVyc2lvbiBmb3IgdjYuMS4wLXJjMyByZWxl
YXNlICgyMDIxLTA4LTEwIDE5OjA4OjA5ICswMTAwKQoKYXJlIGF2YWlsYWJsZSBpbiB0aGUgZ2l0
IHJlcG9zaXRvcnkgYXQ6CgogIGh0dHBzOi8vZ2l0aHViLmNvbS9xdWljL3FlbXUgdGFncy9wdWxs
LWhleC0yMDIxMDgxMgoKZm9yIHlvdSB0byBmZXRjaCBjaGFuZ2VzIHVwIHRvIGE3Njg2ZDVkODUy
ODQ2OWI1OTZlOThlZmYwOThhNWQzZjgzMjhmYjM6CgogIEhleGFnb24gKGRpc2FzL2hleGFnb24u
YykgZml4IG1lbW9yeSBsZWFrIGZvciBlYXJseSBleGl0IGNhc2VzICgyMDIxLTA4LTEyIDA5OjA2
OjA1IC0wNTAwKQoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLQoKRG9uJ3QgYWxsb2NhdGUgdGhlIHN0cmluZyB1bnRpbCBlcnJv
ciBjb25kaXRpb25zIGhhdmUgYmVlbiBjaGVja2VkCgpGaXhlczogYTAwY2ZlZDBlICgiSGV4YWdv
biAoZGlzYXMpIGRpc2Fzc2VtYmxlciIpCkVsaW1pbmF0ZSBDb3Zlcml0eSBDSUQgMTQ2MDEyMSAo
UmVzb3VyY2UgbGVhaykKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KVGF5bG9yIFNpbXBzb24gKDEpOgogICAgICBIZXhhZ29u
IChkaXNhcy9oZXhhZ29uLmMpIGZpeCBtZW1vcnkgbGVhayBmb3IgZWFybHkgZXhpdCBjYXNlcwoK
IGRpc2FzL2hleGFnb24uYyB8IDMgKystCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCsp
LCAxIGRlbGV0aW9uKC0pCg==

