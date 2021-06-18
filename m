Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 099203AC026
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 02:37:20 +0200 (CEST)
Received: from localhost ([::1]:36204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lu2Va-0006bW-SI
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 20:37:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1lu2UQ-0005qy-Sk
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 20:36:06 -0400
Received: from prt-mail.chinatelecom.cn ([42.123.76.223]:51908
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1lu2UN-0001X6-Tl
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 20:36:06 -0400
HMM_SOURCE_IP: 172.18.0.48:34950.79047676
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-10.133.8.242?logid-7cd7d4bac80642a189c31f944b33e0ef
 (unknown [172.18.0.48])
 by chinatelecom.cn (HERMES) with SMTP id D007C2800AD;
 Fri, 18 Jun 2021 08:35:51 +0800 (CST)
X-189-SAVE-TO-SEND: huangy81@chinatelecom.cn
Received: from  ([172.18.0.48])
 by app0024 with ESMTP id 7cd7d4bac80642a189c31f944b33e0ef for
 zhengchuan@huawei.com; Fri Jun 18 08:35:53 2021
X-Transaction-ID: 7cd7d4bac80642a189c31f944b33e0ef
X-filter-score: filter<0>
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 172.18.0.48
X-MEDUSA-Status: 0
Subject: Re: [PATCH v7 4/7] migration/dirtyrate: introduce struct and adjust
 DirtyRateStat
To: Peter Xu <peterx@redhat.com>
References: <cover.1623938622.git.huangy81@chinatelecom.cn>
 <d91f66916a28327105f62919092224a403a0067f.1623938622.git.huangy81@chinatelecom.cn>
 <YMtpxwcxQgVKork7@t490s>
From: Hyman Huang <huangy81@chinatelecom.cn>
Message-ID: <0001fc97-1ad1-613e-a60e-96a39e205ede@chinatelecom.cn>
Date: Fri, 18 Jun 2021 08:35:48 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YMtpxwcxQgVKork7@t490s>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.223;
 envelope-from=huangy81@chinatelecom.cn; helo=chinatelecom.cn
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.254,
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



在 2021/6/17 23:27, Peter Xu 写道:
> On Thu, Jun 17, 2021 at 10:12:05PM +0800, huangy81@chinatelecom.cn wrote:
>>   ##
>> +# @DirtyRateMeasureMode:
>> +#
>> +# An enumeration of mode of measuring dirtyrate.
>> +#
>> +# @page-sampling: calculate dirtyrate by sampling pages.
>> +#
>> +# @dirty-ring: calculate dirtyrate by via dirty ring.
>> +#
>> +# Since: 6.1
>> +#
>> +##
>> +{ 'enum': 'DirtyRateMeasureMode',
>> +  'data': [ 'none', 'page-sampling', 'dirty-ring'] }
> 
> I still don't get why we need "none" mode.  Could you explain?
> 
sorry, forget about this modification

-- 
Best regard

Hyman Huang(黄勇)

