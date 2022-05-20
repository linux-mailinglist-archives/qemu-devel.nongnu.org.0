Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB4C652ECA0
	for <lists+qemu-devel@lfdr.de>; Fri, 20 May 2022 14:51:44 +0200 (CEST)
Received: from localhost ([::1]:59550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ns26a-0006ns-0s
	for lists+qemu-devel@lfdr.de; Fri, 20 May 2022 08:51:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lkp@intel.com>) id 1ns23r-0005QW-BS
 for qemu-devel@nongnu.org; Fri, 20 May 2022 08:48:55 -0400
Received: from mga17.intel.com ([192.55.52.151]:12814)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lkp@intel.com>) id 1ns23n-0005eX-Vl
 for qemu-devel@nongnu.org; Fri, 20 May 2022 08:48:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653050931; x=1684586931;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ydq2rAxzxy58oJMneM/mj2UuLnLEiLOSmzW01gULOvU=;
 b=BXhQ4aTxD8SIS1oiK1OfqbeMQEJazdzeDNtW0glkWARgocZkRhsSN+vP
 GqQFyXMW94E7tmHCxkCFLxsqajYHfQ5XlWA1ntPXBSSK1mO9ZMOHgCE/t
 D5p0E1mZpkKwq5G3aOd4V80NPr50O40wgKwyobvMZNHS8PUVoqiwKHxAC
 8m1IqXlMl6Fm3TuTglwaAfUDC5UQlBKFehuU50ncA8b6V+c+nJcoFFP2k
 uP4zhv+2M3FZxZ3S/2wj7AENLbYQMhrWs0ZfZLRCfxmw7oKYi5sFPssaK
 Y3ZiCFjN3WC6KECxMpWEz4LrSwQ65wiSYIi0WMG0OEW5794ZZ6fJNL+K1 w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10352"; a="253112299"
X-IronPort-AV: E=Sophos;i="5.91,239,1647327600"; d="scan'208";a="253112299"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2022 05:48:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,239,1647327600"; d="scan'208";a="662248000"
Received: from lkp-server02.sh.intel.com (HELO 242b25809ac7) ([10.239.97.151])
 by FMSMGA003.fm.intel.com with ESMTP; 20 May 2022 05:48:44 -0700
Received: from kbuild by 242b25809ac7 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1ns23g-0004hw-5m;
 Fri, 20 May 2022 12:48:44 +0000
Date: Fri, 20 May 2022 20:48:19 +0800
From: kernel test robot <lkp@intel.com>
To: zhenwei pi <pizhenwei@bytedance.com>, akpm@linux-foundation.org,
 naoya.horiguchi@nec.com, mst@redhat.com, david@redhat.com
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, jasowang@redhat.com,
 virtualization@lists.linux-foundation.org, pbonzini@redhat.com,
 peterx@redhat.com, qemu-devel@nongnu.org,
 zhenwei pi <pizhenwei@bytedance.com>
Subject: Re: [PATCH 3/3] virtio_balloon: Introduce memory recover
Message-ID: <202205202014.mgqgBrKd-lkp@intel.com>
References: <20220520070648.1794132-4-pizhenwei@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220520070648.1794132-4-pizhenwei@bytedance.com>
Received-SPF: pass client-ip=192.55.52.151; envelope-from=lkp@intel.com;
 helo=mga17.intel.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on akpm-mm/mm-everything]
[also build test WARNING on next-20220519]
[cannot apply to linux/master linus/master v5.18-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/zhenwei-pi/recover-hardware-corrupted-page-by-virtio-balloon/20220520-151328
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
config: hexagon-randconfig-r041-20220519 (https://download.01.org/0day-ci/archive/20220520/202205202014.mgqgBrKd-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project e00cbbec06c08dc616a0d52a20f678b8fbd4e304)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/a42127073dd4adb6354649c8235c5cde033d01f2
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review zhenwei-pi/recover-hardware-corrupted-page-by-virtio-balloon/20220520-151328
        git checkout a42127073dd4adb6354649c8235c5cde033d01f2
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/virtio/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/virtio/virtio_balloon.c:654:2: warning: unannotated fall-through between switch labels [-Wimplicit-fallthrough]
           default:
           ^
   drivers/virtio/virtio_balloon.c:654:2: note: insert 'break;' to avoid fall-through
           default:
           ^
           break; 
   1 warning generated.


vim +654 drivers/virtio/virtio_balloon.c

   593	
   594	static void recover_vq_handle_response(struct virtio_balloon *vb, unsigned int len)
   595	{
   596		struct __virtio_balloon_recover *in_vbr;
   597		struct virtio_balloon_recover *vbr;
   598		struct page *page;
   599		unsigned int pfns;
   600		u32 pfn0, pfn1;
   601		__u8 status;
   602	
   603		/* the response is not expected */
   604		if (unlikely(len != sizeof(struct __virtio_balloon_recover)))
   605			return;
   606	
   607		in_vbr = &vb->in_vbr;
   608		vbr = &in_vbr->vbr;
   609		if (unlikely(vbr->cmd != VIRTIO_BALLOON_R_CMD_RESPONSE))
   610			return;
   611	
   612		/* to make sure the contiguous balloon PFNs */
   613		for (pfns = 1; pfns < VIRTIO_BALLOON_PAGES_PER_PAGE; pfns++) {
   614			pfn0 = virtio32_to_cpu(vb->vdev, in_vbr->pfns[pfns - 1]);
   615			pfn1 = virtio32_to_cpu(vb->vdev, in_vbr->pfns[pfns]);
   616			if (pfn1 - pfn0 != 1)
   617				return;
   618		}
   619	
   620		pfn0 = virtio32_to_cpu(vb->vdev, in_vbr->pfns[0]);
   621		if (!pfn_valid(pfn0))
   622			return;
   623	
   624		pfn1 = -1;
   625		spin_lock(&vb->recover_page_list_lock);
   626		list_for_each_entry(page, &vb->corrupted_page_list, lru) {
   627			pfn1 = page_to_pfn(page);
   628			if (pfn1 == pfn0)
   629				break;
   630		}
   631		spin_unlock(&vb->recover_page_list_lock);
   632	
   633		status = vbr->status;
   634		switch (status) {
   635		case VIRTIO_BALLOON_R_STATUS_RECOVERED:
   636			if (pfn1 == pfn0) {
   637				spin_lock(&vb->recover_page_list_lock);
   638				list_del(&page->lru);
   639				balloon_page_push(&vb->recovered_page_list, page);
   640				spin_unlock(&vb->recover_page_list_lock);
   641				queue_work(system_freezable_wq, &vb->unpoison_memory_work);
   642				dev_info_ratelimited(&vb->vdev->dev, "recovered pfn 0x%x", pfn0);
   643			}
   644			break;
   645		case VIRTIO_BALLOON_R_STATUS_FAILED:
   646			/* the hypervisor can't fix this corrupted page, balloon puts page */
   647			if (pfn1 == pfn0) {
   648				spin_lock(&vb->recover_page_list_lock);
   649				list_del(&page->lru);
   650				spin_unlock(&vb->recover_page_list_lock);
   651				put_page(page);
   652				dev_info_ratelimited(&vb->vdev->dev, "failed to recover pfn 0x%x", pfn0);
   653			}
 > 654		default:
   655			break;
   656		};
   657	
   658		/* continue to get response from host side if the response gets handled successfully */
   659		recover_vq_get_response(vb);
   660	}
   661	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

