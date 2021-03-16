Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 914B733DFA3
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 21:57:20 +0100 (CET)
Received: from localhost ([::1]:51416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMGkh-0006p8-6a
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 16:57:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@gmail.com>)
 id 1lMGjZ-0006OI-Hd
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 16:56:09 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:45520)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@gmail.com>)
 id 1lMGjX-0002XU-De
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 16:56:09 -0400
Received: by mail-pl1-x630.google.com with SMTP id u18so17518463plc.12
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 13:56:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=dSoK/4/F0Ti89m/a5PETgU1SCukkqvF0a3L6A20r44Q=;
 b=IJMdXzabWRsEWyVwXrgMCuTTH2A+mAByZouKfDgvHSLi2ArJZDPtp7dvlZx5z9QXKW
 +iSvREnHa0lkZsfZDEQz5sW8p2KXDneubYwqkb63nc0RUWpSdFTsZcjRJBWCslYZjPnz
 Y1hsIZVWIT1PDnXlEq0g7NO+mXlvFr3HNmVRgecEadFFmLcNs1rKBIO7BCaqBqDFDKNN
 o9hy+77zaX0LHZxLs1bK8bGuDvzBy/pULIbJwePi2sJ3Gaw1NDe16HgCNHzgVyhDqNyv
 Bfb/9kON+/XUCQ8ytVgL675G7TlN09Bv5iIOTjTV7tOyTDk0s5CXAgkt6bmomrTwNkMw
 u98Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=dSoK/4/F0Ti89m/a5PETgU1SCukkqvF0a3L6A20r44Q=;
 b=a+MabOHMwao8i3OTfREXIxr2L+r+aDWa4q11TlxB3D+cJpkZVdgG0mfSej+VH48jfJ
 Q+bbF089GMrxXlgR8uenwICa9AZmZNtOwnYcf9itSiAt92ON4hsj5P0PtmAMpII5pb8a
 K74winsWOWfMQ62Y6F/PMFkdEgwLV4bE5evkYtuKOdHDL9fSh1fDtd20/hcmImk6ZDRt
 B0Bq8fJk6vZSdEUqi+5/sX7S6/eK9AMmS57pb7eaoM7XaKlHe4mcR/gMgH0BLIY1kCl5
 d8Nn8cvRXYA1mC9VIyG6248s2Qrf2f56rvYC3YbyjP3C2I23peRjY7CWFAmUpVj+wI1A
 QubQ==
X-Gm-Message-State: AOAM5333SdDSSTw+D+ORUzVZ5P6JbphBbjOLDDPqnM80F49gyBi0G0/J
 ci+Nih6vBpB4SD7QwIPGwfk=
X-Google-Smtp-Source: ABdhPJxVr5tlbdhuYNj7ey3aI3XqgsIxVFGT/kOXzveh4NwY1iIwv6K5jJh261xcIUKkwyDE3N6O4Q==
X-Received: by 2002:a17:90a:bb8d:: with SMTP id
 v13mr930664pjr.12.1615928165577; 
 Tue, 16 Mar 2021 13:56:05 -0700 (PDT)
Received: from localhost ([2601:647:4600:11e1:d2fd:ba5d:619c:c25d])
 by smtp.gmail.com with ESMTPSA id u7sm16948072pfh.150.2021.03.16.13.56.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Mar 2021 13:56:05 -0700 (PDT)
Date: Tue, 16 Mar 2021 13:56:03 -0700
From: Isaku Yamahata <isaku.yamahata@gmail.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH for-6.0] x86:acpi:piix4: reinitialize PM1.CNT on reset
Message-ID: <20210316205603.GA1037316@private.email.ne.jp>
References: <20210316202956.3041128-1-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210316202956.3041128-1-imammedo@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=isaku.yamahata@gmail.com; helo=mail-pl1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: isaku.yamahata@intel.com, berrange@redhat.com, mst@redhat.com,
 f4bug@amsat.org, qemu-devel@nongnu.org, reinoud@NetBSD.org,
 pbonzini@redhat.com, isaku.yamahata@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The fix itself looks good to me for the reported issue.
Should more registers be reset in theory?
But it would cause other issues.

i.e.
acpi_pm1_evt_reset(&s->ar);
acpi_pm_tmr_reset(&s->ar);
acpi_gpe_reset(&s->ar);

Reviewed-by: Isaku Yamahata <isaku.yamahata@intel.com>

Thanks,


On Tue, Mar 16, 2021 at 04:29:56PM -0400,
Igor Mammedov <imammedo@redhat.com> wrote:

> Commit 6be8cf56bc8b made sure that SCI is enabled in PM1.CNT
> on reset in acpi_only mode by modifying acpi_pm1_cnt_reset() and
> that worked for q35 as expected.
> 
> The function was introduced by commit
>   eaba51c573a (acpi, acpi_piix, vt82c686: factor out PM1_CNT logic)
> that forgot to actually call it at piix4 reset time and as result
> SCI_EN wasn't set as was expected by 6be8cf56bc8b in acpi_only mode.
> 
> So Windows crashes when it notices that SCI_EN is not set and FADT is
> not providing information about how to enable it anymore.
> Reproducer:
>    qemu-system-x86_64 -enable-kvm -M pc-i440fx-6.0,smm=off -cdrom any_windows_10x64.iso
> 
> Fix it by calling acpi_pm1_cnt_reset() at piix4 reset time.
> 
> Fixes: 6be8cf56bc8b (acpi/core: always set SCI_EN when SMM isn't supported)
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> ---
> CC: isaku.yamahata@intel.com
> CC: mst@redhat.com
> CC: reinoud@NetBSD.org
> CC: isaku.yamahata@gmail.com
> CC: berrange@redhat.com
> CC: pbonzini@redhat.com
> CC: f4bug@amsat.org
> ---
>  hw/acpi/piix4.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/hw/acpi/piix4.c b/hw/acpi/piix4.c
> index 1efc0ded9f..7cab438015 100644
> --- a/hw/acpi/piix4.c
> +++ b/hw/acpi/piix4.c
> @@ -325,6 +325,7 @@ static void piix4_pm_reset(DeviceState *dev)
>          /* Mark SMM as already inited (until KVM supports SMM). */
>          pci_conf[0x5B] = 0x02;
>      }
> +    acpi_pm1_cnt_reset(&s->ar);
>      pm_io_space_update(s);
>      acpi_pcihp_reset(&s->acpi_pci_hotplug, !s->use_acpi_root_pci_hotplug);
>  }
> -- 
> 2.27.0
> 
> 

-- 
Isaku Yamahata <isaku.yamahata@gmail.com>

