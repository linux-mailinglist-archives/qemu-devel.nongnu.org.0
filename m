Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93FB06B4818
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 15:58:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paeCU-00034g-Q0; Fri, 10 Mar 2023 09:58:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1paeCS-00034Q-Cn
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 09:58:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1paeCQ-0006Hv-M7
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 09:58:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678460305;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=X8OavA2ipdEXnMD6rflEaKb+Y6ond5xGb9iVwHnPQTU=;
 b=NI14l/CRoWED0WIXy9l0QNvwboyMh2/rUfYY9KWtgIRyTbovRdqJycHK3odRWx7BW179pZ
 WKB1FBO5jO5GhJ5q2cOPULu167z+JRH1y+0KpWgoM9AJLeYznUB/UEzRibxcw15OkOYw+u
 Ix2yn5YDkIv42tU7vNMEqq/uIrBMoKM=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-326-nadc0YaINQCdJPXvIthdsw-1; Fri, 10 Mar 2023 09:58:22 -0500
X-MC-Unique: nadc0YaINQCdJPXvIthdsw-1
Received: by mail-qt1-f199.google.com with SMTP id
 l12-20020ac84a8c000000b003bfe751a7fdso3050571qtq.1
 for <qemu-devel@nongnu.org>; Fri, 10 Mar 2023 06:58:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678460301;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=X8OavA2ipdEXnMD6rflEaKb+Y6ond5xGb9iVwHnPQTU=;
 b=N1hlCgUpu3eYDPdXVNxrIksPLr2rjjs0tAFrhKNMUZeLcaxs8hkwe/c3Nw7VgzJxmJ
 dfr5S2VAaWpvbDtPwp6+Pmwllovb5Beikz/5TtmoqD9fjEza5CRH5oq7yu859pTqq6wW
 X340Wp6xlFTpS6c7DtCBllooG2RBFjEmHiAj70um9v+H6PKPrvNlliJIQhNjNwM5c+b3
 Ccu6loqTQxv61chFdQXLPqqeTzsqSZ0SHXP3RSm578LvP2TFL8/UaGWc2qoLr0Yfjzxh
 2H5iZUzzDRwk3oRUevFFF0VVqBaM8mjKvJDMYL/hqiDn+Iyy/d26wt8nv+VbbFdjcd5L
 5ofQ==
X-Gm-Message-State: AO0yUKVsAuB85A473Y6vH/0C7tNIPP4sFwMU+EirgYZAiN5JKRctpktq
 giggJpVnea/HAuxmAskbwpHMa0eYwz/CA0EzzuRy+y23Ijh3nU1BgXHaHD1BZEh3UhDk67T1Oer
 yI2KZkIiPYZgLTFo=
X-Received: by 2002:ac8:574a:0:b0:3bf:da3a:4e0f with SMTP id
 10-20020ac8574a000000b003bfda3a4e0fmr5901329qtx.0.1678460301736; 
 Fri, 10 Mar 2023 06:58:21 -0800 (PST)
X-Google-Smtp-Source: AK7set9m55Jt2vDZIqwGMDMT6vSFY6wJV0RUVqlboLmhkShC4b03BOUed5v93bX7xXF1/9yp8zkh9g==
X-Received: by 2002:ac8:574a:0:b0:3bf:da3a:4e0f with SMTP id
 10-20020ac8574a000000b003bfda3a4e0fmr5901295qtx.0.1678460301451; 
 Fri, 10 Mar 2023 06:58:21 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-56-70-30-145-63.dsl.bell.ca.
 [70.30.145.63]) by smtp.gmail.com with ESMTPSA id
 14-20020a37050e000000b0073b9ccb171asm1382331qkf.130.2023.03.10.06.58.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Mar 2023 06:58:20 -0800 (PST)
Date: Fri, 10 Mar 2023 09:58:19 -0500
From: Peter Xu <peterx@redhat.com>
To: Chuang Xu <xuchuangxclwt@bytedance.com>
Cc: qemu-devel@nongnu.org, dgilbert@redhat.com, quintela@redhat.com,
 pbonzini@redhat.com, david@redhat.com, philmd@linaro.org,
 zhouyibo@bytedance.com
Subject: Re: [PATCH v7 5/6] migration: Reduce time of loading non-iterable
 vmstate
Message-ID: <ZAtFi1aihE2mUoY1@x1n>
References: <20230310022425.2992472-1-xuchuangxclwt@bytedance.com>
 <20230310022425.2992472-6-xuchuangxclwt@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230310022425.2992472-6-xuchuangxclwt@bytedance.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
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

On Fri, Mar 10, 2023 at 10:24:24AM +0800, Chuang Xu wrote:
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

Useless line change.

>      return ret;
>  }

Other than that,

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


