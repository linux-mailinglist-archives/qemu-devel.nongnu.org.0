Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24F64698FCE
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 10:29:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSaa1-0000ou-1r; Thu, 16 Feb 2023 04:29:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1pSaZz-0000oc-FD
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 04:29:27 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1pSaZx-0007vW-TJ
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 04:29:27 -0500
Received: by mail-wr1-x42b.google.com with SMTP id h16so1161917wrz.12
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 01:29:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=fHt8/v+i89x/khGd/domcDyWtCri3NRC1S/3qsS9eNw=;
 b=EyegGGPcZE6KNsreK/8yfGmiwLMcV8R+qujwquCb5QYcuj6VIXSxTOUQJp99INrhVE
 Jg7Miue5pw+n2yLCn/owX2gzKqgPHdDJoIAmLWQDHdBLPz0HXLgWvMgHv1Pjp/0WXNqY
 57lcAKUfaKehEHFDo6kFsHU8t3eD4xSrMlEcIh8siXDmVKC9QTiji4FF3XhMe0G182+x
 6banuIVAFMlVb9VCl6FOjoSVVXOYJDc/i9yX0PVwVEJLD0ABlBiJcupQFGdXlZ1DVjuv
 5e4ePlsmo8pP0YSjkVRIgqw3jlPiZWiyT6Ea4wbMLCjtoojDn/3OaLt9o4uPS9SIs92E
 jpuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fHt8/v+i89x/khGd/domcDyWtCri3NRC1S/3qsS9eNw=;
 b=0FYaYpwtw/cdc+6lcNzB3psRvJalholc0yDl+72kIG452sH8xpSn7HBnfMnj7Fu2r3
 uRCm/vVa69mPW2B499N+tKVdy7G+1ZzLV0YkItmgTG3ihMquAJ6FeiiyY9X7Fb2AdkFO
 ijIcI/O3sMePiGnmKQCiHI/LcCnak/a1YNaaMifeNIZTijg4QSqZoKM/LHv8YGeo7Xxb
 UNIFJZPgAq5mKu+3xgiKAL34SFm/UJROBFezuaiyYBcraZzV43ZniiDct8rwViZsMDB+
 4AMil40Akj9Zz6Om+eF71VtMqVFXKP+iMTwNRbUw7lJyANzPdQ3iAgnDODsPl9AceQXS
 NBuA==
X-Gm-Message-State: AO0yUKV8GDc75+sX5pHxWci8Sn2SQmMGJ0eY739mqZO28M1wTWOH8g/y
 /oKYRaaJpzC2N13P8JZLi8KHKw==
X-Google-Smtp-Source: AK7set+nShakhvjQW4f1tmDflnfGlKBM3TtaEI/WgZdevpxxNekSJRKwvSRDN5nS4EzRhjWtRPUEIA==
X-Received: by 2002:a5d:4e0c:0:b0:2c5:5fc7:2862 with SMTP id
 p12-20020a5d4e0c000000b002c55fc72862mr4020646wrt.69.1676539764290; 
 Thu, 16 Feb 2023 01:29:24 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
 by smtp.gmail.com with ESMTPSA id
 v5-20020adff685000000b002c559def236sm180848wrp.57.2023.02.16.01.29.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 01:29:23 -0800 (PST)
Date: Thu, 16 Feb 2023 10:29:22 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com
Subject: Re: [PATCH v3 02/10] target/riscv: always allow write_misa() to
 write MISA
Message-ID: <20230216092922.sxxwuizbpj65zt4z@orel>
References: <20230215185726.691759-1-dbarboza@ventanamicro.com>
 <20230215185726.691759-3-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230215185726.691759-3-dbarboza@ventanamicro.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=ajones@ventanamicro.com; helo=mail-wr1-x42b.google.com
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

On Wed, Feb 15, 2023 at 03:57:18PM -0300, Daniel Henrique Barboza wrote:
> At this moment, and apparently since ever, we have no way of enabling
> RISCV_FEATURE_MISA. This means that all the code from write_misa(), all
> the nuts and bolts that handles how to properly write this CSR, has
> always been a no-op as well because write_misa() will always exit
> earlier.
> 
> This seems to be benign in the majority of cases. Booting an Ubuntu
> 'virt' guest and logging all the calls to 'write_misa' shows that no
> writes to MISA CSR was attempted. Writing MISA, i.e. enabling/disabling
> RISC-V extensions after the machine is powered on, seems to be a niche
> use.
> 
> Regardless, the spec says that MISA is a WARL read-write CSR, and gating
> the writes in the register doesn't make sense. OS and applications
> should be wary of the consequences when writing it, but the write itself
> must always be allowed.

The write is already allowed, i.e. no exception is raised when writing it.
The spec only says that the fields may/can be writable. So we can
correctly implement the spec with just

 write_misa()
 {
   return RISCV_EXCP_NONE;
 }

as it has effectively been implemented to this point.

Based on Weiwei Li's pointing out of known bugs, and the fact that
this function has likely never been tested, then maybe we should just
implement it as above for now. Once a better solution to extension
sanity checking exists and a use (or at least test) case arises, then
the function could be expanded with some actually writable bits. (Also,
I think that when/if we do the expansion, then something like the misa_w
config proposed in the previous version of this series may still be
needed in order to allow opting-in/out of the behavior change.)

Thanks,
drew

