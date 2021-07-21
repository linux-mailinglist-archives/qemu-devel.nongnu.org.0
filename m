Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B97CA3D12CD
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 17:49:44 +0200 (CEST)
Received: from localhost ([::1]:44968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6ETf-0001tx-R4
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 11:49:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m6EL4-0002kF-Ow
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 11:40:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40273)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m6EL3-00051I-53
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 11:40:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626882048;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8zqtpk6DNLcyKYF10D3Jlc1Ryu1eFaYX/26QK45uW6Q=;
 b=B0/pKAuC5FoMlAAwNGupNhq3FPGEdQ5v+9eDR9Q+ScmyJYdbyDZ3LRRxtIY1kYTeJGRbXx
 lY+fknpEDQpDO1FaCktZAiK1Cjnd/ce1C2XbBvvA0mmRtCSxZqOXiNPLFynd0XrTGL2gZv
 gbpMVP+Tvo2pCfifjnihux/tmLoDOMY=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-447-mNAikevMMdKkkWCbqRRSEQ-1; Wed, 21 Jul 2021 11:40:46 -0400
X-MC-Unique: mNAikevMMdKkkWCbqRRSEQ-1
Received: by mail-qt1-f197.google.com with SMTP id
 d7-20020ac85ac70000b029026ae3f4adc9so1787261qtd.13
 for <qemu-devel@nongnu.org>; Wed, 21 Jul 2021 08:40:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=8zqtpk6DNLcyKYF10D3Jlc1Ryu1eFaYX/26QK45uW6Q=;
 b=e5M2BpgoFHQSRo7jTCtlgfbAAxvQhNBONiOR4XB/OLGXQXUzR7HrGloMYuBwBzl6hx
 yT/c2RkaWzTCsCuBRDpY6mhHTXltoltkRyo0RVHLRIIyNVfsT131rpwjF/ddiL7FapHG
 9OCBYwch+hrOdTXVJJxG5GXsYo8jRkAUlwSzcunQcNmLMyFAmk/K5+w7awV5PYuWE8iA
 c5EISrJeeZ/1mr+Pc9RyHaXu7omzgGUXW/kTwoVWEP1zcUcuc4iM5xhBxSb2iVSGlM2y
 wdOV7IYCkwVbKab8gruTnrNd7KbEjy69CmdpQ8J/HArg5UjYb/HXBNEXsg3oFZBi76C0
 1pYQ==
X-Gm-Message-State: AOAM5308D7gMwz+JdUaFP624CfH8mmr/8m0dSyhGLDPPiWjfLKuUpmF0
 7mSarMXWVst66nIaDr8bLWX3VTd/lXyAwa+p2qLjAfcK6G6Y7gUYM4MvA0pVbRgmqa3NC8FtMma
 J51sJg6jJ1eePXMg=
X-Received: by 2002:ac8:751a:: with SMTP id u26mr32782285qtq.329.1626882046445; 
 Wed, 21 Jul 2021 08:40:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzf6di/OV+Kj8o6Si+RGoIqcQnHi74LMCVj0Yj1JlnSIQV516qyJ2uHq2Z2uU4TYmdU9OA++w==
X-Received: by 2002:ac8:751a:: with SMTP id u26mr32782269qtq.329.1626882046156; 
 Wed, 21 Jul 2021 08:40:46 -0700 (PDT)
Received: from t490s
 (bras-base-toroon474qw-grc-65-184-144-111-238.dsl.bell.ca. [184.144.111.238])
 by smtp.gmail.com with ESMTPSA id t14sm3943909qkm.7.2021.07.21.08.40.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jul 2021 08:40:45 -0700 (PDT)
Date: Wed, 21 Jul 2021 11:40:44 -0400
From: Peter Xu <peterx@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH 2/5] migration: Shutdown src in
 await_return_path_close_on_source()
Message-ID: <YPg//E0nJwCykzaw@t490s>
References: <20210721012134.792845-1-peterx@redhat.com>
 <20210721012134.792845-3-peterx@redhat.com>
 <YPfu9N98PyTp7AKX@work-vm>
MIME-Version: 1.0
In-Reply-To: <YPfu9N98PyTp7AKX@work-vm>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
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

On Wed, Jul 21, 2021 at 10:55:00AM +0100, Dr. David Alan Gilbert wrote:
> * Peter Xu (peterx@redhat.com) wrote:
> > We have a logic in await_return_path_close_on_source() that we will explicitly
> > shutdown the socket when migration encounters errors.  However it could be racy
> > because from_dst_file could have been reset right after checking it but before
> > passing it to qemu_file_shutdown() by the rp_thread.
> > 
> > Fix it by shutdown() on the src file instead.  Since they must be a pair of
> > qemu files, shutdown on either of them will work the same.
> > 
> > Since at it, drop the check for from_dst_file directly, which makes the
> > behavior even more predictable.
> 
> So while the existing code maybe racy, I'm not sure that this change
> keeps the semantics; the channel may well have dup()'d the fd's for the
> two directions, and I'm not convinced that a shutdown() on one will
> necessarily impact the other; and if the shutdown doesn't happen the
> rp_thread might not exit, and we might block on the koin.

dup() seems fine as long as the backend file/socket is the same; but I get the
point here, e.g., potentially from/to channels can indeed be different ones.

> 
> Why don't we solve this a different way - how about we move the:
>     ms->rp_state.from_dst_file = NULL;
>     qemu_fclose(rp);
> 
> out of the source_return_path_thread and put it in
> await_return_path_close_on_source, immediately after the join?
> Then we *know* that the the rp thread isn't messing with it.

Yes that looks working for this special case of when rp_thread quits.

It's just that it'll make things a bit more complicated, previously
from_dst_file is only reset in rp_thread (for either paused or completed
migration), now we handle "migration completes" a bit different.

This also reminded me that maybe we can also use the qemu_file_lock mutex as we
use to try protect access to to_dst_file, because I think from_dst_file is
potentially racy in the same way.  Even if we moved the reset to migration
thread, we still have e.g. migrate_fd_cancel() calling:

    if (s->rp_state.from_dst_file) {
        qemu_file_shutdown(s->rp_state.from_dst_file);
    }

I think that is also racy too when running in the main thread, as either the
migration thread or rp_thread could have reset it right after the check.

So.. maybe I start to use the qemu_file_lock to cover from_dst_file cases too?
Then I'll cover at leasd both migrate_fd_cancel() and this case.

Thanks,

-- 
Peter Xu


