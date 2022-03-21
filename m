Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07D714E2762
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 14:20:16 +0100 (CET)
Received: from localhost ([::1]:46474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWHxF-0000dH-TB
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 09:20:14 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nWHrr-0005cZ-FN
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 09:14:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45272)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nWHro-0005Xa-1I
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 09:14:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647868475;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I5pyeqNRf21N8nMBaUv0wY7hh9F2ICcYZzvLJlfU6iM=;
 b=bCA/QaTjesOIapHerLgs8pwsClo4Z/CUF2mqL5qwcMER9DAH16eqHbi3uUytBOhiVmwuGe
 TC/QhlzWcBhyXlwLKO/CSgRWs3NGxihUYWvj9OOGTOan2hbnZ8zXnlv7N5IGvj80ydgz6F
 1vVeQP2i/n3M6qbs4UL8Vkv/ee98CQI=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-75-Nab3X4tzMAuxyodBImszAA-1; Mon, 21 Mar 2022 09:14:32 -0400
X-MC-Unique: Nab3X4tzMAuxyodBImszAA-1
Received: by mail-ed1-f71.google.com with SMTP id
 s7-20020a508dc7000000b0040f29ccd65aso8611882edh.1
 for <qemu-devel@nongnu.org>; Mon, 21 Mar 2022 06:14:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=I5pyeqNRf21N8nMBaUv0wY7hh9F2ICcYZzvLJlfU6iM=;
 b=GQ0+GsSr3EfW1FXXEM6+W+cT3o9jp6CXFFUXEP8DPeaU5q3ua8L4mL4xpe94Xd44EU
 vQ/JwbKp6Q0V2cNomJcSJmd0dgYs4ObDITM5YyT5ub4xpEmB1b+eJAplOddlX7rwlzeo
 MzsGYyL7klnSokOF/YbyO4U8jZKqIdXsKvjxmTxNwXXpJpEnUSbSiCL4G5IbGIT2nMEb
 puokY+VRVH7dhCQEE6gqupN+RVtIAk32PoyTMtQZjkNFyPtNTdzRMrb8W5KQjUC8ZPDx
 YYEvaz9qie7+g4Te6Ji1qZuLCUyuhDcJUg4RO9ucxkHb13Ur1ugUHsnu9tkAm6PLLXns
 tRiw==
X-Gm-Message-State: AOAM530NX6E9/efPT/P/ZWSiv3Rng8QcDv1iiuJGSPQmw9/UYdHJLOv9
 52nD9Pchy2o3tm9QhUeCDSJvcPSjkxwzY+1BC2Tmux8itjHKZOmGxnGhA8E6MeWJs3vvArUGac7
 FipxzTx3ZaBCDeWE=
X-Received: by 2002:a17:907:9811:b0:6df:f50e:47a0 with SMTP id
 ji17-20020a170907981100b006dff50e47a0mr8016895ejc.124.1647868471654; 
 Mon, 21 Mar 2022 06:14:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxrzm+02Mv1L0o8MkKp2lWfDne7s/9jGf5FBV0PDpdUBnVpNbOQHlD/yfS2uvlIp9fFD/y+0Q==
X-Received: by 2002:a17:907:9811:b0:6df:f50e:47a0 with SMTP id
 ji17-20020a170907981100b006dff50e47a0mr8016880ejc.124.1647868471455; 
 Mon, 21 Mar 2022 06:14:31 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id
 v2-20020a509d02000000b00412d53177a6sm7925205ede.20.2022.03.21.06.14.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Mar 2022 06:14:31 -0700 (PDT)
Message-ID: <96332ab4-c4fb-75c3-d865-4fe3d2588325@redhat.com>
Date: Mon, 21 Mar 2022 14:14:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 00/18] iotests: add enhanced debugging info to qemu-img
 failures
To: John Snow <jsnow@redhat.com>
References: <20220317234937.569525-1-jsnow@redhat.com>
 <73e7fc10-e843-68fd-ebe3-e7916c891c34@redhat.com>
 <CAFn=p-bffj3CK9o2haN-3PDRQvyMcdnMRJ0fKpqAFifYq_L63A@mail.gmail.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <CAFn=p-bffj3CK9o2haN-3PDRQvyMcdnMRJ0fKpqAFifYq_L63A@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Qemu-block <qemu-block@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>,
 Cleber Rosa <crosa@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18.03.22 22:14, John Snow wrote:
> On Fri, Mar 18, 2022 at 9:36 AM Hanna Reitz <hreitz@redhat.com> wrote:
>> On 18.03.22 00:49, John Snow wrote:
>>> Hiya!
>>>
>>> This series effectively replaces qemu_img_pipe_and_status() with a
>>> rewritten function named qemu_img() that raises an exception on non-zero
>>> return code by default. By the end of the series, every last invocation
>>> of the qemu-img binary ultimately goes through qemu_img().
>>>
>>> The exception that this function raises includes stdout/stderr output
>>> when the traceback is printed in a a little decorated text box so that
>>> it stands out from the jargony Python traceback readout.
>>>
>>> (You can test what this looks like for yourself, or at least you could,
>>> by disabling ztsd support and then running qcow2 iotest 065.)
>>>
>>> Negative tests are still possible in two ways:
>>>
>>> - Passing check=False to qemu_img, qemu_img_log, or img_info_log
>>> - Catching and handling the CalledProcessError exception at the callsite.
>> Thanks!  Applied to my block branch:
>>
>> https://gitlab.com/hreitz/qemu/-/commits/block
>>
>> Hanna
>>
> Actually, hold it -- this looks like it is causing problems with the
> Gitlab CI. I need to investigate these.
> https://gitlab.com/jsnow/qemu/-/pipelines/495155073/failures
>
> ... and, ugh, naturally the nice error diagnostics are suppressed here
> so I can't see them. Well, there's one more thing to try and fix
> somehow.

I hope this patch by Thomas fixes the logging at least:

https://lists.nongnu.org/archive/html/qemu-devel/2022-03/msg02946.html

Let’s see.

Hanna


