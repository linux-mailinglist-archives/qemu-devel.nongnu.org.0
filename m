Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0273438F149
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 18:13:16 +0200 (CEST)
Received: from localhost ([::1]:48664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llDCd-0002yk-2J
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 12:13:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llD9c-0007mP-Fh
 for qemu-devel@nongnu.org; Mon, 24 May 2021 12:10:08 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:52811)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llD9a-0001br-TD
 for qemu-devel@nongnu.org; Mon, 24 May 2021 12:10:08 -0400
Received: by mail-pj1-x1032.google.com with SMTP id q6so15098272pjj.2
 for <qemu-devel@nongnu.org>; Mon, 24 May 2021 09:10:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CYhsjndEznet9R16p0vFDe7S8z/CIhlPB7iI4b935nI=;
 b=afS3EFpmOZNIpgsZPPJN3uG6sjBLFkXe4HDEY6Wmns0H1uPfoskZpz2GY3+d8iw54y
 WfCIVSqj68CrKou7KAVa7VJjVCZEukDYGztbH14cxSwUBwSId1Oc2Gg5x5DJVPIVf/WW
 JX3bhj3armXzxaLXlKQNOQPZ1ziDqcxUync/GrFtpl21P214qS9zOTmeCbBWasNWtpq1
 FywUOUJpm8rh1GJhQI4ydQarSBWbw+/EGSRps6zy9xH9LQXlqnYGjKdcrGAm3lTBcL+J
 RvVx0GEP5lxWcF7f+hZNhU5EuJcxIzrtZo9a9NkUhGpwqvpbURan27l4AN4kfa12oAIa
 /Q8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CYhsjndEznet9R16p0vFDe7S8z/CIhlPB7iI4b935nI=;
 b=KmGAAOAYcZNm/moj2vrUSpktTBxg9nja9+IqfavjEoqe7tu/AO6VHSjq7PGVGWDBAe
 v57T7dm12w6/pYT7NV40oYOAFjekD/vBLBEn2IHsAYquI2DJWyILavyk1pEkbYcPoO3H
 mnt48owneneiop4jgpikuZPBexBKxl5JfF4W2ERidsZy3vW9Ialyi7LzR28snkXv+sJP
 QiHHqIS34gklhoI7Bo1KazGMyEFphU3NxSzpc1hKGIEYcTds2YvZqDAkGt2teAJwFCut
 bPw4RMlUfwR8nJ69VJ6VzUvC3dOTHl0lZzs/CukvlLEMItXCfo7dJ3cGvJ5xayIMPNKv
 SqdQ==
X-Gm-Message-State: AOAM531SLeJtqg6TZxCdRmZGXNPUq0Jl/0bxo1fRC2iENibZpkmP/F0l
 foqK09YLUKBh2prc0EK5i77LKg==
X-Google-Smtp-Source: ABdhPJy1YjB3SOARHl780aUaqLHo8DyMFX83rOaMqU/joJMIgEyd1P9pmI74tCLhdgLQ51jVsedh8g==
X-Received: by 2002:a17:902:9885:b029:f5:fc21:7837 with SMTP id
 s5-20020a1709029885b02900f5fc217837mr23425258plp.60.1621872605152; 
 Mon, 24 May 2021 09:10:05 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id l20sm10268397pjq.38.2021.05.24.09.10.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 09:10:04 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: peter.maydell@linaro.org
Subject: Re: [PATCH] hw/intc/arm_gicv3_cpuif: Fix EOIR write access check logic
Date: Mon, 24 May 2021 09:10:03 -0700
Message-Id: <20210524161003.18335-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210510150016.24910-1-peter.maydell@linaro.org>
References: <20210510150016.24910-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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
Cc: qemu-arm@nongnu.org, ckim@etri.re.kr, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> In icc_eoir_write() we assume that we can identify the group of the
> IRQ being completed based purely on which register is being written
> to and the current CPU state, and that "CPU state matches group
> indicated by register" is the only necessary access check.
> 
> This isn't correct: if the CPU is not in Secure state then EOIR1 will
> only complete Group 1 NS IRQs, but if the CPU is in EL3 it can
> complete both Group 1 S and Group 1 NS IRQs.  (The pseudocode
> ICC_EOIR1_EL1 makes this clear.) We were also missing the logic to
> prevent EOIR0 writes completing G0 IRQs when they should not.
> 
> Rearrange the logic to first identify the group of the current
> highest priority interrupt and then look at whether we should
> complete it or ignore the access based on which register was accessed
> and the state of the CPU.  The resulting behavioural change is:
>  * EL3 can now complete G1NS interrupts
>  * G0 interrupt completion is now ignored if the GIC
>    and the CPU have the security extension enabled and
>    the CPU is not secure
> 
> Reported-by: Chan Kim <ckim@etri.re.kr>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/intc/arm_gicv3_cpuif.c | 48 ++++++++++++++++++++++++++-------------
>  1 file changed, 32 insertions(+), 16 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

