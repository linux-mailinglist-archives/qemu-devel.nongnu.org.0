Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6C1C52EF3C
	for <lists+qemu-devel@lfdr.de>; Fri, 20 May 2022 17:30:51 +0200 (CEST)
Received: from localhost ([::1]:43452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ns4aY-0007qP-Ch
	for lists+qemu-devel@lfdr.de; Fri, 20 May 2022 11:30:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lkp@intel.com>) id 1ns4Yo-0006KJ-DG
 for qemu-devel@nongnu.org; Fri, 20 May 2022 11:29:02 -0400
Received: from mga18.intel.com ([134.134.136.126]:3667)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lkp@intel.com>) id 1ns4Yl-0005Yk-Pq
 for qemu-devel@nongnu.org; Fri, 20 May 2022 11:29:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653060539; x=1684596539;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=2leG2LmaeymdY17ZfAaPpngzgqFnDp+gD2t1Nl2U6Yo=;
 b=OHtPM/ExGeqGKmrJek4RqpzRwxRE9IEM62FePiIIckvWxYgegBYNGhEC
 WHSBEC/tugm1+o+ei2i35j/ZZXGAx/8TZ6fi9WbwZvtaDybQHV1HQ21v3
 wcy+L/M1iBFMLyT3SfQ7z79VGjvs0FIcuIb9bQyJ+jT/AtZGq0PyA0+24
 BaFwYTAUI/NbLXxTSATlDdRt+H9lhqjYarkNNeoMmuHeFPlKCj292L3kP
 pK+GetB1q1wlwv9acbYvkmgbt7UlojzG9Hcrv0tCgYDjmhA6YaSOrSE5i
 V+bIqPp7vwGB01D2DNFwNOK6lsHkJNym0LcQNSvS9LyDcPlJDmRtG+e4T Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10353"; a="254693431"
X-IronPort-AV: E=Sophos;i="5.91,239,1647327600"; d="scan'208";a="254693431"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2022 08:28:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,239,1647327600"; d="scan'208";a="899369665"
Received: from lkp-server02.sh.intel.com (HELO 242b25809ac7) ([10.239.97.151])
 by fmsmga005.fm.intel.com with ESMTP; 20 May 2022 08:28:50 -0700
Received: from kbuild by 242b25809ac7 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1ns4Yb-0004rl-NI;
 Fri, 20 May 2022 15:28:49 +0000
Date: Fri, 20 May 2022 23:28:25 +0800
From: kernel test robot <lkp@intel.com>
To: zhenwei pi <pizhenwei@bytedance.com>, akpm@linux-foundation.org,
 naoya.horiguchi@nec.com, mst@redhat.com, david@redhat.com
Cc: kbuild-all@lists.01.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, jasowang@redhat.com,
 virtualization@lists.linux-foundation.org, pbonzini@redhat.com,
 peterx@redhat.com, qemu-devel@nongnu.org,
 zhenwei pi <pizhenwei@bytedance.com>
Subject: Re: [PATCH 3/3] virtio_balloon: Introduce memory recover
Message-ID: <202205202330.u0vQWiWG-lkp@intel.com>
References: <20220520070648.1794132-4-pizhenwei@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220520070648.1794132-4-pizhenwei@bytedance.com>
Received-SPF: pass client-ip=134.134.136.126; envelope-from=lkp@intel.com;
 helo=mga18.intel.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
config: arm-randconfig-r026-20220519 (https://download.01.org/0day-ci/archive/20220520/202205202330.u0vQWiWG-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/a42127073dd4adb6354649c8235c5cde033d01f2
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review zhenwei-pi/recover-hardware-corrupted-page-by-virtio-balloon/20220520-151328
        git checkout a42127073dd4adb6354649c8235c5cde033d01f2
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.3.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: drivers/virtio/virtio_balloon.o: in function `unpoison_memory_func':
>> virtio_balloon.c:(.text+0x89a): undefined reference to `unpoison_memory'
   arm-linux-gnueabi-ld: drivers/virtio/virtio_balloon.o: in function `virtballoon_probe':
>> virtio_balloon.c:(.text+0x111a): undefined reference to `register_memory_failure_notifier'
   arm-linux-gnueabi-ld: drivers/virtio/virtio_balloon.o: in function `virtballoon_remove':
>> virtio_balloon.c:(.text+0x12a2): undefined reference to `unregister_memory_failure_notifier'

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

