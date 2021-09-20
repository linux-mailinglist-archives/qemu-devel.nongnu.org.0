Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21307412885
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 23:53:45 +0200 (CEST)
Received: from localhost ([::1]:55264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSREO-0000Hi-2d
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 17:53:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1mSQml-0002dp-44
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 17:25:11 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:9866)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1mSQmi-000268-By
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 17:25:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1632173108; x=1663709108;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=996D7S1WgySoY2ChqAWQs4SGvStARx2hUWyS2z8jV0Y=;
 b=KgLlD93yNX0cQUEb+9jrIK7DOlLcIsW5q+K6jvZM+rPPxcaqtSPgwVHf
 fMIPMQNjg2+fPinpu6KlmwrJy2EXJcUGKQ5i7Xg+IDgKTv9gzpWRNJ5Gs
 zVVrDRMskbOTyzCYRiKvVzyGBxGSCgFuW1DEFLj7JopsTSWsuijKVQIHj 0=;
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 20 Sep 2021 14:24:37 -0700
X-QCInternal: smtphost
Received: from vu-tsimpson-aus.qualcomm.com (HELO
 vu-tsimpson1-aus.qualcomm.com) ([10.222.150.1])
 by ironmsg01-sd.qualcomm.com with ESMTP; 20 Sep 2021 14:24:37 -0700
Received: by vu-tsimpson1-aus.qualcomm.com (Postfix, from userid 47164)
 id B61741681; Mon, 20 Sep 2021 16:24:35 -0500 (CDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 15/30] Hexagon HVX (target/hexagon) helper overrides -
 vector assign & cmov
Date: Mon, 20 Sep 2021 16:24:10 -0500
Message-Id: <1632173065-18522-16-git-send-email-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1632173065-18522-1-git-send-email-tsimpson@quicinc.com>
References: <1632173065-18522-1-git-send-email-tsimpson@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=199.106.114.39;
 envelope-from=tsimpson@qualcomm.com; helo=alexa-out-sd-02.qualcomm.com
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
Cc: ale@rev.ng, bcain@quicinc.com, tsimpson@quicinc.com,
 richard.henderson@linaro.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

U2lnbmVkLW9mZi1ieTogVGF5bG9yIFNpbXBzb24gPHRzaW1wc29uQHF1aWNpbmMuY29tPgotLS0K
IHRhcmdldC9oZXhhZ29uL2dlbl90Y2dfaHZ4LmggfCAzMSArKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMzEgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBh
L3RhcmdldC9oZXhhZ29uL2dlbl90Y2dfaHZ4LmggYi90YXJnZXQvaGV4YWdvbi9nZW5fdGNnX2h2
eC5oCmluZGV4IGViMjk1NjYuLmJjZDUzZDQgMTAwNjQ0Ci0tLSBhL3RhcmdldC9oZXhhZ29uL2dl
bl90Y2dfaHZ4LmgKKysrIGIvdGFyZ2V0L2hleGFnb24vZ2VuX3RjZ19odnguaApAQCAtMTI2LDQg
KzEyNiwzNSBAQCBzdGF0aWMgaW5saW5lIHZvaWQgYXNzZXJ0X3ZoaXN0X3RtcChEaXNhc0NvbnRl
eHQgKmN0eCkKICAgICB9IHdoaWxlICgwKQogCiAKKyNkZWZpbmUgZkdFTl9UQ0dfVjZfdmFzc2ln
bihTSE9SVENPREUpIFwKKyAgICB0Y2dfZ2VuX2d2ZWNfbW92KE1PXzY0LCBWZFZfb2ZmLCBWdVZf
b2ZmLCBcCisgICAgICAgICAgICAgICAgICAgICBzaXplb2YoTU1WZWN0b3IpLCBzaXplb2YoTU1W
ZWN0b3IpKQorCisvKiBWZWN0b3IgY29uZGl0aW9uYWwgbW92ZSAqLworI2RlZmluZSBmR0VOX1RD
R19WRUNfQ01PVihQUkVEKSBcCisgICAgZG8geyBcCisgICAgICAgIFRDR3YgbHNiID0gdGNnX3Rl
bXBfbmV3KCk7IFwKKyAgICAgICAgVENHTGFiZWwgKmZhbHNlX2xhYmVsID0gZ2VuX25ld19sYWJl
bCgpOyBcCisgICAgICAgIFRDR0xhYmVsICplbmRfbGFiZWwgPSBnZW5fbmV3X2xhYmVsKCk7IFwK
KyAgICAgICAgdGNnX2dlbl9hbmRpX3RsKGxzYiwgUHNWLCAxKTsgXAorICAgICAgICB0Y2dfZ2Vu
X2JyY29uZGlfdGwoVENHX0NPTkRfTkUsIGxzYiwgUFJFRCwgZmFsc2VfbGFiZWwpOyBcCisgICAg
ICAgIHRjZ190ZW1wX2ZyZWUobHNiKTsgXAorICAgICAgICB0Y2dfZ2VuX2d2ZWNfbW92KE1PXzY0
LCBWZFZfb2ZmLCBWdVZfb2ZmLCBcCisgICAgICAgICAgICAgICAgICAgICAgICAgc2l6ZW9mKE1N
VmVjdG9yKSwgc2l6ZW9mKE1NVmVjdG9yKSk7IFwKKyAgICAgICAgdGNnX2dlbl9icihlbmRfbGFi
ZWwpOyBcCisgICAgICAgIGdlbl9zZXRfbGFiZWwoZmFsc2VfbGFiZWwpOyBcCisgICAgICAgIHRj
Z19nZW5fb3JpX3RsKGhleF9zbG90X2NhbmNlbGxlZCwgaGV4X3Nsb3RfY2FuY2VsbGVkLCBcCisg
ICAgICAgICAgICAgICAgICAgICAgIDEgPDwgaW5zbi0+c2xvdCk7IFwKKyAgICAgICAgZ2VuX3Nl
dF9sYWJlbChlbmRfbGFiZWwpOyBcCisgICAgfSB3aGlsZSAoMCkKKworCisvKiBWZWN0b3IgY29u
ZGl0aW9uYWwgbW92ZSAodHJ1ZSkgKi8KKyNkZWZpbmUgZkdFTl9UQ0dfVjZfdmNtb3YoU0hPUlRD
T0RFKSBcCisgICAgZkdFTl9UQ0dfVkVDX0NNT1YoMSkKKworLyogVmVjdG9yIGNvbmRpdGlvbmFs
IG1vdmUgKGZhbHNlKSAqLworI2RlZmluZSBmR0VOX1RDR19WNl92bmNtb3YoU0hPUlRDT0RFKSBc
CisgICAgZkdFTl9UQ0dfVkVDX0NNT1YoMCkKKwogI2VuZGlmCi0tIAoyLjcuNAoK

