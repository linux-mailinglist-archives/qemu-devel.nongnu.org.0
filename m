Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DB726AED13
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 19:01:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZbbJ-0007Ka-By; Tue, 07 Mar 2023 12:59:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZbaq-0006YK-Pm
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 12:59:20 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZbap-0000Cz-7Q
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 12:59:20 -0500
Received: by mail-pj1-x1033.google.com with SMTP id
 u3-20020a17090a450300b00239db6d7d47so12617732pjg.4
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 09:59:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678211958;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QUgF3wCStqIfrQSoFHjmteGnnXlKsfeNNZKc7lTbn9A=;
 b=yUc0S4xqk5JGNJBlOOuHDbxW8+OMvj+dVSX4JRV1286/anUkG2EzIfS8gnC4GTm+FH
 KW6s22JT36eN9jSk9OHjqt2nSfusR3gLHOt+AXinmup/Zkj6Ng47yypgLxBnQQjT5NKa
 6lS6xSasEbvOTKk31KP0QV7+q4js14+CqHQXJokt96NXOBZFol+T0PCePoozIf0B7nym
 48zcN/1vMGQ3w02VoPRg82Ikz/2kx1BDQflZkfdo1OVbI9ejjuqk8wXeQ7ow1fba5u6A
 KnigLrT8733/AfCc4WTXSdjsktb4gyS151qkepdl9XwRUWX1KSSz/8gFeFBIy8PwUP4K
 77oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678211958;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QUgF3wCStqIfrQSoFHjmteGnnXlKsfeNNZKc7lTbn9A=;
 b=00Xqtl8ijqcV7jApobxJg6appAgdpsSI//2b/gi9TKhwoffL4D34stgdrkH1aPPf/V
 e85x0oyJquBIMM6zt7yEIlesBm6Z7ziJVKY1SkmchB9Lf54ojtZKnubppBTBIroyMTAd
 /JCfRrVgVtmCJSs41ZIQ8jhYJeoSn790SqkDXBQ1Crjd2S+6/IP2XjaljFmvhyyA/uh7
 jWVnhGMtsvtYtYGF8k4ZKmGGrXPB72vZBQFd6/td1pmw1l4PnsoRxUhvNZ3YsfXfFDWW
 UwuRWwOf3XaahNojJKKc14MZguAf6GMCzFcRQg94pV+EJmx8vlAqoovAX7i6MN5o6GvW
 6o5g==
X-Gm-Message-State: AO0yUKUWNfo1syyq7icsw0vpv2zUWTt0WPo8nnBPzjfmdWMs4CAL9ee2
 RcAQaEPnzbVCcz4DljzdLEUS80mqZOhp1FFAEzc=
X-Google-Smtp-Source: AK7set+MeYeWCWEu6usas4yQI4n0TcCyT0QX9nvyjotVEb+B81t/RbgAL57yp0BvBpPjyL5ofq2PPg==
X-Received: by 2002:a17:902:d886:b0:19e:cfbd:cc73 with SMTP id
 b6-20020a170902d88600b0019ecfbdcc73mr5192133plz.26.1678211958460; 
 Tue, 07 Mar 2023 09:59:18 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:b1e0:bfd9:8b1a:efeb])
 by smtp.gmail.com with ESMTPSA id
 bd6-20020a170902830600b00198e397994bsm8661802plb.136.2023.03.07.09.59.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 09:59:18 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Anton Johansson <anjo@rev.ng>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 36/67] target/tricore: Remove `NB_MMU_MODES` define
Date: Tue,  7 Mar 2023 09:58:17 -0800
Message-Id: <20230307175848.2508955-37-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230307175848.2508955-1-richard.henderson@linaro.org>
References: <20230307175848.2508955-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Anton Johansson via <qemu-devel@nongnu.org>

Signed-off-by: Anton Johansson <anjo@rev.ng>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230306175230.7110-22-anjo@rev.ng>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/tricore/cpu-param.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/target/tricore/cpu-param.h b/target/tricore/cpu-param.h
index 2727913047..e29d551dd6 100644
--- a/target/tricore/cpu-param.h
+++ b/target/tricore/cpu-param.h
@@ -12,6 +12,5 @@
 #define TARGET_PAGE_BITS 14
 #define TARGET_PHYS_ADDR_SPACE_BITS 32
 #define TARGET_VIRT_ADDR_SPACE_BITS 32
-#define NB_MMU_MODES 3
 
 #endif
-- 
2.34.1


