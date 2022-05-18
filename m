Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 778BE52B946
	for <lists+qemu-devel@lfdr.de>; Wed, 18 May 2022 14:03:57 +0200 (CEST)
Received: from localhost ([::1]:40624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrIPE-0005h0-9c
	for lists+qemu-devel@lfdr.de; Wed, 18 May 2022 08:03:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nrIGI-00079C-RG
 for qemu-devel@nongnu.org; Wed, 18 May 2022 07:54:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26538)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nrIGG-0007P1-0A
 for qemu-devel@nongnu.org; Wed, 18 May 2022 07:54:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652874878;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=KTLk2nkVhJhkl6aU7XgR2PUyW00WBzsy6gBNKbDjPeQ=;
 b=OQT8fcC4nFdAWD1EkRzi/GTGi4BwxqCYWfI4ylSasXE8ZIEFgYszafsIwOZu7TlR4QtFC0
 7x6in1BRmmLkxPkucATKyvPH7UVjYX1okYtRlaZgj3KC2MnkHWwA4V25jWcOJuuQIBfcqQ
 Hds2dDboRvDms05Sr0xiKFw+dNZVdzg=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-572-EnkdS0LCPZKqSVYTgXb-1g-1; Wed, 18 May 2022 07:54:37 -0400
X-MC-Unique: EnkdS0LCPZKqSVYTgXb-1g-1
Received: by mail-wm1-f71.google.com with SMTP id
 n26-20020a1c721a000000b003941ea1ced7so678258wmc.7
 for <qemu-devel@nongnu.org>; Wed, 18 May 2022 04:54:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=KTLk2nkVhJhkl6aU7XgR2PUyW00WBzsy6gBNKbDjPeQ=;
 b=Iy/t66JbDJOIEDF84f9m9dianE11HNObvAyS+0JD4UMkx1ZdgTGEq09oEeAa4rWxhJ
 QgO+mGSMzj5YaOQ0fVvdV71bjtUlthRSC/QwhllIyXbEnsm12B818hA4M35goBJ/FbEi
 x/1KI0fQi3cUgRgs1GapTn7OxyOk1ICWQhnRCQjhXHtDQBioEAQ22zn4buI5zZjc5vyx
 varbdMdxl0Hr7NmOtuQdKM7mMJLPEuZHSqjJvafMI10+ulZtF+zQnCfAq25jPozTgphu
 i2FELTho2mJyKiJisvH8894yxACbQyARk9ri03Vz8kKDlhArmyrbRqUccymeCS2KjErc
 oqzQ==
X-Gm-Message-State: AOAM533cMzCPnNYbaR3b34vSEBhPFtqQtAEJbux2AxnqGO+zstfZt28V
 zojZdDxdh+LlggBfSzgvBGpaggdycqMugqkfKpUnFV1R5pZExLF5ovYt/jr4O5uiocoAENMH04z
 WpxXSpuA2G5FZ3MQ=
X-Received: by 2002:adf:f803:0:b0:20d:3a1:3c31 with SMTP id
 s3-20020adff803000000b0020d03a13c31mr15587897wrp.565.1652874876480; 
 Wed, 18 May 2022 04:54:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxNsCTyhtSTYOQGTl/Vizkyk/fOFAIeVKbWPTDtAVl9iP4Xt0hyT4EDOdZZxwkud7y8MHYLng==
X-Received: by 2002:adf:f803:0:b0:20d:3a1:3c31 with SMTP id
 s3-20020adff803000000b0020d03a13c31mr15587873wrp.565.1652874876196; 
 Wed, 18 May 2022 04:54:36 -0700 (PDT)
Received: from localhost (static-110-87-86-188.ipcom.comunitel.net.
 [188.86.87.110]) by smtp.gmail.com with ESMTPSA id
 t12-20020adfba4c000000b0020c5253d91esm1757942wrg.106.2022.05.18.04.54.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 May 2022 04:54:35 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Avihai Horon <avihaih@nvidia.com>
Cc: qemu-devel@nongnu.org,  "Michael S . Tsirkin" <mst@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,  Paolo Bonzini <pbonzini@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,  "Dr . David Alan Gilbert"
 <dgilbert@redhat.com>,  Yishai Hadas <yishaih@nvidia.com>,  Jason
 Gunthorpe <jgg@nvidia.com>,  Mark Bloch <mbloch@nvidia.com>,  Maor
 Gottlieb <maorg@nvidia.com>,  Kirti Wankhede <kwankhede@nvidia.com>,
 Tarun Gupta <targupta@nvidia.com>
Subject: Re: [PATCH 5/9] migration/qemu-file: Add qemu_file_get_to_fd()
In-Reply-To: <970f0e4c-19bc-6528-2c4c-9cf7fbd5a789@nvidia.com> (Avihai Horon's
 message of "Tue, 17 May 2022 15:36:51 +0300")
References: <20220512154320.19697-1-avihaih@nvidia.com>
 <20220512154320.19697-6-avihaih@nvidia.com>
 <87czgdsohs.fsf@secure.mitica>
 <970f0e4c-19bc-6528-2c4c-9cf7fbd5a789@nvidia.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Wed, 18 May 2022 13:54:34 +0200
Message-ID: <87ee0rf43p.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
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
> On 5/16/2022 2:31 PM, Juan Quintela wrote:
>> External email: Use caution opening links or attachments
>>
>>
>> Avihai Horon <avihaih@nvidia.com> wrote:
>>> Add new function qemu_file_get_to_fd() that allows reading data from
>>> QEMUFile and writing it straight into a given fd.
>>>
>>> This will be used later in VFIO migration code.
>>>
>>> Signed-off-by: Avihai Horon <avihaih@nvidia.com>
>>> ---
>>>   migration/qemu-file.c | 34 ++++++++++++++++++++++++++++++++++
>>>   migration/qemu-file.h |  1 +
>>>   2 files changed, 35 insertions(+)
>>>
>>> diff --git a/migration/qemu-file.c b/migration/qemu-file.c
>>> index 1479cddad9..cad3d32eb3 100644
>>> --- a/migration/qemu-file.c
>>> +++ b/migration/qemu-file.c
>>> @@ -867,3 +867,37 @@ QIOChannel *qemu_file_get_ioc(QEMUFile *file)
>>>   {
>>>       return file->has_ioc ? QIO_CHANNEL(file->opaque) : NULL;
>>>   }
>>> +
>>> +/*
>>> + * Read size bytes from QEMUFile f and write them to fd.
>>> + */
>>> +int qemu_file_get_to_fd(QEMUFile *f, int fd, size_t size)
>>> +{
>>> +    while (size) {
>>> +        size_t pending = f->buf_size - f->buf_index;
>>> +        ssize_t rc;
>>> +
>>> +        if (!pending) {
>>> +            rc = qemu_fill_buffer(f);
>>> +            if (rc < 0) {
>>> +                return rc;
>>> +            }
>>> +            if (rc == 0) {
>>> +                return -1;
>>> +            }
>>> +            continue;
>>> +        }
>>> +
>>> +        rc = write(fd, f->buf + f->buf_index, MIN(pending, size));
>>> +        if (rc < 0) {
>>> +            return rc;
>>> +        }
>>> +        if (rc == 0) {
>>> +            return -1;
>>> +        }
>>> +        f->buf_index += rc;
>>> +        size -= rc;
>>> +    }
>>> +
>>> +    return 0;
>>> +}
>> Is there a really performance difference to just use:
>>
>> uint8_t buffer[size];
>>
>> qemu_get_buffer(f, buffer, size);
>> write(fd, buffer, size);
>>
>> Or telling it otherwise, what sizes are we talking here?
>
> It depends on the device, but It can range from a few MBs to several
> GBs AFAIK.

a few MB is ok.

Several GB on the main migration channel without a single
header/whatever?

This sounds like a recipe for disaster IMHO.
Remember that on source side, we have a migration thread.  This patch
will just block that migration thread.

If we are using 10Gigabit networking, 1GB/second for friends and making
math easy, each GB will take 1 second downtime.

During that downtime, migration control is basically handycapped.
And you are sendinfg this data with qemu_put_buffer_async().  This
function just adds its buffer to an iovec, only user uses 4KB (or
whatever your page size is) to the iovec.  You are talking about adding
gigabytes here.  I don't know how well this is going to work, but my
guess is that migrate_cancel is not going to be happy.

On destination side, this is even worse, because we receive this
multigigabyte chunk in a coroutine, and I am not sure that this will not
completely block all qemu while this is happening (again, multisecond
time).

I have to think more about this problem, but I can see how this is going
to be able to go through the migration main channel.

Later, Juan.


