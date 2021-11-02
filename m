Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6691443964
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 00:16:01 +0100 (CET)
Received: from localhost ([::1]:54494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mi30a-00028s-VY
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 19:16:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mi2f8-0007ki-DW
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 18:53:50 -0400
Received: from mail-io1-xd2a.google.com ([2607:f8b0:4864:20::d2a]:42555)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mi2f5-0002to-1l
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 18:53:50 -0400
Received: by mail-io1-xd2a.google.com with SMTP id n128so563160iod.9
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 15:53:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rJiJ1S+SRfN5kNalL+C6IW22wSVGuIlNDO4cLpe4SBI=;
 b=rSdUu2pCVF6F4heKIRirn25rYOtzWyQmcy1U/EF2rzjgHTG3Qg0wmegAMNdDaF3cEA
 S+ezPeHudPDuzSQJ5QoDnrgIQt1lgZl8iJtdnUXMatfSQrs3OLqbQZ7wZEr+e+IUx6m/
 rXshAx7/HJpJzTOLBA8xU+hRNxwOSSbKZMgdrjlxf1+GeQgtzVz8Lg+GaimXaqj8CQvw
 k9s4pE94KEwUiFciB18pMWaLOvqthXwFEGfl5EEoY+9EzCHpolittvFyo6MnhH0hM+7K
 4n+vK68WAUlBgqwsGvgZr+9hCJvjeoAl7pdyYNg4yticbztJggDbeO5WI4JcrQS5ge19
 fM/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rJiJ1S+SRfN5kNalL+C6IW22wSVGuIlNDO4cLpe4SBI=;
 b=AWVZuY7MiBuim0oZdmLQFr/9xTKKLw3guQXy1zVfd3plLYrxxzhVBZuziwYndjWxVz
 /uuhlV74TaGfpJI/kWAx7PyppBHRcpBaqSFFZyYLzXAstS6uEoiEGK3rYhXIvRM/cXMO
 NRV5ToYpnYyZg8/RjXJamXfmloSe189waq26Afz24vmrMRRlP2pp/quTmF4bhMM9Hm29
 TEdZCXdfjhBrBRg38vdGNy0Bc29tSEZrfAinGYXty2QvnvsGrm/3iQU53WHgrcSPVHHd
 dFwQCbJcutkH8ySQSFnZmRbXGvadPe/qDdhmW3+hMH1HcBefUPptOshhmW6Iqxz1L4/C
 g/TA==
X-Gm-Message-State: AOAM530mDlh+hRDdafhKAjKgJgw1m9dGgvxRi3YW0fB3Ds6E9IIT1C/s
 i5KsSi1dfMZh5uJpigP9USiyeNQryMTeKA==
X-Google-Smtp-Source: ABdhPJw/2rMlvLO+ZgW9tKD8PqltL1E7TNRKQXBulAiN1Z0s4fdyAR1aUPp1HkG1QNCAO2I5rSPirQ==
X-Received: by 2002:a05:6638:1242:: with SMTP id
 o2mr16083297jas.68.1635893625234; 
 Tue, 02 Nov 2021 15:53:45 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id h14sm205427ils.75.2021.11.02.15.53.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 15:53:44 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 25/30] bsd-user/arm/target_arch_signal.h: arm
 get_ucontext_sigreturn
Date: Tue,  2 Nov 2021 16:52:43 -0600
Message-Id: <20211102225248.52999-26-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211102225248.52999-1-imp@bsdimp.com>
References: <20211102225248.52999-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d2a;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
Cc: Stacey Son <sson@FreeBSD.org>, qemu-trivial@nongnu.org,
 Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Philippe Mathieu-Daude <f4bug@amsat.org>, Laurent Vivier <laurent@vivier.eu>,
 Michael Tokarev <mjt@tls.msk.ru>, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Update ucontext to implement sigreturn.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/arm/target_arch_signal.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/bsd-user/arm/target_arch_signal.h b/bsd-user/arm/target_arch_signal.h
index 3b2f56ffab..3db76c9201 100644
--- a/bsd-user/arm/target_arch_signal.h
+++ b/bsd-user/arm/target_arch_signal.h
@@ -254,4 +254,13 @@ static inline abi_long set_mcontext(CPUARMState *env, target_mcontext_t *mcp,
     return err;
 }
 
+/* Compare to arm/arm/machdep.c sys_sigreturn() */
+static inline abi_long get_ucontext_sigreturn(CPUARMState *env,
+        abi_ulong target_sf, abi_ulong *target_uc)
+{
+    *target_uc = target_sf;
+
+    return 0;
+}
+
 #endif /* !_TARGET_ARCH_SIGNAL_H_ */
-- 
2.33.0


