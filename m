Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CB3F655272
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Dec 2022 16:51:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8kK1-0001Kt-Oo; Fri, 23 Dec 2022 10:50:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1p8kJy-0001Kk-EN
 for qemu-devel@nongnu.org; Fri, 23 Dec 2022 10:50:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1p8kJw-0002GN-NE
 for qemu-devel@nongnu.org; Fri, 23 Dec 2022 10:50:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671810652;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=c4Ze1l8WBY851YpC5mU2OFf4TeKCes7JWPL/Y/ZpdLg=;
 b=VAQxTHLd0MyzFV8uTqNCvpa61NcCK4weFjD4sI6sN+qQETEgfOG/lccE5Ph5+58VlAT3lw
 MGUyiln7vRAE/28ppJihJR1FIfmXa09V8EB9jb5GswZtizDZ2g6elnI+Ybvto32GhLHFzJ
 BBrJ1MmF1Y+9h4+10N/cAjBsDsUSQS0=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-643-i2PdYu4NOoypsc1SR4HgHw-1; Fri, 23 Dec 2022 10:50:50 -0500
X-MC-Unique: i2PdYu4NOoypsc1SR4HgHw-1
Received: by mail-qt1-f197.google.com with SMTP id
 j26-20020ac84c9a000000b003a7e6d38e01so2161610qtv.14
 for <qemu-devel@nongnu.org>; Fri, 23 Dec 2022 07:50:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c4Ze1l8WBY851YpC5mU2OFf4TeKCes7JWPL/Y/ZpdLg=;
 b=kVaSh80cq/ng0BjtjGH59OYzc1xrNQttoKLIJAP9V6rA9JbmKCNCjEa0ISe7IJaKFV
 h8BHCFs5TmJIioIL6DuZcuFThCFIH2MloLtexzfwcWopThKjS6lKbqgyZjGbN9H/p6Dy
 OK09SPQvDjoJVFPKagy0w+LLpYXa5PlNJw4H2oVUXg/UeG1Fdw/R2yWY/kzhqkVbKRvi
 aZ7KDA6XCB9XaZ8XCl6yVLiFiRGmkNhOJqTCSfhY0z5maQ1oLpdL670TDxnJ8MIJw2VP
 yVYlAYagcbKPqU217zjWLhC6tStTD8bOBrl1JRSj+AkQTBhxVSbXWqPX//Uyt5eSTnr+
 XcUA==
X-Gm-Message-State: AFqh2kpKWgxcln3uw8D1CdfQLvFrq+XN+XGo7RNctKKJekBXwyKwLQrd
 bCLyqfq+G/1WA+SU9GjacYoOjKKKFuah9079Lu1IQPXYDWPnybmWIlR3ELmqOKIeNdkGDxBjWfz
 Tbobk+6ACg5nSvjo=
X-Received: by 2002:a05:622a:1802:b0:39c:da21:6c01 with SMTP id
 t2-20020a05622a180200b0039cda216c01mr14963799qtc.3.1671810649995; 
 Fri, 23 Dec 2022 07:50:49 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtxxbzUvphVQlTWEXvpx+K0Php8HtHOecNZD9XxrqloR71UHHTLND1W0axop/YIeOsGrq2/Dw==
X-Received: by 2002:a05:622a:1802:b0:39c:da21:6c01 with SMTP id
 t2-20020a05622a180200b0039cda216c01mr14963769qtc.3.1671810649744; 
 Fri, 23 Dec 2022 07:50:49 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-45-70-31-26-132.dsl.bell.ca.
 [70.31.26.132]) by smtp.gmail.com with ESMTPSA id
 w13-20020a05620a424d00b006e54251993esm2450954qko.97.2022.12.23.07.50.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Dec 2022 07:50:49 -0800 (PST)
Date: Fri, 23 Dec 2022 10:50:47 -0500
From: Peter Xu <peterx@redhat.com>
To: Chuang Xu <xuchuangxclwt@bytedance.com>
Cc: qemu-devel@nongnu.org, dgilbert@redhat.com, quintela@redhat.com,
 pbonzini@redhat.com, david@redhat.com, philmd@linaro.org,
 zhouyibo@bytedance.com
Subject: Re: [RFC v4 0/3] migration: reduce time of loading non-iterable
 vmstate
Message-ID: <Y6XOV+ib6a8p2Zjl@x1n>
References: <20221223142307.1614945-1-xuchuangxclwt@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221223142307.1614945-1-xuchuangxclwt@bytedance.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Chuang,

On Fri, Dec 23, 2022 at 10:23:04PM +0800, Chuang Xu wrote:
> In this version:
> 
> - attach more information in the cover letter.
> - remove changes on virtio_load().
> - add rcu_read_locked() to detect holding of rcu lock.
> 
> The duration of loading non-iterable vmstate accounts for a significant
> portion of downtime (starting with the timestamp of source qemu stop and
> ending with the timestamp of target qemu start). Most of the time is spent
> committing memory region changes repeatedly.
> 
> This patch packs all the changes to memory region during the period of
> loading non-iterable vmstate in a single memory transaction. With the
> increase of devices, this patch will greatly improve the performance.
> 
> Here are the test1 results:
> test info:
> - Host
>   - Intel(R) Xeon(R) Platinum 8260 CPU
>   - NVIDIA Mellanox ConnectX-5
> - VM
>   - 32 CPUs 128GB RAM VM
>   - 8 16-queue vhost-net device
>   - 16 4-queue vhost-user-blk device.
> 
> 	time of loading non-iterable vmstate     downtime
> before	about 150 ms			  740+ ms
> after		about 30 ms			  630+ ms

Have you investigated why multi-queue added so much downtime overhead with
the same environment, comparing to below [1]?

> 
> (This result is different from that of v1. It may be that someone has 
> changed something on my host.., but it does not affect the display of 
> the optimization effect.)
> 
> 
> In test2, we keep the number of the device the same as test1, reduce the 
> number of queues per device:
> 
> Here are the test2 results:
> test info:
> - Host
>   - Intel(R) Xeon(R) Platinum 8260 CPU
>   - NVIDIA Mellanox ConnectX-5
> - VM
>   - 32 CPUs 128GB RAM VM
>   - 8 1-queue vhost-net device
>   - 16 1-queue vhost-user-blk device.
> 
> 	time of loading non-iterable vmstate     downtime
> before	about 90 ms			 about 250 ms
> after		about 25 ms			 about 160 ms

[1]

> 
> In test3, we keep the number of queues per device the same as test1, reduce 
> the number of devices:
> 
> Here are the test3 results:
> test info:
> - Host
>   - Intel(R) Xeon(R) Platinum 8260 CPU
>   - NVIDIA Mellanox ConnectX-5
> - VM
>   - 32 CPUs 128GB RAM VM
>   - 1 16-queue vhost-net device
>   - 1 4-queue vhost-user-blk device.
> 
> 	time of loading non-iterable vmstate     downtime
> before	about 20 ms			 about 70 ms
> after		about 11 ms			 about 60 ms
> 
> 
> As we can see from the test results above, both the number of queues and 
> the number of devices have a great impact on the time of loading non-iterable 
> vmstate. The growth of the number of devices and queues will lead to more 
> mr commits, and the time consumption caused by the flatview reconstruction 
> will also increase.

The downtime measured in precopy can be more complicated than postcopy
because the time of switch is calculated by qemu based on the downtime
setup, and also that contains part of RAM migrations.  Postcopy should be
more accurate on that because there's no calculation done, meanwhile
there's no RAM transferred during downtime.

However postcopy downtime is not accurate either in implementation of it in
postcopy_start(), where the downtime is measured right after we flushed the
packed data, and right below it there's some idea of optimizing it:

    if (migrate_postcopy_ram()) {
        /*
         * Although this ping is just for debug, it could potentially be
         * used for getting a better measurement of downtime at the source.
         */
        qemu_savevm_send_ping(ms->to_dst_file, 4);
    }

So maybe I'll have a look there.

Besides above, personally I'm happy with the series, one trivial comment in
patch 2 but not a huge deal.  I don't expect you can get any more comment
before the end of this year.. but let's wait until after the Xmas holiday.

Thanks!

-- 
Peter Xu


