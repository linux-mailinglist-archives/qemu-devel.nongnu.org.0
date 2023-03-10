Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED8B36B5082
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 20:05:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pai2Y-0005Tz-Gx; Fri, 10 Mar 2023 14:04:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pai2S-0005Mn-Uk
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 14:04:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pai2Q-0001uL-I2
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 14:04:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678475060;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lzGIbH4XFAP5YHyzqy9VJYs08wgTRnUrI/vzylUoSz8=;
 b=Fss7hOrepVcy4aQUv5iZaq1/B4WULS7j+NJUlR1DiMwXDU/F4IadsVsM2ZxI/0WjJFJr5N
 yNndqMnxGc2SNY3RE2O1sc1z+dU23Tk2xW/2JuzkqGBNfR2Jr2V/rqH/7HuyIIfb4cpeQL
 aM1VTLVh891eOh1khtQv64cBy8AleHY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-500-j6vdYnjUOXSauC20pA0Fuw-1; Fri, 10 Mar 2023 14:04:15 -0500
X-MC-Unique: j6vdYnjUOXSauC20pA0Fuw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 46A0C1C05AB6;
 Fri, 10 Mar 2023 19:04:15 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.147])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 86AD740ED76D;
 Fri, 10 Mar 2023 19:04:14 +0000 (UTC)
Date: Fri, 10 Mar 2023 13:04:12 -0600
From: Eric Blake <eblake@redhat.com>
To: "Richard W.M. Jones" <rjones@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, vsementsov@yandex-team.ru,
 hreitz@redhat.com, kwolf@redhat.com
Subject: Re: [PATCH nbd 0/4] Enable multi-conn NBD [for discussion only]
Message-ID: <20230310190412.xraytgsexjb2zv3i@redhat.com>
References: <20230309113946.1528247-1-rjones@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230309113946.1528247-1-rjones@redhat.com>
User-Agent: NeoMutt/20220429
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Thu, Mar 09, 2023 at 11:39:42AM +0000, Richard W.M. Jones wrote:
> [ Patch series also available here, along with this cover letter and the
>   script used to generate test results:
>   https://gitlab.com/rwmjones/qemu/-/commits/2023-nbd-multi-conn-v1 ]
> 
> This patch series adds multi-conn support to the NBD block driver in
> qemu.  It is only meant for discussion and testing because it has a
> number of obvious shortcomings (see "XXX" in commit messages and
> code).  If we decided this was a good idea, we can work on a better
> patch.

Overall, I'm in favor of this.  A longer term project might be to have
qemu's NBD client code call into libnbd instead of reimplementing
things itself, at which point having libnbd manage multi-conn under
the hood would be awesome, but as that's a much bigger effort, a
shorter-term task of having qemu itself handle parallel sockets seems
worthwhile.

> 
>  - It works effectively for qemu client & nbdkit server, especially in
>    cases where the server does large, heavyweight requests.  This is
>    important for us because virt-v2v uses an nbdkit Python plugin and
>    various other heavyweight plugins (eg. plugins that access remote
>    servers for each request).
> 
>  - It seems to make little or no difference with qemu + qemu-nbd
>    server.  I speculate that's because qemu-nbd doesn't support system
>    threads, so networking is bottlenecked through a single core.  Even
>    though there are coroutines handling different sockets, they must
>    all wait in turn to issue send(3) or recv(3) calls on the same
>    core.

Is the current work to teach qemu to do multi-queue (that is, spread
the I/O load for a single block device across multiple cores) going to
help here?  I haven't been following the multi-queue efforts closely
enough to know if the approach used in this series will play nicely,
or need even further overhaul.

> 
>  - qemu-img unfortunately uses a single thread for all coroutines so
>    it suffers from a similar problem to qemu-nbd.  This change would
>    be much more effective if we could distribute coroutines across
>    threads.

qemu-img uses the same client code as qemu-nbd; any multi-queue
improvements that can spread the send()/recv() load of multiple
sockets across multiple cores will benefit both programs
simultaneously.

> 
>  - For tests which are highly bottlenecked on disk I/O (eg. the large
>    local file test and null test) multi-conn doesn't make much
>    difference.

As long as it isn't adding to much penalty, that's okay.  If the
saturation is truly at the point of how fast disk requests can be
served, it doesn't matter if we can queue up more of those requests in
parallel across multiple NBD sockets.

> 
>  - Multi-conn even with only 2 connections can make up for the
>    overhead of range requests, exceeding the performance of wget.

That alone is a rather cool result, and an argument in favor of
further developing this.

> 
>  - In the curlremote test, qemu-nbd is especially slow, for unknown
>    reasons.
> 
> 
> Integrity test (./multi-conn.pl integrity)
> ==========================================
> 
> nbdkit-sparse-random-plugin
>   |                 ^
>   | nbd+unix        | nbd+unix
>   v                 |
>    qemu-img convert
> 
> Reading from and writing the same data back to nbdkit sparse-random
> plugin checks that the data written is the same as the data read.
> This uses two Unix domain sockets, with or without multi-conn.  This
> test is mainly here to check we don't crash or corrupt data with this
> patch.
> 
>   server          client        multi-conn
>   ---------------------------------------------------------------
>     nbdkit	  qemu-img	[u/s]	9.07s	
>     nbdkit	  qemu-img	1	9.05s	
>     nbdkit	  qemu-img	2	9.02s	
>     nbdkit	  qemu-img	4	8.98s	
> 
> [u/s] = upstream qemu 7.2.0

How many of these timing numbers can be repeated with TLS in the mix?

> 
> 
> Curl local server test (./multi-conn.pl curlhttp)
> =================================================
> 
> Localhost Apache serving a file over http
>                   |
>                   | http
>                   v
> nbdkit-curl-plugin   or   qemu-nbd
>                   |
>                   | nbd+unix
>                   v
> qemu-img convert   or   nbdcopy
> 
> We download an image from a local web server through
> nbdkit-curl-plugin or qemu-nbd using the curl block driver, over NBD.
> The image is copied to /dev/null.
> 
>   server          client        multi-conn
>   ---------------------------------------------------------------
>   qemu-nbd	   nbdcopy	1	8.88s	
>   qemu-nbd	   nbdcopy	2	8.64s	
>   qemu-nbd	   nbdcopy	4	8.37s	
>   qemu-nbd	  qemu-img	[u/s]	6.47s

Do we have any good feel for why qemu-img is faster than nbdcopy in
the baseline?  But improving that is orthogonal to this series.

>   qemu-nbd	  qemu-img	1	6.56s	
>   qemu-nbd	  qemu-img	2	6.63s	
>   qemu-nbd	  qemu-img	4	6.50s	
>     nbdkit	   nbdcopy	1	12.15s  

I'm assuming this is nbdkit with your recent in-progress patches to
have the curl plugin serve parallel requests.  But another place where
we can investigate why nbdkit is not as performant as qemu-nbd at
utilizing curl.

>     nbdkit	   nbdcopy	2	7.05s	(72.36% better)
>     nbdkit	   nbdcopy	4	3.54s	(242.90% better)

That one is impressive!

>     nbdkit	  qemu-img	[u/s]	6.90s	
>     nbdkit	  qemu-img	1	7.00s   

Minimal penalty for adding the code but not utilizing it...

>     nbdkit	  qemu-img	2	3.85s	(79.15% better)
>     nbdkit	  qemu-img	4	3.85s	(79.15% better)

...and definitely shows its worth.

> 
> 
> Curl local file test (./multi-conn.pl curlfile)
> ===============================================
> 
> nbdkit-curl-plugin   using file:/// URI
>                   |
>                   | nbd+unix
>                   v
> qemu-img convert   or   nbdcopy
> 
> We download from a file:/// URI.  This test is designed to exercise
> NBD and some curl internal paths without the overhead from an external
> server.  qemu-nbd doesn't support file:/// URIs so we cannot duplicate
> the test for qemu as server.
> 
>   server          client        multi-conn
>   ---------------------------------------------------------------
>     nbdkit	   nbdcopy	1	31.32s	
>     nbdkit	   nbdcopy	2	20.29s	(54.38% better)
>     nbdkit	   nbdcopy	4	13.22s	(136.91% better)
>     nbdkit	  qemu-img	[u/s]	31.55s	

Here, the baseline is already comparable; both nbdcopy and qemu-img
are parsing the image off nbdkit in about the same amount of time.

>     nbdkit	  qemu-img	1	31.70s	

And again, minimal penalty for having the new code in place but not
exploiting it.

>     nbdkit	  qemu-img	2	21.60s	(46.07% better)
>     nbdkit	  qemu-img	4	13.88s	(127.25% better)

Plus an obvious benefit when the parallel sockets matter.

> 
> 
> Curl remote server test (./multi-conn.pl curlremote)
> ====================================================
> 
> nbdkit-curl-plugin   using http://remote/*.qcow2 URI
>          |
>          | nbd+unix
>          v
> qemu-img convert
> 
> We download from a remote qcow2 file to a local raw file, converting
> between formats during copying.
> 
> qemu-nbd   using http://remote/*.qcow2 URI
>     |
>     | nbd+unix
>     v
> qemu-img convert
> 
> Similarly, replacing nbdkit with qemu-nbd (treating the remote file as
> if it is raw, so the conversion is still done by qemu-img).
> 
> Additionally we compare downloading the file with wget (note this
> doesn't include the time for conversion, but that should only be a few
> seconds).
> 
>   server          client        multi-conn
>   ---------------------------------------------------------------
>          -	      wget	1	58.19s	
>     nbdkit	  qemu-img	[u/s]	68.29s	(17.36% worse)
>     nbdkit	  qemu-img	1	67.85s	(16.60% worse)
>     nbdkit	  qemu-img	2	58.17s	

Comparable to wget on paper, but a win in practice (since the wget
step also has to add a post-download qemu-img local conversion step).

>     nbdkit	  qemu-img	4	59.80s	
>     nbdkit	  qemu-img	6	59.15s	
>     nbdkit	  qemu-img	8	59.52s	
> 
>   qemu-nbd	  qemu-img	[u/s]	202.55s
>   qemu-nbd	  qemu-img	1	204.61s	
>   qemu-nbd	  qemu-img	2	196.73s	
>   qemu-nbd	  qemu-img	4	179.53s	(12.83% better)
>   qemu-nbd	  qemu-img	6	181.70s	(11.48% better)
>   qemu-nbd	  qemu-img	8	181.05s	(11.88% better)
>

Less dramatic results here, but still nothing horrible.

> 
> Local file test (./multi-conn.pl file)
> ======================================
> 
> qemu-nbd or nbdkit serving a large local file
>                   |
>                   | nbd+unix
>                   v
> qemu-img convert   or   nbdcopy
> 
> We download a local file over NBD.  The image is copied to /dev/null.
> 
>   server          client        multi-conn
>   ---------------------------------------------------------------
>   qemu-nbd	   nbdcopy	1	15.50s	
>   qemu-nbd	   nbdcopy	2	14.36s	
>   qemu-nbd	   nbdcopy	4	14.32s	
>   qemu-nbd	  qemu-img	[u/s]	10.16s	

Once again, we're seeing qemu-img baseline faster than nbdcopy as
client.  But throwing more sockets at either client does improve
performance, except for...

>   qemu-nbd	  qemu-img	1	11.17s	(10.01% worse)

...this one looks bad.  Is it a case of this series adding more mutex
work (qemu-img is making parallel requests; each request then contends
for the mutex only to learn that it will be using the same NBD
connection)?  And your comments about smarter round-robin schemes mean
there may still be room to avoid this much of a penalty.

>   qemu-nbd	  qemu-img	2	10.35s	
>   qemu-nbd	  qemu-img	4	10.39s	
>     nbdkit	   nbdcopy	1	9.10s	

This one in interesting: nbdkit as server performs better than
qemu-nbd.

>     nbdkit	   nbdcopy	2	8.25s	
>     nbdkit	   nbdcopy	4	8.60s	
>     nbdkit	  qemu-img	[u/s]	8.64s	
>     nbdkit	  qemu-img	1	9.38s	
>     nbdkit	  qemu-img	2	8.69s	
>     nbdkit	  qemu-img	4	8.87s	
> 
> 
> Null test (./multi-conn.pl null)
> ================================
> 
> qemu-nbd with null-co driver  or  nbdkit-null-plugin + noextents filter
>                   |
>                   | nbd+unix
>                   v
> qemu-img convert   or   nbdcopy
> 
> This is like the local file test above, but without needing a file.
> Instead all zeroes (fully allocated) are downloaded over NBD.

And I'm sure that if you allowed block status to show the holes, the
performance would be a lot faster, but that would be testing something
completely differently ;)

> 
>   server          client        multi-conn
>   ---------------------------------------------------------------
>   qemu-nbd	   nbdcopy	1	14.86s	
>   qemu-nbd	   nbdcopy	2	17.08s	(14.90% worse)
>   qemu-nbd	   nbdcopy	4	17.89s	(20.37% worse)

Oh, that's weird.  I wonder if qemu's null-co driver has some poor
mutex behavior when being hit by parallel I/O.  Seems like
investigating that can be separate from this series, though.

>   qemu-nbd	  qemu-img	[u/s]	13.29s	

And another point where qemu-img is faster than nbdcopy as a
single-client baseline.

>   qemu-nbd	  qemu-img	1	13.31s	
>   qemu-nbd	  qemu-img	2	13.00s	
>   qemu-nbd	  qemu-img	4	12.62s	
>     nbdkit	   nbdcopy	1	15.06s	
>     nbdkit	   nbdcopy	2	12.21s	(23.32% better)
>     nbdkit	   nbdcopy	4	11.67s	(29.10% better)
>     nbdkit	  qemu-img	[u/s]	17.13s	
>     nbdkit	  qemu-img	1	17.11s	
>     nbdkit	  qemu-img	2	16.82s	
>     nbdkit	  qemu-img	4	18.81s	

Overall, I'm looking forward to seeing this go in (8.1 material; we're
too close to 8.0)

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


