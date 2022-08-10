Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06FA958EC3B
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Aug 2022 14:44:56 +0200 (CEST)
Received: from localhost ([::1]:46398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLl4w-0005yr-Nv
	for lists+qemu-devel@lfdr.de; Wed, 10 Aug 2022 08:44:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1oLl1P-0006wx-3f
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 08:41:15 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:39847)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1oLl1N-0005PM-D5
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 08:41:14 -0400
Received: by mail-wr1-x42e.google.com with SMTP id h13so17622430wrf.6
 for <qemu-devel@nongnu.org>; Wed, 10 Aug 2022 05:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc;
 bh=2wdII7q5350dyl+ZyIL7Pkw6L02jN8t/a+pXCBjdHpw=;
 b=ORCb/eDfBtKKdbzps2w5tmBfUUErwjR9opq8BWJtZl83Q+CEfvDZTz/8sqWFOeoFs0
 bpSDwcARrsN30+06Fp1qiHedG4OAMWVAEXcBC/OrfZY+MIS4k7elTYgoZRbpl4WJyZ5b
 felXvccZXg5E6yui5dZM1FjY/HcdrhxLMY+7qYFlBdfLmmzHu6V1QRQAVSyWya/zzs5/
 ad1JKW5GBFKn9nkNp2N8VFuAINTWXobSfzMdrIt6NcDfcPVxLnni3NteAyz73UAKWzFF
 LIsSDYRD15G0eNprH3uySlYWd+Qb7oComNwtDAZ2k+w21OPCpDE9aa+Nx+w8n2a4L6ga
 eLFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=2wdII7q5350dyl+ZyIL7Pkw6L02jN8t/a+pXCBjdHpw=;
 b=ezglzsdAsfLRNBJjJpI0YeDlJf0dSfxGOV+yG2KNhLT6kyGxCMGcRK1eKdunzsZt/K
 ZMauQ1paukqadr8hQMR2DQfUPXjM1JqKR4AQWeioMvU66S34Z/nRMNNFD05eD14RCIbZ
 AaM2pzo6O8TijIWM4HzwiP4VQtTB7UTTKlSygsvSejUisfQj7pJoMeVTJO6hGCTSLX1S
 AEHyaZkTufYUdDUl0Zew89pndr8i0tUlHp42tbWjWmR8kUpJoStBNcJO06I+zOf3wamt
 idDQD0XUkmmU6mI4/HODnE8DcrcDXfQSqOwkKWoHFXYmqlvZipCYL6h5v1L1BG7RsDdC
 G/ww==
X-Gm-Message-State: ACgBeo3vu8HBbu/Dv5zsRLNMzRWjJFCKsYIHZIdnwGFLd8rQCfamXaoU
 tqvqxGWTMUkBi6slJk5NZeaYCA==
X-Google-Smtp-Source: AA6agR5Borh/n3SiCw1B1/WNk89PhMagsjdRhSOdPWxzrm5btbr7JnXiCB+Qf5pO+48T/VjdASIIcw==
X-Received: by 2002:a05:6000:181b:b0:221:119b:d26a with SMTP id
 m27-20020a056000181b00b00221119bd26amr15853755wrh.708.1660135269964; 
 Wed, 10 Aug 2022 05:41:09 -0700 (PDT)
Received: from localhost (cst2-173-67.cust.vodafone.cz. [31.30.173.67])
 by smtp.gmail.com with ESMTPSA id
 c5-20020a5d4f05000000b002205a5de337sm16335295wru.102.2022.08.10.05.41.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Aug 2022 05:41:09 -0700 (PDT)
Date: Wed, 10 Aug 2022 14:41:08 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Ben Dooks <qemu@ben.fluff.org>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, Alistair.Francis@wdc.com,
 peter.maydell@linaro.org, qemu-arm@nongnu.org
Subject: Re: [PATCH v4 6/6] hw/arm: change to use qemu_fdt_setprop_strings()
Message-ID: <20220810124108.dqmryussx5x5p7d3@kamzik>
References: <20220809185639.750345-1-qemu@ben.fluff.org>
 <20220809185639.750345-7-qemu@ben.fluff.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220809185639.750345-7-qemu@ben.fluff.org>
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=ajones@ventanamicro.com; helo=mail-wr1-x42e.google.com
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

On Tue, Aug 09, 2022 at 07:56:40PM +0100, Ben Dooks wrote:
> Change to using qemu_fdt_setprop_strings() instead of using
> \0 separated string arrays. Note, also there were a few places
> where qemu_fdt_setprop_string() can be used in the same areas.
> 
> Signed-off-by: Ben Dooks <qemu@ben.fluff.org>
> ---
> v4:
>  - fixed checkpatch errors with string
>  - fixed patch subject
> ---
>  hw/arm/boot.c             |  8 +++---
>  hw/arm/virt.c             | 28 +++++++++------------
>  hw/arm/xlnx-versal-virt.c | 51 ++++++++++++++++-----------------------
>  3 files changed, 37 insertions(+), 50 deletions(-)
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

