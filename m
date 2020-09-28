Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D43827B33E
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Sep 2020 19:31:27 +0200 (CEST)
Received: from localhost ([::1]:33258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kMwzm-0004RV-EQ
	for lists+qemu-devel@lfdr.de; Mon, 28 Sep 2020 13:31:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1kMwxd-0002ch-21
 for qemu-devel@nongnu.org; Mon, 28 Sep 2020 13:29:13 -0400
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:53857)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1kMwxY-0007uy-Je
 for qemu-devel@nongnu.org; Mon, 28 Sep 2020 13:29:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1601314148; x=1632850148;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=km1GJ45TtFLI9zgwcnBmfVDhd/f6wvQcLPvi1t5khZs=;
 b=BGavSh2DJf93LXI6hJxIXcleFuouvOG7L+BWrOVK67YXtecYeR6ra1Kb
 bhKSUYSGQG05tc26nsxR/YrtEmVOzZ1gkPohKxZ0Lpmi9Gt+WdyxprSzB
 P+q8W7N62nliV473VW+cOsmQg+sP7fMcKv+THnLvWYVy2RdCc0mV7b6m1 8=;
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 28 Sep 2020 10:29:02 -0700
X-QCInternal: smtphost
Received: from vu-tsimpson-aus.qualcomm.com (HELO
 vu-tsimpson1-aus.qualcomm.com) ([10.222.150.1])
 by ironmsg01-sd.qualcomm.com with ESMTP; 28 Sep 2020 10:29:02 -0700
Received: by vu-tsimpson1-aus.qualcomm.com (Postfix, from userid 47164)
 id D627E11E9; Mon, 28 Sep 2020 12:29:01 -0500 (CDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v4 03/29] Hexagon (include/elf.h) ELF machine definition
Date: Mon, 28 Sep 2020 12:28:32 -0500
Message-Id: <1601314138-9930-4-git-send-email-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1601314138-9930-1-git-send-email-tsimpson@quicinc.com>
References: <1601314138-9930-1-git-send-email-tsimpson@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=199.106.114.38;
 envelope-from=tsimpson@qualcomm.com; helo=alexa-out-sd-01.qualcomm.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/28 13:29:03
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.199,
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
Cc: ale@rev.ng, riku.voipio@iki.fi, richard.henderson@linaro.org,
 laurent@vivier.eu, tsimpson@quicinc.com, philmd@redhat.com,
 aleksandar.m.mail@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

RGVmaW5lIEVNX0hFWEFHT04gMTY0CgpTaWduZWQtb2ZmLWJ5OiBUYXlsb3IgU2ltcHNvbiA8dHNp
bXBzb25AcXVpY2luYy5jb20+ClJldmlld2VkLWJ5OiBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSA8
cGhpbG1kQHJlZGhhdC5jb20+ClRlc3RlZC1ieTogUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPHBo
aWxtZEByZWRoYXQuY29tPgpSZXZpZXdlZC1ieTogUmljaGFyZCBIZW5kZXJzb24gPHJpY2hhcmQu
aGVuZGVyc29uQGxpbmFyby5vcmc+Ci0tLQogaW5jbHVkZS9lbGYuaCB8IDIgKysKIDEgZmlsZSBj
aGFuZ2VkLCAyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9pbmNsdWRlL2VsZi5oIGIvaW5j
bHVkZS9lbGYuaAppbmRleCBjMTE3YTRkLi4xNDFhODZmIDEwMDY0NAotLS0gYS9pbmNsdWRlL2Vs
Zi5oCisrKyBiL2luY2x1ZGUvZWxmLmgKQEAgLTE3Miw2ICsxNzIsOCBAQCB0eXBlZGVmIHN0cnVj
dCBtaXBzX2VsZl9hYmlmbGFnc192MCB7CiAKICNkZWZpbmUgRU1fVU5JQ09SRTMyICAgIDExMCAg
ICAgLyogVW5pQ29yZTMyICovCiAKKyNkZWZpbmUgRU1fSEVYQUdPTiAgICAgMTY0ICAgICAvKiBR
dWFsY29tbSBIZXhhZ29uICovCisKICNkZWZpbmUgRU1fUklTQ1YgICAgICAgIDI0MyAgICAgLyog
UklTQy1WICovCiAKICNkZWZpbmUgRU1fTkFOT01JUFMgICAgIDI0OSAgICAgLyogV2F2ZSBDb21w
dXRpbmcgbmFub01JUFMgKi8KLS0gCjIuNy40Cgo=

