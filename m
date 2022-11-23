Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11DDC6368A5
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Nov 2022 19:24:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxuPi-000339-R3; Wed, 23 Nov 2022 13:24:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oxuPh-00032c-0a
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 13:24:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oxuPe-0005b4-TR
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 13:24:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669227837;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kJCMuj6j/qB4ie0u4yIKypS/ud9QgstC80z6Tjkfux4=;
 b=bhWwhjKMmyqq/mn8yxboHU/G+y1EXcJqrn1b5IqGIAaKplNpAJtBFSM/azBRisaDsQZOPU
 YL76PyJpqwnT7CPTR7hBE3oVstmoYcgxXiIuBm+fsRQ4tslrIxw3yV48OEeimRPY6BfpKN
 e806nxZGniYsRLxsn3WeQ0znakeTQdA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-349-638kVpv1MDWPIuUhcHAr6Q-1; Wed, 23 Nov 2022 13:23:56 -0500
X-MC-Unique: 638kVpv1MDWPIuUhcHAr6Q-1
Received: by mail-wm1-f69.google.com with SMTP id
 c126-20020a1c3584000000b003cfffcf7c1aso1410200wma.0
 for <qemu-devel@nongnu.org>; Wed, 23 Nov 2022 10:23:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-transfer-encoding
 :content-disposition:mime-version:references:message-id:subject:cc
 :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kJCMuj6j/qB4ie0u4yIKypS/ud9QgstC80z6Tjkfux4=;
 b=n5NkpyyNr34fITiUxymbPpZGF9Xi0Ufhh5WFnf16OJlDsfTfA1Aio3YhKk/Yl0G0xC
 6mc6UhRRyp2pfbTUXa7YfgUXbWvdsIl1q8WVmCl3p53/xiKYtuq2QJi9tRyPJhQzLJbs
 KUMNnvrDl1JA2DtaGIQhq64nNnu3E7X7Md2MxL306tQ/YacJGrB5UfmRsP5Fd+sM2eIC
 reoPpY9wlA5OkgKNgbRDfYRBo3o1cSopMpbROdISiR7antYogDqfQBnCBO3dcwEAOPYC
 XcJpF9la4b81MHeXIJbGv6FpjtSfe2Wz0DZqFz/UWgZrNhG1jfthZuC4YwDKSdoBbQuY
 SwmA==
X-Gm-Message-State: ANoB5pkMlIGiFsSFis+wWnrajkiB8rjlPqovyJTI1DBJsY27gr4srbRn
 nVx8wYYvyFIKz0ELEr68a1w2flmAEHFt/5sjNLZ2KQD31uYBd7dpK7WgGXK2hwM7HQC5zC2NM2S
 w+58/EhK06JpKy3o=
X-Received: by 2002:a7b:cc85:0:b0:3bf:d1e2:1d9 with SMTP id
 p5-20020a7bcc85000000b003bfd1e201d9mr14583841wma.115.1669227834790; 
 Wed, 23 Nov 2022 10:23:54 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7eGFcYHOs5xOk9IthmgHcpU5LOmxX8iXEbbWSLmeR1WIDCZ/of4xgScPicCrIHtH4t9zbS6A==
X-Received: by 2002:a7b:cc85:0:b0:3bf:d1e2:1d9 with SMTP id
 p5-20020a7bcc85000000b003bfd1e201d9mr14583813wma.115.1669227834552; 
 Wed, 23 Nov 2022 10:23:54 -0800 (PST)
Received: from work-vm
 (ward-16-b2-v4wan-166627-cust863.vm18.cable.virginm.net. [81.97.203.96])
 by smtp.gmail.com with ESMTPSA id
 l10-20020adff48a000000b002366ded5864sm17126289wro.116.2022.11.23.10.23.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Nov 2022 10:23:54 -0800 (PST)
Date: Wed, 23 Nov 2022 18:23:51 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Avihai Horon <avihaih@nvidia.com>
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-devel@nongnu.org, Alex Williamson <alex.williamson@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>,
 Eric Blake <eblake@redhat.com>, John Snow <jsnow@redhat.com>,
 qemu-s390x@nongnu.org, qemu-block@nongnu.org,
 Kunkun Jiang <jiangkunkun@huawei.com>,
 "Zhang, Chen" <chen.zhang@intel.com>,
 Yishai Hadas <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Maor Gottlieb <maorg@nvidia.com>, Shay Drory <shayd@nvidia.com>,
 Kirti Wankhede <kwankhede@nvidia.com>, Tarun Gupta <targupta@nvidia.com>,
 Joao Martins <joao.m.martins@oracle.com>
Subject: Re: [PATCH v3 01/17] migration: Remove res_compatible parameter
Message-ID: <Y35lN2Pk1FAef4cR@work-vm>
References: <20221103161620.13120-1-avihaih@nvidia.com>
 <20221103161620.13120-2-avihaih@nvidia.com>
 <fbf06ccb-c339-d323-c01e-455109bed372@yandex-team.ru>
 <a469eb6a-8630-0e2e-e000-4a24bbb9b26d@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a469eb6a-8630-0e2e-e000-4a24bbb9b26d@nvidia.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
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

* Avihai Horon (avihaih@nvidia.com) wrote:
> 
> On 08/11/2022 19:52, Vladimir Sementsov-Ogievskiy wrote:
> > External email: Use caution opening links or attachments
> > 
> > 
> > On 11/3/22 19:16, Avihai Horon wrote:
> > > From: Juan Quintela <quintela@redhat.com>
> > > 
> > > It was only used for RAM, and in that case, it means that this amount
> > > of data was sent for memory.
> > 
> > Not clear for me, what means "this amount of data was sent for
> > memory"... That amount of data was not yet sent, actually.
> > 
> Yes, this should be changed to something like:
> 
> "It was only used for RAM, and in that case, it means that this amount
> of data still needs to be sent for memory, and can be sent in any phase
> of migration. The same functionality can be achieved without res_compatible,
> so just delete the field in all callers and change the definition of
> res_postcopy accordingly.".

Sorry, I recently sent a similar comment in reply to Juan's original
post.
If I understand correctly though, the dirty bitmap code relies on
'postcopy' here to be data only sent during postcopy.

Dave

> > > Just delete the field in all callers.
> > > 
> > > Signed-off-by: Juan Quintela <quintela@redhat.com>
> > > ---
> > >   hw/s390x/s390-stattrib.c       |  6 ++----
> > >   hw/vfio/migration.c            | 10 ++++------
> > >   hw/vfio/trace-events           |  2 +-
> > >   include/migration/register.h   | 20 ++++++++++----------
> > >   migration/block-dirty-bitmap.c |  7 +++----
> > >   migration/block.c              |  7 +++----
> > >   migration/migration.c          |  9 ++++-----
> > >   migration/ram.c                |  8 +++-----
> > >   migration/savevm.c             | 14 +++++---------
> > >   migration/savevm.h             |  4 +---
> > >   migration/trace-events         |  2 +-
> > >   11 files changed, 37 insertions(+), 52 deletions(-)
> > > 
> > 
> > [..]
> > 
> > > diff --git a/include/migration/register.h b/include/migration/register.h
> > > index c1dcff0f90..1950fee6a8 100644
> > > --- a/include/migration/register.h
> > > +++ b/include/migration/register.h
> > > @@ -48,18 +48,18 @@ typedef struct SaveVMHandlers {
> > >       int (*save_setup)(QEMUFile *f, void *opaque);
> > >       void (*save_live_pending)(QEMUFile *f, void *opaque,
> > >                                 uint64_t threshold_size,
> > > -                              uint64_t *res_precopy_only,
> > > -                              uint64_t *res_compatible,
> > > -                              uint64_t *res_postcopy_only);
> > > +                              uint64_t *rest_precopy,
> > > +                              uint64_t *rest_postcopy);
> > >       /* Note for save_live_pending:
> > > -     * - res_precopy_only is for data which must be migrated in
> > > precopy phase
> > > -     *     or in stopped state, in other words - before target vm start
> > > -     * - res_compatible is for data which may be migrated in any phase
> > > -     * - res_postcopy_only is for data which must be migrated in
> > > postcopy phase
> > > -     *     or in stopped state, in other words - after source vm stop
> > > +     * - res_precopy is for data which must be migrated in precopy
> > > +     *     phase or in stopped state, in other words - before target
> > > +     *     vm start
> > > +     * - res_postcopy is for data which must be migrated in postcopy
> > > +     *     phase or in stopped state, in other words - after source vm
> > > +     *     stop
> > >        *
> > > -     * Sum of res_postcopy_only, res_compatible and
> > > res_postcopy_only is the
> > > -     * whole amount of pending data.
> > > +     * Sum of res_precopy and res_postcopy is the whole amount of
> > > +     * pending data.
> > >        */
> > > 
> > > 
> > 
> > [..]
> > 
> > > diff --git a/migration/ram.c b/migration/ram.c
> > > index dc1de9ddbc..20167e1102 100644
> > > --- a/migration/ram.c
> > > +++ b/migration/ram.c
> > > @@ -3435,9 +3435,7 @@ static int ram_save_complete(QEMUFile *f, void
> > > *opaque)
> > >   }
> > > 
> > >   static void ram_save_pending(QEMUFile *f, void *opaque, uint64_t
> > > max_size,
> > > -                             uint64_t *res_precopy_only,
> > > -                             uint64_t *res_compatible,
> > > -                             uint64_t *res_postcopy_only)
> > > +                             uint64_t *res_precopy, uint64_t
> > > *res_postcopy)
> > >   {
> > >       RAMState **temp = opaque;
> > >       RAMState *rs = *temp;
> > > @@ -3457,9 +3455,9 @@ static void ram_save_pending(QEMUFile *f, void
> > > *opaque, uint64_t max_size,
> > > 
> > >       if (migrate_postcopy_ram()) {
> > >           /* We can do postcopy, and all the data is postcopiable */
> > > -        *res_compatible += remaining_size;
> > > +        *res_postcopy += remaining_size;
> > 
> > That's seems to be not quite correct.
> > 
> > res_postcopy is defined as "data which must be migrated in postcopy",
> > but that's not true here, as RAM can be migrated both in precopy and
> > postcopy.
> > 
> > Still we really can include "compat" into "postcopy" just because in the
> > logic of migration_iteration_run() we don't actually distinguish
> > "compat" and "post". The logic only depends on "total" and "pre".
> > 
> > So, if we want to combine "compat" into "post", we should redefine
> > "post" in the comment in include/migration/register.h, something like
> > this:
> > 
> > - res_precopy is for data which MUST be migrated in precopy
> >   phase or in stopped state, in other words - before target
> >   vm start
> > 
> > - res_postcopy is for all data except for declared in res_precopy.
> >   res_postcopy data CAN be migrated in postcopy, i.e. after target
> >   vm start.
> > 
> > 
> You are right, the definition of res_postcopy should be changed.
> 
> Yet, I am not sure if this patch really makes things more clear/simple.
> Juan, what do you think?
> 
> Thanks!
> > >       } else {
> > > -        *res_precopy_only += remaining_size;
> > > +        *res_precopy += remaining_size;
> > >       }
> > >   }
> > > 
> > 
> > 
> > -- 
> > Best regards,
> > Vladimir
> > 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


