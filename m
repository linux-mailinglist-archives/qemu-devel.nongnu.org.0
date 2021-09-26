Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 683E8418697
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Sep 2021 07:23:29 +0200 (CEST)
Received: from localhost ([::1]:41004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUMdM-0004EL-GP
	for lists+qemu-devel@lfdr.de; Sun, 26 Sep 2021 01:23:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1mUMbk-00032l-DA
 for qemu-devel@nongnu.org; Sun, 26 Sep 2021 01:21:48 -0400
Received: from mga09.intel.com ([134.134.136.24]:50126)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1mUMbh-000093-UQ
 for qemu-devel@nongnu.org; Sun, 26 Sep 2021 01:21:47 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10118"; a="224346456"
X-IronPort-AV: E=Sophos;i="5.85,323,1624345200"; d="scan'208";a="224346456"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2021 22:21:41 -0700
X-IronPort-AV: E=Sophos;i="5.85,323,1624345200"; d="scan'208";a="560440534"
Received: from xiaoyaol-mobl.ccr.corp.intel.com (HELO [10.239.13.122])
 ([10.239.13.122])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2021 22:21:40 -0700
Subject: Re: [RFC PATCH 0/5] Make Intel PT configurable
To: Paolo Bonzini <pbonzini@redhat.com>, Marcelo Tosatti
 <mtosatti@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>
References: <20210909144150.1728418-1-xiaoyao.li@intel.com>
From: Xiaoyao Li <xiaoyao.li@intel.com>
Message-ID: <7d3c77dc-16d2-d281-1e0b-3a26acac82cb@intel.com>
Date: Sun, 26 Sep 2021 13:21:38 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20210909144150.1728418-1-xiaoyao.li@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=134.134.136.24; envelope-from=xiaoyao.li@intel.com;
 helo=mga09.intel.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, HK_RANDOM_ENVFROM=0.623,
 HK_RANDOM_FROM=0.998, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ping...

Eduardo, could you please take a look at this series.

Thanks!
-Xiaoyao

On 9/9/2021 10:41 PM, Xiaoyao Li wrote:
> Initial Intel PT support was added by making it as fixed feature set as
> ICX's capabilities, which allowed different CPU model with PT enabled
> live migration on ICX host. However, it breaks the PT exposure/working
> on SPR machine. Because SPR has less PT capabilities regrading
> CPUID(0x14,1):EBX[15:0].
> 
> This series aims to make Intel PT configurable that named CPU model can
> define its own PT feature set and "-cpu host/max" can use the host pass
> through feature set of PT.
> 
> At the same time, it also ensure existing named CPU model to generate
> the same PT CPUID set as before to not break live migration.
> 
> Xiaoyao Li (5):
>    target/i386: Print CPUID subleaf info for unsupported feature
>    target/i386: Introduce FeatureWordInfo for Intel PT CPUID leaf 0xD
>    target/i386: Enable host pass through of Intel PT
>    target/i386: Define specific PT feature set for IceLake-server and
>      Snowridge
>    target/i386: Access MSR_IA32_RTIT_ADDRn based on guest CPUID
>      configuration
> 
>   target/i386/cpu.c     | 215 ++++++++++++++++++++++++++++--------------
>   target/i386/cpu.h     |  40 +++++++-
>   target/i386/kvm/kvm.c |   8 +-
>   3 files changed, 186 insertions(+), 77 deletions(-)
> 


