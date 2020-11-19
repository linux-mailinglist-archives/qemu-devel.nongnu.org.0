Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BF1D2B9708
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 16:56:36 +0100 (CET)
Received: from localhost ([::1]:39702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfmIV-0001xd-7X
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 10:56:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kfmGn-0000n8-0O
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 10:54:49 -0500
Received: from mx2.suse.de ([195.135.220.15]:44246)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kfmGl-0006ig-7j
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 10:54:48 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 88B4EAA4F;
 Thu, 19 Nov 2020 15:54:45 +0000 (UTC)
Subject: Re: [PATCH for-6.0 0/6] Add HMP/QMP commands to query accelerator
To: Roman Bolshakov <r.bolshakov@yadro.com>
References: <20201116131011.26607-1-r.bolshakov@yadro.com>
 <6ba77678-473a-0da1-f2d4-1fde46790972@suse.de>
 <20201119154650.GG81070@SPB-NB-133.local>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <e7892cfc-ca17-42e0-94fe-974f642b146c@suse.de>
Date: Thu, 19 Nov 2020 16:54:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201119154650.GG81070@SPB-NB-133.local>
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/19/20 4:46 PM, Roman Bolshakov wrote:
> On Thu, Nov 19, 2020 at 03:41:53PM +0100, Claudio Fontana wrote:
>> On 11/16/20 2:10 PM, Roman Bolshakov wrote:
>>> Management applications have no way to determine if certain accelerator
>>> is available. That complicates discovery of non-KVM accelerators.
>>
>> are we thinking about how to make this future-proof when it comes to
>> modularization efforts, ie, when we get to fully modularized
>> accelerator plugins?
>>
>> Maybe too soon to consider, but still worth mentioning on my side I think.
>>
> 
> Hi Claudio,
> 
> I'd be happy to do it future-proof if you have something on the mind.
> As far as I understand from the discussion, if we have /machine/accel
> container, we can use QOM to query properties of the container including
> accel name:
> qom-get /machine/accel/type
> 
> Thanks,
> Roman
> 

My understanding is very limited here, especially when it comes then to how libvirt f.e. uses this,

I wonder how to make sure that libvirt does not query the currently selected accelerator "too early",
ie before it has been finally selected (what in the other series I called the INIT_ACCEL_CPU time),

and how to query "available/supported" accelerators in a way that accounts for the fact that the plugin might not be loaded or available.

I guess this is a larger question about how libvirt detects modularized features in QEMU, when those features are (or are not) present only in an external binary plugin.

Ciao,

Claudio


