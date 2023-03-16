Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1F3C6BCD32
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Mar 2023 11:48:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcl8K-0000sy-33; Thu, 16 Mar 2023 06:46:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pcl8H-0000ra-OM
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 06:46:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pcl8F-0001To-EA
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 06:46:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678963610;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=wsmAGv7zujf+RFJAf3z/MvuZo8lIJXad3ixHU3f6dGg=;
 b=QZrwqCnRHFl+OjHGgzy1NnGQF+lQg7vKeEQclo1qd4xaR0Aq5a6CDRDWKNZ4uoJQ6sV7CY
 fBfwbUSacLUxo4ca5QThxZ/goNgbc5oOQ5mGB7WQgEkBu9Nk555E9QceduB/IQsEJv9Qgu
 CrFwkA/WfCUKmeJz3rDUvL8qGEUaftM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-58-ZZys8edJP2i45PEqmDNKrA-1; Thu, 16 Mar 2023 06:46:48 -0400
X-MC-Unique: ZZys8edJP2i45PEqmDNKrA-1
Received: by mail-wm1-f70.google.com with SMTP id
 v8-20020a05600c470800b003ed3b575374so575300wmo.7
 for <qemu-devel@nongnu.org>; Thu, 16 Mar 2023 03:46:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678963607;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wsmAGv7zujf+RFJAf3z/MvuZo8lIJXad3ixHU3f6dGg=;
 b=nM9SReEtQkVpUXOUImYXQPE7RRMWo5DijJazcQYCU3ZCw2A5zKLl612ucyPS1gxx6l
 TwOkWgt4/CHm21eJiM9yCwUDW/gQ7qT8yT/h09BVrdNuQVH5jT9i/OCHxNK3ClZQ6uOH
 0mlvOMx743ElQKkekAMn30HDN11sMg/Nm0h4sTkr8VSXFxbk9hWqyXGIcC1eprLNEIvm
 uOv6KaENfIftIlO939vuZ9TE2RyqREkQZj1Z/0+MpLU5/rOXcMhZ2WDJ6UrlK9sFpHtW
 e4SKGZWDM5UbBNShg22w/Sm5lbKBV8uFRXy5Qe1lOpiA/QuGL7ewD51xbxayXF9WKqgC
 97zg==
X-Gm-Message-State: AO0yUKX5FbB5vTQCHewqCFdD+eQrAvDb0k4R/qoywY5oeB7PwGcXIJ8j
 nIbBqC4UWzu67pXI4hEZNwOzwNBVN0dqmUsJ7itYrDmJ8WmWa4vy5XMNUY6dge3UyP77KTdf3c4
 r0irWSkOvvMWVjKc=
X-Received: by 2002:a5d:4d04:0:b0:2ce:9a15:3724 with SMTP id
 z4-20020a5d4d04000000b002ce9a153724mr4254915wrt.3.1678963607414; 
 Thu, 16 Mar 2023 03:46:47 -0700 (PDT)
X-Google-Smtp-Source: AK7set/5iM6EDcsM2mh98v21VYIdmRjvXXU3Nqf2RmENu3c2yEdIafoBDifNB/OIXXp+pKtsASwxrQ==
X-Received: by 2002:a5d:4d04:0:b0:2ce:9a15:3724 with SMTP id
 z4-20020a5d4d04000000b002ce9a153724mr4254896wrt.3.1678963607122; 
 Thu, 16 Mar 2023 03:46:47 -0700 (PDT)
Received: from redhat.com (62.117.238.225.dyn.user.ono.com. [62.117.238.225])
 by smtp.gmail.com with ESMTPSA id
 x1-20020a5d60c1000000b002cfe63ded49sm6933954wrt.26.2023.03.16.03.46.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Mar 2023 03:46:46 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Chuang Xu <xuchuangxclwt@bytedance.com>
Cc: qemu-devel@nongnu.org,  dgilbert@redhat.com,  pbonzini@redhat.com,
 peterx@redhat.com,  david@redhat.com,  philmd@linaro.org,
 zhouyibo@bytedance.com
Subject: Re: [PATCH v7 5/6] migration: Reduce time of loading non-iterable
 vmstate
In-Reply-To: <20230310022425.2992472-6-xuchuangxclwt@bytedance.com> (Chuang
 Xu's message of "Fri, 10 Mar 2023 10:24:24 +0800")
References: <20230310022425.2992472-1-xuchuangxclwt@bytedance.com>
 <20230310022425.2992472-6-xuchuangxclwt@bytedance.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Thu, 16 Mar 2023 11:46:45 +0100
Message-ID: <87cz59m0ru.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Chuang Xu <xuchuangxclwt@bytedance.com> wrote:
> The duration of loading non-iterable vmstate accounts for a significant
> portion of downtime (starting with the timestamp of source qemu stop and
> ending with the timestamp of target qemu start). Most of the time is spent
> committing memory region changes repeatedly.
>
> This patch packs all the changes to memory region during the period of
> loading non-iterable vmstate in a single memory transaction. With the
> increase of devices, this patch will greatly improve the performance.
>
> Note that the following test results are based on the application of the
> next patch. Without the next patch, the improvement will be reduced.
>
> Here are the test1 results:
> test info:
> - Host
>   - Intel(R) Xeon(R) Platinum 8362 CPU
>   - Mellanox Technologies MT28841
> - VM
>   - 32 CPUs 128GB RAM VM
>   - 8 16-queue vhost-net device
>   - 16 4-queue vhost-user-blk device.
>
> 	time of loading non-iterable vmstate     downtime
> before		about 112 ms			  285 ms
> after		about 20 ms			  194 ms
>
> In test2, we keep the number of the device the same as test1, reduce the
> number of queues per device:
>
> Here are the test2 results:
> test info:
> - Host
>   - Intel(R) Xeon(R) Platinum 8362 CPU
>   - Mellanox Technologies MT28841
> - VM
>   - 32 CPUs 128GB RAM VM
>   - 8 1-queue vhost-net device
>   - 16 1-queue vhost-user-blk device.
>
> 	time of loading non-iterable vmstate     downtime
> before		about 65 ms			 about 151 ms
>
> after		about 19 ms			 about 100 ms
>
> In test3, we keep the number of queues per device the same as test1, reduce
> the number of devices:
>
> Here are the test3 results:
> test info:
> - Host
>   - Intel(R) Xeon(R) Platinum 8362 CPU
>   - Mellanox Technologies MT28841
> - VM
>   - 32 CPUs 128GB RAM VM
>   - 1 16-queue vhost-net device
>   - 1 4-queue vhost-user-blk device.
>
> 	time of loading non-iterable vmstate     downtime
> before		about 24 ms			 about 51 ms
> after		about 9 ms			 about 36 ms
>
> As we can see from the test results above, both the number of queues and
> the number of devices have a great impact on the time of loading non-iterable
> vmstate. The growth of the number of devices and queues will lead to more
> mr commits, and the time consumption caused by the flatview reconstruction
> will also increase.
>
> Signed-off-by: Chuang Xu <xuchuangxclwt@bytedance.com>
> ---
>  migration/savevm.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>
> diff --git a/migration/savevm.c b/migration/savevm.c
> index aa54a67fda..9a7d3e40d6 100644
> --- a/migration/savevm.c
> +++ b/migration/savevm.c
> @@ -2762,6 +2762,7 @@ out:
>              goto retry;
>          }
>      }
> +
>      return ret;
>  }
>  

Drop this.

> @@ -2787,7 +2788,25 @@ int qemu_loadvm_state(QEMUFile *f)
>  
>      cpu_synchronize_all_pre_loadvm();
>  
> +    /*
> +     * Call memory_region_transaction_begin() before loading vmstate.
> +     * This call is paired with memory_region_transaction_commit() at
> +     * the end of qemu_loadvm_state_main(), in order to pack all the
> +     * changes to memory region during the period of loading
> +     * non-iterable vmstate in a single memory transaction.
> +     * This operation will reduce time of loading non-iterable vmstate
> +     */
> +    memory_region_transaction_begin();
> +
>      ret = qemu_loadvm_state_main(f, mis);
> +
> +    /*
> +     * Call memory_region_transaction_commit() after loading vmstate.
> +     * At this point, qemu actually completes all the previous memory
> +     * region transactions.
> +     */
> +    memory_region_transaction_commit();
> +
>      qemu_event_set(&mis->main_thread_load_event);
>  
>      trace_qemu_loadvm_state_post_main(ret);

Reviewed-by: Juan Quintela <quintela@redhat.com>

I don't feel confident getting this series through the migration tree
without Paolo (or someone else more familiar with the memory API)
reviews it.

So if anyone else reviews it, I will got it through the migration tree,
otherwise I am ok to have it pulled trhough other tree.

Not sure if we should get this in the middle of the freeze or should we
wait for 8.1 to open.


