Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B50815E6AAF
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 20:22:41 +0200 (CEST)
Received: from localhost ([::1]:59080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obQqO-0000fD-HF
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 14:22:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1obPGi-0008Et-Cn
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 12:41:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21671)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1obPGf-0006NM-OX
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 12:41:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663864896;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tN7sBJ022mVZi2q3q3OyaCWGqikXhV0cVNvUgbyZpAI=;
 b=AtdgjNqFIjB5dH5471Ad6Dd4N/2cq6+7nAEIJuebLdneexGeuAz0aCdzUVZwKll5SSb2R/
 PHE/fzn5cfBKECZLH6il7fdz4LJeFFzncuQGMu5YxhQf5d3nMP+c5Exa6wjaRAikicHu8f
 +17I7/YB7PjfG2VX6pB6GVfZ9SVecZk=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-529-m69l1drZPDGsv-rcxMHPXg-1; Thu, 22 Sep 2022 12:41:35 -0400
X-MC-Unique: m69l1drZPDGsv-rcxMHPXg-1
Received: by mail-wr1-f70.google.com with SMTP id
 q17-20020adfab11000000b0022a44f0c5d9so3407772wrc.2
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 09:41:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date;
 bh=tN7sBJ022mVZi2q3q3OyaCWGqikXhV0cVNvUgbyZpAI=;
 b=EbTgChkWQ57A+MO0ZUYi1/9fiPZa+dPMvT8wIlPpdfxUtMYdElR9H+fLoENb8HxHRS
 wkC5oQ+RUoWrOEydzSZT5UmqbAKTWvAP/7KLLwGFCBzFYyv5OebWsEW1LlSuV7r5ZAmC
 iiFNRgI+5tZyvWBuFQsgVfFuzaf23vDtNvAtFcWbK7sX5a+AxL0LaWbjPUdb9hnCadFb
 KLgw4/48Y+bK6DNyoUvqB9WXaY6KE+/p+tpI1JhszbMRzFaU1pFI7j5ECN9ofIApmNOJ
 gcmOJWZ2gEQ8KZEidRnqFh4UgJdPJsfAP6MXcQ8wcOLk7HWopVbGQEVZ7+EQ5WfIu8u+
 XGvw==
X-Gm-Message-State: ACrzQf2BLrG9mcABkyPQdh2CqA1aNle/hteGEbdlgyBrB/wT9Y7nm3xz
 Eh7BhSTum/1BfX46pGWJlQEWDE3KkFJX6Mx9W1QpAaDt3dJNxeGjcvNoNr7LPqXNEmCvYMH3d8z
 xUrjblC2LhgQGkPQ=
X-Received: by 2002:a05:6000:110e:b0:228:c336:b1db with SMTP id
 z14-20020a056000110e00b00228c336b1dbmr2782957wrw.194.1663864892932; 
 Thu, 22 Sep 2022 09:41:32 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7qt4aBFukThu+6TaK2xJ20K7RjCxg+NQXLnJPbBa5CzgXhBm6IYY9WqCwCN5QGGHHEUG7zLA==
X-Received: by 2002:a05:6000:110e:b0:228:c336:b1db with SMTP id
 z14-20020a056000110e00b00228c336b1dbmr2782936wrw.194.1663864892696; 
 Thu, 22 Sep 2022 09:41:32 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 a8-20020a05600c348800b003a62400724bsm108458wmq.0.2022.09.22.09.41.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Sep 2022 09:41:32 -0700 (PDT)
Date: Thu, 22 Sep 2022 17:41:30 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, "Daniel P . Berrange" <berrange@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Subject: Re: [PATCH 1/5] migration: Fix possible deadloop of ram save process
Message-ID: <YyyQOlxaSHRbZIK6@work-vm>
References: <20220920223800.47467-1-peterx@redhat.com>
 <20220920223800.47467-2-peterx@redhat.com>
 <Yyx2An+YcgYCbsDx@work-vm> <Yyx+cs9ihNx+WE6G@xz-m1.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yyx+cs9ihNx+WE6G@xz-m1.local>
User-Agent: Mutt/2.2.7 (2022-08-07)
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Peter Xu (peterx@redhat.com) wrote:
> On Thu, Sep 22, 2022 at 03:49:38PM +0100, Dr. David Alan Gilbert wrote:
> > * Peter Xu (peterx@redhat.com) wrote:
> > > When starting ram saving procedure (especially at the completion phase),
> > > always set last_seen_block to non-NULL to make sure we can always correctly
> > > detect the case where "we've migrated all the dirty pages".
> > > 
> > > Then we'll guarantee both last_seen_block and pss.block will be valid
> > > always before the loop starts.
> > > 
> > > See the comment in the code for some details.
> > > 
> > > Signed-off-by: Peter Xu <peterx@redhat.com>
> > 
> > Yeh I guess it can currently only happen during restart?
> 
> There're only two places to clear last_seen_block:
> 
> ram_state_reset[2683]          rs->last_seen_block = NULL;
> ram_postcopy_send_discard_bitmap[2876] rs->last_seen_block = NULL;
> 
> Where for the reset case:
> 
> ram_state_init[2994]           ram_state_reset(*rsp);
> ram_state_resume_prepare[3110] ram_state_reset(rs);
> ram_save_iterate[3271]         ram_state_reset(rs);
> 
> So I think it can at least happen in two places, either (1) postcopy just
> started (assume when postcopy starts accidentally when all dirty pages were
> migrated?), or (2) postcopy recover from failure.

Oh, (1) is a more general problem then; yeh.

> In my case I triggered this deadloop when I was debugging the other bug
> fixed by the next patch where it was postcopy recovery (on tls), but only
> once..  So currently I'm still not 100% sure whether this is the same
> problem, but logically it could trigger.
> 
> I also remember I used to hit very rare deadloops before too, maybe they're
> the same thing because I did test recovery a lot.

Note; 'deadlock' not 'deadloop'.

Dave

> > 
> > Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> 
> Thanks!
> 
> -- 
> Peter Xu
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


