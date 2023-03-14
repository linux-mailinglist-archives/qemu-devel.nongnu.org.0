Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 091C96B9DCD
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Mar 2023 19:04:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pc8zx-0001ew-KK; Tue, 14 Mar 2023 14:03:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pc8zv-0001eT-6a
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 14:03:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pc8zt-0006p9-J3
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 14:03:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678817020;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=h7ca5T5UPHzyorqJD70yAyR8Pa2GyfJvs0M0CC3pF7s=;
 b=HJsDkNIRt4BBmTnFxLJOAEtOHwCmGOpeEq2CUJo4wB6JxUDbCtZ1EAseYWWlcJF1HMYFvg
 Ed3W0qvJIQ5aTJDX6H+gHwDGUixGCN8jnhAPZVnLv1jg9tNIK7FwHn0B/RtoE960KZbC4/
 QCPnApfmN9TBuYTu+/KcHfmVtdRD1bQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-621-GhUWr8lTOzauujTEiT_4eQ-1; Tue, 14 Mar 2023 14:03:38 -0400
X-MC-Unique: GhUWr8lTOzauujTEiT_4eQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 n38-20020a05600c3ba600b003ed29a0b729so2100803wms.9
 for <qemu-devel@nongnu.org>; Tue, 14 Mar 2023 11:03:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678817017;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=h7ca5T5UPHzyorqJD70yAyR8Pa2GyfJvs0M0CC3pF7s=;
 b=7sgYWvPfhioXp2ZKgD9hGthns8m6xX99bbD4o/2fRdRSRscVbOt88mmqX6ajbPlwqu
 eonCOguE+sEHyzLko0cMFSKN5VvwAv9n3v45uB5ioSWCETdyAZEY7+rIkQYwfwGxF3r9
 0WnBc+9zgbvKXPlnXN6Qjs663bp7gmWXEn+gdoFPrY+BuzHykv/f8a5gbiTyIohafaSL
 28OvRytY0uTRbZ+FB0YE9kPZ/fbt7H0mI1oBR+zaoDc/iFmt639A5Gbmq9i8x/9FpWhS
 hcWBEXd8v7FMRThi1zLJUfgj6t/VhR5lr5H3bJ+a71RqEywwosKvBXmW+PADWsrHrHlY
 34vw==
X-Gm-Message-State: AO0yUKU9L0QB6EZRqj3PiilcasrZaEm/misS6N/F6RGuYbH+EQp7nQqd
 hCFB9svzV3y5CZ0VkWDgut/HlgQJKyK1mxFV47405AQIHzI5qg1c4Q3hkIXaDM09IaqRaK3H3P8
 hbS2SxSIfCOzLVYE=
X-Received: by 2002:a05:600c:3491:b0:3eb:2e19:ff3a with SMTP id
 a17-20020a05600c349100b003eb2e19ff3amr14686909wmq.7.1678817017451; 
 Tue, 14 Mar 2023 11:03:37 -0700 (PDT)
X-Google-Smtp-Source: AK7set9WviiBqIKsbVO4irmzM0KpP1A/Decx29X5zjNd2JlGNuk/NxFfm1bHRKvzzBDffwBqRl61dQ==
X-Received: by 2002:a05:600c:3491:b0:3eb:2e19:ff3a with SMTP id
 a17-20020a05600c349100b003eb2e19ff3amr14686882wmq.7.1678817017190; 
 Tue, 14 Mar 2023 11:03:37 -0700 (PDT)
Received: from work-vm
 (ward-16-b2-v4wan-166627-cust863.vm18.cable.virginm.net. [81.97.203.96])
 by smtp.gmail.com with ESMTPSA id
 f6-20020a7bc8c6000000b003e215a796fasm3408520wml.34.2023.03.14.11.03.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Mar 2023 11:03:36 -0700 (PDT)
Date: Tue, 14 Mar 2023 18:03:34 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, quintela@redhat.com, lizhijian@cn.fujitsu.com,
 jdenemar@redhat.com
Subject: Re: [PATCH] migration/rdma: Fix return-path case
Message-ID: <ZBC29kyulA6EWG3P@work-vm>
References: <20230314171558.75941-1-dgilbert@redhat.com> <ZBC00qARI3Lu7YVw@x1n>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZBC00qARI3Lu7YVw@x1n>
User-Agent: Mutt/2.2.9 (2022-11-12)
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

* Peter Xu (peterx@redhat.com) wrote:
> On Tue, Mar 14, 2023 at 05:15:58PM +0000, Dr. David Alan Gilbert (git) wrote:
> > From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> > 
> > The RDMA code has return-path handling code, but it's only enabled
> > if postcopy is enabled; if the 'return-path' migration capability
> > is enabled, the return path is NOT setup but the core migration
> > code still tries to use it and breaks.
> > 
> > Enable the RDMA return path if either postcopy or the return-path
> > capability is enabled.
> > 
> > bz: https://bugzilla.redhat.com/show_bug.cgi?id=2063615
> > 
> > Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> 
> Acked-by: Peter Xu <peterx@redhat.com>
> 
> > @@ -3373,7 +3373,8 @@ static int qemu_rdma_accept(RDMAContext *rdma)
> >       * initialize the RDMAContext for return path for postcopy after first
> >       * connection request reached.
> >       */
> > -    if (migrate_postcopy() && !rdma->is_return_path) {
> > +    if ((migrate_postcopy() || migrate_use_return_path())
> > +        && !rdma->is_return_path) {
> >          rdma_return_path = qemu_rdma_data_init(rdma->host_port, NULL);
> >          if (rdma_return_path == NULL) {
> >              rdma_ack_cm_event(cm_event);
> 
> It's not extremely clear to me yet on when we should use migrate_postcopy()
> and when to use migrate_postcopy_ram().  I think it's because I don't know
> enough on the dirty-bitmaps capability.  Do we have some good documentation
> somewhere?

Hmm that's probably a good point.

> Not much I get from the qapi doc..
> 
> # @dirty-bitmaps: If enabled, QEMU will migrate named dirty bitmaps.
> #                 (since 2.12)

I don't know of any good docs; I think this is a blocks mechanism; I'm
not even sure if it needs the return path.

Dave

> Thanks,
> 
> -- 
> Peter Xu
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


