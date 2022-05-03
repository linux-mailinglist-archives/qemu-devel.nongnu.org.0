Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D547A518E82
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 22:15:58 +0200 (CEST)
Received: from localhost ([::1]:43028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlyw9-0000Sp-SH
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 16:15:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nlyWB-0001da-0n
 for qemu-devel@nongnu.org; Tue, 03 May 2022 15:49:07 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:44589)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nlyW4-0003Xn-FD
 for qemu-devel@nongnu.org; Tue, 03 May 2022 15:49:06 -0400
Received: by mail-pl1-x630.google.com with SMTP id j8so15854661pll.11
 for <qemu-devel@nongnu.org>; Tue, 03 May 2022 12:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=uw4gme9KuFW+TrMXShBM/0VdYE8dR14VXRbCtedKveY=;
 b=v5oHlKFln1ctjaDmtcYOPVFlnNJ2AY1VCefdxEpPrhr6iqI8GV32zMwL1mi3eY1m9o
 Fp09PfeZKeO4jqjKl+L/l3lDw6lakjLyaiPitjEOaF9EvpICuSQLuhY2daLoUAf2Lu2j
 w0P2z6ENYQ6RJTNnS4+Xzp7hqUk2Hzs6ZCdrlC9T/uOR+TuABNkYlyIsnxerbkZRXvlK
 dZL1xWV0mGa/A8/04rQopr1QvtTAoFKiAJiPpC+TdpLltmShzXSsf8YH38Xwd1RJJPvV
 ErbN7ntxy2kU1qAjhULMRAEdRbCWd1+SZHhozL6tW61bp6i25rLkuVrATeGoYdbzWv85
 QWGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uw4gme9KuFW+TrMXShBM/0VdYE8dR14VXRbCtedKveY=;
 b=6IRP+ptwWf8TA4c5csna1Uc30Ym9bAysGM5TPqKbMf4T9jsan+ssV2IPMkKStC3I7W
 6jmHzxhwU/Cqnoz6RqXe4b8V+6wIQAnkeQRwrwhLv6dRwOwJDBqxI3lLo3+AtLE5IIFa
 rj74hOibwHd01N4xOU8ph1rVENs+Q2Le7qhK/dLXVcGlt4frRTi5tT+n3wDnd0nMzuQY
 OhdUq+MgNPP0iTWT2gZcp5/GnzfBO44o0/rpKH4Gj15CMnn6Hl6ckTMxnVXIaGYWJTUr
 DQtSlTH/OmCHafyMFkwa2GOHqDgV1k/L3mRS0Pxa+6dTGL1nGb6EtEIloa7XzMwHU8PD
 BPSA==
X-Gm-Message-State: AOAM533RqnwHtjDZF5KD043SVZqDYrCwM7O1/3nG/1mQsaSsVPv7j6T8
 jdGnUowukD12xzeUqM0R0zV+/c4oRTj9Jw==
X-Google-Smtp-Source: ABdhPJypB6v4ICeNbQT9zaPcGWC/K3B9x+9F3CsSnJjRRkvfqarQkrkuTVCryLfNAIjWK3sDkgfXzA==
X-Received: by 2002:a17:902:e393:b0:15c:f1c1:c527 with SMTP id
 g19-20020a170902e39300b0015cf1c1c527mr18214358ple.22.1651607336683; 
 Tue, 03 May 2022 12:48:56 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 p11-20020a17090ad30b00b001cd4989fed3sm1712383pju.31.2022.05.03.12.48.55
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 May 2022 12:48:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 11/74] semihosting: Move common-semi.h to
 include/semihosting/
Date: Tue,  3 May 2022 12:47:40 -0700
Message-Id: <20220503194843.1379101-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220503194843.1379101-1-richard.henderson@linaro.org>
References: <20220503194843.1379101-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

This header is not private to the top-level semihosting directory,
so place it in the public include directory.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 {semihosting => include/semihosting}/common-semi.h | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename {semihosting => include/semihosting}/common-semi.h (100%)

diff --git a/semihosting/common-semi.h b/include/semihosting/common-semi.h
similarity index 100%
rename from semihosting/common-semi.h
rename to include/semihosting/common-semi.h
-- 
2.34.1


