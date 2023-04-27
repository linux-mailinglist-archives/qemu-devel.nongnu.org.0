Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 362BB6EFF03
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 03:43:01 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prqdc-0003tD-Bc; Wed, 26 Apr 2023 21:41:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tao1.su@linux.intel.com>)
 id 1prqdZ-0003rs-Ts
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 21:41:34 -0400
Received: from mga02.intel.com ([134.134.136.20])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tao1.su@linux.intel.com>)
 id 1prqdX-0004va-Vt
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 21:41:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682559692; x=1714095692;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=jdOkRulaF+3HnW1Sza6KlsYXUx4Mx/Ystr+vMh5GHLY=;
 b=CBUbcoOkL8rEoTYN7X2DvNBWxuhoN3iVux+N0w7Lw+tbiAXNpvyoxys2
 tPD+nfMuIltwv0WOC+nAc9wlyJPWBasq362IXE5B/vMShZI43IVJYs0JF
 0FJjz4yMMFAQRanYcL2YidMGTXR0VjG/J/rjgRsTPGZcA1GdHxjLs1RWT
 KPBOSyDu/1MVCpGHGAOLeXKXjz9ESHvROjL/PhKK9/T/MYzmdbOrWGZQy
 2YupgKXAEnu94pCRKz8PfDPK5HEUi7NpFNITp4FohAxeYuu1wlzPAASyT
 ApFEFCG3cokDakB9qQmF7nY/phvRbQwgrW2JchdPDg4zK8ghcV0W4sjMj A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="336226908"
X-IronPort-AV: E=Sophos;i="5.99,229,1677571200"; d="scan'208";a="336226908"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2023 18:41:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="724674949"
X-IronPort-AV: E=Sophos;i="5.99,229,1677571200"; d="scan'208";a="724674949"
Received: from linux.bj.intel.com ([10.238.156.127])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2023 18:41:25 -0700
Date: Thu, 27 Apr 2023 09:39:49 +0800
From: Tao Su <tao1.su@linux.intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, richard.henderson@linaro.org,
 yang.zhong@intel.com, jing2.liu@intel.com, vkuznets@redhat.com,
 philmd@linaro.org
Subject: Re: [PATCH v2 0/6] target/i386: Support new Intel platform
 Instructions in CPUID enumeration
Message-ID: <ZEnSZZvohDv4NvYk@linux.bj.intel.com>
References: <20230303065913.1246327-1-tao1.su@linux.intel.com>
 <20230426122418.41074-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230426122418.41074-1-pbonzini@redhat.com>
Received-SPF: none client-ip=134.134.136.20;
 envelope-from=tao1.su@linux.intel.com; helo=mga02.intel.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Wed, Apr 26, 2023 at 02:24:18PM +0200, Paolo Bonzini wrote:
> Queued, thanks.
> 
> Paolo
> 

Paolo, thanks!

Tao

