Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D6B2D6167
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 17:15:56 +0100 (CET)
Received: from localhost ([::1]:35344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knObj-0003eG-BP
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 11:15:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1knOXh-0001qS-83
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 11:11:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50713)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1knOXc-0000Vy-54
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 11:11:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607616698;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=UbV9TK3pb+KaQ303K/1FOPBOmnWXhCir665/RQCvPrw=;
 b=Q7hrD8pk+5GMss2bHiSTl2gDkeCDM25YqkpWYLEiIdWkVyzkIIe61ETi1+SyMbnDaClhDu
 Iql0sKFSVIEbJ9Qn8NuRWPeiqLg7OSB00xcx+9UyBeDKPRA6ewrlRQIzNz7YGKtco76vFN
 7krMwthDf2qBWaozVaoGQ7YoeUcpnKI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-419-F6Ri2gATPziFDZy5xLMcHw-1; Thu, 10 Dec 2020 11:11:35 -0500
X-MC-Unique: F6Ri2gATPziFDZy5xLMcHw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7180359;
 Thu, 10 Dec 2020 16:11:34 +0000 (UTC)
Received: from horse.redhat.com (ovpn-116-241.rdu2.redhat.com [10.10.116.241])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5FE3236FA;
 Thu, 10 Dec 2020 16:11:27 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id E0198220BCF; Thu, 10 Dec 2020 11:11:26 -0500 (EST)
Date: Thu, 10 Dec 2020 11:11:26 -0500
From: Vivek Goyal <vgoyal@redhat.com>
To: virtio-fs-list <virtio-fs@redhat.com>, qemu-devel@nongnu.org
Subject: Some performance numbers for virtiofs, DAX and virtio-9p
Message-ID: <20201210161126.GA125438@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vgoyal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=vgoyal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Miklos Szeredi <mszeredi@redhat.com>, jose.carlos.venegas.munoz@intel.com,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

Now virtiofs DAX support has been merged in upstream kernel 5.10 (It
has yet to be merged qemu). So I decided to do some performance
benchmarking and see what's the impact of DAX on different workloads in
different caching modes. Hence I ran some performance numbers and
publishing the results here.

I was running these numbers for virtiofs, so thought of why not throw
virtio-9p also into the mix to get and idea how these two compare.

I have pushed logfiles and final test results and test-setup information
in virtiofs-tests git tree.

https://github.com/rhvgoyal/virtiofs-tests/tree/master/performance-results/dec-10-2020

Methodology
===========
I have basically run bunch of fio jobs to get a sense of speed of
various operations. I wrote a simple wrapper script to run fio jobs
3 times and take their average and report it. These scripts and fio
jobs are available here.

https://github.com/rhvgoyal/virtiofs-tests

I have an SSD on host where I setup a test directory and exported that
directory inside guest using virtiofs and virtio-9p and ran tests inside
guests in different configurations.

Used caching modes cache=none, cache=auto and cache=always for virtiofs
and cache=none, cache=mmap and cache=loose for virtio-9p. For virtiofs,
I also rand all caching test with DAX too to evaluate the impact of DAX.

Test Setup
-----------
- A fedora 29 host with 376Gi RAM, 2 sockets (20 cores per socket, 2
  threads per core)

- Using SSD on host as backing store. 4 fio files of 4G each.

- Created a VM with 32 VCPUS and 64GB memory. Used a 16GB cache window for dax.

- For mounting virtio-9p, I used msize=16MB.

- For guest kernel, I used Miklos's for-next branch of fuse tree. It has
  killpriv_v2 support patches which should go upstream in 5.11.

  https://git.kernel.org/pub/scm/linux/kernel/git/mszeredi/fuse.git/log/?h=for-next

- For qemu, I used following qemu branch. 

  https://github.com/rhvgoyal/qemu/commits/dax-killpriv-thread-pool

  Bunch of patches like DAX support, killpriv_v2 support, thread-pool-0 support
  are not upstream yet. So applied these patches on this branch and used
  for testing.

  Also, carried a patch which improves virtio-9p performance to not use
  coroutines. Hopefully this will make upstream someday.

virtiofsd command line
----------------------
- Used following options for virtiofsd.

./tools/virtiofsd/virtiofsd --socket-path=/tmp/vhostqemu -o source=/mnt/sdb/virtiofs-source -o no_posix_lock -o xattr -o cache=none --thread-pool-size=0 --daemonize

Test Results
------------
- Results in nine configurations have been reported.
  virtio-fs: cache=none, cache=auto, cache=always,
	     cache=none + DAX, cache=auto + DAX, cache=always + DAX
  virtio-9p: cache=none, cache=mmap, cache=loose

- Three fio ioengines psync, libaio and mmap have been used.

- I/O Workload of randread, radwrite, seqread and seqwrite have been run.

- Each file size is 4G. Block size 4K. iodepth=16

- "multi" means same operation was done with 4 jobs and each job is
  operating on a file of size 4G.

- Some results are "0 (KiB/s)". That means that particular operation is
  not supported in that configuration.

Conclusion
-----------
- virtiofs DAX seems to help a lot in many workloads.

  Note, DAX performance well only if data fits in cache window. My total
  data is 16G and cache window size is 16G as well. If data is larger
  than DAX cache window, then performance of dax suffers a lot. Overhead
  of reclaiming old mapping and setting up a new one is very high.

NAME                    WORKLOAD                Bandwidth       IOPS            
9p-none                 seqread-psync           98.6mb          24.6k           
9p-mmap                 seqread-psync           97.5mb          24.3k           
9p-loose                seqread-psync           91.6mb          22.9k           
vtfs-none               seqread-psync           98.4mb          24.6k           
vtfs-none-dax           seqread-psync           660.3mb         165.0k          
vtfs-auto               seqread-psync           650.0mb         162.5k          
vtfs-auto-dax           seqread-psync           703.1mb         175.7k          
vtfs-always             seqread-psync           671.3mb         167.8k          
vtfs-always-dax         seqread-psync           687.2mb         171.8k          

9p-none                 seqread-psync-multi     397.6mb         99.4k           
9p-mmap                 seqread-psync-multi     382.7mb         95.6k           
9p-loose                seqread-psync-multi     350.5mb         87.6k           
vtfs-none               seqread-psync-multi     360.0mb         90.0k           
vtfs-none-dax           seqread-psync-multi     2281.1mb        570.2k          
vtfs-auto               seqread-psync-multi     2530.7mb        632.6k          
vtfs-auto-dax           seqread-psync-multi     2423.9mb        605.9k          
vtfs-always             seqread-psync-multi     2535.7mb        633.9k          
vtfs-always-dax         seqread-psync-multi     2406.1mb        601.5k          

9p-none                 seqread-mmap            64.3mb          16.0k           
9p-mmap                 seqread-mmap            91.2mb          22.8k           
9p-loose                seqread-mmap            88.4mb          22.1k           
vtfs-none               seqread-mmap            0kb             0               
vtfs-none-dax           seqread-mmap            915.0mb         228.7k          
vtfs-auto               seqread-mmap            570.6mb         142.6k          
vtfs-auto-dax           seqread-mmap            916.9mb         229.2k          
vtfs-always             seqread-mmap            585.0mb         146.2k          
vtfs-always-dax         seqread-mmap            889.5mb         222.3k          

9p-none                 seqread-mmap-multi      256.6mb         64.1k           
9p-mmap                 seqread-mmap-multi      333.2mb         83.3k           
9p-loose                seqread-mmap-multi      352.3mb         88.0k           
vtfs-none               seqread-mmap-multi      0kb             0               
vtfs-none-dax           seqread-mmap-multi      2848.7mb        712.1k          
vtfs-auto               seqread-mmap-multi      2210.1mb        552.5k          
vtfs-auto-dax           seqread-mmap-multi      3106.7mb        776.6k          
vtfs-always             seqread-mmap-multi      2218.8mb        554.7k          
vtfs-always-dax         seqread-mmap-multi      3084.3mb        771.0k          

9p-none                 seqread-libaio          93.1mb          23.2k           
9p-mmap                 seqread-libaio          97.7mb          24.4k           
9p-loose                seqread-libaio          89.6mb          22.4k           
vtfs-none               seqread-libaio          259.3mb         64.8k           
vtfs-none-dax           seqread-libaio          406.3mb         101.5k          
vtfs-auto               seqread-libaio          303.3mb         75.8k           
vtfs-auto-dax           seqread-libaio          400.2mb         100.0k          
vtfs-always             seqread-libaio          274.7mb         68.6k           
vtfs-always-dax         seqread-libaio          415.4mb         103.8k          

9p-none                 seqread-libaio-multi    349.4mb         87.3k           
9p-mmap                 seqread-libaio-multi    353.5mb         88.3k           
9p-loose                seqread-libaio-multi    330.1mb         82.5k           
vtfs-none               seqread-libaio-multi    329.0mb         82.2k           
vtfs-none-dax           seqread-libaio-multi    1472.0mb        368.0k          
vtfs-auto               seqread-libaio-multi    1500.0mb        375.0k          
vtfs-auto-dax           seqread-libaio-multi    1491.2mb        372.8k          
vtfs-always             seqread-libaio-multi    1485.2mb        371.3k          
vtfs-always-dax         seqread-libaio-multi    1494.1mb        373.5k          

9p-none                 randread-psync          101.5mb         25.3k           
9p-mmap                 randread-psync          102.8mb         25.7k           
9p-loose                randread-psync          83.2mb          20.8k           
vtfs-none               randread-psync          104.9mb         26.2k           
vtfs-none-dax           randread-psync          662.5mb         165.6k          
vtfs-auto               randread-psync          77.9mb          19.4k           
vtfs-auto-dax           randread-psync          586.6mb         146.6k          
vtfs-always             randread-psync          79.3mb          19.8k           
vtfs-always-dax         randread-psync          634.1mb         158.5k          

9p-none                 randread-psync-multi    383.3mb         95.8k           
9p-mmap                 randread-psync-multi    372.6mb         93.1k           
9p-loose                randread-psync-multi    334.5mb         83.6k           
vtfs-none               randread-psync-multi    351.0mb         87.7k           
vtfs-none-dax           randread-psync-multi    519.9mb         129.9k          
vtfs-auto               randread-psync-multi    285.2mb         71.3k           
vtfs-auto-dax           randread-psync-multi    517.1mb         129.2k          
vtfs-always             randread-psync-multi    289.6mb         72.4k           
vtfs-always-dax         randread-psync-multi    507.9mb         126.9k          

9p-none                 randread-mmap           68.5mb          17.1k           
9p-mmap                 randread-mmap           64.4mb          16.1k           
9p-loose                randread-mmap           65.2mb          16.3k           
vtfs-none               randread-mmap           0kb             0               
vtfs-none-dax           randread-mmap           878.8mb         219.7k          
vtfs-auto               randread-mmap           57.7mb          14.4k           
vtfs-auto-dax           randread-mmap           870.6mb         217.6k          
vtfs-always             randread-mmap           58.5mb          14.6k           
vtfs-always-dax         randread-mmap           892.2mb         223.0k          

9p-none                 randread-mmap-multi     248.0mb         62.0k           
9p-mmap                 randread-mmap-multi     247.4mb         61.8k           
9p-loose                randread-mmap-multi     245.4mb         61.3k           
vtfs-none               randread-mmap-multi     0kb             0               
vtfs-none-dax           randread-mmap-multi     1055.3mb        263.8k          
vtfs-auto               randread-mmap-multi     243.5mb         60.8k           
vtfs-auto-dax           randread-mmap-multi     1030.9mb        257.7k          
vtfs-always             randread-mmap-multi     240.4mb         60.1k           
vtfs-always-dax         randread-mmap-multi     1052.0mb        263.0k          

9p-none                 randread-libaio         91.0mb          22.7k           
9p-mmap                 randread-libaio         92.1mb          23.0k           
9p-loose                randread-libaio         91.7mb          22.9k           
vtfs-none               randread-libaio         266.4mb         66.6k           
vtfs-none-dax           randread-libaio         387.2mb         96.8k           
vtfs-auto               randread-libaio         276.2mb         69.0k           
vtfs-auto-dax           randread-libaio         379.8mb         94.9k           
vtfs-always             randread-libaio         275.0mb         68.7k           
vtfs-always-dax         randread-libaio         399.5mb         99.8k           

9p-none                 randread-libaio-multi   354.5mb         88.6k           
9p-mmap                 randread-libaio-multi   359.5mb         89.8k           
9p-loose                randread-libaio-multi   348.5mb         87.1k           
vtfs-none               randread-libaio-multi   278.6mb         69.6k           
vtfs-none-dax           randread-libaio-multi   374.4mb         93.6k           
vtfs-auto               randread-libaio-multi   271.0mb         67.7k           
vtfs-auto-dax           randread-libaio-multi   367.0mb         91.7k           
vtfs-always             randread-libaio-multi   278.4mb         69.6k           
vtfs-always-dax         randread-libaio-multi   360.6mb         90.1k           

9p-none                 seqwrite-psync          93.2mb          23.3k           
9p-mmap                 seqwrite-psync          95.8mb          23.9k           
9p-loose                seqwrite-psync          69.3mb          17.3k           
vtfs-none               seqwrite-psync          95.3mb          23.8k           
vtfs-none-dax           seqwrite-psync          486.5mb         121.6k          
vtfs-auto               seqwrite-psync          78.6mb          19.6k           
vtfs-auto-dax           seqwrite-psync          470.9mb         117.7k          
vtfs-always             seqwrite-psync          75.9mb          18.9k           
vtfs-always-dax         seqwrite-psync          491.4mb         122.8k          

9p-none                 seqwrite-psync-multi    339.9mb         84.9k           
9p-mmap                 seqwrite-psync-multi    343.6mb         85.9k           
9p-loose                seqwrite-psync-multi    290.5mb         72.6k           
vtfs-none               seqwrite-psync-multi    321.3mb         80.3k           
vtfs-none-dax           seqwrite-psync-multi    1283.5mb        320.8k          
vtfs-auto               seqwrite-psync-multi    305.7mb         76.4k           
vtfs-auto-dax           seqwrite-psync-multi    1319.5mb        329.8k          
vtfs-always             seqwrite-psync-multi    307.5mb         76.8k           
vtfs-always-dax         seqwrite-psync-multi    1200.8mb        300.2k          

9p-none                 seqwrite-mmap           0kb             0               
9p-mmap                 seqwrite-mmap           101.3mb         25.3k           
9p-loose                seqwrite-mmap           112.4mb         28.1k           
vtfs-none               seqwrite-mmap           0kb             0               
vtfs-none-dax           seqwrite-mmap           1297.2mb        324.3k          
vtfs-auto               seqwrite-mmap           199.7mb         49.9k           
vtfs-auto-dax           seqwrite-mmap           1323.0mb        330.7k          
vtfs-always             seqwrite-mmap           181.7mb         45.4k           
vtfs-always-dax         seqwrite-mmap           1353.7mb        338.4k          

9p-none                 seqwrite-mmap-multi     0kb             0               
9p-mmap                 seqwrite-mmap-multi     274.7mb         68.6k           
9p-loose                seqwrite-mmap-multi     281.3mb         70.3k           
vtfs-none               seqwrite-mmap-multi     0kb             0               
vtfs-none-dax           seqwrite-mmap-multi     1806.2mb        451.5k          
vtfs-auto               seqwrite-mmap-multi     384.1mb         96.0k           
vtfs-auto-dax           seqwrite-mmap-multi     2023.4mb        505.8k          
vtfs-always             seqwrite-mmap-multi     384.5mb         96.1k           
vtfs-always-dax         seqwrite-mmap-multi     2008.9mb        502.2k          

9p-none                 seqwrite-libaio         87.9mb          21.9k           
9p-mmap                 seqwrite-libaio         89.3mb          22.3k           
9p-loose                seqwrite-libaio         42.4mb          10.5k           
vtfs-none               seqwrite-libaio         254.5mb         63.6k           
vtfs-none-dax           seqwrite-libaio         284.7mb         71.1k           
vtfs-auto               seqwrite-libaio         279.1mb         69.7k           
vtfs-auto-dax           seqwrite-libaio         299.6mb         74.9k           
vtfs-always             seqwrite-libaio         238.9mb         59.7k           
vtfs-always-dax         seqwrite-libaio         305.8mb         76.4k           

9p-none                 seqwrite-libaio-multi   339.6mb         84.9k           
9p-mmap                 seqwrite-libaio-multi   329.5mb         82.3k           
9p-loose                seqwrite-libaio-multi   165.8mb         41.4k           
vtfs-none               seqwrite-libaio-multi   320.6mb         80.1k           
vtfs-none-dax           seqwrite-libaio-multi   975.3mb         243.8k          
vtfs-auto               seqwrite-libaio-multi   306.4mb         76.6k           
vtfs-auto-dax           seqwrite-libaio-multi   974.4mb         243.6k          
vtfs-always             seqwrite-libaio-multi   312.6mb         78.1k           
vtfs-always-dax         seqwrite-libaio-multi   883.8mb         220.9k          

9p-none                 randwrite-psync         94.9mb          23.7k           
9p-mmap                 randwrite-psync         99.3mb          24.8k           
9p-loose                randwrite-psync         68.7mb          17.1k           
vtfs-none               randwrite-psync         97.2mb          24.3k           
vtfs-none-dax           randwrite-psync         480.3mb         120.0k          
vtfs-auto               randwrite-psync         82.2mb          20.5k           
vtfs-auto-dax           randwrite-psync         435.6mb         108.9k          
vtfs-always             randwrite-psync         77.3mb          19.3k           
vtfs-always-dax         randwrite-psync         451.1mb         112.7k          

9p-none                 randwrite-psync-multi   336.0mb         84.0k           
9p-mmap                 randwrite-psync-multi   338.5mb         84.6k           
9p-loose                randwrite-psync-multi   278.4mb         69.6k           
vtfs-none               randwrite-psync-multi   323.7mb         80.9k           
vtfs-none-dax           randwrite-psync-multi   519.2mb         129.8k          
vtfs-auto               randwrite-psync-multi   302.1mb         75.5k           
vtfs-auto-dax           randwrite-psync-multi   473.3mb         118.3k          
vtfs-always             randwrite-psync-multi   302.4mb         75.6k           
vtfs-always-dax         randwrite-psync-multi   512.9mb         128.2k          

9p-none                 randwrite-mmap          0kb             0               
9p-mmap                 randwrite-mmap          58.2mb          14.5k           
9p-loose                randwrite-mmap          63.5mb          15.8k           
vtfs-none               randwrite-mmap          0kb             0               
vtfs-none-dax           randwrite-mmap          872.3mb         218.0k          
vtfs-auto               randwrite-mmap          55.9mb          13.9k           
vtfs-auto-dax           randwrite-mmap          771.8mb         192.9k          
vtfs-always             randwrite-mmap          59.0mb          14.7k           
vtfs-always-dax         randwrite-mmap          828.8mb         207.2k          

9p-none                 randwrite-mmap-multi    0kb             0               
9p-mmap                 randwrite-mmap-multi    251.2mb         62.8k           
9p-loose                randwrite-mmap-multi    257.9mb         64.4k           
vtfs-none               randwrite-mmap-multi    0kb             0               
vtfs-none-dax           randwrite-mmap-multi    1119.1mb        279.7k          
vtfs-auto               randwrite-mmap-multi    208.9mb         52.2k           
vtfs-auto-dax           randwrite-mmap-multi    1043.9mb        260.9k          
vtfs-always             randwrite-mmap-multi    209.4mb         52.3k           
vtfs-always-dax         randwrite-mmap-multi    1091.4mb        272.8k          

9p-none                 randwrite-libaio        85.9mb          21.4k           
9p-mmap                 randwrite-libaio        87.8mb          21.9k           
9p-loose                randwrite-libaio        41.6mb          10.4k           
vtfs-none               randwrite-libaio        252.4mb         63.1k           
vtfs-none-dax           randwrite-libaio        282.0mb         70.5k           
vtfs-auto               randwrite-libaio        258.7mb         64.6k           
vtfs-auto-dax           randwrite-libaio        272.5mb         68.1k           
vtfs-always             randwrite-libaio        239.0mb         59.7k           
vtfs-always-dax         randwrite-libaio        256.4mb         64.1k           

9p-none                 randwrite-libaio-multi  329.5mb         82.3k           
9p-mmap                 randwrite-libaio-multi  324.4mb         81.1k           
9p-loose                randwrite-libaio-multi  161.1mb         40.2k           
vtfs-none               randwrite-libaio-multi  323.8mb         80.9k           
vtfs-none-dax           randwrite-libaio-multi  366.3mb         91.5k           
vtfs-auto               randwrite-libaio-multi  320.9mb         80.2k           
vtfs-auto-dax           randwrite-libaio-multi  351.2mb         87.8k           
vtfs-always             randwrite-libaio-multi  328.8mb         82.2k           
vtfs-always-dax         randwrite-libaio-multi  362.5mb         90.6k           

9p-none                 randrw-psync            70.2mb/23.5mb   17.5k/6017      
9p-mmap                 randrw-psync            74.5mb/24.9mb   18.6k/6398      
9p-loose                randrw-psync            59.2mb/19.8mb   14.8k/5077      
vtfs-none               randrw-psync            75.8mb/25.4mb   18.9k/6508      
vtfs-none-dax           randrw-psync            403.2mb/134.7mb 100.8k/33.6k    
vtfs-auto               randrw-psync            38.1mb/12.7mb   9775/3265       
vtfs-auto-dax           randrw-psync            382.4mb/127.8mb 95.6k/31.9k     
vtfs-always             randrw-psync            40.7mb/13.6mb   10.1k/3485      
vtfs-always-dax         randrw-psync            393.4mb/131.4mb 98.3k/32.8k     

9p-none                 randrw-psync-multi      264.3mb/88.5mb  66.0k/22.1k     
9p-mmap                 randrw-psync-multi      260.5mb/87.2mb  65.1k/21.8k     
9p-loose                randrw-psync-multi      232.6mb/77.9mb  58.1k/19.4k     
vtfs-none               randrw-psync-multi      260.7mb/87.3mb  65.1k/21.8k     
vtfs-none-dax           randrw-psync-multi      270.0mb/90.4mb  67.5k/22.6k     
vtfs-auto               randrw-psync-multi      151.4mb/50.7mb  37.8k/12.6k     
vtfs-auto-dax           randrw-psync-multi      251.2mb/84.1mb  62.8k/21.0k     
vtfs-always             randrw-psync-multi      152.9mb/51.2mb  38.2k/12.8k     
vtfs-always-dax         randrw-psync-multi      251.5mb/84.3mb  62.8k/21.0k     

9p-none                 randrw-mmap             0kb/0kb         0/0             
9p-mmap                 randrw-mmap             47.4mb/15.8mb   11.8k/4057      
9p-loose                randrw-mmap             48.4mb/16.1mb   12.1k/4143      
vtfs-none               randrw-mmap             0kb/0kb         0/0             
vtfs-none-dax           randrw-mmap             539.5mb/180.3mb 134.8k/45.0k    
vtfs-auto               randrw-mmap             44.4mb/14.8mb   11.1k/3806      
vtfs-auto-dax           randrw-mmap             544.2mb/181.8mb 136.0k/45.4k    
vtfs-always             randrw-mmap             43.1mb/14.4mb   10.7k/3691      
vtfs-always-dax         randrw-mmap             555.4mb/185.6mb 138.8k/46.4k    

9p-none                 randrw-mmap-multi       0kb/0kb         0/0             
9p-mmap                 randrw-mmap-multi       184.0mb/61.6mb  46.0k/15.4k     
9p-loose                randrw-mmap-multi       188.8mb/63.2mb  47.2k/15.8k     
vtfs-none               randrw-mmap-multi       0kb/0kb         0/0             
vtfs-none-dax           randrw-mmap-multi       573.8mb/191.9mb 143.4k/47.9k    
vtfs-auto               randrw-mmap-multi       179.3mb/60.0mb  44.8k/15.0k     
vtfs-auto-dax           randrw-mmap-multi       498.0mb/166.7mb 124.5k/41.6k    
vtfs-always             randrw-mmap-multi       180.2mb/60.4mb  45.0k/15.1k     
vtfs-always-dax         randrw-mmap-multi       525.0mb/175.7mb 131.2k/43.9k    

9p-none                 randrw-libaio           68.4mb/22.8mb   17.1k/5858      
9p-mmap                 randrw-libaio           67.4mb/22.5mb   16.8k/5777      
9p-loose                randrw-libaio           52.7mb/17.6mb   13.1k/4517      
vtfs-none               randrw-libaio           199.9mb/66.8mb  49.9k/16.7k     
vtfs-none-dax           randrw-libaio           256.9mb/85.8mb  64.2k/21.4k     
vtfs-auto               randrw-libaio           83.4mb/27.9mb   20.8k/7161      
vtfs-auto-dax           randrw-libaio           241.2mb/80.6mb  60.3k/20.1k     
vtfs-always             randrw-libaio           87.3mb/29.2mb   21.8k/7491      
vtfs-always-dax         randrw-libaio           252.5mb/84.3mb  63.1k/21.0k     

9p-none                 randrw-libaio-multi     267.4mb/89.5mb  66.8k/22.3k     
9p-mmap                 randrw-libaio-multi     256.2mb/85.8mb  64.0k/21.4k     
9p-loose                randrw-libaio-multi     200.1mb/67.0mb  50.0k/16.7k     
vtfs-none               randrw-libaio-multi     210.9mb/70.7mb  52.7k/17.6k     
vtfs-none-dax           randrw-libaio-multi     192.6mb/64.5mb  48.1k/16.1k     
vtfs-auto               randrw-libaio-multi     209.6mb/70.2mb  52.4k/17.5k     
vtfs-auto-dax           randrw-libaio-multi     189.1mb/63.3mb  47.2k/15.8k     
vtfs-always             randrw-libaio-multi     212.3mb/71.1mb  53.0k/17.7k     
vtfs-always-dax         randrw-libaio-multi     195.8mb/65.6mb  48.9k/16.4k     

Thanks
Vivek


