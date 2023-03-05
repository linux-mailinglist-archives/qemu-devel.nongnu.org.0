Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B53E36AB38C
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 00:42:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYxyz-0007ID-CP; Sun, 05 Mar 2023 18:41:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pYxyw-0007Hf-MI
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 18:41:34 -0500
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pYxyu-0006qq-Ee
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 18:41:34 -0500
Received: by mail-pl1-x62b.google.com with SMTP id y11so8450142plg.1
 for <qemu-devel@nongnu.org>; Sun, 05 Mar 2023 15:41:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1678059691;
 h=content-transfer-encoding:mime-version:message-id:to:from:cc
 :in-reply-to:subject:date:from:to:cc:subject:date:message-id
 :reply-to; bh=z+SBnkZV/ElejRw9FztVceoACOQeG+lKO82CIMPVr+g=;
 b=fQgi5WBfM11ENckGUIvC3MpKjN3LlC/hbqOipoXfVwbqoJsNBrhLrvZ5vSStpBIGf+
 8sueeRpOebFksetI3aVRj2gWlabuJog4acKHy6s9OsxXjg6twMVwXlJPtZVX0mb4FIQi
 +0272Cghb1zbLp7whkC/2gtfHfHcchHgWuzBgf4IxBdfWxm9fdr/kcPHi5P/p/luUitG
 iq+vnwWe4BopT8WK0Al0Y8xqWW5xEoaVE36fUMQvWxpl4n6cZt5s6mNN4hHGN6T9mEZ7
 fIyGV4ZV4cY8a5LTNRCi57aJb1WIOoi6/Y5MC+vj2QuIDhFu627272MkwNGcEjCDicae
 +X9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678059691;
 h=content-transfer-encoding:mime-version:message-id:to:from:cc
 :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=z+SBnkZV/ElejRw9FztVceoACOQeG+lKO82CIMPVr+g=;
 b=qEJXOXJ5L8m+AiWhoXjRDWQ6AgojYDlbE03viYZUArYf3ogaog44ce75WzagsNKpzz
 hNQ7qbVbwOkBrufdbKmJkznlST5vKY2Z+smPOdjNAw4eAcigGQG9/+qPfvMGnIsK4vpp
 BH7TCJ8q2BX/9dCDlz0YJTDYV3SdgncukAzwXV1iHMjZonVeFR/OFV8aPgiQtWZ8S5ja
 FdjioVr+7ubfFCwigGrM/8AotzPtlVv0cjDYEEJS/BLslfOmKw871VlXwBUob+4GKutS
 RmQynJ11LU6BeCtuv9x9DdQxkAdan+0AuNCd4sxu5KSrVPg/wwalVw7A/Kfnw89XRTfG
 tMaA==
X-Gm-Message-State: AO0yUKW8ksf/gvo4uQvcrItdk909YScdIebI/3IRVSGiU/j8guDzoQKl
 URkAMpWCg3OUfYQG2Abq1EpTUVbMN0kcCND2EeQ=
X-Google-Smtp-Source: AK7set98k2rd2aPBLT4CzOyV04lJPwM/HeiNR1qdCPlxtnD5M3XPWr6iym3cer0WI802lemFcj1nUw==
X-Received: by 2002:a17:90b:1d0f:b0:237:752f:1af0 with SMTP id
 on15-20020a17090b1d0f00b00237752f1af0mr9566357pjb.29.1678059690542; 
 Sun, 05 Mar 2023 15:41:30 -0800 (PST)
Received: from localhost ([50.221.140.188]) by smtp.gmail.com with ESMTPSA id
 r1-20020a17090a4dc100b00232cf6186fdsm6472719pjl.30.2023.03.05.15.41.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Mar 2023 15:41:30 -0800 (PST)
Date: Sun, 05 Mar 2023 15:41:30 -0800 (PST)
X-Google-Original-Date: Sun, 05 Mar 2023 15:40:30 PST (-0800)
Subject: Re: [PATCH 0/2] Risc-V CPU state by hart ID
In-Reply-To: <20230303065055.915652-1-mchitale@ventanamicro.com>
CC: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, mchitale@ventanamicro.com,
 Alistair Francis <Alistair.Francis@wdc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: mchitale@ventanamicro.com
Message-ID: <mhng-c65e100e-e598-446c-8ad6-bfb18e3334de@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=palmer@rivosinc.com; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Thu, 02 Mar 2023 22:50:53 PST (-0800), mchitale@ventanamicro.com wrote:
> Currently a Risc-V platform cannot realizes multiple CPUs with non contiguous
> hart IDs because the APLIC, IMSIC and ACLINT emulation code uses the
> contiguous logical CPU ID to fetch per CPU state.
>
> This patchset implements cpu_by_arch_id for Risc-V to get the CPU state
> by hart ID which may be sparse instead of the contigous logical CPU id.
>
> Mayuresh Chitale (2):
>   target/riscv: cpu: Implement get_arch_id callback
>   hw: intc: Use cpu_by_arch_id to fetch CPU state
>
>  hw/intc/riscv_aclint.c | 16 ++++++++--------
>  hw/intc/riscv_aplic.c  |  4 ++--
>  hw/intc/riscv_imsic.c  |  6 +++---
>  target/riscv/cpu.c     |  8 ++++++++
>  4 files changed, 21 insertions(+), 13 deletions(-)

Thanks, these are queue up on riscv-to-apply.next.

