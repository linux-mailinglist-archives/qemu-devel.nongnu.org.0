Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3425D6E6AC8
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Apr 2023 19:18:31 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pooxd-0006gZ-2E; Tue, 18 Apr 2023 13:17:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pooxa-0006fD-E7
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 13:17:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pooxX-0003SS-SX
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 13:17:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681838257;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=A2QhoDksL11qXZyKaU0wyNf1WaIjOiW5DTFEFNwexK8=;
 b=iEhUSDYS6BB0PmkNW3W5/vq8JcCT3nawDWxBONJgjIgJU9CcVAZWyCUioe46t8fc8BGXWg
 7vGSzLDqZ1z/JHTrNCussERX3d2FW8TNdcNQv/eMLjjA/fnLVqRvR/3gF2oyRsaKe9+wYx
 8A79dH+KQUgqiW77MuTcp0QMZIxISWA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-441-G3HZmXi-Nh2PK2kAabNuYw-1; Tue, 18 Apr 2023 13:17:36 -0400
X-MC-Unique: G3HZmXi-Nh2PK2kAabNuYw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 63D2629DD998;
 Tue, 18 Apr 2023 17:17:35 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.13])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AF64C4085720;
 Tue, 18 Apr 2023 17:17:34 +0000 (UTC)
Date: Tue, 18 Apr 2023 18:17:32 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Andrei Gudkov <gudkov.andrei@huawei.com>
Cc: qemu-devel@nongnu.org, quintela@redhat.com, dgilbert@redhat.com
Subject: Re: [PATCH 0/2] Migration time prediction using calc-dirty-rate
Message-ID: <ZD7QrDJLrxjKehD3@redhat.com>
References: <cover.1677589218.git.gudkov.andrei@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cover.1677589218.git.gudkov.andrei@huawei.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, Feb 28, 2023 at 04:16:01PM +0300, Andrei Gudkov via wrote:
> Summary of calc-dirty-rate changes:
> 
> 1. The most important change is that now calc-dirty-rate produces
>    a *vector* of dirty page measurements for progressively increasing time
>    periods: 125ms, 250, 500, 750, 1000, 1500, .., up to specified calc-time.
>    The motivation behind such change is that number of dirtied pages as
>    a function of time starting from "clean state" (new migration iteration)
>    is far from linear. Shape of this function depends on the workload type
>    and intensity. Measuring number of dirty pages at progressively
>    increasing periods allows to reconstruct this function using piece-wise
>    interpolation.
> 
> 2. New metric added -- number of all-zero pages.
>    Predictor needs to distinguish between number of zero and non-zero pages
>    because during migration only 8 byte header is placed on the wire for
>    all-zero page.
> 
> 3. Hashing function was changed from CRC32 to xxHash.
>    This reduces overhead of sampling by ~10 times, which is important since
>    now some of the measurement periods are sub-second.

Very good !

> 
> 4. Other trivial metrics were added for convenience: total number
>    of VM pages, number of sampled pages, page size.
> 
> 
> After these changes output from calc-dirty-rate looks like this:
> 
> {
>   "page-size": 4096,
>   "periods": [125, 250, 375, 500, 750, 1000, 1500,
>               2000, 3000, 4001, 6000, 8000, 10000,
>               15000, 20000, 25000, 30000, 35000,
>               40000, 45000, 50000, 60000],
>   "status": "measured",
>   "sample-pages": 512,
>   "dirty-rate": 98,
>   "mode": "page-sampling",
>   "n-dirty-pages": [33, 78, 119, 151, 217, 236, 293, 336,
>                     425, 505, 620, 756, 898, 1204, 1457,
>                     1723, 1934, 2141, 2328, 2522, 2675, 2958],
>   "n-sampled-pages": 16392,
>   "n-zero-pages": 10060,
>   "n-total-pages": 8392704,
>   "start-time": 2916750,
>   "calc-time": 60
> }

Ok, so "periods" and "n-dirty-pages" pages arrays correlate with
each other.

> 
> Passing this data into prediction script, we get the following estimations:
> 
> Downtime> |    125ms |    250ms |    500ms |   1000ms |   5000ms |    unlim
> ---------------------------------------------------------------------------
>  100 Mbps |        - |        - |        - |        - |        - |   16m59s  
>    1 Gbps |        - |        - |        - |        - |        - |    1m40s
>    2 Gbps |        - |        - |        - |        - |    1m41s |      50s  
>  2.5 Gbps |        - |        - |        - |        - |    1m07s |      40s
>    5 Gbps |      48s |      46s |      31s |      28s |      25s |      20s
>   10 Gbps |      13s |      12s |      12s |      12s |      12s |      10s
>   25 Gbps |       5s |       5s |       5s |       5s |       4s |       4s
>   40 Gbps |       3s |       3s |       3s |       3s |       3s |       3s

This is fascinating and really helpful as an idea. It so nicely
shows the when it is not even worth bothering to try to start the
migrate unless you're willing to put up with large (5 sec) downtime.
or use autoconverge/post-copy.

I wonder if the calc-dirty-rate measurements also give enough info
to predict the likely number/duration of async page fetches needed
during post-copy phase ? Or does this give enough info to predict
how far down auto-converge should throttle the guest to enable
convergance.

> Quality of prediction was tested with YCSB benchmark. Memcached instance
> was installed into 32GiB VM, and a client generated a stream of requests.
> Between experiments we varied request size distribution, number of threads,
> and location of the client (inside or outside the VM).
> After short preheat phase, we measured calc-dirty-rate:
> 1. {"execute": "calc-dirty-rate", "arguments":{"calc-time":60}}
> 2. Wait 60 seconds
> 3. Collect results with {"execute": "query-dirty-rate"}
> 
> Afterwards we tried to migrate VM after randomly selecting max downtime
> and bandwidth limit. Typical prediction error is 6-7%, with only 180 out
> of 5779 experiments failing badly: prediction error >=25% or incorrectly
> predicting migration success when in fact it didn't converge.

Nice results


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


