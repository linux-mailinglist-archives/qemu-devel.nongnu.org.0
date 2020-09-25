Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4517027823A
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Sep 2020 10:08:07 +0200 (CEST)
Received: from localhost ([::1]:38018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kLily-0000Mw-BA
	for lists+qemu-devel@lfdr.de; Fri, 25 Sep 2020 04:08:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1kLikl-00081D-1X
 for qemu-devel@nongnu.org; Fri, 25 Sep 2020 04:06:51 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:53047)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1kLiki-00086w-Gz
 for qemu-devel@nongnu.org; Fri, 25 Sep 2020 04:06:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=C1LAl7iFhSWxJo4O4+Fg+1J6QMFGsW7M6C6eJvk9vCY=; b=cNrpcyH0NFjMrz4CcpXPepwflE
 cABEw0CuVkczdQ4KKAiLuLaApRjK6H2iXpZDV57nFWniDUr2a2ltzigIX6S3E+7c4K5WtKJrAgO8z
 qDj2OelLbyk21s0r20IvfMrukx1q1ep6LtU0mKlcd1pUqK2Cj8He66+yNzYFe7ZLpUI1s6c4Zzv5X
 IxFH5mkv0k79MmH3PfJO67eZHFa2iiZyDQcE/M+qi3OitCYV61LvYPLolhFqF5yeoSm/ofhMNyt8j
 VeFN1sVB1SvCoU+nXNMAcxaETUeb6z2qfRRmJu6v6Iw3B9nwht/pIbUV8OPFyeidAdyx8AqEqRxdw
 aQtPraeA==;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Vivek Goyal <vgoyal@redhat.com>, "Venegas Munoz,
 Jose Carlos" <jose.carlos.venegas.munoz@intel.com>,
 "cdupontd@redhat.com" <cdupontd@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 virtio-fs-list <virtio-fs@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 "Shinde, Archana M" <archana.m.shinde@intel.com>, Greg Kurz <groug@kaod.org>
Subject: Re: virtiofs vs 9p performance
Date: Fri, 25 Sep 2020 10:06:41 +0200
Message-ID: <17216624.eqST2d0sUl@silver>
In-Reply-To: <20200924221023.GB132653@redhat.com>
References: <20200918213436.GA3520@redhat.com>
 <46D726A6-72F3-40FE-9382-A189513F783D@intel.com>
 <20200924221023.GB132653@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Received-SPF: pass client-ip=91.194.90.13; envelope-from=qemu_oss@crudebyte.com;
 helo=lizzy.crudebyte.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/25 04:06:45
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Freitag, 25. September 2020 00:10:23 CEST Vivek Goyal wrote:
> In my testing, with cache=none, virtiofs performed better than 9p in
> all the fio jobs I was running. For the case of cache=auto  for virtiofs
> (with xattr enabled), 9p performed better in certain write workloads. I
> have identified root cause of that problem and working on
> HANDLE_KILLPRIV_V2 patches to improve WRITE performance of virtiofs
> with cache=auto and xattr enabled.

Please note, when it comes to performance aspects, you should set a reasonable 
high value for 'msize' on 9p client side:
https://wiki.qemu.org/Documentation/9psetup#msize

I'm also working on performance optimizations for 9p BTW. There is plenty of 
headroom to put it mildly. For QEMU 5.2 I started by addressing readdir 
requests:
https://wiki.qemu.org/ChangeLog/5.2#9pfs

Best regards,
Christian Schoenebeck



