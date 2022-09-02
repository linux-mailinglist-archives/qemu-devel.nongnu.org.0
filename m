Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19CB45AB354
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Sep 2022 16:22:41 +0200 (CEST)
Received: from localhost ([::1]:57368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oU7Z9-0000PS-Q2
	for lists+qemu-devel@lfdr.de; Fri, 02 Sep 2022 10:22:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1oU7St-0004jI-OI
 for qemu-devel@nongnu.org; Fri, 02 Sep 2022 10:16:12 -0400
Received: from prt-mail.chinatelecom.cn ([42.123.76.223]:57062
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1oU7Sr-0000ST-1a
 for qemu-devel@nongnu.org; Fri, 02 Sep 2022 10:16:11 -0400
HMM_SOURCE_IP: 172.18.0.48:48680.755081985
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-10.133.8.31 (unknown [172.18.0.48])
 by chinatelecom.cn (HERMES) with SMTP id C99D12800B7;
 Fri,  2 Sep 2022 22:15:54 +0800 (CST)
X-189-SAVE-TO-SEND: huangy81@chinatelecom.cn
Received: from  ([172.18.0.48])
 by app0024 with ESMTP id 4ba6c590f7eb49f2990d704659e3c866 for
 armbru@redhat.com; Fri, 02 Sep 2022 22:15:57 CST
X-Transaction-ID: 4ba6c590f7eb49f2990d704659e3c866
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 172.18.0.48
X-MEDUSA-Status: 0
Message-ID: <ba9baa48-a82b-16cc-a902-2dd63194420a@chinatelecom.cn>
Date: Fri, 2 Sep 2022 22:15:53 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v1 3/8] migration: Introduce dirty-limit capability
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Blake <eblake@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>
References: <cover.1662052189.git.huangy81@chinatelecom.cn>
 <cover.1662052189.git.huangy81@chinatelecom.cn>
 <fb2a51fcf30d927a2512b397cd2dc6f34c3936c4.1662052189.git.huangy81@chinatelecom.cn>
 <87y1v2w65q.fsf@pond.sub.org>
From: Hyman Huang <huangy81@chinatelecom.cn>
In-Reply-To: <87y1v2w65q.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.223;
 envelope-from=huangy81@chinatelecom.cn; helo=chinatelecom.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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



在 2022/9/2 16:07, Markus Armbruster 写道:
> huangy81@chinatelecom.cn writes:
> 
>> From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
>>
>> Introduce migration dirty-limit capability, which can
>> be turned on before live migration and limit dirty
>> page rate durty live migration.
>>
>> Introduce migrate_dirty_limit function to help check
>> if dirty-limit capability enabled during live migration.
>>
>> Meanwhile, refactor vcpu_dirty_rate_stat_collect
>> so that period can be configured instead of hardcoded.
>>
>> dirty-limit capability is kind of like auto-converge
>> but using dirty limit instead of traditional cpu-throttle
>> to throttle guest down. To enable this feature, turn on
>> the dirty-limit capability before live migration using
>> migratioin-set-capabilities, and set the parameters
> 
> migrate-set-capabilities
> 
>> "x-vcpu-dirty-limit-period", "vcpu-dirty-limit" suitably
> 
> "x-vcpu-dirty-limit"
> 
>> to speed up convergence.
>>
>> Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
> 
> Hmm.  You make dirty-limiting as a whole a stable interface (evidence:
> capability "dirty-limit" is stable), but keep its two parameters
> unstable.  Rationale behind that?
> 
Thanks Markus's comments. :)

x-vcpu-dirty-limit-period is an experimental parameter indeed, as to 
x-vcpu-dirty-limit, i think it's resonable to be a stable parameter.
These 2 parameters are introduced first time and none of them suffer 
heavily tests, so i also made vcpu-dirty-limit experimental last version.

For dirty-limit interface, it improves the vCPU computational 
performance during migration indeed(see the test results in cover 
letter), so it sounds ok to be an stable interface.

The 'x-vcpu-dirty-limit-period' parameter can be dropped, IMHO, after 
being proved insignificant for migration in the future, and meanwhile, 
x-vcpu-dirty-limit be made stable.

Since I don't have much experience to introducing fresh new interface,
any suggestions are welcome.

-- 
Best regard

Hyman Huang(黄勇)

