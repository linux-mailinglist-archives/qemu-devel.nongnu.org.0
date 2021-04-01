Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BAD6350D73
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 06:08:39 +0200 (CEST)
Received: from localhost ([::1]:50848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRodF-0003hT-9p
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 00:08:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1lRoP5-0001aT-EW
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 23:53:55 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:2902)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1lRoP2-0004rM-Sw
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 23:53:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1617249232; x=1648785232;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=C6aPgyv0HI8Qqyqx7C1C+01qGuDywdCVFbp7ibehpDs=;
 b=wqetagdHlc+9EMS8mxf8eWjZ0l3Omb1YrjnSU9IqEcCvZlVeh/RpScvd
 PPzZnJLkZq1wsIJjkKCeN2gjJEVDyrfX9Bi4W7F9QNv6gnLm/nB+bOeLO
 CscsaJXAsViBkGrcK7BGtdAouvNkNMRyvwAWif8ticSDUX6AKm8HtG62l o=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 31 Mar 2021 20:53:42 -0700
X-QCInternal: smtphost
Received: from vu-tsimpson-aus.qualcomm.com (HELO
 vu-tsimpson1-aus.qualcomm.com) ([10.222.150.1])
 by ironmsg04-sd.qualcomm.com with ESMTP; 31 Mar 2021 20:53:41 -0700
Received: by vu-tsimpson1-aus.qualcomm.com (Postfix, from userid 47164)
 id D9C5F177B; Wed, 31 Mar 2021 22:53:40 -0500 (CDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 08/21] Hexagon (target/hexagon) change type of
 softfloat_roundingmodes
Date: Wed, 31 Mar 2021 22:53:20 -0500
Message-Id: <1617249213-22667-9-git-send-email-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1617249213-22667-1-git-send-email-tsimpson@quicinc.com>
References: <1617249213-22667-1-git-send-email-tsimpson@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=199.106.114.39;
 envelope-from=tsimpson@qualcomm.com; helo=alexa-out-sd-02.qualcomm.com
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
Cc: ale@rev.ng, philmd@redhat.com, tsimpson@quicinc.com,
 richard.henderson@linaro.org, bcain@quicinc.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
---
 target/hexagon/arch.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/hexagon/arch.c b/target/hexagon/arch.c
index 699e2cf..bb51f19 100644
--- a/target/hexagon/arch.c
+++ b/target/hexagon/arch.c
@@ -95,7 +95,7 @@ int32_t conv_round(int32_t a, int n)
 
 /* Floating Point Stuff */
 
-static const int softfloat_roundingmodes[] = {
+static const FloatRoundMode softfloat_roundingmodes[] = {
     float_round_nearest_even,
     float_round_to_zero,
     float_round_down,
-- 
2.7.4


