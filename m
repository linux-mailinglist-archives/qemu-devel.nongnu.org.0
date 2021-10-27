Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 822A443CDB3
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 17:35:51 +0200 (CEST)
Received: from localhost ([::1]:33688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfkxx-0005vz-Oj
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 11:35:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1mfkGQ-0000tf-R3
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 10:50:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46521)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1mfkGO-0003rk-Hi
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 10:50:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635346246;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LEm3WLbXjqzamMVxaLJOFmo0TrU4T3Bnq8hVSd1eTOg=;
 b=QYdx40fXPOo0DbZATau5QErgHdr2SsyQduzym/La3NAmtmFsDnw3M14S9gD6nrEu4Zv3ja
 /snzsihT4QiDuGyhv8i3zIMazT7z8Jz8TFRC4vZEhWP+4hTCFBxcQ01dA5HMeaJB6vAuyR
 qfk25yF+yqa8nvZu4dl4JgDKNLjwnmE=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-243-jcMGSZRNPJWL5y4hK7_bTQ-1; Wed, 27 Oct 2021 10:50:45 -0400
X-MC-Unique: jcMGSZRNPJWL5y4hK7_bTQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 k28-20020a508adc000000b003dd5e21da4bso2540886edk.11
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 07:50:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=LEm3WLbXjqzamMVxaLJOFmo0TrU4T3Bnq8hVSd1eTOg=;
 b=yUTWBMaj+nP0PaiijIegwH6pmLUKCUbeZigNoBC8eLAFm1ndAPZ8xhVRpAV4pTij5/
 Cf6DANNhS8PFIvBAt3UKQmLEhrwdNM6DK4M/VMu9GYlT0DXJ6B1+5FjGf1a9vXrbr6Gb
 km/5NMNbs2TKJV6D6TJnF88MeVeWGEEY8ZV138Se3cC0EHAXxiLkEEsskYsuZJGnNPXx
 AKauiyMHMjhYFD8S4qJaJHmAdrrZWvqsgzevqzK+/KghrYSQIbrr6QMthpzl5/i3EPDP
 0ihId40kz5AW1+tlR8SqkmZdPKdo+zDEKb/DMbh/8MNdMv+V7GnVE1vsJ5oBDm+IlBzg
 Xrlw==
X-Gm-Message-State: AOAM532L5imEjO5OD7yvBdvtLvfUsyjK5oVa+YrRlqw62CjcRzy7Jb/K
 0NXN3o/Wn7siW9Hue/WkIk/UTjQiOSzsi7werWSrqeI1Gse6otBoyBPvxYdJCE24nfkl/p9Alrm
 69XiepnW42lJizGc=
X-Received: by 2002:a17:907:78cc:: with SMTP id
 kv12mr11495224ejc.149.1635346244107; 
 Wed, 27 Oct 2021 07:50:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyifHogwgUd/mDXOetZLyu6HqhmWaN1NGfOoL7isp5aQ/a1IdwHyHktT/my/PXFXpmQeMUEQQ==
X-Received: by 2002:a17:907:78cc:: with SMTP id
 kv12mr11495197ejc.149.1635346243881; 
 Wed, 27 Oct 2021 07:50:43 -0700 (PDT)
Received: from steredhat (host-79-30-88-77.retail.telecomitalia.it.
 [79.30.88.77])
 by smtp.gmail.com with ESMTPSA id r5sm132817edy.86.2021.10.27.07.50.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 07:50:43 -0700 (PDT)
Date: Wed, 27 Oct 2021 16:50:41 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>, Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v2 1/3] file-posix: add `aio-max-batch` option
Message-ID: <20211027145041.xvh5phgnftzhibli@steredhat>
References: <20211026162346.253081-1-sgarzare@redhat.com>
 <20211026162346.253081-2-sgarzare@redhat.com>
 <87zgqvccqk.fsf@dusky.pond.sub.org>
 <20211027092304.43zhzjp5u6x66nbq@steredhat>
 <YXlO3c7/EC2DWk5R@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YXlO3c7/EC2DWk5R@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org,
 Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Oct 27, 2021 at 03:06:37PM +0200, Kevin Wolf wrote:
>Am 27.10.2021 um 11:23 hat Stefano Garzarella geschrieben:
>> On Wed, Oct 27, 2021 at 06:28:51AM +0200, Markus Armbruster wrote:
>> > Stefano Garzarella <sgarzare@redhat.com> writes:
>> >
>> > > Commit d7ddd0a161 ("linux-aio: limit the batch size using
>> > > `aio-max-batch` parameter") added a way to limit the batch size
>> > > of Linux AIO backend for the entire AIO context.
>> > >
>> > > The same AIO context can be shared by multiple devices, so
>> > > latency-sensitive devices may want to limit the batch size even
>> > > more to avoid increasing latency.
>> > >
>> > > For this reason we add the `aio-max-batch` option to the file
>> > > backend, which will be used by the next commits to limit the size of
>> > > batches including requests generated by this device.
>> > >
>> > > Suggested-by: Kevin Wolf <kwolf@redhat.com>
>> > > Reviewed-by: Kevin Wolf <kwolf@redhat.com>
>> > > Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
>> > > ---
>> > >
>> > > Notes:
>> > >     v2:
>> > >     - @aio-max-batch documentation rewrite [Stefan, Kevin]
>> > >
>> > >  qapi/block-core.json | 7 +++++++
>> > >  block/file-posix.c   | 9 +++++++++
>> > >  2 files changed, 16 insertions(+)
>> > >
>> > > diff --git a/qapi/block-core.json b/qapi/block-core.json
>> > > index 6d3217abb6..fef76b0ea2 100644
>> > > --- a/qapi/block-core.json
>> > > +++ b/qapi/block-core.json
>> > > @@ -2896,6 +2896,12 @@
>> > >  #              for this device (default: none, forward the commands via SG_IO;
>> > >  #              since 2.11)
>> > >  # @aio: AIO backend (default: threads) (since: 2.8)
>> > > +# @aio-max-batch: maximum number of requests to batch together into a single
>> > > +#                 submission in the AIO backend. The smallest value between
>> > > +#                 this and the aio-max-batch value of the IOThread object is
>> > > +#                 chosen.
>> > > +#                 0 means that the AIO backend will handle it automatically.
>> > > +#                 (default: 0, since 6.2)
>> >
>> > "(default 0) (since 6.2)" seems to be more common.
>>
>> Indeed I wasn't sure, so I followed @drop-cache, the last one added in
>> @BlockdevOptionsFile.
>
>Actually, I think your style is more common, both globally and in
>block-*:
>
>    $ git grep -i '[,;] since' qapi/ | wc -l
>    17
>    $ git grep -i '[,;] since' qapi/block* | wc -l
>    12
>
>Compared to:
>
>    $ git grep -i ') (since' qapi/ | wc -l
>    14
>    $ git grep -i ') (since' qapi/block* | wc -l
>    7
>

Thanks for checking!

>Also a few instances with "(since: ...; default: ...)", but none in 
>that
>order with separate brackets.
>
>So I'd rather merge this version if this is the only comment.

Honestly I don't have a strong opinion.

If Markus agree, I think we can merge this version.

Thanks,
Stefano


