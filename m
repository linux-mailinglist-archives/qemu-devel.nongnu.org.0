Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FB09442DA2
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 13:14:57 +0100 (CET)
Received: from localhost ([::1]:51750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhsgn-0006IC-P2
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 08:14:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1mhsLY-0006it-Sd
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 07:52:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21841)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1mhsLT-0000ry-19
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 07:52:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635853970;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6Ew0vsk5/gieP/NysyYExvkOO89Lk+A7CvPB11BnC68=;
 b=KvXavW/iWUMDyjasPL0TjdP3ksFkSrDQtzJnvbFhSxRD7EmZE4GG3dqypmn5AoccV1IaKA
 5R/UHSckX61p7bkTLnCSqR1oT5omf8gEM6HdVM8dnHA5D6d/UUxfXvChnA7wruDjw5h6so
 3CVCwoU9PalQ9KrW8YvjjXuGxZXp4K0=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-467-_Ji9FroLNoarVAMEIRkb1w-1; Tue, 02 Nov 2021 07:52:49 -0400
X-MC-Unique: _Ji9FroLNoarVAMEIRkb1w-1
Received: by mail-ed1-f71.google.com with SMTP id
 z1-20020a05640235c100b003e28c89743bso5606067edc.22
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 04:52:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=6Ew0vsk5/gieP/NysyYExvkOO89Lk+A7CvPB11BnC68=;
 b=HGnjQhEreL0nRKMJ/Zf9XLpVIOikQFECIc9CfXHcVULrVscSgk+Jjc29eA3zf/dGoK
 gbzZ+RLg8aXatuiGATfkWPk1nrScCWk/FOHmmleX/V8ImHN1G8hVl9i2OjLHVRL87+gH
 mWUIJWQ2FCt5gNr7O5bSDwqvAqcIzO0cipD9RHQKme6o7PY0g8nEAjHwYkCfBY+n2BDd
 Pd3TUvhBgSAt1sUK1Yjsec0aEby4YWk9wk1SNOFIWKzyzyn71khf84Y0KwspjmOFJuWG
 hrCAk4a2lQRmb6PXexbY6t5WtVc28Aa6uOPrPaG2tVBMmdDScIUSE3si6crBVFlwfH9l
 hLTw==
X-Gm-Message-State: AOAM533lUpAsX/xtN5wGrxVT0xn6/Gy7dvc3gtoKdyzwsY688LEKTfhf
 AxSMiTcSzJfO36dXOc7wJ8vIa2fpQ2FUqnHbs7vLlVySb+Wj4B6u8vh4ShQZET5yNxuAwKoU/pK
 GrVWoXCTX+E/lkh8=
X-Received: by 2002:a17:906:fa90:: with SMTP id
 lt16mr40867986ejb.95.1635853967904; 
 Tue, 02 Nov 2021 04:52:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJySmtRrqpVpq8jzl447fyYiPkXSXAvZRYDI8VVetOPjkK1l1g0A3/PMrciac0WsxVDGlLZC0g==
X-Received: by 2002:a17:906:fa90:: with SMTP id
 lt16mr40867956ejb.95.1635853967660; 
 Tue, 02 Nov 2021 04:52:47 -0700 (PDT)
Received: from steredhat (host-87-10-72-39.retail.telecomitalia.it.
 [87.10.72.39])
 by smtp.gmail.com with ESMTPSA id s26sm8109479edq.6.2021.11.02.04.52.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 04:52:47 -0700 (PDT)
Date: Tue, 2 Nov 2021 12:52:44 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH v2 1/3] file-posix: add `aio-max-batch` option
Message-ID: <20211102115244.jasz5gxoy7wogkfg@steredhat>
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
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-block@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Eric Blake <eblake@redhat.com>
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
>Also a few instances with "(since: ...; default: ...)", but none in that
>order with separate brackets.
>
>So I'd rather merge this version if this is the only comment.

Kevin, since today is the soft freeze, are you planning on queuing this 
series?

If not, I'll add to my todo list to resend it for the next release.

Thanks,
Stefano


