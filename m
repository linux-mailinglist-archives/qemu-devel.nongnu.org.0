Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 695A0543861
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 18:08:08 +0200 (CEST)
Received: from localhost ([::1]:34030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyyE2-0005is-FP
	for lists+qemu-devel@lfdr.de; Wed, 08 Jun 2022 12:08:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nyy82-0005vf-7L
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 12:01:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37817)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nyy7z-0000Y1-Bh
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 12:01:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654704110;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=946KQXL/MuGthlZ6auNsGhR0l6y4iAXQdOAkiL9ls3E=;
 b=PfEyW4Hzf0SKZtAHJbUbzglwdDQY70XSwHJIA5IaPFtuBJ+WVOdom3nKninM2a8fzLfS32
 MG5xeDvux+fANQIW73XayuiF40L0+ql7c4OIpr3IzEuTZXMaRCr3wD7RM6GQKFQknpVtPu
 q9GrJ9eDG8VUNzA7v8sHYpLMey5AWdQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-563-dXcnWegSNdeNJckTHXcDqA-1; Wed, 08 Jun 2022 12:01:48 -0400
X-MC-Unique: dXcnWegSNdeNJckTHXcDqA-1
Received: by mail-wm1-f72.google.com with SMTP id
 k16-20020a7bc310000000b0038e6cf00439so10086254wmj.0
 for <qemu-devel@nongnu.org>; Wed, 08 Jun 2022 09:01:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=946KQXL/MuGthlZ6auNsGhR0l6y4iAXQdOAkiL9ls3E=;
 b=qs9l8THSSva5AoWcpQ6Y2AXUpPx6uNwhqUKZsL7MC8xlsDkrsPmXUehYq9Luo3coco
 GEHOdz6RF4k7Q0eHasVflXOS08yU3fpv88M1XmR0JXODUL6UB6iPrI/n2yFBjzNi6CnE
 wVX5H8QK3NtlPYIh+KBnqq71f+u9FLLIceFq7lCGXKz2lOYI0O0Uouh2fdNRI61UBnBY
 sp7NiaC/TNVinp90vaSo4GxOfvEfIXLfd7bN0dFd8lXXBEK9+24Hf03zWCmEMRb3R+BA
 JY2mh2msgxa95rri/mHw6TW+gEIhAmwej3wn7HE0YTk9hKMaFw3kdtdLFxXQdXPBzicS
 zPmg==
X-Gm-Message-State: AOAM530caoyaKZSpeMIXEV7ZlPe5ULJ+1iLzsn6UjYGEdWTlnOiYhQG2
 EllTAJSCe/3VkC9j48mC4WzbLWWwHaIn7gSP782PBzB2t2YVlA92L04eoUYgxHJWrKInhEKfNGz
 xxbfPTQa4X9HfFVw=
X-Received: by 2002:adf:fa81:0:b0:20e:69df:5f06 with SMTP id
 h1-20020adffa81000000b0020e69df5f06mr34347579wrr.188.1654704107534; 
 Wed, 08 Jun 2022 09:01:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwPpJb/7IQ/F6g1/qmNfAq/4wEmKFM+Pnkwmq7PW0rMSbBDlyAHcMlZmaZyPo+syL5QbktLLg==
X-Received: by 2002:adf:fa81:0:b0:20e:69df:5f06 with SMTP id
 h1-20020adffa81000000b0020e69df5f06mr34347546wrr.188.1654704107235; 
 Wed, 08 Jun 2022 09:01:47 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 x8-20020adff0c8000000b00210a6bd8019sm21122792wro.8.2022.06.08.09.01.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jun 2022 09:01:46 -0700 (PDT)
Date: Wed, 8 Jun 2022 17:01:44 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, armbru@redhat.com,
 Mark Kanda <mark.kanda@oracle.com>
Subject: Re: [PATCH v5 02/10] kvm: Support for querying fd-based stats
Message-ID: <YqDH6Ec/6937BTT/@work-vm>
References: <20220530150714.756954-1-pbonzini@redhat.com>
 <20220530150714.756954-3-pbonzini@redhat.com>
 <Yp+ObQxOi/EXc6PZ@work-vm>
 <758db6b4-5786-adf4-d293-d8dc7793a21b@redhat.com>
 <YqC3pocwSjcp2y/3@work-vm>
 <686d6426-f035-4218-25a2-c212af38ce58@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <686d6426-f035-4218-25a2-c212af38ce58@redhat.com>
User-Agent: Mutt/2.2.1 (2022-02-19)
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

* Paolo Bonzini (pbonzini@redhat.com) wrote:
> On 6/8/22 16:52, Dr. David Alan Gilbert wrote:
> > > If you mean why not some other source, each source has a different file
> > > descriptor:
> > > 
> > > +    int stats_fd = kvm_vcpu_ioctl(cpu, KVM_GET_STATS_FD, NULL);
> > > 
> > > but the descriptors are consistent every time KVM_GET_STATS_FD is called, so
> > > basically "ident" can be used as a cache key.
> > 
> > Ah OK, this is what I was after; it's a little weird that the caller
> > does the ioctl to get the stats-fd, but it does the lookup internally
> > with current_cpu for the ident.
> 
> Oh yeah that's weird.
> 
> Let me squash in this:

Yeh that's nicer; a comment something like:

'Find descriptors for 'target', either that have already been read or
 query 'stats_fd' to read them from kvm'

?

Dave

> diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
> index 023bf4ea79..71896ad173 100644
> --- a/accel/kvm/kvm-all.c
> +++ b/accel/kvm/kvm-all.c
> @@ -3871,17 +3871,7 @@ static StatsDescriptors *find_stats_descriptors(StatsTarget target, int stats_fd
>      size_t size_desc;
>      ssize_t ret;
> -    switch (target) {
> -    case STATS_TARGET_VM:
> -        ident = StatsTarget_str(STATS_TARGET_VM);
> -        break;
> -    case STATS_TARGET_VCPU:
> -        ident = current_cpu->parent_obj.canonical_path;
> -        break;
> -    default:
> -        abort();
> -    }
> -
> +    ident = StatsTarget_str(target);
>      QTAILQ_FOREACH(descriptors, &stats_descriptors, next) {
>          if (g_str_equal(descriptors->ident, ident)) {
>              return descriptors;
> @@ -3917,7 +3907,7 @@ static StatsDescriptors *find_stats_descriptors(StatsTarget target, int stats_fd
>      }
>      descriptors->kvm_stats_header = kvm_stats_header;
>      descriptors->kvm_stats_desc = kvm_stats_desc;
> -    descriptors->ident = g_strdup(ident);
> +    descriptors->ident = ident;
>      QTAILQ_INSERT_TAIL(&stats_descriptors, descriptors, next);
>      return descriptors;
>  }
> 
> (once I test it).
> 
> Paolo
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


