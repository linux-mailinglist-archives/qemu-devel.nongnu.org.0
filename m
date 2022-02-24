Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16E6B4C34C8
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 19:30:36 +0100 (CET)
Received: from localhost ([::1]:44274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNIst-0004sc-3h
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 13:30:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nNIrR-0004CH-8M
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 13:29:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30818)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nNIrP-0001j9-EU
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 13:29:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645727342;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9TsmSG+MpOIqaQspx9w13t2GEUxs//Yqv3t+L7HaaoM=;
 b=d6cLiw6DKVZZMSFxJydUTQA8PdhuPpH1Iz32vFJ9k3Gos2g1eiHeatL/LsEBwO7oc5Slqw
 nKIcGybOGKUwHLipOOTfNZpLaQ6hrJBYOuqoDdx+OpHIxhiMAwVSrtd/Q+yG9OEPdrWO/A
 SqCcEXAxH2txeyekevjvkII1LaxXucs=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-572-K2G0wA6QPyGofWTYWoDOQg-1; Thu, 24 Feb 2022 13:29:01 -0500
X-MC-Unique: K2G0wA6QPyGofWTYWoDOQg-1
Received: by mail-wr1-f72.google.com with SMTP id
 u9-20020adfae49000000b001e89793bcb0so233408wrd.17
 for <qemu-devel@nongnu.org>; Thu, 24 Feb 2022 10:29:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=9TsmSG+MpOIqaQspx9w13t2GEUxs//Yqv3t+L7HaaoM=;
 b=RoEro4bLfpVtis7Ma9/6OCokHZ3qp976oXFirXqocAiyNdV+ozWYeC6ObngQmMAgvA
 Lpj56DhtBWr+dq0y22tKlM4S4WtWZKMMRVBv4sf6hHH0FowTmS+LwMOfeynLAHfVNNLm
 kNmxo+ASW1pHA52kS+3ZWknz1Wp1j0uLLM9GEUMOPJgqerNdlrsUwguK65OWRUWstM30
 5CWboS8jUqIPxbOl0eCe85baPfxH48ilbMkok/xoe/z0gAchlTw2tEY/rtTomCf89cS5
 LRLiiawbuhmLSRf+/AngSjuK8FMpcqJxvDOaOU1SeWxm/76AiNvonOdYeMLjgM/zYOne
 Y5cw==
X-Gm-Message-State: AOAM533z7xoWjR0mjbITSn4gq3PRpAMP76ui7jQoA/8VEJmvbd9bDoa3
 R4dNevDKPSmrDFn36a+lpAR2TomD6sZlKW3c/5IwzLxV4PkrsFx29SqpG/CoK5ylZdJgHxNv+HL
 92cuUic2trB9fSXY=
X-Received: by 2002:a05:600c:4e8a:b0:37d:1c28:20fc with SMTP id
 f10-20020a05600c4e8a00b0037d1c2820fcmr3390944wmq.166.1645727340034; 
 Thu, 24 Feb 2022 10:29:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxlLrWk0quMXKyeY7o89x019VAAzLECL0crZuoLp4ZtpkTeWAS3tdlM+ysjKquSs8suY5upNQ==
X-Received: by 2002:a05:600c:4e8a:b0:37d:1c28:20fc with SMTP id
 f10-20020a05600c4e8a00b0037d1c2820fcmr3390917wmq.166.1645727339808; 
 Thu, 24 Feb 2022 10:28:59 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 h2-20020a05600c350200b0037c8ff59e58sm151370wmq.28.2022.02.24.10.28.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Feb 2022 10:28:59 -0800 (PST)
Date: Thu, 24 Feb 2022 18:28:57 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Steve Sistare <steven.sistare@oracle.com>
Subject: Re: [PATCH V7 01/29] memory: qemu_check_ram_volatile
Message-ID: <YhfOaab2tT6SDWnN@work-vm>
References: <1640199934-455149-1-git-send-email-steven.sistare@oracle.com>
 <1640199934-455149-2-git-send-email-steven.sistare@oracle.com>
MIME-Version: 1.0
In-Reply-To: <1640199934-455149-2-git-send-email-steven.sistare@oracle.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Jason Zeng <jason.zeng@linux.intel.com>,
 Juan Quintela <quintela@redhat.com>, Eric Blake <eblake@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Zheng Chuan <zhengchuan@huawei.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Steve Sistare (steven.sistare@oracle.com) wrote:
> Add a function that returns an error if any ram_list block represents
> volatile memory.
> 
> Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
> ---
>  include/exec/memory.h |  8 ++++++++
>  softmmu/memory.c      | 26 ++++++++++++++++++++++++++
>  2 files changed, 34 insertions(+)
> 
> diff --git a/include/exec/memory.h b/include/exec/memory.h
> index 20f1b27..137f5f3 100644
> --- a/include/exec/memory.h
> +++ b/include/exec/memory.h
> @@ -2981,6 +2981,14 @@ bool ram_block_discard_is_disabled(void);
>   */
>  bool ram_block_discard_is_required(void);
>  
> +/**
> + * qemu_ram_check_volatile: return 1 if any memory regions are writable and not
> + * backed by shared memory, else return 0.
> + *
> + * @errp: returned error message identifying the first volatile region found.
> + */
> +int qemu_check_ram_volatile(Error **errp);
> +
>  #endif
>  
>  #endif
> diff --git a/softmmu/memory.c b/softmmu/memory.c
> index 7340e19..30b2f68 100644
> --- a/softmmu/memory.c
> +++ b/softmmu/memory.c
> @@ -2837,6 +2837,32 @@ void memory_global_dirty_log_stop(unsigned int flags)
>      memory_global_dirty_log_do_stop(flags);
>  }
>  
> +static int check_volatile(RAMBlock *rb, void *opaque)
> +{
> +    MemoryRegion *mr = rb->mr;
> +
> +    if (mr &&
> +        memory_region_is_ram(mr) &&
> +        !memory_region_is_ram_device(mr) &&
> +        !memory_region_is_rom(mr) &&
> +        (rb->fd == -1 || !qemu_ram_is_shared(rb))) {
> +        *(const char **)opaque = memory_region_name(mr);
> +        return -1;
> +    }
> +    return 0;
> +}
> +
> +int qemu_check_ram_volatile(Error **errp)
> +{
> +    char *name;

Does that need to be const char *name for safety since you're casting
it to it below?

Other than that,


Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> +
> +    if (qemu_ram_foreach_block(check_volatile, &name)) {
> +        error_setg(errp, "Memory region %s is volatile", name);
> +        return -1;
> +    }
> +    return 0;
> +}
> +
>  static void listener_add_address_space(MemoryListener *listener,
>                                         AddressSpace *as)
>  {
> -- 
> 1.8.3.1
> 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


