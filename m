Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA97B43C458
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 09:48:44 +0200 (CEST)
Received: from localhost ([::1]:35866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfdfv-0002E7-Vh
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 03:48:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mfdbZ-00072f-Pj
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 03:44:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28015)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mfdbY-0008S8-7O
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 03:44:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635320651;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9vJQQ5eLVKs/kri0OomHww6ZxOJZdyXHQBAIhsF6Ndc=;
 b=JkTyMqW42mRKOXWtoEmAhzCznrgcB8iVrMRFiEMdv4g0f4eHMZljifHLApDVlyB5C4KG1h
 tINBRsN0bFxQHmN36mdKj1sSr9qwyQ9huBoQIrt+iwhyYYke/cmfpycc6Alf45MyBYHEwx
 untD4/lADAor/1Eyr+O+67u+KUl0WVc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-22-PRjYL9LxNV2txsUK829RIg-1; Wed, 27 Oct 2021 03:44:10 -0400
X-MC-Unique: PRjYL9LxNV2txsUK829RIg-1
Received: by mail-wm1-f69.google.com with SMTP id
 m1-20020a1ca301000000b003231d5b3c4cso1795603wme.5
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 00:44:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=9vJQQ5eLVKs/kri0OomHww6ZxOJZdyXHQBAIhsF6Ndc=;
 b=vKOrnR3vSyxqgSfBMbt4HyEYko7+pLucSuSsuyUtmZ31d8BKX/zME3btvUpcisN1QD
 e4CdfdutiA/pxsX7Bv8HB2/ck9Ktnah87WC/TFBi2FLk025YxJHMZZkzuDjFYplHjsP8
 pQY/AeP0DW20J+XvtTQXbEnbiSVN/dmkV8xMC2fiHWgY/NYhg8NpHvMT9PylA9ZP6BCt
 6fT0IZGuxdx53I/tf1NXz6zz7jFynqVfBmfG8jAlKBsVc5VukQXLYkUIRx9INhGzo4fv
 SRJKOT6ozbUC8IiuG38jlnTcEWRjQ/iMpnUccmGNTe85XmkfbQZhdt9v8gxdeOkZ8W6T
 pNVA==
X-Gm-Message-State: AOAM530Pe7YTUje6M6niTcgrGDGM0MSIBWxRzoW9SPgXOFPiteIlKBTx
 IKihOaj/VCKTev3wKC0Ozpq1sw5ezRKcyD9+ALo6QoF7yud0xY8jy83Or47OEwT3pHnr6x2cq4N
 xt04FPAbu5h4CPqM=
X-Received: by 2002:a5d:6d07:: with SMTP id e7mr38711990wrq.425.1635320649194; 
 Wed, 27 Oct 2021 00:44:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx85ZQsa1SzX6GQHQ8ZMH15k+8gaRhbCDSfoO8zNoSikdQLdwZ5NsO+ckuJBu+ZEwGcTNISQA==
X-Received: by 2002:a5d:6d07:: with SMTP id e7mr38711967wrq.425.1635320648920; 
 Wed, 27 Oct 2021 00:44:08 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id f20sm3258764wmq.38.2021.10.27.00.44.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Oct 2021 00:44:08 -0700 (PDT)
Message-ID: <a6779b76-0f1a-4e71-d4ba-7ed58181bd1d@redhat.com>
Date: Wed, 27 Oct 2021 09:44:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v4 6/8] iotests/300: avoid abnormal shutdown race condition
To: John Snow <jsnow@redhat.com>
References: <20211013215748.2154908-1-jsnow@redhat.com>
 <20211013215748.2154908-7-jsnow@redhat.com>
 <53d27c1f-c9de-5608-7f6a-f64bc39fb159@redhat.com>
 <CAFn=p-Y3nCHY4Kp+9ngG077-kZXLOCo8Uv0hr9FTqreNvA58yQ@mail.gmail.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <CAFn=p-Y3nCHY4Kp+9ngG077-kZXLOCo8Uv0hr9FTqreNvA58yQ@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.215, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 qemu-devel <qemu-devel@nongnu.org>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 26.10.21 19:07, John Snow wrote:
>
>
> On Mon, Oct 25, 2021 at 9:20 AM Hanna Reitz <hreitz@redhat.com> wrote:
>
>     On 13.10.21 23:57, John Snow wrote:
>     > Wait for the destination VM to close itself instead of racing to
>     shut it
>     > down first, which produces different error log messages from AQMP
>     > depending on precisely when we tried to shut it down.
>     >
>     > (For example: We may try to issue 'quit' immediately prior to
>     the target
>     > VM closing its QMP socket, which will cause an ECONNRESET error
>     to be
>     > logged. Waiting for the VM to exit itself avoids the race on
>     shutdown
>     > behavior.)
>     >
>     > Reported-by: Hanna Reitz <hreitz@redhat.com>
>     > Signed-off-by: John Snow <jsnow@redhat.com>
>     > ---
>     >   tests/qemu-iotests/300 | 12 ++++--------
>     >   1 file changed, 4 insertions(+), 8 deletions(-)
>     >
>     > diff --git a/tests/qemu-iotests/300 b/tests/qemu-iotests/300
>     > index 10f9f2a8da6..bbea7248005 100755
>     > --- a/tests/qemu-iotests/300
>     > +++ b/tests/qemu-iotests/300
>     > @@ -24,8 +24,6 @@ import random
>     >   import re
>     >   from typing import Dict, List, Optional
>     >
>     > -from qemu.machine import machine
>     > -
>     >   import iotests
>     >
>     >
>     > @@ -461,12 +459,10 @@ class
>     TestBlockBitmapMappingErrors(TestDirtyBitmapMigration):
>     >                         f"'{self.src_node_name}': Name is longer
>     than 255 bytes",
>     >                         log)
>     >
>     > -        # Expect abnormal shutdown of the destination VM because of
>     > -        # the failed migration
>     > -        try:
>     > -            self.vm_b.shutdown()
>     > -        except machine.AbnormalShutdown:
>     > -            pass
>     > +        # Destination VM will terminate w/ error of its own accord
>     > +        # due to the failed migration.
>     > +        self.vm_b.wait()
>     > +        assert self.vm_b.exitcode() > 0
>
>     Trying to test, I can see that this fails iotest 297, because
>     `.exitcode()` is `Optional[int]`...
>
>     (I can’t believe how long it took me to figure this out – the message
>     “300:465: Unsupported operand types for < ("int" and "None")” made me
>     believe that it was 300 that was failing, because `exitcode()` was
>     returning `None` for some inconceivable reason.  I couldn’t
>     understand
>     why my usual test setup failed on every run, but I couldn’t get
>     300 to
>     fail manually...  Until I noticed that the message came below the
>     “297”
>     line, not the “300” line...)
>
>
> Oops. Is there anything we can do to improve the visual clarity there?

You mean, like, separating iotests from the Python linting tests? :)

I think until then I’ll just need to pay more attention.

Hanna


