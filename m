Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4F493EA9D2
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Aug 2021 19:56:07 +0200 (CEST)
Received: from localhost ([::1]:53670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mEEw2-0002Ai-Qc
	for lists+qemu-devel@lfdr.de; Thu, 12 Aug 2021 13:56:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mEEuj-00018L-5f
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 13:54:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20568)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mEEuh-00049X-Oo
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 13:54:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628790883;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=eTv63rUYyHfValJazCjthBaVKyjyDxN/+y6BvZ7Iaj0=;
 b=gcCuh8cbc889fKsMvCEvlk4/KiGb1lTu+WTfkhyGGuJm8n+V/+UZD4uqTDw1zZqJbIIsWm
 U4QWwE6FwW3JKf/vk0oECS9IzXeCgsHkLuve96AZv76mh8RISEhHQZSMw5j0f1JBwPFrnB
 QEWOP69fyAz+wF1cMC9J+X+1uJc7gjY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-80-QJ8XgJvVM8eB43di2SEklg-1; Thu, 12 Aug 2021 13:54:41 -0400
X-MC-Unique: QJ8XgJvVM8eB43di2SEklg-1
Received: by mail-wm1-f70.google.com with SMTP id
 y186-20020a1c32c30000b02902b5ac887cfcso3648094wmy.2
 for <qemu-devel@nongnu.org>; Thu, 12 Aug 2021 10:54:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=eTv63rUYyHfValJazCjthBaVKyjyDxN/+y6BvZ7Iaj0=;
 b=TvePkZe7Yk1sqJA8/FlkbDt7xSajJBkNniV+mNhI1ipbM0kVkqitaLFF1evK15A+p+
 FrTN38WMlrQvHGJRtC+8TmDZE4L0Kbz0/9M2hPL1+jEu+HhA9xa/Sbo55BplLoUzN2kw
 vyTdWr4JbzASLO1FwXTOhn9taj9FA6bpuKyrPgq5TyJHLrEwb85MhqSdE3O8cQUwM3YI
 LDf3pEwiEho5H8MgRZu1RV30dRJpL5U/jCWtdpwzRyj7gnn7DP/doIPOHTh9wR2sPAnC
 ER0aGEMJnB6vSJIn5hJYoreSZJeau4heU5x5Shi2S4sko90ZcZSnrRbn0sP6TTscMcVt
 QVwQ==
X-Gm-Message-State: AOAM530uvLDlwmpgSUI9TZ8pPWI9e8XpOEgdhMSrsFebyXJjnM12uRiZ
 wqh+dKUXLlyUaAk7crEgEQQAFecB0qRLNHoFpeMvkXUA65jLg2STS8ASibOlyR0L9yNTwlYK6gw
 OkPJ7g5ZLq5JfTWg=
X-Received: by 2002:a5d:464a:: with SMTP id j10mr5264241wrs.190.1628790880654; 
 Thu, 12 Aug 2021 10:54:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwUL8OORqcKTQchpODGKHpBb/OnAqFb1tGZbVneglYLXyQRExkFfSikQBqdHZDM7HbFSX2J9A==
X-Received: by 2002:a5d:464a:: with SMTP id j10mr5264228wrs.190.1628790880472; 
 Thu, 12 Aug 2021 10:54:40 -0700 (PDT)
Received: from work-vm (cpc109021-salf6-2-0-cust453.10-2.cable.virginm.net.
 [82.29.237.198])
 by smtp.gmail.com with ESMTPSA id z126sm3484456wmc.11.2021.08.12.10.54.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Aug 2021 10:54:40 -0700 (PDT)
Date: Thu, 12 Aug 2021 18:54:38 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] configure: Remove spurious [] from tr
Message-ID: <YRVgXoaaDngqWUZ7@work-vm>
References: <20210812110942.19065-1-dgilbert@redhat.com>
 <7f58a3cb-01ff-76e8-018a-0be3db62fd74@redhat.com>
MIME-Version: 1.0
In-Reply-To: <7f58a3cb-01ff-76e8-018a-0be3db62fd74@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: philmd@redhat.com, eblake@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Paolo Bonzini (pbonzini@redhat.com) wrote:
> On 12/08/21 13:09, Dr. David Alan Gilbert (git) wrote:
> > From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> > 
> > ShellCheck points out that tr '[a-z]' actually replaces the []'s
> > and only the a-z is needed.
> > 
> > Remove the spurious [] - although in this use it will make no
> > difference.
> > 
> > Fixes: bb55b712e8dc4d4eb515144d5c26798fea178cba
> > Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> > ---
> >   configure | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/configure b/configure
> > index 9a79a004d7..5bb8c2a59d 100755
> > --- a/configure
> > +++ b/configure
> > @@ -4549,7 +4549,7 @@ if test "$gprof" = "yes" ; then
> >   fi
> >   echo "CONFIG_AUDIO_DRIVERS=$audio_drv_list" >> $config_host_mak
> >   for drv in $audio_drv_list; do
> > -    def=CONFIG_AUDIO_$(echo $drv | LC_ALL=C tr '[a-z]' '[A-Z]')
> > +    def=CONFIG_AUDIO_$(echo $drv | LC_ALL=C tr 'a-z' 'A-Z')
> >       echo "$def=y" >> $config_host_mak
> >   done
> >   if test "$alsa" = "yes" ; then
> > 
> 
> Do we want this in 6.1?  For the next release I'm moving all audio stuff to
> meson anyway. :)

Bah! Not bothered; I just tripped over ShellCheck and that
looked like a trivial one.

Dave

> Paolo
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


