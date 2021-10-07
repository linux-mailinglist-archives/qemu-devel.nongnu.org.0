Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFD74425530
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 16:18:05 +0200 (CEST)
Received: from localhost ([::1]:46782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYUDk-0004tL-3J
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 10:18:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mYUCj-00042j-6b
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 10:17:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46305)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mYUCd-0001K9-7c
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 10:17:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633616213;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gT7cdaHOyz9IcUKlEoeQxEGRqsOGrejbu3Y/MFZ4E3M=;
 b=GUcGVLxWlea7GXqbd+G3ABZFD+l8RIp1nejyfA4Cq+z+TPyTl6skXQeiA7+xmuiMs0YTtC
 bo3yUn3/RiFjQF0YFb6EwPWilNSm9sjzZn4ks1O2dLk2LxhqR0zhtcwuJ3X58Cwh2EAhut
 cjO7Lz4PYRwV19DS5AiGzhPkob7AOFs=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-263-8lHYbzWdNY-nqH3lOHQxUg-1; Thu, 07 Oct 2021 10:16:51 -0400
X-MC-Unique: 8lHYbzWdNY-nqH3lOHQxUg-1
Received: by mail-wr1-f69.google.com with SMTP id
 d13-20020adfa34d000000b00160aa1cc5f1so4811603wrb.14
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 07:16:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=gT7cdaHOyz9IcUKlEoeQxEGRqsOGrejbu3Y/MFZ4E3M=;
 b=07cp2VnIb9wdDTewT6/iQNFgIdcZBOWXE3ysZES6ZVAhXZQ2eqwf0NsZ/Pm7S4dDB5
 A3QoSPKMP88v1A0a2Hsz7gvRoNUS7hQZqjAwxp3Cd0EeYJWUPRDneOGPXMVwE/kZM0Yh
 Ek1QyP7jPArwkC+qhtqxxXABeLBBc1eK6iooOQWPkFRvw5nYH+h0JF8Igvuwe5/D32Pw
 bpglKb2a6LE26AhWfo+RMRmvQPcXaBA32cvAdrEVaxQkiLI8iZlzALY1MI2JnMBowVhw
 Wecg3yZuCBfP/myWQ74lbMF4pG02Nd0imc8N+z23jtMomPASN0cz/tMNRP8QUMr9mUWd
 3YdQ==
X-Gm-Message-State: AOAM533Q2B13HtebYBiKBDeYSr6DO+qhM4kgexWnXBAVW76qtkcQ+Iis
 m20yG7r2+3BqFKsg+trZwX9wlmbt0pHS35BXxFYAFmy+Ta/wEd8LJcchCinTtETABmpd2mEg1Jd
 Eb697539zkPaSNAg=
X-Received: by 2002:a7b:cd18:: with SMTP id f24mr4865390wmj.129.1633616210653; 
 Thu, 07 Oct 2021 07:16:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx0dA3vLkpSm4vCD/kXWw9n4KEpkEkFSAb4HjF1X5hLrXg4Vq5hLZ4VXWu13XKjdxkijyon9w==
X-Received: by 2002:a7b:cd18:: with SMTP id f24mr4865357wmj.129.1633616210429; 
 Thu, 07 Oct 2021 07:16:50 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id l21sm10120217wmg.18.2021.10.07.07.16.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Oct 2021 07:16:49 -0700 (PDT)
Message-ID: <e84d3b08-7b09-0db7-23d2-a65c0825a151@redhat.com>
Date: Thu, 7 Oct 2021 16:16:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [RFC PATCH 0/4] aio: AIO_CONTEXT_ACQUIRE_GUARD() macro experiment
To: Stefan Hajnoczi <stefanha@redhat.com>
References: <20211005185807.4134557-1-philmd@redhat.com>
 <YV7y145FN+Es+Vue@stefanha-x1.localdomain>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <YV7y145FN+Es+Vue@stefanha-x1.localdomain>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.964, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-devel@nongnu.org,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/7/21 15:15, Stefan Hajnoczi wrote:
> On Tue, Oct 05, 2021 at 08:58:03PM +0200, Philippe Mathieu-Daudé wrote:
>> Experiment to use glib g_autoptr/autofree features with
>> AIO context.
>> Since this is a RFC, only few examples are provided.
>>
>> TODO: Document the macros in docs/devel/multiple-iothreads.txt
>>
>> Philippe Mathieu-Daudé (4):
>>   block/aio: Add automatically released aio_context variants
>>   hw/scsi/scsi-disk: Use automatic AIO context lock
>>   hw/scsi/scsi-generic: Use automatic AIO context lock
>>   hw/block/virtio-blk: Use automatic AIO context lock
>>
>>  include/block/aio.h    | 24 ++++++++++++++++++++++++
>>  hw/block/virtio-blk.c  | 26 ++++++++++++--------------
>>  hw/scsi/scsi-disk.c    | 13 ++++---------
>>  hw/scsi/scsi-generic.c |  6 +++---
>>  4 files changed, 43 insertions(+), 26 deletions(-)
> 
> This is nice. Two things:
> 
> 1. Emanuele is working on eliminating aio_context_acquire/release(), so
>    a big effort to convert existing code to using guards could be wasted
>    energy and cause conflicts with his patches.

Thanks for the update, I'll wait Emanuele effort to land.

> 2. A few callers anticipate that the AioContext of their BDS may change
>    between acquire/release. Care needs to be taken when converting to
>    preserve the semantics but most instances should be safe to convert.
> 
> Stefan
> 


