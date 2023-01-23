Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47C736778E5
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Jan 2023 11:15:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJtqg-0003mp-Hc; Mon, 23 Jan 2023 05:14:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1pJtqW-0003m9-Sy
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 05:14:39 -0500
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1pJtqS-0007XP-KV
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 05:14:34 -0500
Received: by mail-ed1-x531.google.com with SMTP id x36so13886885ede.13
 for <qemu-devel@nongnu.org>; Mon, 23 Jan 2023 02:14:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=AVFBKQZNyUoBTGsEwYpP77CZQH4iE/9OohcF2Hi3Hu0=;
 b=nFXAPqS0Z1SStpmN6xTsiZn3GJ0Lks2zl3C2EnYcRd9y4AIS05u32WvlI4pAIRhyn9
 C1886DRGCglmdtV612xA5sJU+++8VtkveIZkBO08c+gJD7ocmCIlp4fXluWXdRIgGWJc
 MLMXOsc7l7C8vqpc8FHYAvLTw+bdHzoACF3tAtkch2R+lmgignJcYFgl+jSlYWXkmXET
 L0Vy4F5xZ8LhwzDYC5S/RmH3szJsJOp1Bhjc1EY/m+Z4VMqwWFrSm2mqBD0fEEfhMsGL
 pjL5v3+f/RPecfFIAf42WbBMqw6feU7zdrWgv8JDEma4dDpBEt2FK82WHo7DZWY770SH
 lZuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AVFBKQZNyUoBTGsEwYpP77CZQH4iE/9OohcF2Hi3Hu0=;
 b=alOwmmMrw3mal00WxSq+rZGfXnTC1cuUatZXVc/VhK0Mu6Wc08vPjMQD5E90v6voH3
 Hln3YTSX9MPvtgOSRSg08blXQ73QAxJMNANUqtZ8TwVo2bXt1nIMWl8U7Z6/CEwt7aI7
 1GnGoZaPbvPR6GLLLibyb5/0rxNKcek6++9KAL1pUAaRUWLfxPYAFuyAE1dtgRMhzn2Z
 H337PGyv45/WtWKREE1YoaCbMyn7DBq9bPy67VOSu8NpOSdmlGAhrZbt1hkaCUOcjjol
 jSLiEytCsd54XivRbs2oflwplqWYCYW5aqDR691vxK8CVqgf0LOZ3PViolj16JUmhytd
 pO3g==
X-Gm-Message-State: AFqh2krxfva4ZkxuCqP5cZTo6gYKUd8LUR60beieAx39PlqmVk4k8nuF
 4xNfpZdV79MrnfSlAyg2Ba1g3w==
X-Google-Smtp-Source: AMrXdXsIDPrcvL3hCUVVHe4C6TfaLDz3s3OnVQokxY/2Mw+PdqzgZDmdNRsKbrGaAaDPM0v5AN1veQ==
X-Received: by 2002:a50:fa94:0:b0:493:597e:2193 with SMTP id
 w20-20020a50fa94000000b00493597e2193mr25646246edr.37.1674468871218; 
 Mon, 23 Jan 2023 02:14:31 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
 by smtp.gmail.com with ESMTPSA id
 f3-20020aa7d843000000b0049ef04ad502sm4295237eds.40.2023.01.23.02.14.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 02:14:30 -0800 (PST)
Date: Mon, 23 Jan 2023 11:14:29 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Frank Chang <frank.chang@sifive.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Ludovic Henry <ludovic@rivosinc.com>
Subject: Re: [PATCH v6 3/5] riscv: Allow user to set the satp mode
Message-ID: <20230123101429.a3x6vlatbvbp7kox@orel>
References: <20230123090324.732681-1-alexghiti@rivosinc.com>
 <20230123090324.732681-4-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230123090324.732681-4-alexghiti@rivosinc.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=ajones@ventanamicro.com; helo=mail-ed1-x531.google.com
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

On Mon, Jan 23, 2023 at 10:03:22AM +0100, Alexandre Ghiti wrote:
> RISC-V specifies multiple sizes for addressable memory and Linux probes for
> the machine's support at startup via the satp CSR register (done in
> csr.c:validate_vm).
> 
> As per the specification, sv64 must support sv57, which in turn must
> support sv48...etc. So we can restrict machine support by simply setting the
> "highest" supported mode and the bare mode is always supported.
> 
> You can set the satp mode using the new properties "sv32", "sv39", "sv48",
> "sv57" and "sv64" as follows:
> -cpu rv64,sv57=on  # Linux will boot using sv57 scheme
> -cpu rv64,sv39=on  # Linux will boot using sv39 scheme
> -cpu rv64,sv57=off # Linux will boot using sv48 scheme
> -cpu rv64          # Linux will boot using sv57 scheme by default
> 
> We take the highest level set by the user:
> -cpu rv64,sv48=on,sv57=on # Linux will boot using sv57 scheme
> 
> We make sure that invalid configurations are rejected:
> -cpu rv64,sv32=on # Can't enable 32-bit satp mode in 64-bit
> -cpu rv64,sv39=off,sv48=on # sv39 must be supported if higher modes are
>                            # enabled
> 
> We accept "redundant" configurations:
> -cpu rv64,sv48=on,sv57=off # Linux will boot using sv48 scheme
> 
> And contradictory configurations:
> -cpu rv64,sv48=on,sv48=off # Linux will boot using sv39 scheme
> 
> In addition, we now correctly set the device-tree entry 'mmu-type' using
> those new properties.

This sentence no longer applies to this patch.

Thanks,
drew

