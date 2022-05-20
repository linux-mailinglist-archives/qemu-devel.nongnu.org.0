Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9773152ED5E
	for <lists+qemu-devel@lfdr.de>; Fri, 20 May 2022 15:42:55 +0200 (CEST)
Received: from localhost ([::1]:34582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ns2u6-0006GA-8J
	for lists+qemu-devel@lfdr.de; Fri, 20 May 2022 09:42:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lkp@intel.com>) id 1ns2rG-0003vm-HR
 for qemu-devel@nongnu.org; Fri, 20 May 2022 09:39:58 -0400
Received: from mga14.intel.com ([192.55.52.115]:8458)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lkp@intel.com>) id 1ns2rD-0005qz-Nl
 for qemu-devel@nongnu.org; Fri, 20 May 2022 09:39:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653053995; x=1684589995;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=tEsNkD67VlMRMMbJpoolW2AuTZVamWWhFYXi0Uoe5Js=;
 b=Vrf15X/M/Lgk6F+ZIdjtyAWw5OpWech5p9v5OD53sqeNT+ibdDAlAaYd
 HbzZLcNp8NJ7vFYCw0JUeweiQCOQiHRl1196D5eNZ1PUISUP+LZ8DE4GR
 x1LlcQEHqN/zH2kaPfgzcr1ZtVCp9JFu9VnRltX5nyVolLGeRA5X/+5B+
 XuZDEUsVvJ7jbHESl7AueBd4RaPs8YvL0DfQi9L5bFRVZDeNfEUG9OOGW
 ti2rHCn56q7tRqkHkGce9+yJoS9iKwzzVhXCxjGtlQoCe1i+cAf0NNdOY
 ter/pLm1+ookOZOYxpDu1owOU4F4CHg7d7xDJ/Jq4ynRMRCUw4jH/LYI1 A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10353"; a="272733756"
X-IronPort-AV: E=Sophos;i="5.91,239,1647327600"; d="scan'208";a="272733756"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2022 06:39:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,239,1647327600"; d="scan'208";a="818556999"
Received: from lkp-server02.sh.intel.com (HELO 242b25809ac7) ([10.239.97.151])
 by fmsmga006.fm.intel.com with ESMTP; 20 May 2022 06:39:46 -0700
Received: from kbuild by 242b25809ac7 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1ns2r3-0004k5-Eb;
 Fri, 20 May 2022 13:39:45 +0000
Date: Fri, 20 May 2022 21:39:32 +0800
From: kernel test robot <lkp@intel.com>
To: zhenwei pi <pizhenwei@bytedance.com>, akpm@linux-foundation.org,
 naoya.horiguchi@nec.com, mst@redhat.com, david@redhat.com
Cc: kbuild-all@lists.01.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, jasowang@redhat.com,
 virtualization@lists.linux-foundation.org, pbonzini@redhat.com,
 peterx@redhat.com, qemu-devel@nongnu.org,
 zhenwei pi <pizhenwei@bytedance.com>
Subject: Re: [PATCH 3/3] virtio_balloon: Introduce memory recover
Message-ID: <202205202151.7T3K7Szf-lkp@intel.com>
References: <20220520070648.1794132-4-pizhenwei@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220520070648.1794132-4-pizhenwei@bytedance.com>
Received-SPF: pass client-ip=192.55.52.115; envelope-from=lkp@intel.com;
 helo=mga14.intel.com
X-Spam_score_int: -71
X-Spam_score: -7.2
X-Spam_bar: -------
X-Spam_report: (-7.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi zhenwei,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on akpm-mm/mm-everything]
[also build test ERROR on next-20220519]
[cannot apply to linux/master linus/master v5.18-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/zhenwei-pi/recover-hardware-corrupted-page-by-virtio-balloon/20220520-151328
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
config: nios2-randconfig-r002-20220519 (https://download.01.org/0day-ci/archive/20220520/202205202151.7T3K7Szf-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/a42127073dd4adb6354649c8235c5cde033d01f2
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review zhenwei-pi/recover-hardware-corrupted-page-by-virtio-balloon/20220520-151328
        git checkout a42127073dd4adb6354649c8235c5cde033d01f2
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.3.0 make.cross W=1 O=build_dir ARCH=nios2 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   nios2-linux-ld: drivers/virtio/virtio_balloon.o: in function `unpoison_memory_func':
>> drivers/virtio/virtio_balloon.c:679: undefined reference to `unpoison_memory'
   drivers/virtio/virtio_balloon.c:679:(.text+0xc00): relocation truncated to fit: R_NIOS2_CALL26 against `unpoison_memory'
   nios2-linux-ld: drivers/virtio/virtio_balloon.o: in function `virtballoon_probe':
>> drivers/virtio/virtio_balloon.c:1247: undefined reference to `register_memory_failure_notifier'
   drivers/virtio/virtio_balloon.c:1247:(.text+0x1940): relocation truncated to fit: R_NIOS2_CALL26 against `register_memory_failure_notifier'
   nios2-linux-ld: drivers/virtio/virtio_balloon.o: in function `virtballoon_remove':
>> drivers/virtio/virtio_balloon.c:1323: undefined reference to `unregister_memory_failure_notifier'
   drivers/virtio/virtio_balloon.c:1323:(.text+0x1bcc): relocation truncated to fit: R_NIOS2_CALL26 against `unregister_memory_failure_notifier'


vim +679 drivers/virtio/virtio_balloon.c

   661	
   662	static void unpoison_memory_func(struct work_struct *work)
   663	{
   664		struct virtio_balloon *vb;
   665		struct page *page;
   666	
   667		vb = container_of(work, struct virtio_balloon, unpoison_memory_work);
   668	
   669		do {
   670			spin_lock(&vb->recover_page_list_lock);
   671			page = list_first_entry_or_null(&vb->recovered_page_list,
   672							struct page, lru);
   673			if (page)
   674				list_del(&page->lru);
   675			spin_unlock(&vb->recover_page_list_lock);
   676	
   677			if (page) {
   678				put_page(page);
 > 679				unpoison_memory(page_to_pfn(page), true, "virtio-balloon");
   680			}
   681		} while (page);
   682	}
   683	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

