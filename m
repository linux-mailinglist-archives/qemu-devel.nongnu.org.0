Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F82E3CD1FC
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 12:37:07 +0200 (CEST)
Received: from localhost ([::1]:53212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5Qe2-0000t6-AU
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 06:37:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1m5Qd1-0008Vl-Te
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 06:36:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52761)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1m5Qd0-0005Me-GE
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 06:36:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626690961;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=z/jrKZrYhvMiDr4mN3e4IxDgonq/AKSyT+pSLiarQUg=;
 b=iVaWqTrXiKpLlK0DBYjOz4eQlgjnTlYhGNa0Etl+RBY6WY4nWm3qPOUGio+qLU0KGSKHpz
 Wzry58w5dea/mJE22F/DdTUV0URZgsldl0kddsH+S2w+8Wp7OAe6DttIfq++V0qIPBhMup
 bGBzT0vJz165aXzV2ae+e+VA5U7a1aw=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-67-YOe_JSF_P-O0fX1dDda42g-1; Mon, 19 Jul 2021 06:35:58 -0400
X-MC-Unique: YOe_JSF_P-O0fX1dDda42g-1
Received: by mail-wr1-f71.google.com with SMTP id
 h11-20020adffa8b0000b029013a357d7bdcso8592599wrr.18
 for <qemu-devel@nongnu.org>; Mon, 19 Jul 2021 03:35:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=z/jrKZrYhvMiDr4mN3e4IxDgonq/AKSyT+pSLiarQUg=;
 b=fP1ZPHAX8r2Q7MYSU6/fUTOQx9D/nzwpcLqsPWEE5/W2kKS/5179drtHX0wnISpCHx
 jnNp9V9Xk8o/a6eEoUzFwNTlNlwxovgz0QmxCrcGzDUV0qVQmNm80pZkGz7GmP5+KTZz
 Dcc9ezTo/RfW3aObb3+yF125S98/rnkj0Tq/8ywlhcQxxoVJElX+E/c/cAoSNKnLpYqB
 7PfrIZg5U7+UzWTjL6/HRPLgOsfrmz0ONSkZBUVIpNmQNpUkYISywL/aLgeIfrxpVc+B
 3hvrzubMZu5TAbaE1k5PF4GR0VzyftN6rVaKNRMaPC8COfWma5YDRwErmJ9QIeu/uiSY
 l9cA==
X-Gm-Message-State: AOAM533FkndRhFWnUwNspJAu7TjNbPjl4m9vyum6xGalUsgiNmr2/zb0
 BprsHGBQlO2EgpJXcBrvs9oZZklPMm7543xPOtJDKuTtbmKp4iq/7du4rFO9x+fD817X+C1ezJK
 dqvTLnBnf0Pym8h8=
X-Received: by 2002:a5d:504d:: with SMTP id h13mr28771714wrt.46.1626690956801; 
 Mon, 19 Jul 2021 03:35:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz9zlxu9beSVsEiR3V6hfxCldo3CB9MTaygu8oN41wAZdgfDBOMwHHGayAgIr85v74II7hKjA==
X-Received: by 2002:a5d:504d:: with SMTP id h13mr28771694wrt.46.1626690956564; 
 Mon, 19 Jul 2021 03:35:56 -0700 (PDT)
Received: from steredhat (host-79-18-148-79.retail.telecomitalia.it.
 [79.18.148.79])
 by smtp.gmail.com with ESMTPSA id z16sm20632495wrl.8.2021.07.19.03.35.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jul 2021 03:35:56 -0700 (PDT)
Date: Mon, 19 Jul 2021 12:35:53 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH 3/3] linux-aio: limit the batch size using
 `aio-max-batch` parameter
Message-ID: <20210719103553.2732gqgnvc4nuzlh@steredhat>
References: <20210707150019.201442-1-sgarzare@redhat.com>
 <20210707150019.201442-4-sgarzare@redhat.com>
 <YO2p/Ns7SsV6LE1x@stefanha-x1.localdomain>
MIME-Version: 1.0
In-Reply-To: <YO2p/Ns7SsV6LE1x@stefanha-x1.localdomain>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.466,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jul 13, 2021 at 03:58:04PM +0100, Stefan Hajnoczi wrote:
>On Wed, Jul 07, 2021 at 05:00:19PM +0200, Stefano Garzarella wrote:
>> @@ -371,7 +375,7 @@ static int laio_do_submit(int fd, struct qemu_laiocb *laiocb, off_t offset,
>>      s->io_q.in_queue++;
>>      if (!s->io_q.blocked &&
>>          (!s->io_q.plugged ||
>> -         s->io_q.in_flight + s->io_q.in_queue >= MAX_EVENTS)) {
>> +         s->io_q.in_queue >= max_batch)) {
>
>Is it safe to drop the MAX_EVENTS case?

I think it is safe since in ioq_submit() we have this check while 
dequeueing:

         QSIMPLEQ_FOREACH(aiocb, &s->io_q.pending, next) {
             iocbs[len++] = &aiocb->iocb;
             if (s->io_q.in_flight + len >= MAX_EVENTS) {
                 break;
             }
         }

But in term of performance, I think is better what you're suggesting, 
because if we have fewer slots available than `max_batch`, here we were 
delaying the call to io_submit().

>
>Perhaps the following can be used:
>
>  int64_t max_batch = s->aio_context->aio_max_batch ?: DEFAULT_MAX_BATCH;
>  max_batch = MIN_NON_ZERO(MAX_EVENTS - s->io_q.in_flight + s->io_q.in_queue, max_batch);
>

Since we will compare `in_queue` with `max_batch`, should we remove it 
from this expression?

I mean:

   int64_t max_batch = s->aio_context->aio_max_batch ?: DEFAULT_MAX_BATCH;
   max_batch = MIN_NON_ZERO(MAX_EVENTS - s->io_q.in_flight, max_batch);

then as it is in this patch:

   s->io_q.in_queue++;
   if (!s->io_q.blocked &&
       (!s->io_q.plugged ||
        s->io_q.in_queue >= max_batch)) {
       ioq_submit(s);
   }

>Here we'll only need to check against max_batch but it takes into
>account MAX_EVENT and in_flight.

Thanks,
Stefano


