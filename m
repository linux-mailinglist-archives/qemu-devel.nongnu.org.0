Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5730623BDFE
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Aug 2020 18:20:42 +0200 (CEST)
Received: from localhost ([::1]:36556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k2zg9-0007pK-CW
	for lists+qemu-devel@lfdr.de; Tue, 04 Aug 2020 12:20:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1k2zek-0006fN-Np
 for qemu-devel@nongnu.org; Tue, 04 Aug 2020 12:19:14 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:23978
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1k2zei-0007YR-QV
 for qemu-devel@nongnu.org; Tue, 04 Aug 2020 12:19:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596557952;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NlIRqcYpCGuzct6vHwKYU6i5EKd3jo99HCsWiSqxQ38=;
 b=JH3BJKEiwEEv1tJHZOUki920pPEbKAD76ONy/Bad2+03x9P5yatirGkIknGeU/+HPYz6jV
 5uz63h5NYCii2rtZP26hFiXCppxafmk2YWi+i47dJDuqfy+ZI76pCujcHJFpTso1R5gOkJ
 Rvf/DSURD07NslQtpEoRBZE1I5q9/y8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-285-Pcj4DjIcNO-vJaC12aqOug-1; Tue, 04 Aug 2020 12:19:08 -0400
X-MC-Unique: Pcj4DjIcNO-vJaC12aqOug-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D291657;
 Tue,  4 Aug 2020 16:19:06 +0000 (UTC)
Received: from work-vm (ovpn-114-108.ams2.redhat.com [10.36.114.108])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3412F5C1D2;
 Tue,  4 Aug 2020 16:19:05 +0000 (UTC)
Date: Tue, 4 Aug 2020 17:19:02 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Chuan Zheng <zhengchuan@huawei.com>
Subject: Re: [RFC PATCH 0/8] *** A Method for evaluating dirty page rate ***
Message-ID: <20200804161902.GC2659@work-vm>
References: <1595646669-109310-1-git-send-email-zhengchuan@huawei.com>
MIME-Version: 1.0
In-Reply-To: <1595646669-109310-1-git-send-email-zhengchuan@huawei.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.81; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/04 01:01:15
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: zhang.zhanghailiang@huawei.com, quintela@redhat.com, linyilu@huawei.com,
 qemu-devel@nongnu.org, alex.chen@huawei.com, ann.zhuangyanying@huawei.com,
 fangying1@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Chuan Zheng (zhengchuan@huawei.com) wrote:
> From: Zheng Chuan <zhengchuan@huawei.com>

Hi,

> Sometimes it is neccessary to evaluate dirty page rate before migration.
> Users could decide whether to proceed migration based on the evaluation
> in case of vm performance loss due to heavy workload.
> Unlikey simulating dirtylog sync which could do harm on runnning vm,
> we provide a sample-hash method to compare hash results for samping page.
> In this way, it would have hardly no impact on vm performance.
> 
> We evaluate the dirtypage rate on running vm.
> The VM specifications for migration are as follows:
> - VM use 4-K page;
> - the number of VCPU is 32;
> - the total memory is 32Gigabit;
> - use 'mempress' tool to pressurize VM(mempress 4096 1024);
> 
> ++++++++++++++++++++++++++++++++++++++++++
> |                      |    dirtyrate    |
> ++++++++++++++++++++++++++++++++++++++++++
> | no mempress          |     4MB/s       |
> ------------------------------------------
> | mempress 4096 1024   |    1204MB/s     |
> ++++++++++++++++++++++++++++++++++++++++++
> | mempress 4096 4096   |    4000Mb/s     |
> ++++++++++++++++++++++++++++++++++++++++++

This is quite neat; I know we've got other people who have asked
for a similar feature!
Have you tried to validate these numbers against a real migration - e.g.
try setting mempress to dirty just under 1GByte/s and see if you can
migrate it over a 10Gbps link?

Dave

> Test dirtyrate by qmp command like this:
> 1.  virsh qemu-monitor-command [vmname] '{"execute":"cal_dirty_rate", "arguments": {"value": [sampletime]}}'
> 2.  virsh qemu-monitor-command [vmname] '{"execute":"get_dirty_rate"}'
> 
> Further test dirtyrate by libvirt api like this:
> virsh getdirtyrate [vmname] [sampletime]
> 
> Zheng Chuan (8):
>   migration/dirtyrate: Add get_dirtyrate_thread() function
>   migration/dirtyrate: Add block_dirty_info to store dirtypage info
>   migration/dirtyrate: Add dirtyrate statistics series functions
>   migration/dirtyrate: Record hash results for each ramblock
>   migration/dirtyrate: Compare hash results for recorded ramblock
>   migration/dirtyrate: Implement get_sample_gap_period() and
>     block_sample_gap_period()
>   migration/dirtyrate: Implement calculate_dirtyrate() function
>   migration/dirtyrate: Implement
>     qmp_cal_dirty_rate()/qmp_get_dirty_rate() function
> 
>  migration/Makefile.objs |   1 +
>  migration/dirtyrate.c   | 424 ++++++++++++++++++++++++++++++++++++++++++++++++
>  migration/dirtyrate.h   |  67 ++++++++
>  qapi/migration.json     |  24 +++
>  qapi/pragma.json        |   3 +-
>  5 files changed, 518 insertions(+), 1 deletion(-)
>  create mode 100644 migration/dirtyrate.c
>  create mode 100644 migration/dirtyrate.h
> 
> -- 
> 1.8.3.1
> 
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


