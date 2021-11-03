Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA14E444B9D
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Nov 2021 00:26:40 +0100 (CET)
Received: from localhost ([::1]:52814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miPeR-0003i9-Hg
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 19:26:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1miPcH-00031Z-Ji
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 19:24:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52711)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1miPcE-00074C-12
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 19:24:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635981860;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=Cj3+bd437l4pWKV266UDxXtsjvbPTuy2+M1or69q9GY=;
 b=CcDdii2DJVzC0o+3UM9eMENTVRGFzuKjqLCASERcck7BCvcToGdpo568MIv2CzMwHY+qLV
 5/iInE9P7131USUmSAW9+i5wftzD4QV76vXJgPCF6JxQ1GFNW3/WWGXaLy2oHmS2QF/KtN
 JjlYJKaA2/QI0ePvi+L/wY4wBr1e+zY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-586-1X5Ir8Q1MTqcc27nFt2Qtg-1; Wed, 03 Nov 2021 19:24:19 -0400
X-MC-Unique: 1X5Ir8Q1MTqcc27nFt2Qtg-1
Received: by mail-wm1-f70.google.com with SMTP id
 a18-20020a1cf012000000b0032ca3eb2ac3so1821024wmb.0
 for <qemu-devel@nongnu.org>; Wed, 03 Nov 2021 16:24:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=Cj3+bd437l4pWKV266UDxXtsjvbPTuy2+M1or69q9GY=;
 b=DrqWzNYiOovNaILo+8GAwYNq7WlV/9/nH1LbSQ/EI08U3EqHg8afN+Yyk9BManHHSa
 Aa+luTMrH4FJb+SfbXcBWoPqFnogEIZ27nOgpZr95GUvkJfP3nUcKthxaz0TeFnZyvv4
 eMeK4yWE2ZZYfKYn/uQUo0ODEMCnCHvdlUOk1DGX8MqhDdXbgShqX7nVSsqhrkjnJVde
 FpmUpeotuvCgnD65uvuvV00WSSx6WnnfOcD5IpzkLObL8p3c0Q5cN1ikDD17tvWARGSx
 bbAgCWWX+P0HuiJIWCpHCy2eU+KA/w3IsopM+598E8RNouBT25/kIQV4A3T6nO1XIHpx
 jL2Q==
X-Gm-Message-State: AOAM532zXhsAZhKeeOjKisO38fMvGGXgllLyVQ2KWZk2t7AGc0DOLSb8
 ifSwf+pbg5QnwJJX8f8CIbPjPclldohxNZjGj19Xw8SvAjwTEea2DzH+Zm25rjAnC+sTJrKchYb
 7OLq0MxdjN4mY1nw=
X-Received: by 2002:a05:600c:17c3:: with SMTP id
 y3mr18637963wmo.136.1635981858621; 
 Wed, 03 Nov 2021 16:24:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx1Qw6Xqc2eRnyk2n2sKZHSvhhCEcIQqtBqD4rAY1cQpBC81jn10A9FwzVzMedtYi9zBtaSiw==
X-Received: by 2002:a05:600c:17c3:: with SMTP id
 y3mr18637935wmo.136.1635981858423; 
 Wed, 03 Nov 2021 16:24:18 -0700 (PDT)
Received: from localhost (62.117.184.100.dyn.user.ono.com. [62.117.184.100])
 by smtp.gmail.com with ESMTPSA id o9sm3364122wrs.4.2021.11.03.16.24.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Nov 2021 16:24:17 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Leonardo Bras Soares Passos <leobras@redhat.com>
Subject: Re: [PATCH v4 3/3] multifd: Implement zerocopy write in multifd
 migration (multifd-zerocopy)
In-Reply-To: <CAJ6HWG7erHjN7ZNi=oRC=e-boWexbCJ7bBpgKs9x1D-igVSAqw@mail.gmail.com>
 (Leonardo Bras Soares Passos's message of "Wed, 3 Nov 2021 18:29:25
 -0300")
References: <20211009075612.230283-1-leobras@redhat.com>
 <20211009075612.230283-4-leobras@redhat.com>
 <87sfwekabf.fsf@secure.mitica>
 <CAJ6HWG7erHjN7ZNi=oRC=e-boWexbCJ7bBpgKs9x1D-igVSAqw@mail.gmail.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Thu, 04 Nov 2021 00:24:16 +0100
Message-ID: <87bl30hlgf.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
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
Reply-To: quintela@redhat.com
Cc: "Daniel P. =?utf-8?Q?Berrang=C3=A9?=" <berrange@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Jason Wang <jasowang@redhat.com>,
 "Dr. David
 Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Leonardo Bras Soares Passos <leobras@redhat.com> wrote:
> Hello Juan,

hi

> Current multifd's sendmsg() will block until all data is sent, is that correct?
>
> If that's the case, and supposing the network driver supports
> multiqueue, maybe there is a small chance for this to happen.
> I will add the flush at the end of each iteration, just to be sure.
>
>>
>> After each iteration, one needs to be sure that no ram is inflight.
>>
>> This means that I think you don't need the last_sync parameter at all,
>> as you have to do the flush() in every iteration.

It means guest memory corruption, it _needs_ to be there.
That is the whole reason why multifd code has to wait after each
iteration for all channels to finish.  Probability of failure is low,
but it exist, so it needs to be handled correctly.
>> >              '*multifd-zlib-level': 'uint8',
>> >              '*multifd-zstd-level': 'uint8',
>> > +         '*multifd-zerocopy': 'bool',
>> >              '*block-bitmap-mapping': [ 'BitmapMigrationNodeAlias' ] } }
>>
>> Something weird here.
>>
>> >              '*multifd-compression': 'MultiFDCompression',
>> >              '*multifd-zlib-level': 'uint8',
>> >              '*multifd-zstd-level': 'uint8',
>> > +         '*multifd-zerocopy': 'bool',
>> >              '*block-bitmap-mapping': [ 'BitmapMigrationNodeAlias' ] } }
>> >
>>
>> Same here.
>
> Could you please elaborate?

Indentation, 

+         '*multifd-zerocopy': 'bool',
             '*block-bitmap-mapping': [ 'BitmapMigrationNodeAlias' ] } }

This is how it is seen here.  space/tab?

Later, Juan.


