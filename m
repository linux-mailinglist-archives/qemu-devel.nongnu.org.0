Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 600A33CD19C
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 12:12:16 +0200 (CEST)
Received: from localhost ([::1]:49828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5QFy-0003IT-5L
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 06:12:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1m5QE3-0001oh-Gy
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 06:10:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46302)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1m5QDx-0003jT-90
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 06:10:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626689408;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ix8W3EUtgdR5oIgOXT1LXC9TnMTp9gpGM9x+B23Aqb4=;
 b=TSh+5RGUHOeffdI03ADYp4VqNVmtcvbzEZGrqYd15CPQ2pyT5MQhRJldQg3c89iN/VaBdo
 a3HR3yzJ+fbzINS4Aw9xXjQXz4grA7vOfGRWp9Qk2vSlOYucf0vEoo+3+Ly56ROohidh+z
 z9y9zSWE/tXaePrc+aG5AjNMuwUIXMc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-564-VejuyBs9NpWU67lJnYXCKA-1; Mon, 19 Jul 2021 06:10:05 -0400
X-MC-Unique: VejuyBs9NpWU67lJnYXCKA-1
Received: by mail-wm1-f70.google.com with SMTP id
 v25-20020a1cf7190000b0290197a4be97b7so5238522wmh.9
 for <qemu-devel@nongnu.org>; Mon, 19 Jul 2021 03:10:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ix8W3EUtgdR5oIgOXT1LXC9TnMTp9gpGM9x+B23Aqb4=;
 b=iWib7fZyV6BuAJhhVIN8mjvQSY0t2VB+FvH70jgtVp4wPJ3muZxdCt/lbKtgOOfgKI
 tuAEdbpStNFHps1Ocg2xgwWTQVXyusnMLeuS3T/IeutcW239r6Twcm6GxsGzRsntRovL
 tJ9101eoXk6aU5fE2hGTVWGhX6HhNTn2VL0dhwX2LNjQXIYVAt11iC1bI/7cVhUpIEr1
 rKE2492kK73S5+ZH8GWLO8EEivku1+yrDt8yPqeok7yrtR+7rDsEZfTbMDVMJ7eyLiG7
 CM/xTXD1OV3TBNKS90StA/8HQt+ul/5Is04H7ikoSh0HNrq1gAzvkfZsvw/jl8V1vAXt
 t6BA==
X-Gm-Message-State: AOAM531+VHzt2bo4W4Zaf/N4difLk0U6P+3esYzT+pqcfjndUDa7Wd+S
 83Jet0gIUwckCrOUawAjEM56ag0BuuQixWuAOvSgmQJ5A9zzLoqjrzE93tUucHeCdvihBoB8HG6
 evMjMH4RUmR1etvU=
X-Received: by 2002:a05:600c:4846:: with SMTP id
 j6mr17538014wmo.4.1626689404014; 
 Mon, 19 Jul 2021 03:10:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy2BrRqa3auyoBHZSvwVOyOFgVd3ePCwIksPRQOO4KWmEEjoVjue/vq6DXDZTNSVNPQ7kpXHw==
X-Received: by 2002:a05:600c:4846:: with SMTP id
 j6mr17537972wmo.4.1626689403663; 
 Mon, 19 Jul 2021 03:10:03 -0700 (PDT)
Received: from steredhat (host-79-18-148-79.retail.telecomitalia.it.
 [79.18.148.79])
 by smtp.gmail.com with ESMTPSA id q72sm12414570wme.14.2021.07.19.03.10.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jul 2021 03:10:03 -0700 (PDT)
Date: Mon, 19 Jul 2021 12:10:00 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH 2/3] iothread: add aio-max-batch parameter
Message-ID: <20210719101000.27xtuwc6st3sy54u@steredhat>
References: <20210707150019.201442-1-sgarzare@redhat.com>
 <20210707150019.201442-3-sgarzare@redhat.com>
 <YO2oY/OObOC9Io1e@stefanha-x1.localdomain>
MIME-Version: 1.0
In-Reply-To: <YO2oY/OObOC9Io1e@stefanha-x1.localdomain>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=sgarzare@redhat.com;
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

On Tue, Jul 13, 2021 at 03:51:15PM +0100, Stefan Hajnoczi wrote:
>On Wed, Jul 07, 2021 at 05:00:18PM +0200, Stefano Garzarella wrote:
>> diff --git a/qapi/misc.json b/qapi/misc.json
>> index 156f98203e..f64bb69f74 100644
>> --- a/qapi/misc.json
>> +++ b/qapi/misc.json
>> @@ -86,6 +86,9 @@
>>  # @poll-shrink: how many ns will be removed from polling time, 0 means that
>>  #               it's not configured (since 2.9)
>>  #
>> +# @aio-max-batch: maximum number of requests in a bacth for the AIO engine,
>
>s/bacth/batch/
>
>> +#                 0 means that the engine will use its default (since 6.1)
>> +#
>>  # Since: 2.0
>>  ##
>>  { 'struct': 'IOThreadInfo',
>> @@ -93,7 +96,8 @@
>>             'thread-id': 'int',
>>             'poll-max-ns': 'int',
>>             'poll-grow': 'int',
>> -           'poll-shrink': 'int' } }
>> +           'poll-shrink': 'int',
>> +           'aio-max-batch': 'int' } }
>>
>>  ##
>>  # @query-iothreads:
>> diff --git a/qapi/qom.json b/qapi/qom.json
>> index 652be317b8..23fd586614 100644
>> --- a/qapi/qom.json
>> +++ b/qapi/qom.json
>> @@ -516,12 +516,17 @@
>>  #               algorithm detects it is spending too long polling without
>>  #               encountering events. 0 selects a default behaviour (default: 0)
>>  #
>> +# @aio-max-batch: maximum number of requests in a bacth for the AIO engine,
>
>s/bacth/batch/

Fixed in v2 also in include/block/aio.h :-)

Thanks,
Stefano


