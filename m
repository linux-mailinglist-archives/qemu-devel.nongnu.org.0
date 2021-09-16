Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB7B140D6E6
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 11:57:54 +0200 (CEST)
Received: from localhost ([::1]:40068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQo9R-0003hs-HT
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 05:57:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mQo7a-0002GJ-1d
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 05:55:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31144)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mQo7V-0001tu-Km
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 05:55:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631786151;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ke1sTA/Ko4i8+F2yhyD2A2Nn2VwPPui91Z7lXWZNBtE=;
 b=U6CoDiw7gc/SsFaMgI/CfPR+OlYxwww9h91O6h8dXIPpzYbdqxyeICVQR0Cw5bMc+ETlx9
 /RBDBoB+JMk2blkOEkYuD14cWq9WayjgW28YCGESVko/aHkYRMA8fvB4ksU279rp5qwPng
 E/MTC2tJKvF+Sb2WKR2G3kX8Gnmbpb4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-166-5gYv7L8xM9WYQsnazMyzsA-1; Thu, 16 Sep 2021 05:55:50 -0400
X-MC-Unique: 5gYv7L8xM9WYQsnazMyzsA-1
Received: by mail-wm1-f70.google.com with SMTP id
 n30-20020a05600c3b9e00b002fbbaada5d7so2379409wms.7
 for <qemu-devel@nongnu.org>; Thu, 16 Sep 2021 02:55:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Ke1sTA/Ko4i8+F2yhyD2A2Nn2VwPPui91Z7lXWZNBtE=;
 b=v/gIT2Q/oiDkFsHNZWLBXdmah/ugx34E6iV3GBpLjZr4keyEX62v55kaIwnhzymYcw
 Eqg8E/JrAOmUzB206OXsASCAPkHY0mV85xcCXarKBAFuRm1157H1amMxXOPkRTfvpLZT
 cZ++yB0a6VMEDXuhNBYWcVtVaj50eR7zwSA71WUhJxa3emYEJAryikgM8nbm/rzBTJ8N
 YvxiZs7gY9JPTVSkGVRJAJIuktADhiM04b6M6bdK/5nc12DkRS6bLZxaBQWJXjT1/yJc
 wSfPf/Wvb339XgRif+igaAB8SVOdEeayzMq6ZCHFA1u746sgaMkLNKajU7evIyOVUXwO
 5Gjw==
X-Gm-Message-State: AOAM530WZiS8+YFKct+zSGcvaQMV0Icj/wDTLk9zbaivM3MzHQsOyKsd
 qSHit3IaBFQMoU//c5RC9FOaEdwDYvu7E292+eQuxXIpoanz7lDDEzZ01roEe0kFHmzKEChvoCk
 Yur/tFtsvCZoCuRI=
X-Received: by 2002:adf:f789:: with SMTP id q9mr5005757wrp.367.1631786149545; 
 Thu, 16 Sep 2021 02:55:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxAJ37lM4VVKz8a2072p1TNF6uEF9jX6flKL6BO10OdyUHqBziD46/ED12apNEtGiWhN9fG3A==
X-Received: by 2002:adf:f789:: with SMTP id q9mr5005740wrp.367.1631786149286; 
 Thu, 16 Sep 2021 02:55:49 -0700 (PDT)
Received: from work-vm (cpc109021-salf6-2-0-cust453.10-2.cable.virginm.net.
 [82.29.237.198])
 by smtp.gmail.com with ESMTPSA id o8sm3409589wrm.9.2021.09.16.02.55.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Sep 2021 02:55:48 -0700 (PDT)
Date: Thu, 16 Sep 2021 10:55:46 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Sergio Lopez <slp@redhat.com>
Subject: Re: [PATCH] virtiofsd: Reverse req_list before processing it
Message-ID: <YUMUonBdCHCtXA/3@work-vm>
References: <20210824131158.39970-1-slp@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210824131158.39970-1-slp@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) DKIMWL_WL_HIGH=-0.39, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: virtio-fs@redhat.com, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, vgoyal@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Sergio Lopez (slp@redhat.com) wrote:
> With the thread pool disabled, we add the requests in the queue to a
> GList, processing by iterating over there afterwards.
> 
> For adding them, we're using "g_list_prepend()", which is more
> efficient but causes the requests to be processed in reverse order,
> breaking the read-ahead and request-merging optimizations in the host
> for sequential operations.
> 
> According to the documentation, if you need to process the request
> in-order, using "g_list_prepend()" and then reversing the list with
> "g_list_reverse()" is more efficient than using "g_list_append()", so
> let's do it that way.
> 
> Testing on a spinning disk (to boost the increase of read-ahead and
> request-merging) shows a 4x improvement on sequential write fio test:
> 
> Test:
> fio --directory=/mnt/virtio-fs --filename=fio-file1 --runtime=20
> --iodepth=16 --size=4G --direct=1 --blocksize=4K --ioengine libaio
> --rw write --name seqwrite-libaio
> 
> Without "g_list_reverse()":
> ...
> Jobs: 1 (f=1): [W(1)][100.0%][w=22.4MiB/s][w=5735 IOPS][eta 00m:00s]
> seqwrite-libaio: (groupid=0, jobs=1): err= 0: pid=710: Tue Aug 24 12:58:16 2021
>   write: IOPS=5709, BW=22.3MiB/s (23.4MB/s)(446MiB/20002msec); 0 zone resets
> ...
> 
> With "g_list_reverse()":
> ...
> Jobs: 1 (f=1): [W(1)][100.0%][w=84.0MiB/s][w=21.5k IOPS][eta 00m:00s]
> seqwrite-libaio: (groupid=0, jobs=1): err= 0: pid=716: Tue Aug 24 13:00:15 2021
>   write: IOPS=21.3k, BW=83.1MiB/s (87.2MB/s)(1663MiB/20001msec); 0 zone resets
> ...
> 
> Signed-off-by: Sergio Lopez <slp@redhat.com>

Queued

> ---
>  tools/virtiofsd/fuse_virtio.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/tools/virtiofsd/fuse_virtio.c b/tools/virtiofsd/fuse_virtio.c
> index fc2564a603..8f4fd165b9 100644
> --- a/tools/virtiofsd/fuse_virtio.c
> +++ b/tools/virtiofsd/fuse_virtio.c
> @@ -716,6 +716,7 @@ static void *fv_queue_thread(void *opaque)
>  
>          /* Process all the requests. */
>          if (!se->thread_pool_size && req_list != NULL) {
> +            req_list = g_list_reverse(req_list);
>              g_list_foreach(req_list, fv_queue_worker, qi);
>              g_list_free(req_list);
>              req_list = NULL;
> -- 
> 2.26.2
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


