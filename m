Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65B9852A79C
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 18:06:51 +0200 (CEST)
Received: from localhost ([::1]:52530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqzij-0003sk-QS
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 12:06:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1nqzcy-0000Yo-ST
 for qemu-devel@nongnu.org; Tue, 17 May 2022 12:00:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56922)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1nqzcv-0007Ai-V2
 for qemu-devel@nongnu.org; Tue, 17 May 2022 12:00:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652803249;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KXyNdb/qYUm4bT/FBPlcTWmb50A3X6cgMHVfkh1hjtg=;
 b=R+MypPevPEtuFt2sZJsN8Ke6HneEipm3QA1INSdlU3yFc4thBPdsv9M8kFMwKWh+XdlghU
 PDzziyYYhd52o2x97p+8CHf3rFbx/TPw7jM6xCMKWolQv2VOBNwAK4ZcKeSQ7QH+xLA7uC
 Itwg4w2Su8jtVmrG3Due5lbFpQJiOKU=
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-615-jyWHXO3wOompLK-v-7ByWw-1; Tue, 17 May 2022 12:00:47 -0400
X-MC-Unique: jyWHXO3wOompLK-v-7ByWw-1
Received: by mail-io1-f71.google.com with SMTP id
 x13-20020a0566022c4d00b0065491fa5614so12649105iov.9
 for <qemu-devel@nongnu.org>; Tue, 17 May 2022 09:00:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=KXyNdb/qYUm4bT/FBPlcTWmb50A3X6cgMHVfkh1hjtg=;
 b=yw3Gfn+uNxkE5Uq+2nT1hsu565MuswfORjsJUMdPGhnkUayrDGaH7t45XOKwMFmM5h
 TRf2nYDGXsCgRY72vRFkVmIXFl6Ct7N+CRhU2GHHccuVhCBx8+hRR0sbiI/0dLKHl9CH
 4byICKMFCQLojFotluANT0Wz+0zEb/UrC4aqL5olotkSasFwYHQ6YxPJB75ZHEj2hj13
 BkxzIO55IBlIK2ZM8Ru6lHNa2TE1HEyIRP1ro8YKb8IBXwxdmzraxqkz7CoBvRVYEefQ
 tECCLhXv/hS8dMttdhhBKaQhzqOb8jv6je9FFlbn6EhMYBJMjVzFNNR2nGluzb0b2r/y
 SFBA==
X-Gm-Message-State: AOAM531noqlQtmWcZT7JrmEzFAOT5S8y2jNRgjywSd95vd7oRt70QCem
 vRvr2C8AFxFKP0FBQ+97eHToG/StWH9uZvpAQ/S0b8UiVtUUNOauWpErqjVoyZAe1DHIHf0vReS
 GXYf0Gpb+G7lbbpA=
X-Received: by 2002:a5d:94cf:0:b0:657:24c1:bb7f with SMTP id
 y15-20020a5d94cf000000b0065724c1bb7fmr10534971ior.195.1652803247108; 
 Tue, 17 May 2022 09:00:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyE6B3R173NBzm5Zy75ez6htCa2Uqc/Sddo4MAvsdvHP0lMij9UJ6z/7aacMkpnD0IZTAypfw==
X-Received: by 2002:a5d:94cf:0:b0:657:24c1:bb7f with SMTP id
 y15-20020a5d94cf000000b0065724c1bb7fmr10534949ior.195.1652803246868; 
 Tue, 17 May 2022 09:00:46 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 e199-20020a0269d0000000b0032e1655c763sm2489254jac.67.2022.05.17.09.00.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 May 2022 09:00:46 -0700 (PDT)
Date: Tue, 17 May 2022 10:00:45 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Juan Quintela <quintela@redhat.com>, Avihai Horon <avihaih@nvidia.com>,
 qemu-devel@nongnu.org, "Michael S . Tsirkin" <mst@redhat.com>, Cornelia
 Huck <cohuck@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, "Dr . David
 Alan Gilbert" <dgilbert@redhat.com>, Yishai Hadas <yishaih@nvidia.com>,
 Mark Bloch <mbloch@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, Kirti
 Wankhede <kwankhede@nvidia.com>, Tarun Gupta <targupta@nvidia.com>
Subject: Re: [PATCH 4/9] vfio/migration: Skip pre-copy if dirty page
 tracking is not supported
Message-ID: <20220517100045.27a696c9.alex.williamson@redhat.com>
In-Reply-To: <20220516230832.GP1343366@nvidia.com>
References: <20220512154320.19697-1-avihaih@nvidia.com>
 <20220512154320.19697-5-avihaih@nvidia.com>
 <87h75psowp.fsf@secure.mitica>
 <20220516142200.57003872.alex.williamson@redhat.com>
 <20220516230832.GP1343366@nvidia.com>
Organization: Red Hat
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Mon, 16 May 2022 20:08:32 -0300
Jason Gunthorpe <jgg@nvidia.com> wrote:

> On Mon, May 16, 2022 at 02:22:00PM -0600, Alex Williamson wrote:
> > On Mon, 16 May 2022 13:22:14 +0200
> > Juan Quintela <quintela@redhat.com> wrote:
> >   
> > > Avihai Horon <avihaih@nvidia.com> wrote:  
> > > > Currently, if IOMMU of a VFIO container doesn't support dirty page
> > > > tracking, migration is blocked completely. This is because a DMA-able
> > > > VFIO device can dirty RAM pages without updating QEMU about it, thus
> > > > breaking the migration.
> > > >
> > > > However, this doesn't mean that migration can't be done at all. If
> > > > migration pre-copy phase is skipped, the VFIO device doesn't have a
> > > > chance to dirty RAM pages that have been migrated already, thus
> > > > eliminating the problem previously mentioned.
> > > >
> > > > Hence, in such case allow migration but skip pre-copy phase.
> > > >
> > > > Signed-off-by: Avihai Horon <avihaih@nvidia.com>    
> > > 
> > > I don't know (TM).
> > > Several issues:
> > > - Patch is ugly as hell (ok, that depends on taste)
> > > - It changes migration_iteration_run() instead of directly
> > >   migration_thread.
> > > - There is already another case where we skip the sending of RAM
> > >   (localhost migration with shared memory)
> > > 
> > > In migration/ram.c:
> > > 
> > > static int ram_find_and_save_block(RAMState *rs, bool last_stage)
> > > {
> > >     PageSearchStatus pss;
> > >     int pages = 0;
> > >     bool again, found;
> > > 
> > >     /* No dirty page as there is zero RAM */
> > >     if (!ram_bytes_total()) {
> > >         return pages;
> > >     }
> > > 
> > > This is the other place where we _don't_ send any RAM at all.
> > > 
> > > I don't have a great idea about how to make things clear at a higher
> > > level, I have to think about this.  
> > 
> > It seems like if we have devices dictating what type of migrations can
> > be performed then there probably needs to be a switch to restrict use of
> > such devices just as we have the -only-migratable switch now to prevent
> > attaching devices that don't support migration.  I'd guess that we need
> > the switch to opt-in to allowing such devices to maintain
> > compatibility.  There's probably a whole pile of qapi things missing to
> > expose this to management tools as well.  Thanks,  
> 
> This is really intended to be a NOP from where things are now, as if
> you use mlx5 live migration without a patch like this then it causes a
> botched pre-copy since everything just ends up permanently dirty.
> 
> If it makes more sense we could abort the pre-copy too - in the end
> there will be dirty tracking so I don't know if I'd invest in a big
> adventure to fully define non-dirty tracking migration.

How is pre-copy currently "botched" without a patch like this?  If it's
simply that the pre-copy doesn't converge and the downtime constraints
don't allow the VM to enter stop-and-copy, that's the expected behavior
AIUI, and supports backwards compatibility with existing SLAs.

I'm assuming that by setting this new skip_precopy flag that we're
forcing the VM to move to stop-and-copy, regardless of any other SLA
constraints placed on the migration.  It seems like a better solution
would be to expose to management tools that the VM contains a device
that does not support the pre-copy phase so that downtime expectations
can be adjusted.  Thanks,

Alex


