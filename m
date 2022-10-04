Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4762D5F46F4
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 17:52:20 +0200 (CEST)
Received: from localhost ([::1]:60192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofkDR-0005sR-Ff
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 11:52:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1ofjRq-0005uN-62
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 11:03:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47309)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1ofjRl-0007TC-Vz
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 11:03:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664895780;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+MdtJeXsWrt/VL7+WlKKTbL1ylT+h7FBKLrAjWBRLz8=;
 b=bdm2V4w66xjPs9WzZ7e48nn2mwPJsWwkzmlWleS3Ln7qixdInS+4ZvLvWHBnkFPgVrpghT
 sfp34xEN5VJ4e79vu+rLiv297HBDbGV+IJJVcFrXA6IiEsn9eTpH7HtvSnQxTqQDOmu3Bu
 m+Er6/VHgfkMTbzBEitJ8UE7W7v/mas=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-206--QBQIbp8O5OQCb6sbZ5NZQ-1; Tue, 04 Oct 2022 11:02:59 -0400
X-MC-Unique: -QBQIbp8O5OQCb6sbZ5NZQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 i26-20020adfaada000000b0022e2f38ffccso2253404wrc.14
 for <qemu-devel@nongnu.org>; Tue, 04 Oct 2022 08:02:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date;
 bh=+MdtJeXsWrt/VL7+WlKKTbL1ylT+h7FBKLrAjWBRLz8=;
 b=MR06MCogfLAIncyZzIj7DtWiWLuQ6hRgTSHGD3zTzm6FOx7ilkCxfpPbre5qsy3mO2
 uwVEjSKFLZWEV1oZmUnl4zI/xT9+St+kw6CeMu4SK1K8RtfXsYuI7fHj4JBwIGLZyzGw
 itIzXR81UetUaQ0uiCt9BePA0SlU3MxfrNNfcycYN2bTSehr5DuobRxCOVX9Rx/eUz3f
 zudjVVoqAN343h/nNP71Okds+Rt279ZQGBuAtTrX6ttVTEosZFXnDsnVMGsobR96cCx5
 LPepyVX12zPqyLtpMp2F9o48kSMM+aX9TuVVmwGMIr/UbeZdRTBKntTHr1XoDVhy2T2l
 fMAw==
X-Gm-Message-State: ACrzQf0o1gIoZ08boWg64gan6tNbVCS7iRZB9+mllkD6zaYlcj5eoPHI
 DEh7AZXIyBQlDvjqy5WJkgmvERI4RliMyCg4Z20tJvELRoGQ03dB6af3mUij12Ii/eaxxnrNBUY
 yBOBs/019TVuVu0w=
X-Received: by 2002:adf:fbc3:0:b0:22c:8a19:1762 with SMTP id
 d3-20020adffbc3000000b0022c8a191762mr16304962wrs.169.1664895777868; 
 Tue, 04 Oct 2022 08:02:57 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4/VYd8WeR4s0Lo23xlUmJpyX07UupcEeNTHOwpNvZDI6flGfu2R+zK03zjGdaDDJgFgJlOeA==
X-Received: by 2002:adf:fbc3:0:b0:22c:8a19:1762 with SMTP id
 d3-20020adffbc3000000b0022c8a191762mr16304862wrs.169.1664895776812; 
 Tue, 04 Oct 2022 08:02:56 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 h11-20020adfe98b000000b0022c906ffedasm12635408wrm.70.2022.10.04.08.02.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Oct 2022 08:02:56 -0700 (PDT)
Date: Tue, 4 Oct 2022 16:02:53 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, "Daniel P . Berrange" <berrange@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Subject: Re: [PATCH 1/5] migration: Fix possible deadloop of ram save process
Message-ID: <YzxLHaw7B9V2qxGp@work-vm>
References: <20220920223800.47467-1-peterx@redhat.com>
 <20220920223800.47467-2-peterx@redhat.com>
 <Yyx2An+YcgYCbsDx@work-vm> <Yyx+cs9ihNx+WE6G@xz-m1.local>
 <YyyQOlxaSHRbZIK6@work-vm> <YzxCcdPSewXDDwB+@x1n>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YzxCcdPSewXDDwB+@x1n>
User-Agent: Mutt/2.2.7 (2022-08-07)
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
> On Thu, Sep 22, 2022 at 05:41:30PM +0100, Dr. David Alan Gilbert wrote:
> > * Peter Xu (peterx@redhat.com) wrote:
> > > On Thu, Sep 22, 2022 at 03:49:38PM +0100, Dr. David Alan Gilbert wrote:
> > > > * Peter Xu (peterx@redhat.com) wrote:
> > > > > When starting ram saving procedure (especially at the completion phase),
> > > > > always set last_seen_block to non-NULL to make sure we can always correctly
> > > > > detect the case where "we've migrated all the dirty pages".
> > > > > 
> > > > > Then we'll guarantee both last_seen_block and pss.block will be valid
> > > > > always before the loop starts.
> > > > > 
> > > > > See the comment in the code for some details.
> > > > > 
> > > > > Signed-off-by: Peter Xu <peterx@redhat.com>
> > > > 
> > > > Yeh I guess it can currently only happen during restart?
> > > 
> > > There're only two places to clear last_seen_block:
> > > 
> > > ram_state_reset[2683]          rs->last_seen_block = NULL;
> > > ram_postcopy_send_discard_bitmap[2876] rs->last_seen_block = NULL;
> > > 
> > > Where for the reset case:
> > > 
> > > ram_state_init[2994]           ram_state_reset(*rsp);
> > > ram_state_resume_prepare[3110] ram_state_reset(rs);
> > > ram_save_iterate[3271]         ram_state_reset(rs);
> > > 
> > > So I think it can at least happen in two places, either (1) postcopy just
> > > started (assume when postcopy starts accidentally when all dirty pages were
> > > migrated?), or (2) postcopy recover from failure.
> > 
> > Oh, (1) is a more general problem then; yeh.
> > 
> > > In my case I triggered this deadloop when I was debugging the other bug
> > > fixed by the next patch where it was postcopy recovery (on tls), but only
> > > once..  So currently I'm still not 100% sure whether this is the same
> > > problem, but logically it could trigger.
> > > 
> > > I also remember I used to hit very rare deadloops before too, maybe they're
> > > the same thing because I did test recovery a lot.
> > 
> > Note; 'deadlock' not 'deadloop'.
> 
> (Oops I somehow forgot there's still this series pending..)
> 
> Here it's not about a lock, or maybe I should add a space ("dead loop")?

So the normal phrases I'm used to are:
  'deadlock' - two threads waiting for each other
  'livelock' - two threads spinning for each other

Dave

> -- 
> Peter Xu
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


