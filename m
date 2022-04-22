Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADECC50BF7F
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 20:28:34 +0200 (CEST)
Received: from localhost ([::1]:34696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhy1B-0005Wb-R4
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 14:28:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhxuS-0005fG-9e
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 14:21:36 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:41789)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhxuQ-0003ja-0P
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 14:21:35 -0400
Received: by mail-pl1-x62a.google.com with SMTP id s14so12583179plk.8
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 11:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=sPYNVJNzQw3WgpRvC+Tu+LuM5XSxak5qJ76EF4by+IA=;
 b=JKW4pbZYAdVaXyE838xqo+FS8P7PPvpBEhMdfcHrUnBwsf9bv0uwGgMeccJfCDVVdu
 iAW9CR3a2UEwXkImNtpJRyHJrn03dAT1++ROiKB8k5O/9B69xo/hVfPD+5HGVRFqaNuP
 0nqbRbwPCO8NjVPqw+/pe5gOUi/TjMhIK2/mV8y7+78b7qZ0Z77R4nIiqJHvZQdu//Bw
 muPizyfk7qpSL1eoAFjCiCUiKcJg8aMmWu3ENCjCv7y7W3SK5jUGwTY134HB8bB5DtTK
 L6I5Afv4joElRwg1zrSQln8cua4Aw8LlKBiTPy0zxsu3D1rrRbFsQs4of6YSQL71cFJf
 P93w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=sPYNVJNzQw3WgpRvC+Tu+LuM5XSxak5qJ76EF4by+IA=;
 b=gjuBekVd8O8xzxfnQKbtXI3QNHOMaWpFrF+qdNqI2gE4UaVhDBUBdVogymK9+bBSWW
 9622eiQYIcSsmInFhcMJmyLx6TgzACxmbqDX8YCUvEpvKyI9sZAK4zEWA3p/YVihmD70
 XzGzWM5mIwFjgXeM9LykR7FysXfAQcX36cj7LuYPHKPLANikUMuznAGlVkpAJbh1lfsm
 8IdmCdtP0sqHO//zFBYu8/mbZ3uDZyL0j77RyrlwdRC9ke3WjKD/ghOXQxIq5UyqF+qb
 VmP5LuPaQZTyLkTsRoEtH5DVXsHiYBn610TCs3dKpI422muI8awqT/EZaYSNFtCmrAcq
 pObA==
X-Gm-Message-State: AOAM533D03SyyF8SRoLrSIJonJSkvJ5hNDPLpG9CVQBquToXwIEHBacE
 6aCUgvO8aLR1cPRuHxQWGeqmXg==
X-Google-Smtp-Source: ABdhPJw6kVhyc+1LINpETf02FguTQPdnuPu2sb2HjPB4C1jm4FoYlSR8jw8p5Oj7IwH6DgDKFCDl8Q==
X-Received: by 2002:a17:90a:e604:b0:1d3:7887:3508 with SMTP id
 j4-20020a17090ae60400b001d378873508mr16830022pjy.224.1650651692383; 
 Fri, 22 Apr 2022 11:21:32 -0700 (PDT)
Received: from ?IPV6:2607:fb90:27d0:b0f2:7bc8:cd1d:9e0a:e3d7?
 ([2607:fb90:27d0:b0f2:7bc8:cd1d:9e0a:e3d7])
 by smtp.gmail.com with ESMTPSA id
 q15-20020a056a00084f00b0050ab60bf37fsm3389021pfk.22.2022.04.22.11.21.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Apr 2022 11:21:31 -0700 (PDT)
Message-ID: <c97f19cc-082e-3133-e0e1-121497e76441@linaro.org>
Date: Fri, 22 Apr 2022 11:20:53 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PULL v2 00/61] target-arm queue
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20220422134739.2318078-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220422134739.2318078-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 4/22/22 06:47, Peter Maydell wrote:
> This pullreq is (1) my GICv4 patches (2) most of the first third of RTH's
> cleanup patchset (3) one patch fixing an smmuv3 bug...
> 
> v2 changes: fix build failure on aarch64 hosts by moving the
> gicv3_add_its() and gicv3_foreach_its() functions to
> arm_gicv3_its_common.h.
> 
> thanks
> -- PMM
> 
> 
> The following changes since commit a74782936dc6e979ce371dabda4b1c05624ea87f:
> 
>    Merge tag 'pull-migration-20220421a' of https://gitlab.com/dagrh/qemu into staging (2022-04-21 18:48:18 -0700)
> 
> are available in the Git repository at:
> 
>    https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20220422-1
> 
> for you to fetch changes up to c3ca7d56c4790c2223122f7e84b71161cd36dbce:
> 
>    hw/arm/smmuv3: Pass the actual perm to returned IOMMUTLBEntry in smmuv3_translate() (2022-04-22 14:44:55 +0100)
> 
> ----------------------------------------------------------------
> target-arm queue:
>   * Implement GICv4 emulation
>   * Some cleanup patches in target/arm
>   * hw/arm/smmuv3: Pass the actual perm to returned IOMMUTLBEntry in smmuv3_translate()

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/7.1 as appropriate.


r~



> 
> ----------------------------------------------------------------
> Peter Maydell (41):
>        hw/intc/arm_gicv3_its: Add missing blank line
>        hw/intc/arm_gicv3: Sanity-check num-cpu property
>        hw/intc/arm_gicv3: Insist that redist region capacity matches CPU count
>        hw/intc/arm_gicv3: Report correct PIDR0 values for ID registers
>        target/arm/cpu.c: ignore VIRQ and VFIQ if no EL2
>        hw/intc/arm_gicv3_its: Factor out "is intid a valid LPI ID?"
>        hw/intc/arm_gicv3_its: Implement GITS_BASER2 for GICv4
>        hw/intc/arm_gicv3_its: Implement VMAPI and VMAPTI
>        hw/intc/arm_gicv3_its: Implement VMAPP
>        hw/intc/arm_gicv3_its: Distinguish success and error cases of CMD_CONTINUE
>        hw/intc/arm_gicv3_its: Factor out "find ITE given devid, eventid"
>        hw/intc/arm_gicv3_its: Factor out CTE lookup sequence
>        hw/intc/arm_gicv3_its: Split out process_its_cmd() physical interrupt code
>        hw/intc/arm_gicv3_its: Handle virtual interrupts in process_its_cmd()
>        hw/intc/arm_gicv3: Keep pointers to every connected ITS
>        hw/intc/arm_gicv3_its: Implement VMOVP
>        hw/intc/arm_gicv3_its: Implement VSYNC
>        hw/intc/arm_gicv3_its: Implement INV command properly
>        hw/intc/arm_gicv3_its: Implement INV for virtual interrupts
>        hw/intc/arm_gicv3_its: Implement VMOVI
>        hw/intc/arm_gicv3_its: Implement VINVALL
>        hw/intc/arm_gicv3: Implement GICv4's new redistributor frame
>        hw/intc/arm_gicv3: Implement new GICv4 redistributor registers
>        hw/intc/arm_gicv3_cpuif: Split "update vIRQ/vFIQ" from gicv3_cpuif_virt_update()
>        hw/intc/arm_gicv3_cpuif: Support vLPIs
>        hw/intc/arm_gicv3_cpuif: Don't recalculate maintenance irq unnecessarily
>        hw/intc/arm_gicv3_redist: Factor out "update hpplpi for one LPI" logic
>        hw/intc/arm_gicv3_redist: Factor out "update hpplpi for all LPIs" logic
>        hw/intc/arm_gicv3_redist: Recalculate hppvlpi on VPENDBASER writes
>        hw/intc/arm_gicv3_redist: Factor out "update bit in pending table" code
>        hw/intc/arm_gicv3_redist: Implement gicv3_redist_process_vlpi()
>        hw/intc/arm_gicv3_redist: Implement gicv3_redist_vlpi_pending()
>        hw/intc/arm_gicv3_redist: Use set_pending_table_bit() in mov handling
>        hw/intc/arm_gicv3_redist: Implement gicv3_redist_mov_vlpi()
>        hw/intc/arm_gicv3_redist: Implement gicv3_redist_vinvall()
>        hw/intc/arm_gicv3_redist: Implement gicv3_redist_inv_vlpi()
>        hw/intc/arm_gicv3: Update ID and feature registers for GICv4
>        hw/intc/arm_gicv3: Allow 'revision' property to be set to 4
>        hw/arm/virt: Use VIRT_GIC_VERSION_* enum values in create_gic()
>        hw/arm/virt: Abstract out calculation of redistributor region capacity
>        hw/arm/virt: Support TCG GICv4
> 
> Richard Henderson (19):
>        target/arm: Update ISAR fields for ARMv8.8
>        target/arm: Update SCR_EL3 bits to ARMv8.8
>        target/arm: Update SCTLR bits to ARMv9.2
>        target/arm: Change DisasContext.aarch64 to bool
>        target/arm: Change CPUArchState.aarch64 to bool
>        target/arm: Extend store_cpu_offset to take field size
>        target/arm: Change DisasContext.thumb to bool
>        target/arm: Change CPUArchState.thumb to bool
>        target/arm: Remove fpexc32_access
>        target/arm: Split out set_btype_raw
>        target/arm: Split out gen_rebuild_hflags
>        target/arm: Simplify GEN_SHIFT in translate.c
>        target/arm: Simplify gen_sar
>        target/arm: Simplify aa32 DISAS_WFI
>        target/arm: Use tcg_constant in translate-m-nocp.c
>        target/arm: Use tcg_constant in translate-neon.c
>        target/arm: Use smin/smax for do_sat_addsub_32
>        target/arm: Use tcg_constant in translate-vfp.c
>        target/arm: Use tcg_constant_i32 in translate.h
> 
> Xiang Chen (1):
>        hw/arm/smmuv3: Pass the actual perm to returned IOMMUTLBEntry in smmuv3_translate()
> 
>   docs/system/arm/virt.rst               |   5 +-
>   hw/intc/gicv3_internal.h               | 213 +++++++-
>   include/hw/arm/virt.h                  |  19 +-
>   include/hw/intc/arm_gicv3_common.h     |  13 +
>   include/hw/intc/arm_gicv3_its_common.h |  19 +
>   target/arm/cpu.h                       |  59 ++-
>   target/arm/translate-a32.h             |  13 +-
>   target/arm/translate.h                 |  17 +-
>   hw/arm/smmuv3.c                        |   2 +-
>   hw/arm/virt.c                          | 102 +++-
>   hw/intc/arm_gicv3_common.c             |  54 +-
>   hw/intc/arm_gicv3_cpuif.c              | 195 ++++++--
>   hw/intc/arm_gicv3_dist.c               |   7 +-
>   hw/intc/arm_gicv3_its.c                | 876 +++++++++++++++++++++++++++------
>   hw/intc/arm_gicv3_its_kvm.c            |   2 +
>   hw/intc/arm_gicv3_kvm.c                |   5 +
>   hw/intc/arm_gicv3_redist.c             | 480 +++++++++++++++---
>   linux-user/arm/cpu_loop.c              |   2 +-
>   target/arm/cpu.c                       |  16 +-
>   target/arm/helper-a64.c                |   4 +-
>   target/arm/helper.c                    |  19 +-
>   target/arm/hvf/hvf.c                   |   2 +-
>   target/arm/m_helper.c                  |   6 +-
>   target/arm/op_helper.c                 |  13 -
>   target/arm/translate-a64.c             |  50 +-
>   target/arm/translate-m-nocp.c          |  12 +-
>   target/arm/translate-neon.c            |  21 +-
>   target/arm/translate-sve.c             |   9 +-
>   target/arm/translate-vfp.c             |  76 +--
>   target/arm/translate.c                 | 101 ++--
>   hw/intc/trace-events                   |  18 +-
>   31 files changed, 1890 insertions(+), 540 deletions(-)
> 


