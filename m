Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 894FA6A7650
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 22:46:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXUGl-0006rJ-5i; Wed, 01 Mar 2023 16:45:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXUGN-0006gi-LD
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 16:45:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXUGG-0003iu-6d
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 16:45:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677707119;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CRNGmpiu07lhWIG9uQKmTyZmnoqqTWTxJX+XRpyNcVg=;
 b=RI+QPAqM39uHJgik30DltlvaW+ghzZrA8IEiaxaX9ftTF1sp6nPHmWuQY1BCSFqQXEayIK
 iizxRKWaRMp7oPJ9i4/Z/yuxlzWFNEz17+UKXcxSVTAchpFTMVpokoIy0CuFRhr0bXNeFb
 wz1AVe3dGA/M8+p8HBBDHq4oKOQjfEU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-42-k3mLlcXPMM6YY3-XIS4-dQ-1; Wed, 01 Mar 2023 16:45:18 -0500
X-MC-Unique: k3mLlcXPMM6YY3-XIS4-dQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 z6-20020a7bc7c6000000b003e0107732f4so5037173wmk.1
 for <qemu-devel@nongnu.org>; Wed, 01 Mar 2023 13:45:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677707117;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CRNGmpiu07lhWIG9uQKmTyZmnoqqTWTxJX+XRpyNcVg=;
 b=n/MIrZex0kfwvzu5jpqDBt7XvQnb+G9t+XqLUjEhdTZPlbMHZ5V96o0cwBPUq0LK7T
 6WUtSrRr9p+p5R1iueN+dQBwI5Ukw8BZO75yfC3OQvzevf2mqd6SbgwfwgA9/dbt/Ppy
 TAJe936bK7ue7DxATxkugQCwzvwQK1v/rvBIqw8qKRQd8IbQEubFm9vKLrNueDPIYvbH
 0YJZzHoWfuhgLdNsrnwwg5Sj9FKaWSqmQLlYtyQ3co3BJLnaC6xjsmdKNCRUfhOSRnj6
 2JeSEHc3mAXmcmRuYHoQNw4/8xfb9WB974TKyM/+4HjV+jA8beY1nhpsVEkS4tSe7hph
 6ggg==
X-Gm-Message-State: AO0yUKWuGsUgMMlsOzhKupIFqw6Drn+tdZPoDjxnfyykdAUClIksEtgU
 FXbLww9/TNuutnfmY0TPGB+NVeY7zELcckdEMPirC61iNJDZ17s2Mumi8PVig+ClJ65i/88htcQ
 uCCilG3MAP+9qbir4BRWy
X-Received: by 2002:a05:6000:104d:b0:2c7:390e:163c with SMTP id
 c13-20020a056000104d00b002c7390e163cmr5815607wrx.47.1677707116763; 
 Wed, 01 Mar 2023 13:45:16 -0800 (PST)
X-Google-Smtp-Source: AK7set8if8VHMfqaQ0LT5g45XskMpI3MgPpLAm+VhZVX5shp5saHPA6hns+udQTu/Ea9CdX0VmnstQ==
X-Received: by 2002:a05:6000:104d:b0:2c7:390e:163c with SMTP id
 c13-20020a056000104d00b002c7390e163cmr5815599wrx.47.1677707116462; 
 Wed, 01 Mar 2023 13:45:16 -0800 (PST)
Received: from redhat.com ([2.52.141.194]) by smtp.gmail.com with ESMTPSA id
 i12-20020adfefcc000000b002c54f4d0f71sm13524100wrp.38.2023.03.01.13.45.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Mar 2023 13:45:15 -0800 (PST)
Date: Wed, 1 Mar 2023 16:45:12 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>
Subject: Re: [PATCH 03/12] hw/pci-host/q35: Use memory_region_set_address()
 also for tseg_blackhole
Message-ID: <20230301164444-mutt-send-email-mst@kernel.org>
References: <20230214131441.101760-1-shentey@gmail.com>
 <20230214131441.101760-4-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230214131441.101760-4-shentey@gmail.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

On Tue, Feb 14, 2023 at 02:14:32PM +0100, Bernhard Beschow wrote:
> Deleting from and adding to the parent memory region seems to be the old
> way of changing a memory region's address which is superseeded by
> memory_region_set_address(). Moreover, memory_region_set_address() is
> already used for tseg_window which is tseg_blackhole's counterpart in
> SMM space.
> 
> Ammends: bafc90bdc594 'q35: implement TSEG'

I don't really see what purpose does this tag serve but
if you want it use the standard format pls.


> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>  hw/pci-host/q35.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/pci-host/q35.c b/hw/pci-host/q35.c
> index 3124cad60f..0384ce4350 100644
> --- a/hw/pci-host/q35.c
> +++ b/hw/pci-host/q35.c
> @@ -404,12 +404,11 @@ static void mch_update_smram(MCHPCIState *mch)
>      } else {
>          tseg_size = 0;
>      }
> -    memory_region_del_subregion(mch->system_memory, &mch->tseg_blackhole);
> +
>      memory_region_set_enabled(&mch->tseg_blackhole, tseg_size);
>      memory_region_set_size(&mch->tseg_blackhole, tseg_size);
> -    memory_region_add_subregion_overlap(mch->system_memory,
> -                                        mch->below_4g_mem_size - tseg_size,
> -                                        &mch->tseg_blackhole, 1);
> +    memory_region_set_address(&mch->tseg_blackhole,
> +                              mch->below_4g_mem_size - tseg_size);
>  
>      memory_region_set_enabled(&mch->tseg_window, tseg_size);
>      memory_region_set_size(&mch->tseg_window, tseg_size);
> -- 
> 2.39.1


