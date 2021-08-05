Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0992D3E105C
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Aug 2021 10:32:51 +0200 (CEST)
Received: from localhost ([::1]:53814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBYo6-0005Ur-3b
	for lists+qemu-devel@lfdr.de; Thu, 05 Aug 2021 04:32:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1mBYnB-0004p3-V2
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 04:31:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38870)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1mBYnA-0006FG-6P
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 04:31:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628152311;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=345HL7K9qPj+/cFdorEOlhisuiaHXrmk4uXAhnFo+Eg=;
 b=HXaInjdCelTuevjyaKRww7EaO0Q29ylQbx+LSJi5Y1Rv1Cb9PCiU4UrKs/zF4MaYr/g4Bd
 2Jl5B2jr/9z9NxeQiUqE3K3hRNbWPS/w2VFFJ1iEHh4cqsdNNc76WC6m1PbbBYV2TeJLqN
 mD11HhuNKSk6Rh4al3oTFpHf9d9DYCE=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-397--ihyTJlTOp63UN6p7GkOUg-1; Thu, 05 Aug 2021 04:31:49 -0400
X-MC-Unique: -ihyTJlTOp63UN6p7GkOUg-1
Received: by mail-ej1-f72.google.com with SMTP id
 ci25-20020a1709072679b029058e79f6c38aso1772691ejc.13
 for <qemu-devel@nongnu.org>; Thu, 05 Aug 2021 01:31:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=345HL7K9qPj+/cFdorEOlhisuiaHXrmk4uXAhnFo+Eg=;
 b=InM2BmEYXhWqHjt2zzhlz0Ycxu7XNk45+llLlw/XN5ZC/lfLOnbI+OyZxWv3D66yny
 x7h6LMzs09MPrrY/uWyXoKlDKbeah/8gYMWWE4Bpk49xv78Vx/N5juNxg5rCLmyL0dej
 wyaC2p60VG0PuBlNev51x67SWMQXlnPj6OAtZGbMB998O3CE5HTbMYOq17Ma+NLXfJU2
 oXiHsmUStguIccMNQnKq0ke3nVStpWcsHGwmCYQ2b6k/5qjATfLvbXu/ki+9Wb0kh19/
 BxbDJ+4nADqDHektsgIKuOtKaPKaepFnNaEXaLimZxD5l6/KboAiGOh63MrLCuN0wpQV
 Yngg==
X-Gm-Message-State: AOAM530tRAPZdx2M40/xTvKeXg0sdl4+yQbS6z+9XZG1una4gEJNVKQ9
 yxepB4yENy+BLTr2/Ykq9Fe+O/n1vTtkiL4neoy7AxVNlBxFHwqhKaMx/8eYWcAv2EzPav3HJXD
 UKyFvxO9BtfhM5CU=
X-Received: by 2002:a50:ae02:: with SMTP id c2mr5145127edd.307.1628152308676; 
 Thu, 05 Aug 2021 01:31:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxEGk9nuhTL8FmW9nGy6DfiKbht/v40kw4wKesbpDCooqQR0mfgYPrqhHhHa7NzpeeewOxtyg==
X-Received: by 2002:a50:ae02:: with SMTP id c2mr5145095edd.307.1628152308409; 
 Thu, 05 Aug 2021 01:31:48 -0700 (PDT)
Received: from steredhat (host-79-18-148-79.retail.telecomitalia.it.
 [79.18.148.79])
 by smtp.gmail.com with ESMTPSA id ga20sm1435553ejc.18.2021.08.05.01.31.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Aug 2021 01:31:47 -0700 (PDT)
Date: Thu, 5 Aug 2021 10:31:45 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH v2] block/io_uring: resubmit when result is -EAGAIN
Message-ID: <20210805083145.idxfgmwi7i7whzjx@steredhat>
References: <20210729091029.65369-1-f.ebner@proxmox.com>
 <YQfnxLROKL/JUKyF@redhat.com>
 <20210804145048.awmlthlwlv3vcohu@steredhat>
 <YQrFv9P5/tGPEaH8@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YQrFv9P5/tGPEaH8@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: "open list:Linux io_uring" <qemu-block@nongnu.org>,
 Stefan Hajnoczi <stefanha@gmail.com>, Julia Suvorova <jusual@redhat.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Fabian Ebner <f.ebner@proxmox.com>,
 Aarushi Mehta <mehta.aaru20@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Aug 04, 2021 at 06:52:15PM +0200, Kevin Wolf wrote:
>Am 04.08.2021 um 16:50 hat Stefano Garzarella geschrieben:
>> On Mon, Aug 02, 2021 at 02:40:36PM +0200, Kevin Wolf wrote:
>> > Am 29.07.2021 um 11:10 hat Fabian Ebner geschrieben:
>> > > Linux SCSI can throw spurious -EAGAIN in some corner cases in its
>> > > completion path, which will end up being the result in the completed
>> > > io_uring request.
>> > >
>> > > Resubmitting such requests should allow block jobs to complete, even
>> > > if such spurious errors are encountered.
>> > >
>> > > Co-authored-by: Stefan Hajnoczi <stefanha@gmail.com>
>> > > Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
>> > > Signed-off-by: Fabian Ebner <f.ebner@proxmox.com>
>> > > ---
>> > >
>> > > Changes from v1:
>> > >     * Focus on what's relevant for the patch itself in the commit
>> > >       message.
>> > >     * Add Stefan's comment.
>> > >     * Add Stefano's R-b tag (I hope that's fine, since there was no
>> > >       change code-wise).
>> > >
>> > >  block/io_uring.c | 16 +++++++++++++++-
>> > >  1 file changed, 15 insertions(+), 1 deletion(-)
>> > >
>> > > diff --git a/block/io_uring.c b/block/io_uring.c
>> > > index 00a3ee9fb8..dfa475cc87 100644
>> > > --- a/block/io_uring.c
>> > > +++ b/block/io_uring.c
>> > > @@ -165,7 +165,21 @@ static void luring_process_completions(LuringState *s)
>> > >          total_bytes = ret + luringcb->total_read;
>> > >
>> > >          if (ret < 0) {
>> > > -            if (ret == -EINTR) {
>> > > +            /*
>> > > +             * Only writev/readv/fsync requests on regular files or host block
>> > > +             * devices are submitted. Therefore -EAGAIN is not expected but it's
>> > > +             * known to happen sometimes with Linux SCSI. Submit again and hope
>> > > +             * the request completes successfully.
>> > > +             *
>> > > +             * For more information, see:
>> > > +             * https://lore.kernel.org/io-uring/20210727165811.284510-3-axboe@kernel.dk/T/#u
>> > > +             *
>> > > +             * If the code is changed to submit other types of requests in the
>> > > +             * future, then this workaround may need to be extended to deal with
>> > > +             * genuine -EAGAIN results that should not be resubmitted
>> > > +             * immediately.
>> > > +             */
>> > > +            if (ret == -EINTR || ret == -EAGAIN) {
>> > >                  luring_resubmit(s, luringcb);
>> > >                  continue;
>> > >              }
>> >
>> > Reviewed-by: Kevin Wolf <kwolf@redhat.com>
>> >
>> > Question about the preexisting code, though: luring_resubmit() requires
>> > that the caller calls ioq_submit() later so that the request doesn't
>> > just sit in a queue without getting any attention, but actually gets
>> > submitted to the kernel.
>> >
>> > In the call chain ioq_submit() -> luring_process_completions() ->
>> > luring_resubmit(), who takes care of that?
>>
>> Mmm, good point.
>> There should be the same problem with ioq_submit() ->
>> luring_process_completions() -> luring_resubmit_short_read() ->
>> luring_resubmit().
>>
>> Should we schedule a BH for example in luring_resubmit() to make sure that
>> ioq_submit() is invoked after a resubmission?
>
>Or just loop in ioq_submit() after calling luring_process_completions()
>if new requests were added to the queue?
>

I was just concerned that we might cycle a bit if a request always 
returns -EAGAIN, while scheduling a task might give room for other 
devices to queue other requests.

But maybe this happens so occasionally that we might not worry about 
it...

Stefano


