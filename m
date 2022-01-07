Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E35E487B0E
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 18:10:58 +0100 (CET)
Received: from localhost ([::1]:50950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5slT-0001Ez-9i
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 12:10:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n5se9-0003Y6-Ie
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 12:03:21 -0500
Received: from [2a00:1450:4864:20::432] (port=43889
 helo=mail-wr1-x432.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n5se6-00043c-PP
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 12:03:21 -0500
Received: by mail-wr1-x432.google.com with SMTP id o3so12211084wrh.10
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 09:03:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0nZyFVRLRM6IRGy6cUUpenOMXwoZRgiGiU7K35XPPuA=;
 b=DmSs+sFFvOQ99bXVVtrq+++GFYF9JlJ59Nh/iJCLbSWoDYZnkmPWkZ6TVpotRWx0pd
 /eb+hfIYLI9yAW44uohyHJMniR682LZRZ1avAIAHXxYPqX0SJfFmZUr9qChfi/izQmBI
 T+y47gb90p4x3MwSk6WDHCcDIcpcCZpiTbVqy0kDW6bycqyxk22SWM2Is/1Ynrun19m+
 98LJ4oNK7L78txd9Fr1ldnsoKL6pLkGYGll+cZTZMTEkbqznzKbuifidbc+g9qSb9Hth
 XbFnueCfh6tY3u+ZwV2sr4mGyo7Qiv8F5QA1tbNgLHjIKyC2yfJ3ZIW39ZEUpxlS7ck9
 PTpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0nZyFVRLRM6IRGy6cUUpenOMXwoZRgiGiU7K35XPPuA=;
 b=3KwbJTMAxpd36TsAliVEbCykMpBtIu6VT1jaZditk+vRKabWhdfID1Hj3KHzA87uSN
 /qCHxiHMfhWJtvHLpGcvIjeNqWnA7k7+j7Sg4V6ub7VrN61FNR5EFfujGZdsrFft8evi
 X63+MZ3RGrg99AA6qtKI5FywojA1vV1Mtv7O6XjoQKqwqLB2mI1kZzA017jNxdRJ6TVT
 ff3HskJ4YHDMVyfqK2n8M9J2opT+FJqTkHKd80r2ER3YJxGdcoXFbG2TRUg5/Vvq3emf
 biM7Uuvy+dxqZ1s+CBmmf9s2Mp19ILeJvE4OphdaFce9FR579+s9BvwK9SWxW7RMFxNR
 JlSA==
X-Gm-Message-State: AOAM533PiLg/4zXa2rYeclmPQLQ+7bCsT5z8ub6huw2B74HgGRJnEUZE
 vgWZ69wDODZ0vFZMStAPePM0HEoWiKsZuElLppAo+g==
X-Google-Smtp-Source: ABdhPJx6xhkgwnGRPAUwDxOlVw8gEHWp4rMdcOtwCGpAjGFMrAym5hCzg7aP9QineR3RgFnduo/KWt4cA//lYUXqccY=
X-Received: by 2002:a5d:64c3:: with SMTP id f3mr54018359wri.295.1641574996901; 
 Fri, 07 Jan 2022 09:03:16 -0800 (PST)
MIME-Version: 1.0
References: <771c599a-3ea5-8d59-909a-05f127c8ff0e@suse.com>
In-Reply-To: <771c599a-3ea5-8d59-909a-05f127c8ff0e@suse.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 7 Jan 2022 17:03:05 +0000
Message-ID: <CAFEAcA_kjSbgdG=iNaDJV26ZEZT4HR9P-dhEQSs2izG510H3YQ@mail.gmail.com>
Subject: Re: [PATCH] hw/intc/arm_gic: Allow reset of the running priority
To: Petr Pavlu <petr.pavlu@suse.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::432
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 14 Dec 2021 at 17:28, Petr Pavlu <petr.pavlu@suse.com> wrote:
> When running Linux on a machine with GICv2, the kernel can crash while
> processing an interrupt and can subsequently start a kdump kernel from
> the active interrupt handler. In such a case, the crashed kernel might
> not gracefully signal the end of interrupt to the GICv2 hardware. The
> kdump kernel will however try to reset the GIC state on startup to get
> the controller into a sane state, in particular the kernel writes ones
> to GICD_ICACTIVERn and wipes out GICC_APRn to make sure that no
> interrupt is active.
>
> The patch makes sure that this reset works for the GICv2 emulation in
> QEMU too and the kdump kernel starts receiving interrupts. It adds
> a logic to recalculate the running priority when GICC_APRn/GICC_NSAPRn
> is written and implements read of GICC_IIDR so the kernel can recognize
> that the GICv2 with GICC_APRn is present.
>
> The described scenario can be reproduced on an AArch64 QEMU virt machine
> with a kdump-enabled Linux system by using the softdog module. The kdump
> kernel will hang at some point because QEMU still thinks the running
> priority is that of the timer interrupt and asserts no new interrupts to
> the system:
> $ modprobe softdog soft_margin=10 soft_panic=1
> $ cat > /dev/watchdog
> [Press Enter to start the watchdog, wait for its timeout and observe
> that the kdump kernel hangs on startup.]

Hi; thanks for this patch and sorry I haven't got to it earlier
(I've been on holiday). Both the mishandling of the cached
priority and the failure to implement GICC_IIDR are definitely bugs,
but I think they are distinct bugs. Could you split this into a two
patch series, please ? (If you don't have time to do the respin,
let me know and I can do it at this end.)

> Signed-off-by: Petr Pavlu <petr.pavlu@suse.com>
> ---
>  hw/intc/arm_gic.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
> index a994b1f024..2edbc4cb46 100644
> --- a/hw/intc/arm_gic.c
> +++ b/hw/intc/arm_gic.c
> @@ -1662,6 +1662,10 @@ static MemTxResult gic_cpu_read(GICState *s, int cpu, int offset,
>          }
>          break;
>      }
> +    case 0xfc:
> +        /* GICv1/2, ARM implementation */
> +        *data = (s->revision << 16) + 0x43b;

This is correct for GICv1 and GICv2, but not for 11MPCore, whose
interrupt controller has no GICC_IIDR:

https://developer.arm.com/documentation/ddi0360/e/mpcore-distributed-interrupt-controller/cpu-interface-registers-definition?lang=en

So this should be

    if (s->revision == REV_11MPCORE) {
        /* Reserved on 11MPCore */
        *data = 0;
    } else {
        /* GICv1 or v2; Arm implementation */
        *data = (s->revision << 16) | 0x43b;
    }

(also using '|' rather than '+' since we're assembling a value
as a bunch of bit operations, not doing arithmetic on it. The
end result is the same but I think '|' is clearer stylistically.)

> +        break;
>      default:
>          qemu_log_mask(LOG_GUEST_ERROR,
>                        "gic_cpu_read: Bad offset %x\n", (int)offset);
> @@ -1727,6 +1731,7 @@ static MemTxResult gic_cpu_write(GICState *s, int cpu, int offset,
>          } else {
>              s->apr[regno][cpu] = value;
>          }
> +        s->running_priority[cpu] = gic_get_prio_from_apr_bits(s, cpu);
>          break;
>      }
>      case 0xe0: case 0xe4: case 0xe8: case 0xec:
> @@ -1743,6 +1748,7 @@ static MemTxResult gic_cpu_write(GICState *s, int cpu, int offset,
>              return MEMTX_OK;
>          }
>          s->nsapr[regno][cpu] = value;
> +        s->running_priority[cpu] = gic_get_prio_from_apr_bits(s, cpu);
>          break;
>      }
>      case 0x1000:

These parts are correct and just need to be in their own patch.

thanks
-- PMM

