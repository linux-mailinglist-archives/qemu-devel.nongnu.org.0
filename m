Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4712F3AC125
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 05:00:44 +0200 (CEST)
Received: from localhost ([::1]:42508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lu4kN-0002R8-Kg
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 23:00:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1lu4j8-0001mw-5I
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 22:59:26 -0400
Received: from mga04.intel.com ([192.55.52.120]:13467)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1lu4j5-0003Mx-89
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 22:59:25 -0400
IronPort-SDR: VDWLFPuCwVdCt+nbJaykOFUDvcRsmKDW1N5fYCFTv5czZG40qoYYZR8JmgXWB5xujltrxkDEk1
 mda12g7AxWSw==
X-IronPort-AV: E=McAfee;i="6200,9189,10018"; a="204656966"
X-IronPort-AV: E=Sophos;i="5.83,281,1616482800"; d="scan'208";a="204656966"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2021 19:59:10 -0700
IronPort-SDR: QR/FX76iaCPoPQyRVIakcQYiJo6LnPDErmZ66hNa9T+k/nIXlsNPCcmEb5U5O6uNlRu9bwOm11
 r9ugBA+HRxfQ==
X-IronPort-AV: E=Sophos;i="5.83,281,1616482800"; d="scan'208";a="451242525"
Received: from unknown (HELO [10.239.13.19]) ([10.239.13.19])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2021 19:59:08 -0700
Subject: Re: [PATCH v6 00/10] Fixed some bugs and optimized some codes for COLO
From: "chen.zhang@intel.com" <chen.zhang@intel.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <1617938456-315058-1-git-send-email-lei.rao@intel.com>
 <20210517214638.7519781b@gecko.fritz.box>
 <79a39d11ea124acbab097d17034ab6ff@intel.com>
Message-ID: <2a750dfe-368f-5289-861d-f35ee639e82c@intel.com>
Date: Fri, 18 Jun 2021 10:52:31 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <79a39d11ea124acbab097d17034ab6ff@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=192.55.52.120; envelope-from=chen.zhang@intel.com;
 helo=mga04.intel.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.254,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: Lukas Straub <lukasstraub2@web.de>,
 "lizhijian@cn.fujitsu.com" <lizhijian@cn.fujitsu.com>,
 "quintela@redhat.com" <quintela@redhat.com>, Jason Wang <jasowang@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>, "Rao, Lei" <lei.rao@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 5/18/21 9:33 AM, Zhang, Chen wrote:
>
>> -----Original Message-----
>> From: Lukas Straub <lukasstraub2@web.de>
>> Sent: Tuesday, May 18, 2021 3:47 AM
>> To: Rao, Lei <lei.rao@intel.com>
>> Cc: Zhang, Chen <chen.zhang@intel.com>; lizhijian@cn.fujitsu.com;
>> jasowang@redhat.com; quintela@redhat.com; dgilbert@redhat.com;
>> pbonzini@redhat.com; qemu-devel@nongnu.org
>> Subject: Re: [PATCH v6 00/10] Fixed some bugs and optimized some codes
>> for COLO
>>
>> On Thu,  8 Apr 2021 23:20:46 -0400
>> leirao <lei.rao@intel.com> wrote:
>>
>>> From: Rao, Lei <lei.rao@intel.com>
>>>
>>> Changes since v5:
>>>          --Replaced g_slice_new calls with g_slice_new0.
>>>
>>> Changes since v4:
>>>          --Replaced qemu_mutex_lock calls with QEMU_LOCK_GUARD in
>> colo_bitmap_clear_dirty.
>>>          --Modify some minor issues about variable definition.
>>>          --Add some performance test data in the commit message.
>>>
>>> Changes since v3:
>>>          --Remove cpu_throttle_stop from mig_throttle_counter_reset.
>>>
>>> Changes since v2:
>>>          --Add a function named packet_new_nocopy.
>>>          --Continue to optimize the function of colo_flush_ram_cache.
>>>
>>> Changes since v1:
>>>          --Reset the state of the auto-converge counters at every checkpoint
>> instead of directly disabling.
>>>          --Treat the filter_send function returning zero as a normal case.
>>>
>>> The series of patches include:
>>>          Fixed some bugs of qemu crash.
>>>          Optimized some code to reduce the time of checkpoint.
>>>          Remove some unnecessary code to improve COLO.
>>>
>>> Rao, Lei (10):
>>>    Remove some duplicate trace code.
>>>    Fix the qemu crash when guest shutdown during checkpoint
>>>    Optimize the function of filter_send
>>>    Remove migrate_set_block_enabled in checkpoint
>>>    Add a function named packet_new_nocopy for COLO.
>>>    Add the function of colo_compare_cleanup
>>>    Reset the auto-converge counter at every checkpoint.
>>>    Reduce the PVM stop time during Checkpoint
>>>    Add the function of colo_bitmap_clear_dirty
>>>    Fixed calculation error of pkt->header_size in fill_pkt_tcp_info()
>>>
>>>   migration/colo.c      | 10 +++----
>>>   migration/migration.c |  4 +++
>>>   migration/ram.c       | 83
>> +++++++++++++++++++++++++++++++++++++++++++++++++--
>>>   migration/ram.h       |  1 +
>>>   net/colo-compare.c    | 25 +++++++---------
>>>   net/colo-compare.h    |  1 +
>>>   net/colo.c            | 25 +++++++++++-----
>>>   net/colo.h            |  1 +
>>>   net/filter-mirror.c   |  8 ++---
>>>   net/filter-rewriter.c |  3 +-
>>>   net/net.c             |  4 +++
>>>   softmmu/runstate.c    |  1 +
>>>   12 files changed, 129 insertions(+), 37 deletions(-)
>>>
>> I guess Zhang Chen can already take the network-related patches through his
>> tree.
> Sure, I will queue the patch 1-6 and 10.
> Hi Dave, can you take the patch 7-9? Or do you think it's more convenient to take all series?


Hi David,


The 1-6 and 10 already been merged in upstream.

Can you please pick up the rest of this series?

By the way, If you have time, Lei submitted a new series of patch still 
need your comments,


Thanks

Chen


> Thanks
> Chen
>
>> Regards,
>> Lukas Straub
>>
>> --
>

