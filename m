Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55B275E6793
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 17:51:34 +0200 (CEST)
Received: from localhost ([::1]:51454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obOU9-0003UA-Ep
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 11:51:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1obO5E-0005nN-GQ
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 11:25:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49526)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1obO5B-0001Xi-3t
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 11:25:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663860342;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LJQkcwyHVghNYKi+YLT0d6Wbdilwg7B6IloNbdWyHlY=;
 b=NhVVnsAdBLlJ9ORR++u0eU9NyB+oykmO30zsjfZ2rFcOFB0JmMuzBfMi9Pr/7STSSj8IJg
 z29OQ95i4aSTpIflVDkt781Le1vpDm6Vdgg9N0M35FJUFrwglBj1A8Ey1SLHRNwX0oEjP4
 Xluqlkb9MsKMKlcGkPnkrQlts1QiqCQ=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-425-AUTYbBw3NL-HCyGrh1m23w-1; Thu, 22 Sep 2022 11:25:40 -0400
X-MC-Unique: AUTYbBw3NL-HCyGrh1m23w-1
Received: by mail-qt1-f197.google.com with SMTP id
 h7-20020ac85047000000b0035a6794699bso6610373qtm.3
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 08:25:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=LJQkcwyHVghNYKi+YLT0d6Wbdilwg7B6IloNbdWyHlY=;
 b=uT9unhWz0kyhzj2LmJB1fnry9oOipVd5y0afAciAYV0noz7Y9Q2TUbSJ1kBdnntcxs
 YVfOeh57avCugEBqQBmAOM9xLbDfpkwz3RXlc+sDoOSkfgLytfyecB4HEBueKDsFlXjp
 Sy1KgiYFOR2O5xjCxvB0tRcaoVyX324QXLV/j9C7RR71mJdHKPNSDKtGR2MFmisOwB+d
 Kid/12w3D1ORa4TbGjLG0hhpeGhVqYuho0InELC22Yo9O+zfx3fUu3jToslBaevsdRnA
 /VPW87YS0py0kwwgUFee+HL8JfPsA+cWN7V9GQ9zWo5Lp2gNc3U13EH8YvHCrQWv1mmt
 /Ekg==
X-Gm-Message-State: ACrzQf12fuk2kegj3GX19oUPpCRCdgiPBPDpseubUvdcC2E6qT+FFL5y
 X034M79oMMq2X3UkfTf0nmyTSPDipvFGKtvd10CZNASNEQ2SnG+32T75iRJLHlBMOL9nXNqzLfs
 9BrX6R0kpq4gLaoc=
X-Received: by 2002:a05:620a:14aa:b0:6cb:e3a2:311b with SMTP id
 x10-20020a05620a14aa00b006cbe3a2311bmr2511239qkj.266.1663860340445; 
 Thu, 22 Sep 2022 08:25:40 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7lfircyBki5AC2pEL1/cvbF/QmRbM5DLjNhRSEsRdJxqEDCCRWm5/U7Rs3pYLSbvT4IeQmeg==
X-Received: by 2002:a05:620a:14aa:b0:6cb:e3a2:311b with SMTP id
 x10-20020a05620a14aa00b006cbe3a2311bmr2511223qkj.266.1663860340210; 
 Thu, 22 Sep 2022 08:25:40 -0700 (PDT)
Received: from xz-m1.local
 (bras-base-aurron9127w-grc-46-70-31-27-79.dsl.bell.ca. [70.31.27.79])
 by smtp.gmail.com with ESMTPSA id
 de4-20020a05620a370400b006bbb07ebd83sm4079914qkb.108.2022.09.22.08.25.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Sep 2022 08:25:39 -0700 (PDT)
Date: Thu, 22 Sep 2022 11:25:38 -0400
From: Peter Xu <peterx@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: qemu-devel@nongnu.org, "Daniel P . Berrange" <berrange@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Subject: Re: [PATCH 1/5] migration: Fix possible deadloop of ram save process
Message-ID: <Yyx+cs9ihNx+WE6G@xz-m1.local>
References: <20220920223800.47467-1-peterx@redhat.com>
 <20220920223800.47467-2-peterx@redhat.com>
 <Yyx2An+YcgYCbsDx@work-vm>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Yyx2An+YcgYCbsDx@work-vm>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
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

On Thu, Sep 22, 2022 at 03:49:38PM +0100, Dr. David Alan Gilbert wrote:
> * Peter Xu (peterx@redhat.com) wrote:
> > When starting ram saving procedure (especially at the completion phase),
> > always set last_seen_block to non-NULL to make sure we can always correctly
> > detect the case where "we've migrated all the dirty pages".
> > 
> > Then we'll guarantee both last_seen_block and pss.block will be valid
> > always before the loop starts.
> > 
> > See the comment in the code for some details.
> > 
> > Signed-off-by: Peter Xu <peterx@redhat.com>
> 
> Yeh I guess it can currently only happen during restart?

There're only two places to clear last_seen_block:

ram_state_reset[2683]          rs->last_seen_block = NULL;
ram_postcopy_send_discard_bitmap[2876] rs->last_seen_block = NULL;

Where for the reset case:

ram_state_init[2994]           ram_state_reset(*rsp);
ram_state_resume_prepare[3110] ram_state_reset(rs);
ram_save_iterate[3271]         ram_state_reset(rs);

So I think it can at least happen in two places, either (1) postcopy just
started (assume when postcopy starts accidentally when all dirty pages were
migrated?), or (2) postcopy recover from failure.

In my case I triggered this deadloop when I was debugging the other bug
fixed by the next patch where it was postcopy recovery (on tls), but only
once..  So currently I'm still not 100% sure whether this is the same
problem, but logically it could trigger.

I also remember I used to hit very rare deadloops before too, maybe they're
the same thing because I did test recovery a lot.

> 
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

Thanks!

-- 
Peter Xu


