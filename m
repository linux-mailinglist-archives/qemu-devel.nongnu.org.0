Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 309A33AD095
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 18:38:25 +0200 (CEST)
Received: from localhost ([::1]:56536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luHVf-0008OR-RQ
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 12:38:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1luHUM-0007XC-5x
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 12:37:02 -0400
Received: from prt-mail.chinatelecom.cn ([42.123.76.219]:59975
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1luHUI-0002PX-EK
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 12:37:01 -0400
HMM_SOURCE_IP: 172.18.0.48:53130.1528791349
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-125.69.42.195?logid-ac742851e1b64a43a8728fab4d842185
 (unknown [172.18.0.48])
 by chinatelecom.cn (HERMES) with SMTP id 9039828009C;
 Sat, 19 Jun 2021 00:36:45 +0800 (CST)
X-189-SAVE-TO-SEND: huangy81@chinatelecom.cn
Received: from  ([172.18.0.48])
 by app0024 with ESMTP id ac742851e1b64a43a8728fab4d842185 for
 zhengchuan@huawei.com; Sat Jun 19 00:36:46 2021
X-Transaction-ID: ac742851e1b64a43a8728fab4d842185
X-filter-score: filter<0>
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 172.18.0.48
X-MEDUSA-Status: 0
Subject: Re: [PATCH v8 0/6] support dirtyrate at the granualrity of vcpu
To: Peter Xu <peterx@redhat.com>
References: <cover.1624028590.git.huangy81@chinatelecom.cn>
 <YMzDAjeyK3at9DUu@t490s>
From: Hyman <huangy81@chinatelecom.cn>
Message-ID: <53b0d3cd-21aa-6446-bdbd-74e5c49eb2d5@chinatelecom.cn>
Date: Sat, 19 Jun 2021 00:36:30 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YMzDAjeyK3at9DUu@t490s>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.219;
 envelope-from=huangy81@chinatelecom.cn; helo=chinatelecom.cn
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.202,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Chuan Zheng <zhengchuan@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



在 2021/6/19 0:00, Peter Xu 写道:
> On Fri, Jun 18, 2021 at 11:32:01PM +0800, huangy81@chinatelecom.cn wrote:
>> From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
>>
>> v8
> 
> I have one last comment in patch 2, the rest looks good to me, thanks.
> 
> I think the next step can be that we add another command to configure dirty
> rate limit for each of the vcpu.  It can be the 3rd bit in the
> global_dirty_tracking and it should require dirty ring too to be there, but I
> haven't thought deeper..  Then after that, we may teach migration code some
> algorithm to auto-setup these per-vcpu throttling, it'll grow into some kind of
> per-vcpu auto-converge.
> 
> Do you think above would be something worth trying out?  And.. Dave/Paolo/Juan?
> 
from my point, absolutely yes, since we have introduced the dirty ring, 
the most valuable sicenario i think is to improve migration or at least 
provide another auto-converge implementation to management apps, it 
seems that there is no reason not trying this.
> Btw, this series cannot apply cleanly to master here.  Maybe you need to pull
> and rebase?
Ok, i'll rebase and post another version later, may be commit "KVM: Fix 
dirty ring mmap incorrect size due to renaming accident" should be 
merged before this, so that dirty rate calculation can work rightly.
> 

