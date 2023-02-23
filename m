Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F08796A11CE
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 22:17:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVIxS-0007oU-Td; Thu, 23 Feb 2023 16:16:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pVIxM-0007nf-8B
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 16:16:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pVIxI-0007pi-CL
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 16:16:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677187003;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hv819Z3M0vegcCVSWtg9d/uGU/W0RBBZGL7hW9Y1AR8=;
 b=UIonDrq71GjuNkySRyIAO5lw3Jl/aXuJdlG6nvewpbtzr6zEmUCzqj188cQswnsGnkvQWY
 S+fn3YkqiI0wx4oklDCgWPiU+UTEpWSgy0qmWTtKjDAT1kc1E31Ga8KrYdWRN1X7f/q+QA
 kOgOqvykoKKIw4Lkja2vjN2MtjFk6hg=
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-310-T4g4ZcYOMp61exA7cc8CyA-1; Thu, 23 Feb 2023 16:16:39 -0500
X-MC-Unique: T4g4ZcYOMp61exA7cc8CyA-1
Received: by mail-io1-f70.google.com with SMTP id
 a21-20020a5d9595000000b0074c9dc19e16so2430178ioo.15
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 13:16:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hv819Z3M0vegcCVSWtg9d/uGU/W0RBBZGL7hW9Y1AR8=;
 b=W5A82v1ys3YKMz3lgsq08+Lj8DVpnxe/njkTknTEnjw0DmTUuA3InVI8OJaztz6Er9
 c2yuCsxbo4MUG4/nCtauWOuzayMISHjTu/2/pe2aoXFCj9f4uFj9D2KoME3Z10Jlvw0+
 i7AzFblQAxDL8INJ1xXG120O/FFKUPlUB5ilcYBS+KeSYZdILW07j/sWczbj1UsH/HEF
 ra2D2dy8jYwj+473DlL/r9xhGapKXuKJDNdHv26djhqtsv9aspHzzqA+3KPwDZdvbjut
 ggCSxLoPnd7uOFiAGRJlOo/cWEMFji5CdZUt++E35QEihBVSIirDnBJYG3fiiBnlKIqM
 H97A==
X-Gm-Message-State: AO0yUKV6cZrxMmg9kavJkz5oc0HnndKzc3uZ3QUxKGe2nlhCVY6nlFcG
 /bNyFzoHPOUY6itV/x5bm1ISRD0UyGghEgY+wiWPWMfZfGb5guOGkM/TfOBLFte4kPYDdtEzEg9
 PGtHcetn1ycFsuFU=
X-Received: by 2002:a5d:9d90:0:b0:704:c2fe:d923 with SMTP id
 ay16-20020a5d9d90000000b00704c2fed923mr10649339iob.2.1677186999050; 
 Thu, 23 Feb 2023 13:16:39 -0800 (PST)
X-Google-Smtp-Source: AK7set+cJMmQ2QGEaUn1OqZBejhPYdktBwENtmjC8uzTX/A5N7HapjeCKfkogIhm2O8UC+Z4JeCB6g==
X-Received: by 2002:a5d:9d90:0:b0:704:c2fe:d923 with SMTP id
 ay16-20020a5d9d90000000b00704c2fed923mr10649314iob.2.1677186998785; 
 Thu, 23 Feb 2023 13:16:38 -0800 (PST)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 w15-20020a5d844f000000b0074c7db1470dsm970856ior.20.2023.02.23.13.16.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Feb 2023 13:16:38 -0800 (PST)
Date: Thu, 23 Feb 2023 14:16:37 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Avihai Horon <avihaih@nvidia.com>
Cc: qemu-devel@nongnu.org, =?UTF-8?B?Q8OpZHJpYw==?= Le Goater
 <clg@redhat.com>, Juan Quintela <quintela@redhat.com>, "Dr. David Alan
 Gilbert" <dgilbert@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Peter Xu <peterx@redhat.com>, Jason Wang <jasowang@redhat.com>, Marcel
 Apfelbaum <marcel.apfelbaum@gmail.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, David Hildenbrand
 <david@redhat.com>, Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?=
 <philmd@linaro.org>, Yishai Hadas <yishaih@nvidia.com>, Jason Gunthorpe
 <jgg@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, Kirti Wankhede
 <kwankhede@nvidia.com>, Tarun Gupta <targupta@nvidia.com>, Joao Martins
 <joao.m.martins@oracle.com>
Subject: Re: [PATCH v2 03/20] vfio/migration: Add VFIO migration pre-copy
 support
Message-ID: <20230223141637.67870a03.alex.williamson@redhat.com>
In-Reply-To: <38bdb26f-08d7-fe11-9a97-ebcc95c82254@nvidia.com>
References: <20230222174915.5647-1-avihaih@nvidia.com>
 <20230222174915.5647-4-avihaih@nvidia.com>
 <20230222135811.705b85b7.alex.williamson@redhat.com>
 <38bdb26f-08d7-fe11-9a97-ebcc95c82254@nvidia.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
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

On Thu, 23 Feb 2023 17:25:12 +0200
Avihai Horon <avihaih@nvidia.com> wrote:

> On 22/02/2023 22:58, Alex Williamson wrote:
> > External email: Use caution opening links or attachments
> >
> >
> > On Wed, 22 Feb 2023 19:48:58 +0200
> > Avihai Horon <avihaih@nvidia.com> wrote:
> >  
> >> @@ -302,23 +380,44 @@ static void vfio_save_cleanup(void *opaque)
> >>       trace_vfio_save_cleanup(vbasedev->name);
> >>   }
> >>
> >> +static void vfio_state_pending_estimate(void *opaque, uint64_t threshold_size,
> >> +                                        uint64_t *must_precopy,
> >> +                                        uint64_t *can_postcopy)
> >> +{
> >> +    VFIODevice *vbasedev = opaque;
> >> +    VFIOMigration *migration = vbasedev->migration;
> >> +
> >> +    if (migration->device_state != VFIO_DEVICE_STATE_PRE_COPY) {
> >> +        return;
> >> +    }
> >> +
> >> +    /*
> >> +     * Initial size should be transferred during pre-copy phase so stop-copy
> >> +     * phase will not be slowed down. Report threshold_size to force another
> >> +     * pre-copy iteration.
> >> +     */
> >> +    *must_precopy += migration->precopy_init_size ?
> >> +                         threshold_size :
> >> +                         migration->precopy_dirty_size;  
> > This sure feels like we're feeding false data back to the iterator to
> > spoof it to run another iteration, when the vfio migration protocol
> > only recommends that initial_bytes reaches zero before proceeding to
> > stop-copy, it's not a requirement.  What benefit is actually observed
> > from this?  Why is this required for initial pre-copy support?  It
> > seems devious.  
> 
> As previously discussed in the thread that added the pre-copy uAPI [1], 
> the init_bytes can be used by drivers to reduce the downtime.
> For example, mlx5 transfers some metadata to the target so it will be 
> able to pre-allocate resources etc.
> 
> [1] 
> https://lore.kernel.org/kvm/ae4a6259-349d-0131-896c-7a6ea775cc9e@nvidia.com/

Yes, but how does that become a requirement to QEMU that it must
iterate until the initial segment is complete?  Especially when we need
to trigger that behavior via such nefarious means.  AIUI, QEMU should
be allowed to move to stop-copy at any point.  We should make efforts
that QEMU would never decide on its own to move from pre-copy to
stop-copy without completing the init_bytes (which sounds suspiciously
like the purpose of @must_precopy), but if, for instance a user forces a
transition to stop-copy, I don't see that we have any business to
impose a policy to delay that until the init_bytes is complete.  Thanks,

Alex


