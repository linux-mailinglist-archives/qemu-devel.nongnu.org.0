Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07A3E3296CE
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 09:12:54 +0100 (CET)
Received: from localhost ([::1]:45460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lH09E-0002jO-Ql
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 03:12:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lH07z-0002ET-MH
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 03:11:35 -0500
Received: from mx2.suse.de ([195.135.220.15]:54398)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lH07x-0007ZR-E4
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 03:11:35 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E7C62AE3C;
 Tue,  2 Mar 2021 08:11:31 +0000 (UTC)
Subject: Re: [RFC v2 12/24] target/arm: move cpsr_read, cpsr_write to
 cpu_common
To: Richard Henderson <richard.henderson@linaro.org>
References: <20210301164936.19446-1-cfontana@suse.de>
 <20210301164936.19446-13-cfontana@suse.de>
 <de4d984f-031c-b5c7-095c-86fc5d2ff338@linaro.org>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <cf654296-0b8a-3d6f-b285-7e34809287e8@suse.de>
Date: Tue, 2 Mar 2021 09:11:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <de4d984f-031c-b5c7-095c-86fc5d2ff338@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/2/21 5:02 AM, Richard Henderson wrote:
> On 3/1/21 8:49 AM, Claudio Fontana wrote:
>> we need as a result to move switch_mode too,
>> so we put an implementation into cpu_user and cpu_sysemu.
>>
>> Signed-off-by: Claudio Fontana<cfontana@suse.de>
>> ---
>>   target/arm/cpu.h        |   2 +
>>   target/arm/cpu-common.c | 182 +++++++++++++++++++++++++++++++++
>>   target/arm/cpu-sysemu.c |  29 ++++++
>>   target/arm/cpu-user.c   |  24 +++++
>>   target/arm/tcg/helper.c | 221 ----------------------------------------
>>   target/arm/meson.build  |   3 +
>>   6 files changed, 240 insertions(+), 221 deletions(-)
>>   create mode 100644 target/arm/cpu-user.c
> 
> Some commentary about what cpu-common.c is meant to be would be helpful.  So 
> far it looks like helper.c under a different name.
> 
> r~
> 

In the intention,

cpu-common.c, cpu-sysemu.c, cpu-user.c

cpu-common.c: cpu class definitions and functions common between sysemu and user
cpu-sysemu.c: sysemu-only cpu class definitions and functions
cpu-user.c: user-only

I agree that things need improving to get there, 
will take a good look,

thanks,

C




