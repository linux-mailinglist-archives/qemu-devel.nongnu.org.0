Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF55666062F
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Jan 2023 19:08:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDr7q-0003PN-GX; Fri, 06 Jan 2023 13:07:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pDr7o-0003Og-38
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 13:07:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pDr7m-0002E0-EK
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 13:07:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673028445;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E12LphicTTd00G4LpzgjCC/W4/c1gai30w95igN2jD8=;
 b=MfRrnI+JaJu2vijH28nFMDeyZYwQvaFIDt0pjel7vYwp2uzaGJ+Q7petCDDqNkpaBtQXc5
 MI4oHDG9eSyg3+JRJsbHOvX9ZpaLTYymatutLMgFYMwXmn/yDVYkxba9CqyxDxe/grhekK
 1TVMpT1baEVYd565tfBzZiuHQqHAOqA=
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-498-fhrJmdLyMTeUfAyrjKj7oQ-1; Fri, 06 Jan 2023 13:07:24 -0500
X-MC-Unique: fhrJmdLyMTeUfAyrjKj7oQ-1
Received: by mail-il1-f199.google.com with SMTP id
 y5-20020a056e021be500b0030bc4f23f0aso1520499ilv.3
 for <qemu-devel@nongnu.org>; Fri, 06 Jan 2023 10:07:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:organization:references
 :in-reply-to:message-id:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=E12LphicTTd00G4LpzgjCC/W4/c1gai30w95igN2jD8=;
 b=MTY8oFCnAi+mWizXYrEP3oGZKbrxfLa+S9OoTHY733PxKSSWzDXJwUFFXYIorrgRBY
 10seAeYeK1ASsa2awoNkd6/l0mZWcYOfj7Jk40/5ZjxrQz+2OU7tl49CJHNrs2M4UGGn
 LpxO8Cl9mJxXbTzmIVrN9QIWWqyBmOryFsIxgkuMjp9Ao0+9PeFbiUePg+k7ZFoa2/hB
 GWBIVNGKw6Jc/tExVV286MD8w9sBy0k7kD/I38gtgjRCRNWFYierHuOY5DcAS+cYBE7h
 s2CBQVq1zJ7a2JOHIx6c9Xy5woDBE9OU/WCj2RfabKNil6A6Fl9ZfDm1FvGGvRQviBIC
 Bk6Q==
X-Gm-Message-State: AFqh2koX/h/SRPZL2t/k7md9Ha6T3Hi3L0mAMNT059aWXdbbrlzSfUWb
 Ff1mtKR2/yaNsNw0myvyyTyPgGW6/SyyRhezZWPFozBCcv9Y/+xbIvM+6GVdMzFPpGaWYQbatV/
 ncuuyykMhBPxX57U=
X-Received: by 2002:a92:c68f:0:b0:30d:8a51:ef2c with SMTP id
 o15-20020a92c68f000000b0030d8a51ef2cmr2420567ilg.0.1673028443187; 
 Fri, 06 Jan 2023 10:07:23 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsQ0flAADvWWNSH6ohinq1zVBK8DdwKqboADGduKvCpNgTgqVr3yxeYihibKS43fZSE4maeFg==
X-Received: by 2002:a92:c68f:0:b0:30d:8a51:ef2c with SMTP id
 o15-20020a92c68f000000b0030d8a51ef2cmr2420536ilg.0.1673028442957; 
 Fri, 06 Jan 2023 10:07:22 -0800 (PST)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 f11-20020a92cb4b000000b0030c2ae99cf9sm569160ilq.12.2023.01.06.10.07.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Jan 2023 10:07:22 -0800 (PST)
Date: Fri, 6 Jan 2023 11:07:20 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: Avihai Horon <avihaih@nvidia.com>, qemu-devel@nongnu.org, Halil Pasic
 <pasic@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, Richard Henderson
 <richard.henderson@linaro.org>, David Hildenbrand <david@redhat.com>, Ilya
 Leoshkevich <iii@linux.ibm.com>, Thomas Huth <thuth@redhat.com>, Juan
 Quintela <quintela@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>, Eric
 Blake <eblake@redhat.com>, Vladimir Sementsov-Ogievskiy
 <vsementsov@yandex-team.ru>, John Snow <jsnow@redhat.com>,
 qemu-s390x@nongnu.org, qemu-block@nongnu.org, Yishai Hadas
 <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>, Maor Gottlieb
 <maorg@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>, Tarun Gupta
 <targupta@nvidia.com>, Joao Martins <joao.m.martins@oracle.com>
Subject: Re: [PATCH v5 04/14] vfio/migration: Fix NULL pointer dereference bug
Message-ID: <20230106110720.17178a0f.alex.williamson@redhat.com>
In-Reply-To: <Y7QN0fT6vI9AMU+3@work-vm>
References: <20221229110345.12480-1-avihaih@nvidia.com>
 <20221229110345.12480-5-avihaih@nvidia.com>
 <Y7QN0fT6vI9AMU+3@work-vm>
Organization: Red Hat
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Tue, 3 Jan 2023 11:13:21 +0000
"Dr. David Alan Gilbert" <dgilbert@redhat.com> wrote:

> * Avihai Horon (avihaih@nvidia.com) wrote:
> > As part of its error flow, vfio_vmstate_change() accesses
> > MigrationState->to_dst_file without any checks. This can cause a NULL
> > pointer dereference if the error flow is taken and
> > MigrationState->to_dst_file is not set.
> > 
> > For example, this can happen if VM is started or stopped not during
> > migration and vfio_vmstate_change() error flow is taken, as
> > MigrationState->to_dst_file is not set at that time.
> > 
> > Fix it by checking that MigrationState->to_dst_file is set before using
> > it.
> > 
> > Fixes: 02a7e71b1e5b ("vfio: Add VM state change handler to know state of VM")
> > Signed-off-by: Avihai Horon <avihaih@nvidia.com>
> > Reviewed-by: Juan Quintela <quintela@redhat.com>
> > Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>  
> 
> It might be worth posting this patch separately since it's a simple fix
> and should go in sooner.

There's no upstream implementation of a v1 migration driver, it's
deprecated in the kernel, and only enabled in QEMU via an experimental
option.  It seems sufficient as done here to make it a separate fix for
downstreams that may want to backport separately, but given the
remaining v1 status, I don't think I'd bother hurrying it otherwise.
Thanks,

Alex

> > ---
> >  hw/vfio/migration.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> > 
> > diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
> > index e1413ac90c..09fe7c1de2 100644
> > --- a/hw/vfio/migration.c
> > +++ b/hw/vfio/migration.c
> > @@ -743,7 +743,9 @@ static void vfio_vmstate_change(void *opaque, bool running, RunState state)
> >           */
> >          error_report("%s: Failed to set device state 0x%x", vbasedev->name,
> >                       (migration->device_state & mask) | value);
> > -        qemu_file_set_error(migrate_get_current()->to_dst_file, ret);
> > +        if (migrate_get_current()->to_dst_file) {
> > +            qemu_file_set_error(migrate_get_current()->to_dst_file, ret);
> > +        }
> >      }
> >      vbasedev->migration->vm_running = running;
> >      trace_vfio_vmstate_change(vbasedev->name, running, RunState_str(state),
> > -- 
> > 2.26.3
> >   


