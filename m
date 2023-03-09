Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 384A56B2343
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 12:41:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paEcs-000429-F0; Thu, 09 Mar 2023 06:40:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1paEcq-00041K-71
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 06:40:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1paEco-0005Ge-0C
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 06:39:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678361996;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=3upsK9oMS1vOqzeA/g3HWhVWVNuBedUs/o5gWte2Wos=;
 b=QKMebw0TGCW4+/+gWKW4t9aqBYEtrJKSfjJ9jCt/ttjfdSr93jNWK8dBJvlv6bDPqOrXhh
 dj2mAXjAi2qw9QVIlHuzTxyqQBR6CQpO7uIkxRbcjy7vS+ThjnDZoSvJEwpG3VcFll6wW3
 yNtqoQVp3QSp2q+r2i3Y/dUwl7KqVB4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-336-MOArk5tGNcSs1ioLgMCiqQ-1; Thu, 09 Mar 2023 06:39:55 -0500
X-MC-Unique: MOArk5tGNcSs1ioLgMCiqQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C415885A5B1;
 Thu,  9 Mar 2023 11:39:54 +0000 (UTC)
Received: from pick.home.annexia.org (unknown [10.39.192.88])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 561FD4010E7B;
 Thu,  9 Mar 2023 11:39:53 +0000 (UTC)
From: "Richard W.M. Jones" <rjones@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, vsementsov@yandex-team.ru, eblake@redhat.com,
 hreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH nbd 0/4] Enable multi-conn NBD [for discussion only]
Date: Thu,  9 Mar 2023 11:39:42 +0000
Message-Id: <20230309113946.1528247-1-rjones@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=rjones@redhat.com;
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

[ Patch series also available here, along with this cover letter and the
  script used to generate test results:
  https://gitlab.com/rwmjones/qemu/-/commits/2023-nbd-multi-conn-v1 ]

This patch series adds multi-conn support to the NBD block driver in
qemu.  It is only meant for discussion and testing because it has a
number of obvious shortcomings (see "XXX" in commit messages and
code).  If we decided this was a good idea, we can work on a better
patch.

The Network Block Driver (NBD) protocol allows servers to advertise
that they are capable of multi-conn.  This means they obey certain
requirements around how data is cached, allowing multiple connections
to be safely opened to the NBD server.  For example, a flush or FUA
operation on one connection is guaranteed to flush the cache on all
connections.

Clients that use multi-conn can achieve better performance.  This
seems to be down to at least two factors:

 - Avoids "head of line blocking" of large requests.

 - With NBD over Unix domain sockets, more cores can be used.

qemu-nbd, nbdkit and libnbd have all supported multi-conn for ages,
but qemu's built in NBD client does not, which is what this patch
fixes.

Below I've produced a few benchmarks.

Note these are mostly concoted to try to test NBD performance and may
not make sense in their own terms (eg. qemu's disk image layer has a
curl client so you wouldn't need to run one separately).  In the real
world we use long pipelines of NBD operations where different tools
are mixed together to achieve efficient downloads, conversions, disk
modifications and sparsification, and they would exercise different
aspects of this.

I've also included nbdcopy as a client for comparison in some tests.

All tests were run 4 times, the first result discarded, and the last 3
averaged.  If any of the last 3 were > 10% away from the average then
the test was stopped.

My summary:

 - It works effectively for qemu client & nbdkit server, especially in
   cases where the server does large, heavyweight requests.  This is
   important for us because virt-v2v uses an nbdkit Python plugin and
   various other heavyweight plugins (eg. plugins that access remote
   servers for each request).

 - It seems to make little or no difference with qemu + qemu-nbd
   server.  I speculate that's because qemu-nbd doesn't support system
   threads, so networking is bottlenecked through a single core.  Even
   though there are coroutines handling different sockets, they must
   all wait in turn to issue send(3) or recv(3) calls on the same
   core.

 - qemu-img unfortunately uses a single thread for all coroutines so
   it suffers from a similar problem to qemu-nbd.  This change would
   be much more effective if we could distribute coroutines across
   threads.

 - For tests which are highly bottlenecked on disk I/O (eg. the large
   local file test and null test) multi-conn doesn't make much
   difference.

 - Multi-conn even with only 2 connections can make up for the
   overhead of range requests, exceeding the performance of wget.

 - In the curlremote test, qemu-nbd is especially slow, for unknown
   reasons.


Integrity test (./multi-conn.pl integrity)
==========================================

nbdkit-sparse-random-plugin
  |                 ^
  | nbd+unix        | nbd+unix
  v                 |
   qemu-img convert

Reading from and writing the same data back to nbdkit sparse-random
plugin checks that the data written is the same as the data read.
This uses two Unix domain sockets, with or without multi-conn.  This
test is mainly here to check we don't crash or corrupt data with this
patch.

  server          client        multi-conn
  ---------------------------------------------------------------
    nbdkit	  qemu-img	[u/s]	9.07s	
    nbdkit	  qemu-img	1	9.05s	
    nbdkit	  qemu-img	2	9.02s	
    nbdkit	  qemu-img	4	8.98s	

[u/s] = upstream qemu 7.2.0


Curl local server test (./multi-conn.pl curlhttp)
=================================================

Localhost Apache serving a file over http
                  |
                  | http
                  v
nbdkit-curl-plugin   or   qemu-nbd
                  |
                  | nbd+unix
                  v
qemu-img convert   or   nbdcopy

We download an image from a local web server through
nbdkit-curl-plugin or qemu-nbd using the curl block driver, over NBD.
The image is copied to /dev/null.

  server          client        multi-conn
  ---------------------------------------------------------------
  qemu-nbd	   nbdcopy	1	8.88s	
  qemu-nbd	   nbdcopy	2	8.64s	
  qemu-nbd	   nbdcopy	4	8.37s	
  qemu-nbd	  qemu-img	[u/s]	6.47s	
  qemu-nbd	  qemu-img	1	6.56s	
  qemu-nbd	  qemu-img	2	6.63s	
  qemu-nbd	  qemu-img	4	6.50s	
    nbdkit	   nbdcopy	1	12.15s	
    nbdkit	   nbdcopy	2	7.05s	(72.36% better)
    nbdkit	   nbdcopy	4	3.54s	(242.90% better)
    nbdkit	  qemu-img	[u/s]	6.90s	
    nbdkit	  qemu-img	1	7.00s	
    nbdkit	  qemu-img	2	3.85s	(79.15% better)
    nbdkit	  qemu-img	4	3.85s	(79.15% better)


Curl local file test (./multi-conn.pl curlfile)
===============================================

nbdkit-curl-plugin   using file:/// URI
                  |
                  | nbd+unix
                  v
qemu-img convert   or   nbdcopy

We download from a file:/// URI.  This test is designed to exercise
NBD and some curl internal paths without the overhead from an external
server.  qemu-nbd doesn't support file:/// URIs so we cannot duplicate
the test for qemu as server.

  server          client        multi-conn
  ---------------------------------------------------------------
    nbdkit	   nbdcopy	1	31.32s	
    nbdkit	   nbdcopy	2	20.29s	(54.38% better)
    nbdkit	   nbdcopy	4	13.22s	(136.91% better)
    nbdkit	  qemu-img	[u/s]	31.55s	
    nbdkit	  qemu-img	1	31.70s	
    nbdkit	  qemu-img	2	21.60s	(46.07% better)
    nbdkit	  qemu-img	4	13.88s	(127.25% better)


Curl remote server test (./multi-conn.pl curlremote)
====================================================

nbdkit-curl-plugin   using http://remote/*.qcow2 URI
         |
         | nbd+unix
         v
qemu-img convert

We download from a remote qcow2 file to a local raw file, converting
between formats during copying.

qemu-nbd   using http://remote/*.qcow2 URI
    |
    | nbd+unix
    v
qemu-img convert

Similarly, replacing nbdkit with qemu-nbd (treating the remote file as
if it is raw, so the conversion is still done by qemu-img).

Additionally we compare downloading the file with wget (note this
doesn't include the time for conversion, but that should only be a few
seconds).

  server          client        multi-conn
  ---------------------------------------------------------------
         -	      wget	1	58.19s	
    nbdkit	  qemu-img	[u/s]	68.29s	(17.36% worse)
    nbdkit	  qemu-img	1	67.85s	(16.60% worse)
    nbdkit	  qemu-img	2	58.17s	
    nbdkit	  qemu-img	4	59.80s	
    nbdkit	  qemu-img	6	59.15s	
    nbdkit	  qemu-img	8	59.52s	

  qemu-nbd	  qemu-img	[u/s]	202.55s
  qemu-nbd	  qemu-img	1	204.61s	
  qemu-nbd	  qemu-img	2	196.73s	
  qemu-nbd	  qemu-img	4	179.53s	(12.83% better)
  qemu-nbd	  qemu-img	6	181.70s	(11.48% better)
  qemu-nbd	  qemu-img	8	181.05s	(11.88% better)


Local file test (./multi-conn.pl file)
======================================

qemu-nbd or nbdkit serving a large local file
                  |
                  | nbd+unix
                  v
qemu-img convert   or   nbdcopy

We download a local file over NBD.  The image is copied to /dev/null.

  server          client        multi-conn
  ---------------------------------------------------------------
  qemu-nbd	   nbdcopy	1	15.50s	
  qemu-nbd	   nbdcopy	2	14.36s	
  qemu-nbd	   nbdcopy	4	14.32s	
  qemu-nbd	  qemu-img	[u/s]	10.16s	
  qemu-nbd	  qemu-img	1	11.17s	(10.01% worse)
  qemu-nbd	  qemu-img	2	10.35s	
  qemu-nbd	  qemu-img	4	10.39s	
    nbdkit	   nbdcopy	1	9.10s	
    nbdkit	   nbdcopy	2	8.25s	
    nbdkit	   nbdcopy	4	8.60s	
    nbdkit	  qemu-img	[u/s]	8.64s	
    nbdkit	  qemu-img	1	9.38s	
    nbdkit	  qemu-img	2	8.69s	
    nbdkit	  qemu-img	4	8.87s	


Null test (./multi-conn.pl null)
================================

qemu-nbd with null-co driver  or  nbdkit-null-plugin + noextents filter
                  |
                  | nbd+unix
                  v
qemu-img convert   or   nbdcopy

This is like the local file test above, but without needing a file.
Instead all zeroes (fully allocated) are downloaded over NBD.

  server          client        multi-conn
  ---------------------------------------------------------------
  qemu-nbd	   nbdcopy	1	14.86s	
  qemu-nbd	   nbdcopy	2	17.08s	(14.90% worse)
  qemu-nbd	   nbdcopy	4	17.89s	(20.37% worse)
  qemu-nbd	  qemu-img	[u/s]	13.29s	
  qemu-nbd	  qemu-img	1	13.31s	
  qemu-nbd	  qemu-img	2	13.00s	
  qemu-nbd	  qemu-img	4	12.62s	
    nbdkit	   nbdcopy	1	15.06s	
    nbdkit	   nbdcopy	2	12.21s	(23.32% better)
    nbdkit	   nbdcopy	4	11.67s	(29.10% better)
    nbdkit	  qemu-img	[u/s]	17.13s	
    nbdkit	  qemu-img	1	17.11s	
    nbdkit	  qemu-img	2	16.82s	
    nbdkit	  qemu-img	4	18.81s	




