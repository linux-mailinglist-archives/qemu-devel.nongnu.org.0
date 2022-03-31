Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93A224ED64E
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 10:55:41 +0200 (CEST)
Received: from localhost ([::1]:52848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZqai-0007ec-Lm
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 04:55:40 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1nZqWo-0005XR-UJ
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 04:51:39 -0400
Received: from mga04.intel.com ([192.55.52.120]:62670)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1nZqWm-0000gz-KY
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 04:51:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648716696; x=1680252696;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=AJhSb2adOnH4x8zWZD1Xoit68/Zd7wJssWmMSp6l/Ls=;
 b=X4HEqc4nxr3LYWqdmtOpenQfd1myRpTenkfdJDEOmk3FfPT0MRTQaA9r
 Sc0Be6MUjm888iHkAqXp71Ohl549Dd8fNLs1b2Q1nw/8QWxR+ASKg1Wpx
 L74TDEUhBuJoAHQf8IwSENpNxBrhqROOX42K9+K1NVcvOatOgzrcW5vW8
 zTnCVMDgxjlDQb7Xu4/XjyzLARz87U7t5otS+F3OfTtxkQ940hlQrglzW
 0KR5agTpT9PV9RT39wysifmYwcxpBN50FxwCDVTmoMQQN76q7yEprbzqh
 CjGGN7/XQtvZ0FFhhjW1yovEq+Oy/cthhtiVMqlb56k7Mnor8ZMFit745 g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10302"; a="258594940"
X-IronPort-AV: E=Sophos;i="5.90,224,1643702400"; d="scan'208";a="258594940"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2022 01:51:33 -0700
X-IronPort-AV: E=Sophos;i="5.90,224,1643702400"; d="scan'208";a="547232848"
Received: from xiaoyaol-hp-g830.ccr.corp.intel.com (HELO [10.249.193.1])
 ([10.249.193.1])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2022 01:51:29 -0700
Message-ID: <1d5b0192-75ef-49ad-dc47-cfc0c3c63455@intel.com>
Date: Thu, 31 Mar 2022 16:51:27 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.6.1
Subject: Re: [RFC PATCH v3 17/36] pflash_cfi01/tdx: Introduce ram_mode of
 pflash for TDVF
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20220317135913.2166202-1-xiaoyao.li@intel.com>
 <20220317135913.2166202-18-xiaoyao.li@intel.com>
 <f418548e-c24c-1bc3-4e16-d7a775298a18@gmail.com>
 <7a8233e4-0cae-b05a-7931-695a7ee87fc9@intel.com>
 <YjmWhMVx80/BFY8z@redhat.com>
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <YjmWhMVx80/BFY8z@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.120; envelope-from=xiaoyao.li@intel.com;
 helo=mga04.intel.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.998, HK_RANDOM_FROM=0.998, NICE_REPLY_A=-0.001,
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
Cc: isaku.yamahata@intel.com, Marcelo Tosatti <mtosatti@redhat.com>,
 kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Connor Kuehl <ckuehl@redhat.com>, Eric Blake <eblake@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philippe.mathieu.daude@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, seanjc@google.com, erdemaktas@google.com,
 Paolo Bonzini <pbonzini@redhat.com>, Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/22/2022 5:27 PM, Daniel P. Berrangé wrote:
...
> IMHO the AmdSev build for OVMF gets this right by entirely disabling
> the split OVMF_CODE.fd vs OVMF_VARS.fd, and just having a single
> OVMF.fd file that is exposed read-only to the guest.
> 
> This is further represented in $QEMU.git/docs/interop/firmware.json
> by marking the firmware as 'stateless', which apps like libvirt will
> use to figure out what QEMU command line to pick.

Hi Daniel,

I don't play with AMD SEV and I'm not sure if AMD SEV requires only 
single OVMF.fd. But IIUC, from edk2

commit 437eb3f7a8db ("OvmfPkg/QemuFlashFvbServicesRuntimeDxe: Bypass 
flash detection with SEV-ES")

, AMD SEV(-ES) does support NVRAM via proactive VMGEXIT MMIO 
QemuFlashWrite(). If so, AMD SEV seems to be able to support split OVMF, 
right?

> IOW, if you don't want OVMF_VARS.fd to be written to, then follow
> what AmdSev has done, and get rid of the split files.
> 
> 
> With regards,
> Daniel


