Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DA372EE6C0
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 21:22:16 +0100 (CET)
Received: from localhost ([::1]:33230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxbnT-0007Cr-Dc
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 15:22:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kxbgP-0000Yf-IB
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 15:14:57 -0500
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:40975)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kxbgO-0001MU-37
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 15:14:57 -0500
Received: by mail-pf1-x42f.google.com with SMTP id q20so1281563pfu.8
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 12:14:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pzbu+QPuB679ppIoaOkuQ2FKi4FxaEhDCtC4QBl00dw=;
 b=udoZJtvYcBWNKXUJd+vhh7jaZKtOtltKaBtxuHUM4G/eYB7ZEVVoNEY9i+r9T/sh8s
 yCSso2igULau4xcYztMHmrLjwCr9AAvTHrxZpSjA5BjhiC/VFeJMilAnFIpdVS11/eHj
 cHn5+TfC8qiv+bH6TMOo/zDgI7pgt5pJc19bylUjBkBfnK9iBye7VowJ0UrcJybVqTLL
 WFWspdRZmsJoS2x5/3vdY9zdQ5xEGkuKoWycMHmGQdE7iKQlTBW6RRgBp3Ye17ghYkyB
 mOSFpVJ9TNjSDkhqgmJ5Sddcvh4ZQoQzEaLHk7MmB8WTqa0QabMz/ylbY31qJ8FQRwyz
 YXHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pzbu+QPuB679ppIoaOkuQ2FKi4FxaEhDCtC4QBl00dw=;
 b=GJ3eKn8vhPN1k5BNILB3MVbAFZnNpuTE/BJWL8hEZN/CeKzUGhRf2pi51HWCBoLHdw
 fxNQa5DfCfM8dlVGlkUKVZBgKTidU8RvoP0NOKDmMqHGLSDXABBc1fADGyYJbdp0Pard
 JEs7lFkg1sX0esZbtB6JgqOAGw2hP64bToMMxk6KQC9o8y1KZ1gwTUd/fWASGzEAHANV
 wN+cri5+yRXcd8Hf9oUP9womn2D/MO8l0AtPZtAwKIavZ/1BJteIRaYBFjFJhf4eRzqt
 haRuh+KOU0iiXkSE0dHIFrjVSPOEeVFiRUHFkVM+gryDrVkbGJ+bZX7bSkMsEgggAvwu
 nIcg==
X-Gm-Message-State: AOAM533P7sGIyrAfDL9c+PosiVqfbInCJpzmJ3Y91KG01/oSeeiexQIy
 CWsEeAdi1aPSr6LwGOGk4I4lJDqyfSpFeQ==
X-Google-Smtp-Source: ABdhPJxaCgwyZMHH9psMK7dyaoUpnGvuE5A6lN7VvlzGKvBlLE253T8O85/FOJdRCueVYeJnJJPRXA==
X-Received: by 2002:a62:384b:0:b029:19d:a5c6:d76 with SMTP id
 f72-20020a62384b0000b029019da5c60d76mr453568pfa.16.1610050494226; 
 Thu, 07 Jan 2021 12:14:54 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id v6sm6516265pfi.31.2021.01.07.12.14.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 12:14:53 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 01/47] linux-user: Conditionalize TUNSETVNETLE
Date: Thu,  7 Jan 2021 10:14:02 -1000
Message-Id: <20210107201448.1152301-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210107201448.1152301-1-richard.henderson@linaro.org>
References: <20210107201448.1152301-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: peter.maydell@linaro.org, Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This fixes the build for older ppc64 kernel headers.

Fixes: 6addf06a3c4
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/ioctls.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/linux-user/ioctls.h b/linux-user/ioctls.h
index 661b5daa9f..7193c3b226 100644
--- a/linux-user/ioctls.h
+++ b/linux-user/ioctls.h
@@ -748,8 +748,10 @@
   IOCTL(TUNSETQUEUE,     IOC_W, MK_PTR(MK_STRUCT(STRUCT_short_ifreq)))
   IOCTL(TUNSETIFINDEX ,  IOC_W, MK_PTR(TYPE_INT))
   /* TUNGETFILTER is not supported: see TUNATTACHFILTER. */
+#ifdef TUNSETVNETLE
   IOCTL(TUNSETVNETLE,    IOC_W, MK_PTR(TYPE_INT))
   IOCTL(TUNGETVNETLE,    IOC_R, MK_PTR(TYPE_INT))
+#endif
 #ifdef TUNSETVNETBE
   IOCTL(TUNSETVNETBE,    IOC_W, MK_PTR(TYPE_INT))
   IOCTL(TUNGETVNETBE,    IOC_R, MK_PTR(TYPE_INT))
-- 
2.25.1


