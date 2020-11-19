Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94ED62B9509
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 15:45:36 +0100 (CET)
Received: from localhost ([::1]:57362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kflBn-0005nk-L2
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 09:45:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kfl8I-0003wp-Lj
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 09:41:58 -0500
Received: from mx2.suse.de ([195.135.220.15]:58446)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kfl8F-0003th-Ep
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 09:41:58 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id EDBDEAA4F;
 Thu, 19 Nov 2020 14:41:53 +0000 (UTC)
Subject: Re: [PATCH for-6.0 0/6] Add HMP/QMP commands to query accelerator
To: Roman Bolshakov <r.bolshakov@yadro.com>, qemu-devel@nongnu.org
References: <20201116131011.26607-1-r.bolshakov@yadro.com>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <6ba77678-473a-0da1-f2d4-1fde46790972@suse.de>
Date: Thu, 19 Nov 2020 15:41:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201116131011.26607-1-r.bolshakov@yadro.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/19 08:08:39
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x (no timestamps) [generic]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ciao Roman,

On 11/16/20 2:10 PM, Roman Bolshakov wrote:
> Hi,
> 
> Management applications have no way to determine if certain accelerator
> is available. That complicates discovery of non-KVM accelerators.

are we thinking about how to make this future-proof when it comes to modularization efforts,
ie, when we get to fully modularized accelerator plugins?

Maybe too soon to consider, but still worth mentioning on my side I think.

Ciao,

Claudio

> 
> To address the issue, the series adds two commands:
> 
>   'query-accel' for QMP to be used by management apps, and
> 
>   'info accel' for HMP to replace 'info kvm' in future.
> 
> Thanks,
> Roman
> 
> Roman Bolshakov (6):
>   qapi: Add query-accel command
>   qapi: Rename KvmInfo to AccelInfo
>   qapi: Use qmp_query_accel() in qmp_query_kvm()
>   softmmu: Remove kvm_available()
>   hmp: Add 'info accel' command
>   qapi: Deprecate 'query-kvm'
> 
>  hmp-commands-info.hx       | 13 +++++++++++++
>  include/monitor/hmp.h      |  1 +
>  include/sysemu/arch_init.h |  1 -
>  monitor/hmp-cmds.c         | 36 ++++++++++++++++++++++++++++++++++--
>  monitor/qmp-cmds.c         | 18 ++++++++++++++----
>  qapi/machine.json          | 37 ++++++++++++++++++++++++++++++-------
>  softmmu/arch_init.c        |  9 ---------
>  7 files changed, 92 insertions(+), 23 deletions(-)
> 


