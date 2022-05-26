Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 044E153491A
	for <lists+qemu-devel@lfdr.de>; Thu, 26 May 2022 04:58:00 +0200 (CEST)
Received: from localhost ([::1]:46154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nu3hH-0006MR-4c
	for lists+qemu-devel@lfdr.de; Wed, 25 May 2022 22:57:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1nu3ep-0004fz-SU
 for qemu-devel@nongnu.org; Wed, 25 May 2022 22:55:27 -0400
Received: from mga06b.intel.com ([134.134.136.31]:12154 helo=mga06.intel.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1nu3eo-0003UC-2G
 for qemu-devel@nongnu.org; Wed, 25 May 2022 22:55:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653533726; x=1685069726;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=SKSXqfdXaFViFgqPYeu8IfF3uZqYneWIagraOmfAULU=;
 b=JNIZnqyznyZugWDTBgWKPk8IB6x/mCeBp38K4CrFpBVAeZC9Yw9z0mVA
 dGNGnuYB0PFlB8jtu3+8LdK/1qiCkg9Z/DuLm1XxlAS8dh7bLopSGf6vg
 JfeLNuCrImJVn9KbnGfwiXBmf+S9xKyGSuG1NexThwrkn7OcNHxFWJw8s
 Y6X+kwa2cKm1+8kQvJcb32+xNcPpOBKe8FfFLyNGomtQ5hY8T6bI/JW78
 FmgC5P+ZlDyRZ/XhfRhmwyWC/gTgRurarFkIvP/rtigWEpef+jSKEU0kz
 aA2jp2WoGYA91cqRAiAoTKRqGZmNgUjTnZ6TErJvRxYxvpY4KQ7D4Xpio w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10358"; a="334650393"
X-IronPort-AV: E=Sophos;i="5.91,252,1647327600"; d="scan'208";a="334650393"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2022 19:52:33 -0700
X-IronPort-AV: E=Sophos;i="5.91,252,1647327600"; d="scan'208";a="573642153"
Received: from xiaoyaol-hp-g830.ccr.corp.intel.com (HELO [10.255.28.212])
 ([10.255.28.212])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2022 19:52:28 -0700
Message-ID: <afec66bf-3fa1-b9fe-44b0-11bd32c97f51@intel.com>
Date: Thu, 26 May 2022 10:52:27 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.9.0
Subject: Re: [RFC PATCH v4 20/36] i386/tdx: Register a machine_init_done
 callback for TD
Content-Language: en-US
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Isaku Yamahata <isaku.yamahata@gmail.com>, isaku.yamahata@intel.com,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Cornelia Huck <cohuck@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>, Eric Blake <eblake@redhat.com>,
 Connor Kuehl <ckuehl@redhat.com>, erdemaktas@google.com,
 kvm@vger.kernel.org, qemu-devel@nongnu.org, seanjc@google.com
References: <20220512031803.3315890-1-xiaoyao.li@intel.com>
 <20220512031803.3315890-21-xiaoyao.li@intel.com>
 <20220524070932.rmkmunar6q6brdbo@sirius.home.kraxel.org>
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <20220524070932.rmkmunar6q6brdbo@sirius.home.kraxel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=134.134.136.31; envelope-from=xiaoyao.li@intel.com;
 helo=mga06.intel.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/24/2022 3:09 PM, Gerd Hoffmann wrote:
> On Thu, May 12, 2022 at 11:17:47AM +0800, Xiaoyao Li wrote:
>> Before a TD can run, it needs to
>>   - setup/configure TD HOB list;
>>   - initialize TDVF into TD's private memory;
>>   - initialize TD vcpu state;
>>
>> Register a machine_init_done callback to all those stuff.
> 
>> +static void tdx_finalize_vm(Notifier *notifier, void *unused)
>> +{
>> +    /* TODO */
>> +}
> 
> I'd suggest to squash this into the patch actually implementing
> tdx_finalize_vm.

OK. I'll squash it into the next patch.

> take care,
>    Gerd
> 


