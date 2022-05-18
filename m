Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D09452B913
	for <lists+qemu-devel@lfdr.de>; Wed, 18 May 2022 13:52:59 +0200 (CEST)
Received: from localhost ([::1]:54728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrIEc-0003Mp-NS
	for lists+qemu-devel@lfdr.de; Wed, 18 May 2022 07:52:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nrHyX-0003FD-Mi
 for qemu-devel@nongnu.org; Wed, 18 May 2022 07:36:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31320)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nrHyU-0004Ox-2o
 for qemu-devel@nongnu.org; Wed, 18 May 2022 07:36:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652873776;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=be6QytlnbOcFv3ZQEQXetpMiBRobwYe+RU7yZd4mWJw=;
 b=W+cB2WbXs9p6f2Elf7X+svgpMeuCL5JS+KVWYpZ2+ON01vfa+Vs+HpKFiiW3g6RnmczHsE
 VK723JYQhKPx3NCpz9JTeH/uhmWl7Zotb5p7m+xbrUHKfEwy5FJHzBqFL3prN56GYSQZBQ
 6x7cgL7XaNWa09Vv7hKRzDDGiAN4rTg=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-479-fShDxfUXNE-c1_zuJpw_Ng-1; Wed, 18 May 2022 07:36:15 -0400
X-MC-Unique: fShDxfUXNE-c1_zuJpw_Ng-1
Received: by mail-wr1-f70.google.com with SMTP id
 z5-20020a5d4d05000000b0020e6457f2b4so55430wrt.1
 for <qemu-devel@nongnu.org>; Wed, 18 May 2022 04:36:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=be6QytlnbOcFv3ZQEQXetpMiBRobwYe+RU7yZd4mWJw=;
 b=DZv8gEcHvCoWcK9xoumq5TSkKclWWMZnCaG2LYgM3D0+Jli9U41Xs/RMLJTLTQxPKA
 tt17tG5inXjrD04DstpbS9nG2z7g+SDX2VBYzKcOM6RxuIYd6og6Vw9IfcBk+bWsz0Ug
 pUToKaY1vpM1Es0AAXCWKbwHihnYhcJAWbciaahjrGYRkbiip9rJ34/gejvabzODOzFq
 FBX5vkuF3me0DmebC0L/mMDiH4RjakcliWPgk5p0K8WDI/RGId2LW1Dj3NtfJbkMxDk0
 hTsxETmtl5p4gmAXsZgmjxCvraBTp3I9j55/sYDp1i24Xo0vh87TvG8HF30yn4HgPj8I
 j2kw==
X-Gm-Message-State: AOAM532d4pLq9g+NuTYTs8jZJUsW/OvLmdMIZ/gZfe13f4mVBww1D/Ra
 1OiNmI24squTunULigFyNGjpecoUSD4c2NzgEBAdGJkGmEhmwD+IhewcDhZDDHw0yHgmPDw7ne6
 zo0C8Bs/9oM2BYzM=
X-Received: by 2002:adf:d090:0:b0:20d:3d4:8845 with SMTP id
 y16-20020adfd090000000b0020d03d48845mr14909190wrh.162.1652873774201; 
 Wed, 18 May 2022 04:36:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzJju+st7rmqHpoT0xm61nXvGFK69+lIzlqaU8aQGo0bOa4dtC6Z9Hhr0y8183w+AEY3O5n5w==
X-Received: by 2002:adf:d090:0:b0:20d:3d4:8845 with SMTP id
 y16-20020adfd090000000b0020d03d48845mr14909162wrh.162.1652873773995; 
 Wed, 18 May 2022 04:36:13 -0700 (PDT)
Received: from localhost (static-110-87-86-188.ipcom.comunitel.net.
 [188.86.87.110]) by smtp.gmail.com with ESMTPSA id
 t19-20020a05600c129300b003942a244f2bsm4164664wmd.4.2022.05.18.04.36.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 May 2022 04:36:13 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Avihai Horon <avihaih@nvidia.com>
Cc: qemu-devel@nongnu.org,  "Michael S . Tsirkin" <mst@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,  Paolo Bonzini <pbonzini@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,  "Dr . David Alan Gilbert"
 <dgilbert@redhat.com>,  Yishai Hadas <yishaih@nvidia.com>,  Jason
 Gunthorpe <jgg@nvidia.com>,  Mark Bloch <mbloch@nvidia.com>,  Maor
 Gottlieb <maorg@nvidia.com>,  Kirti Wankhede <kwankhede@nvidia.com>,
 Tarun Gupta <targupta@nvidia.com>
Subject: Re: [PATCH 3/9] vfio/migration: Fix NULL pointer dereference bug
In-Reply-To: <ca7310a6-80fa-ec4d-f480-fce5ffb0c8cd@nvidia.com> (Avihai Horon's
 message of "Tue, 17 May 2022 15:28:33 +0300")
References: <20220512154320.19697-1-avihaih@nvidia.com>
 <20220512154320.19697-4-avihaih@nvidia.com>
 <87lev1sp8j.fsf@secure.mitica>
 <ca7310a6-80fa-ec4d-f480-fce5ffb0c8cd@nvidia.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Wed, 18 May 2022 13:36:12 +0200
Message-ID: <87mtfff4yb.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Avihai Horon <avihaih@nvidia.com> wrote:
> On 5/16/2022 2:15 PM, Juan Quintela wrote:
>> External email: Use caution opening links or attachments
>>
>>
>> Avihai Horon <avihaih@nvidia.com> wrote:
>>> As part of its error flow, vfio_vmstate_change() accesses
>>> MigrationState->to_dst_file without any checks. This can cause a NULL
>>> pointer dereference if the error flow is taken and
>>> MigrationState->to_dst_file is not set.
>>>
>>> For example, this can happen if VM is started or stopped not during
>>> migration and vfio_vmstate_change() error flow is taken, as
>>> MigrationState->to_dst_file is not set at that time.
>>>
>>> Fix it by checking that MigrationState->to_dst_file is set before using
>>> it.
>>>
>>> Fixes: 02a7e71b1e5b ("vfio: Add VM state change handler to know state of VM")
>>> Signed-off-by: Avihai Horon <avihaih@nvidia.com>
>>> ---
>>>   hw/vfio/migration.c | 4 +++-
>>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
>>> index 835608cd23..21e8f9d4d4 100644
>>> --- a/hw/vfio/migration.c
>>> +++ b/hw/vfio/migration.c
>>> @@ -744,7 +744,9 @@ static void vfio_vmstate_change(void *opaque, bool running, RunState state)
>>>            */
>>>           error_report("%s: Failed to set device state 0x%x", vbasedev->name,
>>>                        (migration->device_state & mask) | value);
>>> -        qemu_file_set_error(migrate_get_current()->to_dst_file, ret);
>>> +        if (migrate_get_current()->to_dst_file) {
>>> +            qemu_file_set_error(migrate_get_current()->to_dst_file, ret);
>>> +        }
>>>       }
>> Reviewed-by: Juan Quintela <quintela@redhat.com>
>>
>> I mean that the change is right.
>>
>> But I am not so sure about using qemu_file_* operations outside of the
>> migration_thread.  I *think* that everything else that uses qemu_file_*
>> functions is operating inside the migration_thread, and this one don't
>> look like it.  Furthermore, a fast look at qemu source, I can't see
>> anyplace where we setup an error in a vmstate_change.
>
> vfio_vmstate_change() will operate inside migration_thread if
> migration_thread is the one that called vm start/stop.
>
> In cases where vm start/stop was not called by migration_thread, it
> will operate outside of migration_thread. But I think in such cases 
> to_dst_file should not be set.
>
> Ideally we should have returned error, but vm_state_notify() doesn't
> report errors.
>
> Maybe later we can change vm_state_notify() to support error
> reporting, or instead of using to_dst_file to indicate an error,
> update some flag in VFIOMigration.


I think that sounds like a better option.

There are only two callers of vm_state_notify():

do_vm_stop()

and

vm_prepare_start()

Both already support returning one error.

Thanks, Juan.


