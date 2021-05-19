Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 390163890BD
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 16:23:43 +0200 (CEST)
Received: from localhost ([::1]:49844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljN6s-0002gw-Bl
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 10:23:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1ljN5o-0001jg-94
 for qemu-devel@nongnu.org; Wed, 19 May 2021 10:22:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51445)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1ljN5l-0004AD-CV
 for qemu-devel@nongnu.org; Wed, 19 May 2021 10:22:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621434151;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YoPWReBJ7coHVZn89zjXWd8XWjqbT/8bFMJRY3N8pH8=;
 b=TOGmh6N+HIlLCEo2sjPojHA7pwV178qzK2bI8WTWNcCCI7SXMwr+nJMVOSJgpVI5fSqz/s
 xxd7khMrdrvw4Da03wm532+QsPaCV9wSqCCtRXbH0INk7KH+E/MReUA12KVQ6IttdpPkAV
 tCiKkMt2sxSpEB0MPpZIPnk2L55Y+t0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-393-mqgpWUQIPwWb40ISp5XAbA-1; Wed, 19 May 2021 10:22:29 -0400
X-MC-Unique: mqgpWUQIPwWb40ISp5XAbA-1
Received: by mail-wm1-f71.google.com with SMTP id
 129-20020a1c02870000b0290176ef5297e3so1887296wmc.0
 for <qemu-devel@nongnu.org>; Wed, 19 May 2021 07:22:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=YoPWReBJ7coHVZn89zjXWd8XWjqbT/8bFMJRY3N8pH8=;
 b=Di/mbZ6NdiTnWt/pND6p4fpPJLslp/gYTWzaGtfLaL1Y8uF1sLIckV/BJrX377x8FG
 y3FL2ZGAQb2cQ8nOIFIZvo7uGtAcqxlMloS0Km5nBeG6yaaUEIVkKaHLyZyQ/C6YX0Ud
 BhSpWhIYKFVdUOSTH8v1O4hK6TGdel8ZJD2hHax4gTP5yH90OTJp/aVxp7cVvcIM8u/I
 kEuvfBbz8jB6dYXL3aqMFUbt+QdONy4IVjEZZmS2zUq0CbNYdjgi/OiHcIFXANGXO5kq
 O1kPr9DRU2mcOa8Xjpsv2oeipmncZeeOWFZTFKOC389QSr0onBGaR9u7oFRFYs3qkDIC
 wcNg==
X-Gm-Message-State: AOAM532zIK2pMOWxeKqAq5BKSR7IXLtE8aZ7ed0sRh4VbvLFZtkGPZBK
 vz/Gj3Hd3gSPA7QIfmxF6DSWTD3Tk7BPvOSGNTb0/LdORxQIyRFc6i/E53vIx/12CFXw0dKEz9n
 lGQ69BOjSRsGN1/8=
X-Received: by 2002:a05:600c:198d:: with SMTP id
 t13mr11448049wmq.179.1621434148031; 
 Wed, 19 May 2021 07:22:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwutByAaLwHK8yre4qbgax2x632mPj3eJwuxzg3bNFt9d9tkqggBe4mvl1QIJu+EtWq9dTcBw==
X-Received: by 2002:a05:600c:198d:: with SMTP id
 t13mr11448022wmq.179.1621434147825; 
 Wed, 19 May 2021 07:22:27 -0700 (PDT)
Received: from vitty.brq.redhat.com (g-server-2.ign.cz. [91.219.240.2])
 by smtp.gmail.com with ESMTPSA id y6sm4583126wmy.23.2021.05.19.07.22.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 07:22:27 -0700 (PDT)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: Liang Li <liliang324@gmail.com>
Subject: Re: About the performance of hyper-v
In-Reply-To: <CA+2MQi-_06J1cmLhKAmV1vkPEnvDx6+bOnK06OciYmdymaNruw@mail.gmail.com>
References: <CA+2MQi-_06J1cmLhKAmV1vkPEnvDx6+bOnK06OciYmdymaNruw@mail.gmail.com>
Date: Wed, 19 May 2021 16:22:26 +0200
Message-ID: <87cztmkdlp.fsf@vitty.brq.redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vkuznets@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=vkuznets@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Tianyu.Lan@microsoft.com, qemu-devel@nongnu.org, kvm@vger.kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Liang Li <liliang324@gmail.com> writes:

> [resend for missing cc]
>
> Hi Vitaly,
>
> I found a case that the virtualization overhead was almost doubled
> when turning on Hper-v related features compared to that without any
> no hyper-v feature.  It happens when running a 3D game in windows
> guest in qemu kvm environment.
>
> By investigation, I found there are a lot of IPIs triggered by guest,
> when turning on the hyer-v related features including stimer, for the
> apicv is turned off, at least two vm exits are needed for processing a
> single IPI.
>
>
> perf stat will show something like below [recorded for 5 seconds]
>
> ---------
>
> Analyze events for all VMs, all VCPUs:
>              VM-EXIT    Samples  Samples%     Time%    Min Time    Max
> Time         Avg time
>   EXTERNAL_INTERRUPT     471831    59.89%    68.58%      0.64us
> 65.42us      2.34us ( +-   0.11% )
>            MSR_WRITE     238932    30.33%    23.07%      0.48us
> 41.05us      1.56us ( +-   0.14% )
>
> Total Samples:787803, Total events handled time:1611193.84us.
>
> I tried turning off hyper-v for the same workload and repeat the test,
> the overall virtualization overhead reduced by about of 50%:
>
> -------
>
> Analyze events for all VMs, all VCPUs:
>
>              VM-EXIT    Samples  Samples%     Time%    Min Time    Max
> Time         Avg time
>           APIC_WRITE     255152    74.43%    50.72%      0.49us
> 50.01us      1.42us ( +-   0.14% )
>        EPT_MISCONFIG      39967    11.66%    40.58%      1.55us
> 686.05us      7.27us ( +-   0.43% )
>            DR_ACCESS      35003    10.21%     4.64%      0.32us
> 40.03us      0.95us ( +-   0.32% )
>   EXTERNAL_INTERRUPT       6622     1.93%     2.08%      0.70us
> 57.38us      2.25us ( +-   1.42% )
>
> Total Samples:342788, Total events handled time:715695.62us.
>
> For this scenario,  hyper-v works really bad.  stimer works better
> than hpet, but on the other hand, it relies on SynIC which has
> negative effects for IPI intensive workloads.
> Do you have any plans for improvement?
>

Hey,

the above can be caused by the fact that when 'hv-synic' is enabled, KVM
automatically disables APICv and this can explain the overhead and the
fact that you're seeing more vmexits. KVM disables APICv because SynIC's
'AutoEOI' feature is incompatible with it. We can, however, tell Windows
to not use AutoEOI ('Recommend deprecating AutoEOI' bit) and only
inhibit APICv if the recommendation was ignored. This is implemented in
the following KVM patch series:
https://lore.kernel.org/kvm/20210518144339.1987982-1-vkuznets@redhat.com/

It will, however, require a new 'hv-something' flag to QEMU. For now, it
can be tested with 'hv-passthrough'.

It would be great if you could give it a spin!

-- 
Vitaly


