Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC1963D15D2
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 20:02:49 +0200 (CEST)
Received: from localhost ([::1]:53750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6GYS-0000Qq-R8
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 14:02:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1m6GWJ-0006xY-NK
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 14:00:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52553)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1m6GWF-0000cf-Ne
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 14:00:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626890430;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RJMcLAmKF4qUobFbnglDde3PZHk5p88cjZ0LmjAxf8k=;
 b=jEamSazhIyKDfKSaXUyFwgDJDwkuxrMEWIL77sCf+dEFJn2KqzXNGb6NjzeIDOzSuURkxm
 iaJfQ//HLk0k/otGmtqScFwQWkoMOIgV+Af7ce78tCtLC2A92cmc4UzaXes2h2IAqYO6D9
 gYZsYQM5YqC2TyELNHFwWyKFPXJJTB4=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-328-f8iDxfLANHWeTkrcJ7-sDA-1; Wed, 21 Jul 2021 14:00:28 -0400
X-MC-Unique: f8iDxfLANHWeTkrcJ7-sDA-1
Received: by mail-wr1-f71.google.com with SMTP id
 p4-20020a5d63840000b0290126f2836a61so1357271wru.6
 for <qemu-devel@nongnu.org>; Wed, 21 Jul 2021 11:00:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=RJMcLAmKF4qUobFbnglDde3PZHk5p88cjZ0LmjAxf8k=;
 b=gMd+L2PcJeRNjH6eVuxCnbsC1my0DsoOj8KU7gVyifIexiHT3HVsAUPyRr6PdlBdwe
 U1cOS+Nlc8ulkaeltOx+sHdZPYd6TqmA5RHywYWXNRGJGSvQZKWnGe645ozh8ZYea+ce
 8hJ7luo69LxhHLfVH6Rs5kKl4ZvLlhIL1lTK+RZR67DzLu3jX7Isn5LcveThGb9WuwSk
 TNhk2LyDBtYJ61ZImlGvd5yLnzzV0B8eKHKDyuSLYem47MW7tgG+MWogAFUdfRKVW1Mx
 xBikhBLrtpnEOyoiFypksTydkQ9BYTmOYsGoEg6anJTXrhbkGaI/DLmvSxajhugjIkwA
 GkCw==
X-Gm-Message-State: AOAM5303psIQYg0XdWn7mAckRW+CvU3psoI7hf+A6jLs3rfjr3Z8UYBm
 qVS0l2WXiwDv5PRj9PCYpQ7GKKISw4EohYeXc0xNCoEHjyrKh+at3a5j2S+TySC6UUj4UZoW07S
 9XYBZDFOEOaMlWr8=
X-Received: by 2002:a5d:6482:: with SMTP id o2mr43012237wri.367.1626890426995; 
 Wed, 21 Jul 2021 11:00:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw/QVPY7EGtvIjIMMd6AvvpudF0hTa4tS+Bn8EsTuH1d9sRZnboh5wxG7J29yX3KZwM/KgxwQ==
X-Received: by 2002:a5d:6482:: with SMTP id o2mr43012222wri.367.1626890426842; 
 Wed, 21 Jul 2021 11:00:26 -0700 (PDT)
Received: from work-vm (cpc109021-salf6-2-0-cust453.10-2.cable.virginm.net.
 [82.29.237.198])
 by smtp.gmail.com with ESMTPSA id r18sm27888520wrt.96.2021.07.21.11.00.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jul 2021 11:00:26 -0700 (PDT)
Date: Wed, 21 Jul 2021 19:00:24 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH 2/5] migration: Shutdown src in
 await_return_path_close_on_source()
Message-ID: <YPhguFWw32UPwSeq@work-vm>
References: <20210721012134.792845-1-peterx@redhat.com>
 <20210721012134.792845-3-peterx@redhat.com>
 <YPfu9N98PyTp7AKX@work-vm> <YPg//E0nJwCykzaw@t490s>
MIME-Version: 1.0
In-Reply-To: <YPg//E0nJwCykzaw@t490s>
User-Agent: Mutt/2.0.7 (2021-05-04)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.459,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Lukas Straub <lukasstraub2@web.de>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>, qemu-devel@nongnu.org,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Peter Xu (peterx@redhat.com) wrote:
> On Wed, Jul 21, 2021 at 10:55:00AM +0100, Dr. David Alan Gilbert wrote:
> > * Peter Xu (peterx@redhat.com) wrote:
> > > We have a logic in await_return_path_close_on_source() that we will explicitly
> > > shutdown the socket when migration encounters errors.  However it could be racy
> > > because from_dst_file could have been reset right after checking it but before
> > > passing it to qemu_file_shutdown() by the rp_thread.
> > > 
> > > Fix it by shutdown() on the src file instead.  Since they must be a pair of
> > > qemu files, shutdown on either of them will work the same.
> > > 
> > > Since at it, drop the check for from_dst_file directly, which makes the
> > > behavior even more predictable.
> > 
> > So while the existing code maybe racy, I'm not sure that this change
> > keeps the semantics; the channel may well have dup()'d the fd's for the
> > two directions, and I'm not convinced that a shutdown() on one will
> > necessarily impact the other; and if the shutdown doesn't happen the
> > rp_thread might not exit, and we might block on the koin.
> 
> dup() seems fine as long as the backend file/socket is the same; but I get the
> point here, e.g., potentially from/to channels can indeed be different ones.
> 
> > 
> > Why don't we solve this a different way - how about we move the:
> >     ms->rp_state.from_dst_file = NULL;
> >     qemu_fclose(rp);
> > 
> > out of the source_return_path_thread and put it in
> > await_return_path_close_on_source, immediately after the join?
> > Then we *know* that the the rp thread isn't messing with it.
> 
> Yes that looks working for this special case of when rp_thread quits.
> 
> It's just that it'll make things a bit more complicated, previously
> from_dst_file is only reset in rp_thread (for either paused or completed
> migration), now we handle "migration completes" a bit different.
> 
> This also reminded me that maybe we can also use the qemu_file_lock mutex as we
> use to try protect access to to_dst_file, because I think from_dst_file is
> potentially racy in the same way.  Even if we moved the reset to migration
> thread, we still have e.g. migrate_fd_cancel() calling:
> 
>     if (s->rp_state.from_dst_file) {
>         qemu_file_shutdown(s->rp_state.from_dst_file);
>     }
> 
> I think that is also racy too when running in the main thread, as either the
> migration thread or rp_thread could have reset it right after the check.
> 
> So.. maybe I start to use the qemu_file_lock to cover from_dst_file cases too?
> Then I'll cover at leasd both migrate_fd_cancel() and this case.

Yes, I think that's best; but try to do as little as possible with the
lock held.

Dave

> Thanks,
> 
> -- 
> Peter Xu
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


