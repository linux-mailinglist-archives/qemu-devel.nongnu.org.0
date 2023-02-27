Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 756F76A46D4
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 17:16:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWgAC-0002jP-SQ; Mon, 27 Feb 2023 11:15:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pWg9u-0002Zs-O8
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 11:15:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pWg9h-00019E-Ax
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 11:15:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677514493;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mSfDyvL7FIRjoZTx5lMnShZg0tPlDL4xFmIcgZCYwm4=;
 b=K+ShGFtOLxKvDlBesrFxPaumPSD/WcDrdyL8XETMbR+9KiVBFWhMqLTtQfYCwjL0YF3eSX
 4q08giT0rBdIZWY8q1R8kJwXV1K3sOB/euwbxz2QWSDkjMPO6YgjuugfwPkN2N0/DUq6XK
 L4l/ADoZ57aF52y3BiLMzOhxgJFRziQ=
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-536-VBzzDm9DMz6xMsE5_fbgJQ-1; Mon, 27 Feb 2023 11:14:52 -0500
X-MC-Unique: VBzzDm9DMz6xMsE5_fbgJQ-1
Received: by mail-io1-f69.google.com with SMTP id
 be25-20020a056602379900b0074ce1a54a46so2744656iob.9
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 08:14:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:organization:references
 :in-reply-to:message-id:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mSfDyvL7FIRjoZTx5lMnShZg0tPlDL4xFmIcgZCYwm4=;
 b=Gel0cUNa25L3sGagSh98lF1TS8tbThdktExlgzrhuNU0jgFIiPlNY62sMG1tBzVLMH
 wUXj9azbiXC4M0i5hJ6+uwqX8RD9KvnpeYteAjXdlGGj/m7dCTgKhufxO9TrEBnHY+4d
 txew3vRghkBMjyiHfJI8eZ/RCwO5bO66i3ozQ6iDcH6/9yzKwsNU19eVwqX/RP/HfXEM
 1I7RaLOx4SrMpGrHrD2y9jNE/4ffXsTl2t5WffJUAbVpS2UdQ8Bw4H3fHZtZZbum5nVr
 srdrnKBQDnQ+ZJPc6TewKWAMJHqGiFZs/ho3S7Sw0cukiqAtDY1V1eJD5ndws87TXXtZ
 YsqA==
X-Gm-Message-State: AO0yUKVgYG0uiChSxLWdjv/xFIPeHiY3AspZAX14GycnR37/rvpKmhDI
 Ey4KgYzoaxDFtCfJAltCPwoNEkxGiRpA4bNSMpS0MwYt8EnSRkBY7Nfw9UTcj6Kq8DAC36mZ4zZ
 KAmGqR01Cl4miyqk=
X-Received: by 2002:a05:6e02:219b:b0:316:e54a:82a3 with SMTP id
 j27-20020a056e02219b00b00316e54a82a3mr18297852ila.30.1677514491473; 
 Mon, 27 Feb 2023 08:14:51 -0800 (PST)
X-Google-Smtp-Source: AK7set+AP0VMErKe/zBDY2mcFht6SIHjiBDXe8RiJZ54MZpvam4GDTk6Zn81CvbLrSsmf8w/psqiTA==
X-Received: by 2002:a05:6e02:219b:b0:316:e54a:82a3 with SMTP id
 j27-20020a056e02219b00b00316e54a82a3mr18297596ila.30.1677514486274; 
 Mon, 27 Feb 2023 08:14:46 -0800 (PST)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 b13-20020a05663801ad00b003e9e5e1aacasm1940770jaq.143.2023.02.27.08.14.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 08:14:45 -0800 (PST)
Date: Mon, 27 Feb 2023 09:14:44 -0700
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
Message-ID: <20230227091444.6a6e93cd.alex.williamson@redhat.com>
In-Reply-To: <a875f6e5-951b-8f39-7867-313eabe54363@nvidia.com>
References: <20230222174915.5647-1-avihaih@nvidia.com>
 <20230222174915.5647-4-avihaih@nvidia.com>
 <20230222135811.705b85b7.alex.williamson@redhat.com>
 <38bdb26f-08d7-fe11-9a97-ebcc95c82254@nvidia.com>
 <20230223141637.67870a03.alex.williamson@redhat.com>
 <a875f6e5-951b-8f39-7867-313eabe54363@nvidia.com>
Organization: Red Hat
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On Sun, 26 Feb 2023 18:43:50 +0200
Avihai Horon <avihaih@nvidia.com> wrote:

> On 23/02/2023 23:16, Alex Williamson wrote:
> > External email: Use caution opening links or attachments
> >
> >
> > On Thu, 23 Feb 2023 17:25:12 +0200
> > Avihai Horon <avihaih@nvidia.com> wrote:
> >  
> >> On 22/02/2023 22:58, Alex Williamson wrote:  
> >>> External email: Use caution opening links or attachments
> >>>
> >>>
> >>> On Wed, 22 Feb 2023 19:48:58 +0200
> >>> Avihai Horon <avihaih@nvidia.com> wrote:
> >>>  
> >>>> @@ -302,23 +380,44 @@ static void vfio_save_cleanup(void *opaque)
> >>>>        trace_vfio_save_cleanup(vbasedev->name);
> >>>>    }
> >>>>
> >>>> +static void vfio_state_pending_estimate(void *opaque, uint64_t threshold_size,
> >>>> +                                        uint64_t *must_precopy,
> >>>> +                                        uint64_t *can_postcopy)
> >>>> +{
> >>>> +    VFIODevice *vbasedev = opaque;
> >>>> +    VFIOMigration *migration = vbasedev->migration;
> >>>> +
> >>>> +    if (migration->device_state != VFIO_DEVICE_STATE_PRE_COPY) {
> >>>> +        return;
> >>>> +    }
> >>>> +
> >>>> +    /*
> >>>> +     * Initial size should be transferred during pre-copy phase so stop-copy
> >>>> +     * phase will not be slowed down. Report threshold_size to force another
> >>>> +     * pre-copy iteration.
> >>>> +     */
> >>>> +    *must_precopy += migration->precopy_init_size ?
> >>>> +                         threshold_size :
> >>>> +                         migration->precopy_dirty_size;  
> >>> This sure feels like we're feeding false data back to the iterator to
> >>> spoof it to run another iteration, when the vfio migration protocol
> >>> only recommends that initial_bytes reaches zero before proceeding to
> >>> stop-copy, it's not a requirement.  What benefit is actually observed
> >>> from this?  Why is this required for initial pre-copy support?  It
> >>> seems devious.  
> >> As previously discussed in the thread that added the pre-copy uAPI [1],
> >> the init_bytes can be used by drivers to reduce the downtime.
> >> For example, mlx5 transfers some metadata to the target so it will be
> >> able to pre-allocate resources etc.
> >>
> >> [1]
> >> https://lore.kernel.org/kvm/ae4a6259-349d-0131-896c-7a6ea775cc9e@nvidia.com/  
> > Yes, but how does that become a requirement to QEMU that it must
> > iterate until the initial segment is complete?  Especially when we need
> > to trigger that behavior via such nefarious means.  AIUI, QEMU should
> > be allowed to move to stop-copy at any point.  We should make efforts
> > that QEMU would never decide on its own to move from pre-copy to
> > stop-copy without completing the init_bytes (which sounds suspiciously
> > like the purpose of @must_precopy),  
> 
> @must_precopy represents the pending bytes that must be transferred 
> during pre-copy or stop-copy. If it's under the threshold, then 
> migration will move to stop-copy and be completed.
> So simply adding init_bytes to @must_precopy will not guarantee that we 
> send all init_bytes before moving to stop-copy, since the transition to 
> stop-copy can happen when @must_precopy != 0.

But we have no requirement to send all init_bytes before stop-copy.
This is a hack to achieve a theoretical benefit that a driver might be
able to improve the latency on the target by completing another
iteration.  If drivers are filling in a "must_precopy" arg, it sounds
like even if migration moves to stop-copy, that data should be migrated
first and deferring stop-copy could potentially extend the migration in
other areas.

> >   but if, for instance a user forces a
> > transition to stop-copy, I don't see that we have any business to
> > impose a policy to delay that until the init_bytes is complete.  
> 
> Is there a way a user can force the migration to move to stop-copy?
> Looking at migration code, it seems that the only way to move to 
> stop-copy is if @must_precopy is below the threshold.
> If so, then this is our effort to make QEMU send all init_bytes before 
> moving to stop_copy and we can only benefit from it.

But we have no requirement to send all init_bytes before stop-copy.
This is a hack to achieve a theoretical benefit that a driver might be
able to improve the latency on the target by completing another
iteration.  If drivers are filling in a "must_precopy" arg, it sounds
like even if migration moves to stop-copy, that data should be migrated
first and deferring stop-copy could potentially extend the migration in
other areas.
 
> Regarding how to do it -- maybe instead of spoofing @must_precopy we can 
> introduce a new parameter in upper migration layer (e.g., @init_precopy) 
> and add another condition in migration layer that it must be zero to 
> move to stop-copy.

Why not just move to stop-copy but transfer all must_precopy data
first?  That would seem to align with the naming to me.  I don't think
the device actually cares if the transfer happens while the device is
running or stopped, it just wants it at the target device early enough
to start configuration, right?

I'd drop this for an initial implementation, the uAPI does not require
that QEMU complete init_bytes before transitioning to stop-copy and
this is clearly not a very clean or well justified means to try to
achieve that as a non-requirement.  Thanks,

Alex


