Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 381804913EC
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 03:10:47 +0100 (CET)
Received: from localhost ([::1]:45586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9dxO-0005JW-BG
	for lists+qemu-devel@lfdr.de; Mon, 17 Jan 2022 21:10:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1n9dvF-0003Pr-Vk
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 21:08:33 -0500
Received: from prt-mail.chinatelecom.cn ([42.123.76.228]:33595
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1n9dvD-0002Aw-G0
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 21:08:33 -0500
HMM_SOURCE_IP: 172.18.0.188:54978.1718758930
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-182.150.57.243 (unknown [172.18.0.188])
 by chinatelecom.cn (HERMES) with SMTP id 5A4A728012B;
 Tue, 18 Jan 2022 10:08:08 +0800 (CST)
X-189-SAVE-TO-SEND: huangy81@chinatelecom.cn
Received: from  ([172.18.0.188])
 by app0023 with ESMTP id 24215f1e3c7f4d4aa41287c0d20f6c68 for
 peterx@redhat.com; Tue, 18 Jan 2022 10:08:21 CST
X-Transaction-ID: 24215f1e3c7f4d4aa41287c0d20f6c68
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 172.18.0.188
X-MEDUSA-Status: 0
Message-ID: <dbc349be-48e5-64e8-4358-f8387161747f@chinatelecom.cn>
Date: Tue, 18 Jan 2022 10:08:00 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v11 3/4] softmmu/dirtylimit: implement virtual CPU throttle
To: Peter Xu <peterx@redhat.com>
References: <cover.1641316375.git.huangy81@chinatelecom.cn>
 <0381e32c2cc70613613aaa284b8e8c9760d6932f.1641316375.git.huangy81@chinatelecom.cn>
 <YeUbhC7MG32K9pxu@xz-m1.local>
 <1b41a2ed-4d78-6221-88c4-2b14bad6bd70@chinatelecom.cn>
 <YeYRNHsmZJneG/x5@xz-m1.local>
From: Hyman Huang <huangy81@chinatelecom.cn>
In-Reply-To: <YeYRNHsmZJneG/x5@xz-m1.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.228;
 envelope-from=huangy81@chinatelecom.cn; helo=chinatelecom.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>, David Hildenbrand <david@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Markus ArmBruster <armbru@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



在 2022/1/18 9:00, Peter Xu 写道:
> On Mon, Jan 17, 2022 at 10:00:57PM +0800, Hyman Huang wrote:
>>> This algorithm seems works even worse than the previous version, could you have
>>> a look on what's wrong?
>> What number the dirty-ring-size of qemu be configured? is it the same as
>> previous version test?
> 
> It should be the same 4096.
> 
> The test environment can be slightly different, I used a larger guest this time
> (20G, 40 cores), though.  Previously it should be a few gig only with a few cores.
> 
Ok, i'll work this out.
> Side note: would you also consider picking up this patch along with the series?
> 
Of course yes, i think this patch can reduce time overhead of 
memory_global_dirty_log_start/memory_global_dirty_log_stop but need some 
migration tests, i'll do that and once all these be ready, i'll cherry 
pick the series before dirtylimit patchset.
> https://lore.kernel.org/qemu-devel/20211130080028.6474-1-peterx@redhat.com/
> 
> I wanted to make sure it lands before this series, e.g., when enabled both
> dirty limit and migration, disabling dirty limit might trigger the bug already.
>  > Thanks,
> 

-- 
Best regard

Hyman Huang(黄勇)

