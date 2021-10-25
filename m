Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02ECA4393FF
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Oct 2021 12:49:31 +0200 (CEST)
Received: from localhost ([::1]:39174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mexXm-0003DG-2b
	for lists+qemu-devel@lfdr.de; Mon, 25 Oct 2021 06:49:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1mex5V-0006qx-KE
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 06:20:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37331)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1mex5S-000835-Ao
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 06:20:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635157211;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/Kck9+75QvAVBmcX5439pjKEjGEdkRpbnz10aQCSKHE=;
 b=hMKRCuDuan+BxRSR5QiqXQ6xLfCsUa0h430LKQJke7uF7lxgXsr0pGOkb5esCs/myKXcWn
 3HpNMa/fMIBEv3RS17CSYTcUWW+ThpHdpAil+TsUQFu99diJGU/hiqlKlhHdh1kx6KqoGf
 slWrANqsNKOMPenCQkV7VwT05+ky/LE=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-120-6vHWUhOlPCKCB6Xvi8qcjQ-1; Mon, 25 Oct 2021 06:20:09 -0400
X-MC-Unique: 6vHWUhOlPCKCB6Xvi8qcjQ-1
Received: by mail-ed1-f72.google.com with SMTP id
 z1-20020a05640235c100b003dcf0fbfbd8so9431971edc.6
 for <qemu-devel@nongnu.org>; Mon, 25 Oct 2021 03:20:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=/Kck9+75QvAVBmcX5439pjKEjGEdkRpbnz10aQCSKHE=;
 b=IzI8x03mWpS7QEuUoTw0ZFxg5Hfa92M/5DP6lM5ZJ40dkfAsr9YWnOULu/7d6Vz8G6
 /uc7Q0gQagWcD622FJlU3jZ0+ZaFRXMnbFiELo3LUlFLz9N1adOivqcG9EtM1qbPAtPp
 Oqy1cbE+ifG3d6UuKxOgjlCgbW9RP2KfGwfufi4gOqt94pWNRMKmIyEUllzIPXa6QMng
 J61VW82i0jYFLH3VpOWQPnLPBnFk7N9SxvU6S/lS/DUguolR6lpBt88W/juabxjjq5jQ
 P77GFhskn3PguVEOaZ6DWtvHYtAoDZedQuiOS/CKjxI3S8R8piLnjVYXzkfaUFU4e6Hp
 ZjFA==
X-Gm-Message-State: AOAM530L9zUBmm7AWDp0h01II1YBEqYcadLClxM8BhyX3sqzCIQL3zUZ
 x+g+vGzJvMIArGAh8Efvi8uud8qzpUIg33PP2UHBBD5XwPs4IpvRvnQ27hiwvHlQTcs9ARHWB06
 kFjFohamHL+lqdw4=
X-Received: by 2002:a50:e089:: with SMTP id f9mr25077265edl.290.1635157208778; 
 Mon, 25 Oct 2021 03:20:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwAsPnY26Q/ml2NcHyRJCSzufkF9pdLIYl71PkL05gpMTz/TnpsLZqEVgYfeaAsfHsz4ag+Vg==
X-Received: by 2002:a50:e089:: with SMTP id f9mr25077247edl.290.1635157208597; 
 Mon, 25 Oct 2021 03:20:08 -0700 (PDT)
Received: from steredhat (host-79-30-88-77.retail.telecomitalia.it.
 [79.30.88.77])
 by smtp.gmail.com with ESMTPSA id y22sm9358133edc.76.2021.10.25.03.20.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Oct 2021 03:20:08 -0700 (PDT)
Date: Mon, 25 Oct 2021 12:20:06 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH 1/3] file-posix: add `aio-max-batch` option
Message-ID: <20211025102006.hc6vjbqze3u7mqpr@steredhat>
References: <20210923143100.182979-1-sgarzare@redhat.com>
 <20210923143100.182979-2-sgarzare@redhat.com>
 <YXGE0e/08DZXO1pj@stefanha-x1.localdomain>
MIME-Version: 1.0
In-Reply-To: <YXGE0e/08DZXO1pj@stefanha-x1.localdomain>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Oct 21, 2021 at 04:18:41PM +0100, Stefan Hajnoczi wrote:
>On Thu, Sep 23, 2021 at 04:30:58PM +0200, Stefano Garzarella wrote:
>> Commit d7ddd0a161 ("linux-aio: limit the batch size using
>> `aio-max-batch` parameter") added a way to limit the batch size
>> of Linux AIO backend for the entire AIO context.
>>
>> The same AIO context can be shared by multiple devices, so
>> latency-sensitive devices may want to limit the batch size even
>> more to avoid increasing latency.
>>
>> For this reason we add the `aio-max-batch` option to the file
>> backend, which will be used by the next commits to limit the size of
>> batches including requests generated by this device.
>>
>> Suggested-by: Kevin Wolf <kwolf@redhat.com>
>> Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
>> ---
>>  qapi/block-core.json | 5 +++++
>>  block/file-posix.c   | 9 +++++++++
>>  2 files changed, 14 insertions(+)
>>
>> diff --git a/qapi/block-core.json b/qapi/block-core.json
>> index c8ce1d9d5d..1a8ed325bc 100644
>> --- a/qapi/block-core.json
>> +++ b/qapi/block-core.json
>> @@ -2851,6 +2851,10 @@
>>  #              for this device (default: none, forward the commands via SG_IO;
>>  #              since 2.11)
>>  # @aio: AIO backend (default: threads) (since: 2.8)
>> +# @aio-max-batch: maximum number of requests in an AIO backend batch that
>> +#                 contains request from this block device. 0 means that the
>
>The first sentence is a little unclear. I guess s/request/requests/ but
>that still doesn't doesn't fully explain how this works.
>
>Does the AIO backend use the minimum aio-max-batch value of all its
>blockdevs?

It's a little simpler to avoid having to recalculate the minimum for 
each attach/release of blockdevs.

When the blockdev does submit or unplug, the queue is flushed if the 
number of requests in the batch is greater or equal then the smallest 
aio-max-batch value of the blockdev and the AIO context.

>
>Maybe:
>
>  maximum number of requests to batch together into a single submission
>  in the AIO backend. If multiple BlockdevOptionsFile sharing an AIO
>  backend have different values the smallest value is chosen. ...

Whath about this:

   maximum number of requests to batch together into a single submission
   in the AIO backend. The smallest value between this and AIO context's 
   aio-max-batch value is chosen. ...

Thanks,
Stefano


