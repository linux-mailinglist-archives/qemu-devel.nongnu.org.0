Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECD172E0197
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Dec 2020 21:36:54 +0100 (CET)
Received: from localhost ([::1]:42434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krRvJ-0008Na-Hu
	for lists+qemu-devel@lfdr.de; Mon, 21 Dec 2020 15:36:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1krRtR-0006sd-VP; Mon, 21 Dec 2020 15:34:57 -0500
Received: from mail-qv1-xf34.google.com ([2607:f8b0:4864:20::f34]:38511)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1krRtQ-0003Op-8J; Mon, 21 Dec 2020 15:34:57 -0500
Received: by mail-qv1-xf34.google.com with SMTP id az16so5042024qvb.5;
 Mon, 21 Dec 2020 12:34:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=+zrk2kq9FxRm6oI58bL/AQP4T9VGuHANK2Y72VNniro=;
 b=Knrj27wvifQpDxrfhCIlDTIgr6swCUUkhnZs1f4iT4zjiyRKyiUCNZPaJN4I9LQZVQ
 +eewnG+mUZKOtPDOlQPUTo/xzqZDWjDlC9DMZYzXmloAms4x/SHcPZeyVU3KI6Zu6dFx
 w1xYvcfTIAQdFQxwlTGAyBZRbfISr5MPOEoIAoMuc2ykjfJlXxAtZDRXrF3FrDZpa4iQ
 io+0V4yMBt7+PIBob9mbkp4hL6Q9Egtqyze725rboQ7F1avNSetb6pgj/bhR0VP7WFsn
 HiVdp4w0Hg2coam+njfX86ERBlbzldLQ8WnBMcH0Ns9p1PB9hMnJLF2EurkAMuvF8mMK
 hx6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+zrk2kq9FxRm6oI58bL/AQP4T9VGuHANK2Y72VNniro=;
 b=UIZNsBp/gE4/R5iikXUYLzgDInaeUvi9YJhVICFSF6wtFywDS5/CfE6Tj8kSnHAD2K
 8+hg5BoOkyDeC34XzgwgbmVr+2n8SSJDgvy1TWxN/43pO2IaeWNgK5Hmt7R4mtYAvTzv
 cUTeCxHHs4i8OoeaSjTdPb1fj2YeDQA+155uN+pDgh9TCDlqz/MELAfKrfGq0aCrIUxV
 t2q4QY/zaDt0tXP88OzQHbFS8h3qadInc47YelWI8dwG/2NA24A2TGnc6HEU8H/SY7q4
 scQ/0kZRCnKlYNPG8akvVbDzRulEc3g8I95uTZbBkk7VFhw6EN55F+oK1OuMjgWMzIZG
 fOPQ==
X-Gm-Message-State: AOAM531jnjLqExjNn7A/mBv3Mtlhx6v/FbW5cCCnV1rRYzmV6boyWZv5
 X08oy1HqenzQBnPkPoaE7Rk=
X-Google-Smtp-Source: ABdhPJylR+6teZyCSyuaffv15dpIdr2LhrAjLPC+uB0D3XN6D35nMdvxLHP2UWxUQE//amU0YjoQew==
X-Received: by 2002:a0c:e5d1:: with SMTP id u17mr8104677qvm.34.1608582893742; 
 Mon, 21 Dec 2020 12:34:53 -0800 (PST)
Received: from ?IPv6:2804:431:c7c6:556d:fa44:43b8:486b:f066?
 ([2804:431:c7c6:556d:fa44:43b8:486b:f066])
 by smtp.gmail.com with ESMTPSA id g28sm11205010qtm.91.2020.12.21.12.34.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Dec 2020 12:34:53 -0800 (PST)
Subject: Re: [PATCH 2/6] spapr: Fix reset of transient DR connectors
To: Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org
References: <20201218103400.689660-1-groug@kaod.org>
 <20201218103400.689660-3-groug@kaod.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-ID: <43981f61-d189-1e47-989b-2c74f720ec39@gmail.com>
Date: Mon, 21 Dec 2020 17:34:50 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201218103400.689660-3-groug@kaod.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f34;
 envelope-from=danielhb413@gmail.com; helo=mail-qv1-xf34.google.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-1.233,
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
Cc: Daniel Henrique Barboza <danielhb@linux.ibm.com>, qemu-ppc@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 12/18/20 7:33 AM, Greg Kurz wrote:
> Documentation of object_property_iter_init() clearly stipulates that
> "it is forbidden to modify the property list while iterating". But this
> is exactly what we do when resetting transient DR connectors during CAS.
> The call to spapr_drc_reset() can finalize the hot-unplug sequence of a
> PHB or a PCI bridge, both of which will then in turn destroy their PCI
> DRCs. This could potentially invalidate the iterator. It is pure luck
> that this haven't caused any issues so far.
> 
> Change spapr_drc_reset() to return true if it caused a device to be
> removed. Restart from scratch in this case. This can potentially
> increase the overall DRC reset time, especially with a high maxmem
> which generates a lot of LMB DRCs. But this kind of setup is rare,
> and so is the use case of rebooting a guest while doing hot-unplug.
> 
> Signed-off-by: Greg Kurz <groug@kaod.org>
> ---

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>

>   include/hw/ppc/spapr_drc.h | 3 ++-
>   hw/ppc/spapr_drc.c         | 6 +++++-
>   hw/ppc/spapr_hcall.c       | 8 +++++++-
>   3 files changed, 14 insertions(+), 3 deletions(-)
> 
> diff --git a/include/hw/ppc/spapr_drc.h b/include/hw/ppc/spapr_drc.h
> index cff5e707d0d9..5d80019f82e2 100644
> --- a/include/hw/ppc/spapr_drc.h
> +++ b/include/hw/ppc/spapr_drc.h
> @@ -224,7 +224,8 @@ static inline bool spapr_drc_hotplugged(DeviceState *dev)
>       return dev->hotplugged && !runstate_check(RUN_STATE_INMIGRATE);
>   }
>   
> -void spapr_drc_reset(SpaprDrc *drc);
> +/* Returns true if an unplug request completed */
> +bool spapr_drc_reset(SpaprDrc *drc);
>   
>   uint32_t spapr_drc_index(SpaprDrc *drc);
>   SpaprDrcType spapr_drc_type(SpaprDrc *drc);
> diff --git a/hw/ppc/spapr_drc.c b/hw/ppc/spapr_drc.c
> index 8d62f55066b6..5b5e2ac58a7e 100644
> --- a/hw/ppc/spapr_drc.c
> +++ b/hw/ppc/spapr_drc.c
> @@ -417,9 +417,10 @@ void spapr_drc_detach(SpaprDrc *drc)
>       spapr_drc_release(drc);
>   }
>   
> -void spapr_drc_reset(SpaprDrc *drc)
> +bool spapr_drc_reset(SpaprDrc *drc)
>   {
>       SpaprDrcClass *drck = SPAPR_DR_CONNECTOR_GET_CLASS(drc);
> +    bool unplug_completed = false;
>   
>       trace_spapr_drc_reset(spapr_drc_index(drc));
>   
> @@ -428,6 +429,7 @@ void spapr_drc_reset(SpaprDrc *drc)
>        */
>       if (drc->unplug_requested) {
>           spapr_drc_release(drc);
> +        unplug_completed = true;
>       }
>   
>       if (drc->dev) {
> @@ -444,6 +446,8 @@ void spapr_drc_reset(SpaprDrc *drc)
>           drc->ccs_offset = -1;
>           drc->ccs_depth = -1;
>       }
> +
> +    return unplug_completed;
>   }
>   
>   static bool spapr_drc_unplug_requested_needed(void *opaque)
> diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
> index 4e9d50c254f0..aa22830ac4bd 100644
> --- a/hw/ppc/spapr_hcall.c
> +++ b/hw/ppc/spapr_hcall.c
> @@ -1639,6 +1639,7 @@ static void spapr_handle_transient_dev_before_cas(SpaprMachineState *spapr)
>       ObjectPropertyIterator iter;
>   
>       drc_container = container_get(object_get_root(), "/dr-connector");
> +restart:
>       object_property_iter_init(&iter, drc_container);
>       while ((prop = object_property_iter_next(&iter))) {
>           SpaprDrc *drc;
> @@ -1652,8 +1653,13 @@ static void spapr_handle_transient_dev_before_cas(SpaprMachineState *spapr)
>   
>           /*
>            * This will complete any pending plug/unplug requests.
> +         * In case of a unplugged PHB or PCI bridge, this will
> +         * cause some DRCs to be destroyed and thus potentially
> +         * invalidate the iterator.
>            */
> -        spapr_drc_reset(drc);
> +        if (spapr_drc_reset(drc)) {
> +            goto restart;
> +        }
>       }
>   
>       spapr_clear_pending_hotplug_events(spapr);
> 

