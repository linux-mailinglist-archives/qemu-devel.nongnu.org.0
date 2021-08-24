Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F40F3F5F59
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 15:40:01 +0200 (CEST)
Received: from localhost ([::1]:52360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIWem-0000MM-1b
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 09:40:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1mIWdx-00087U-7X
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 09:39:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56848)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1mIWdu-0007oi-Hl
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 09:39:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629812344;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=m1m/N/TG5Q7D6NtCObay3x8ZBoz8UzofDIH7bhR3EG4=;
 b=iDl/kStpC+IFc47/KQBLzdL6oZP9IRcCuB6EPGwHkNV/+nCB8LeebUBU/TqpvVHLt3eHYy
 9pfXbcvI2qoq/MdOHnfk/JMaJ4w7eLH3oYszptBRgDYZkdQkctWeCiS8cuKJwyRTI304sh
 sZWyfMqTwY5NNvEywbYboAyO7GPLTik=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-133-TEyUagoFPQe_20nthkqQ6A-1; Tue, 24 Aug 2021 09:39:03 -0400
X-MC-Unique: TEyUagoFPQe_20nthkqQ6A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AB4BC101C8A6
 for <qemu-devel@nongnu.org>; Tue, 24 Aug 2021 13:39:02 +0000 (UTC)
Received: from horse.redhat.com (unknown [10.22.9.146])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AC1BC100EBB0;
 Tue, 24 Aug 2021 13:38:50 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id 24D33223EA7; Tue, 24 Aug 2021 09:38:50 -0400 (EDT)
Date: Tue, 24 Aug 2021 09:38:50 -0400
From: Vivek Goyal <vgoyal@redhat.com>
To: Sergio Lopez <slp@redhat.com>
Subject: Re: [PATCH] virtiofsd: Reverse req_list before processing it
Message-ID: <YST2agiCJVIAfE3N@redhat.com>
References: <20210824131158.39970-1-slp@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210824131158.39970-1-slp@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vgoyal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=vgoyal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.747,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
 Stefan Hajnoczi <stefanha@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Aug 24, 2021 at 03:11:58PM +0200, Sergio Lopez wrote:
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

That's a very impressive improvememnt. Thanks Sergio for fixing this.

Reviewed-by: Vivek Goyal <vgoyal@redhat.com>

Vivek

> Signed-off-by: Sergio Lopez <slp@redhat.com>
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


