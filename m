Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55A773D8E74
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Jul 2021 15:03:31 +0200 (CEST)
Received: from localhost ([::1]:45708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8jDe-0000rX-D6
	for lists+qemu-devel@lfdr.de; Wed, 28 Jul 2021 09:03:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1m8jCl-0008Jg-4a
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 09:02:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47655)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1m8jCh-0000RD-SI
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 09:02:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627477350;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s/lZ+CDGLfPzuuvBgK24pbUNBv1NzDRkjPTGKuQF5mc=;
 b=NAkpKCIqYcCCoK3Ubr0Iu85dfYQgLZJe1sw2blKMD2yeeXo/x0my5+uiOZcoA6Rsk8WAmD
 ZW5Yy3uoKkZvCb1vpRgxji7E8X5AqNKwXXWw2m/LQJgoaO2JC5cj0IkXDx6jDdKxyqyPT7
 Svxa9IwA/05LGqYtPVv2mXUGlwNwkFo=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-507-o1-viwrrNIWRu2UJk9YOxw-1; Wed, 28 Jul 2021 09:02:27 -0400
X-MC-Unique: o1-viwrrNIWRu2UJk9YOxw-1
Received: by mail-ej1-f72.google.com with SMTP id
 r21-20020a1709067055b02904be5f536463so819816ejj.0
 for <qemu-devel@nongnu.org>; Wed, 28 Jul 2021 06:02:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=s/lZ+CDGLfPzuuvBgK24pbUNBv1NzDRkjPTGKuQF5mc=;
 b=pgiLf9vWzUnUXkvj8fxNyLEviw/UMa6BqT4BQO1IK8wbNCNMzZFvPfIfBqjDMRQ+NL
 8z0rseLyz/P/2z0IEA24jJXVDRq4g+JYd3A/vXB4W0ug5gr+ldUYUFrMFCj6EezVQn/C
 MJEHTq5+l97VrsendzPzXt9YFFYmVjqJHuz7AxclI/AAD+IGvSHPiCVS77Q1Gcl7j0Gb
 fgMbLsnETPCirNpStTpKp250SlLJR/SC7cxE4UYqs0EwMPkvjvoGWtkLBzVStutuYOnB
 uiXLCmREZ+azwSDzFZ66yp5svKYLaq8fS638UWSXyKSKBlfROJAfrM5gIxQoUnO5kvUl
 R+uw==
X-Gm-Message-State: AOAM532F5hZeVrYV1SYmmtyRA82M5iXIw55Zz7tU9A+CO4/Elo3X/Ud/
 nik9SdEvimJvCuAFNzl9RqOyPG4lX97rVE2axXLXT/hfiCnVqvBTqKVfqtOCVxfOHJuadJy3REF
 Ea6UbBmhREL55MiI=
X-Received: by 2002:a17:906:5d0b:: with SMTP id
 g11mr27614536ejt.437.1627477346140; 
 Wed, 28 Jul 2021 06:02:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyTTNltsk6h/Q34mpXNtbpp/mI88I61x4iXMt7ZhVgjAXxykOX+xTzF2fWgyrUTh1BOQBQgQA==
X-Received: by 2002:a17:906:5d0b:: with SMTP id
 g11mr27614508ejt.437.1627477345861; 
 Wed, 28 Jul 2021 06:02:25 -0700 (PDT)
Received: from steredhat (host-79-18-148-79.retail.telecomitalia.it.
 [79.18.148.79])
 by smtp.gmail.com with ESMTPSA id bm1sm2028681ejb.38.2021.07.28.06.02.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jul 2021 06:02:24 -0700 (PDT)
Date: Wed, 28 Jul 2021 15:02:22 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Fabian Ebner <f.ebner@proxmox.com>
Subject: Re: [PATCH] block/io_uring: resubmit when result is -EAGAIN
Message-ID: <20210728130222.x7t7tn6e3jpyqhru@steredhat>
References: <20210728103518.1221195-1-f.ebner@proxmox.com>
 <b60e324a-ed8f-594f-b27e-2e4a270726bf@redhat.com>
MIME-Version: 1.0
In-Reply-To: <b60e324a-ed8f-594f-b27e-2e4a270726bf@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 Julia Suvorova <jusual@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Aarushi Mehta <mehta.aaru20@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jul 28, 2021 at 02:09:40PM +0200, Philippe Mathieu-Daudé wrote:
>Cc'ing the maintainers for you. See
>https://wiki.qemu.org/Contribute/SubmitAPatch#CC_the_relevant_maintainer
>
>$ ./scripts/get_maintainer.pl -f block/io_uring.c
>Aarushi Mehta <mehta.aaru20@gmail.com> (maintainer:Linux io_uring)
>Julia Suvorova <jusual@redhat.com> (maintainer:Linux io_uring)
>Stefan Hajnoczi <stefanha@redhat.com> (maintainer:Linux io_uring)
>Kevin Wolf <kwolf@redhat.com> (supporter:Block layer core)
>Max Reitz <mreitz@redhat.com> (supporter:Block layer core)
>qemu-block@nongnu.org (open list:Linux io_uring)
>qemu-devel@nongnu.org (open list:All patches CC here)
>
>Also Cc'ing Stefano for commit b4e44c9944e ("io_uring: retry
>io_uring_submit() if it fails with errno=EINTR").

Thanks Phil!

>(Stefano, you might want to add yourself a R: tag in MAINTAINERS).

Yep, I'll send a patch for that.

>
>On 7/28/21 12:35 PM, Fabian Ebner wrote:
>> Quoting from [0]:
>>
>>  Some setups, like SCSI, can throw spurious -EAGAIN off the softirq
>>  completion path. Normally we expect this to happen inline as part
>>  of submission, but apparently SCSI has a weird corner case where it
>>  can happen as part of normal completions.
>>
>> Host kernels without patch [0] can panic when this happens [1], and
>> resubmitting makes the panic more likely. On the other hand, for
>> kernels with patch [0], resubmitting ensures that a block job is not
>> aborted just because of such spurious errors.
>>
>> [0]: https://lore.kernel.org/io-uring/20210727165811.284510-3-axboe@kernel.dk/T/#u
>>
>> [1]:
>>   #9 [ffffb732000c8b70] asm_exc_page_fault at ffffffffa4800ade
>>  #10 [ffffb732000c8bf8] io_prep_async_work at ffffffffa3d89c16
>>  #11 [ffffb732000c8c50] io_rw_reissue at ffffffffa3d8b2e1
>>  #12 [ffffb732000c8c78] io_complete_rw at ffffffffa3d8baa8
>>  #13 [ffffb732000c8c98] blkdev_bio_end_io at ffffffffa3d62a80
>>  #14 [ffffb732000c8cc8] bio_endio at ffffffffa3f4e800
>>  #15 [ffffb732000c8ce8] dec_pending at ffffffffa432f854
>>  #16 [ffffb732000c8d30] clone_endio at ffffffffa433170c
>>  #17 [ffffb732000c8d70] bio_endio at ffffffffa3f4e800
>>  #18 [ffffb732000c8d90] blk_update_request at ffffffffa3f53a37
>>  #19 [ffffb732000c8dd0] scsi_end_request at ffffffffa4233a5c
>>  #20 [ffffb732000c8e08] scsi_io_completion at ffffffffa423432c
>>  #21 [ffffb732000c8e58] scsi_finish_command at ffffffffa422c527
>>  #22 [ffffb732000c8e88] scsi_softirq_done at ffffffffa42341e4
>>
>> Signed-off-by: Fabian Ebner <f.ebner@proxmox.com>
>> ---
>>
>> I'm new to this code and io_uring, so I don't know what all the
>> implications are, but retrying upon EAGAIN does not sound like
>> a bad thing to my inexperienced ears.

Yeah, that doesn't sound bad.

For kernels that don't have the patch applied, I don't think there's 
much we can do about it, so this change seems okay to me:

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>


