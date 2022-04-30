Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B48C515DAB
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Apr 2022 15:37:19 +0200 (CEST)
Received: from localhost ([::1]:60828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nknHi-0002Tb-42
	for lists+qemu-devel@lfdr.de; Sat, 30 Apr 2022 09:37:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nknAS-0004lG-Kp
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 09:29:50 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:44551)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nknAQ-0006Fg-EU
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 09:29:47 -0400
Received: by mail-pl1-x635.google.com with SMTP id j8so9281337pll.11
 for <qemu-devel@nongnu.org>; Sat, 30 Apr 2022 06:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uw4gme9KuFW+TrMXShBM/0VdYE8dR14VXRbCtedKveY=;
 b=HAx+YPkiYyRIhAAqjYCxbpCV7g7KVy9FXEEbboCUJhcrIENrwnHNYb0SgP7GTn0iB3
 yj2F87v6NfR9LR3kBGMJ5t7ogGFktUd7VHozzjmrYEySynnaiRqvdZYmldlGPFlH1Kb7
 88lT6axf+8XAbvUOLOHwdWQQaRIGCbSK8XtHGqyV1CGGpdTP6xDZZejuU/ubvQ0jMLYd
 pk+gidvQLX3nUP9G/IC2BKZuDyt1cq4PpWW+gYd8QITm4RVrweUkDIr+27imLv7XFgin
 jFy0TkHuDe2ePeZqi/wB0VsnQM5BbzUZTJqePA0+7rg7iqUE4RRNBFqF+esgekq4V8Ls
 wq8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uw4gme9KuFW+TrMXShBM/0VdYE8dR14VXRbCtedKveY=;
 b=LJMOVz03pmNWW1QMRhYMUDiQEpcq2P6hN+Ag4ecMtvdnbKvkK5FjYerjlZI4dY25Kb
 Tj6/dQbgnDZLxMjrgtawOTtMtwrruEztq3QmHfnrA08Oo8nvwiyKZzcaWYi3/zex0aco
 txLtF3wf+LglYR/5PVw+sxAw2GiExQN8xjz7ZBFQ0j+eslGcJYHW6MNQnVzsCBF1fJ7I
 95QQLOpM2hXmypoHJGiqVd3ogOpMNeTaEEcKM81ounOu3WZ1tE68/aQ9v/964rwbzaKz
 lxQD4z3NEIaO6OvOROR3nllj3rBOPVP6Q5GQEbhfmIeh5EY8RiseDDezi2261lNIgewi
 WwRQ==
X-Gm-Message-State: AOAM531cmJ2DVxhxM5XsJY/T/klv3uLiIw6aH8erfu6E25XdmKPcEjLH
 NtwaxP/JJj62ggEa+qD9Vt9wYBp6bGSR+w==
X-Google-Smtp-Source: ABdhPJy1RCTzgNRQrNC5mId7aQS0cbrYo4m+Ae1F01ULvJpE02JTlisQJvA9deajL9AYlM1HV8Fjvw==
X-Received: by 2002:a17:902:ecd1:b0:15e:850b:c2d with SMTP id
 a17-20020a170902ecd100b0015e850b0c2dmr3904863plh.75.1651325385043; 
 Sat, 30 Apr 2022 06:29:45 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 x5-20020aa793a5000000b0050dc7628201sm1522606pff.219.2022.04.30.06.29.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Apr 2022 06:29:44 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 11/43] semihosting: Move common-semi.h to include/semihosting/
Date: Sat, 30 Apr 2022 06:29:00 -0700
Message-Id: <20220430132932.324018-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220430132932.324018-1-richard.henderson@linaro.org>
References: <20220430132932.324018-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
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
Cc: crwulff@gmail.com, alex.bennee@linaro.org, f4bug@amsat.org,
 laurent@vivier.eu
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


