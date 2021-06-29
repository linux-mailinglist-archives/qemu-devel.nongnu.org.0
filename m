Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40EE63B761A
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 18:02:40 +0200 (CEST)
Received: from localhost ([::1]:54528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyGC6-0001LX-Gu
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 12:02:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1lyG90-0008Ks-Ag
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 11:59:26 -0400
Received: from prt-mail.chinatelecom.cn ([42.123.76.223]:60672
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1lyG8s-0000lO-0d
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 11:59:26 -0400
HMM_SOURCE_IP: 172.18.0.218:56924.1861699751
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-125.69.43.101?logid-1bc8e45be66349178d2787d7e3a7398f
 (unknown [172.18.0.218])
 by chinatelecom.cn (HERMES) with SMTP id 1D365280029;
 Tue, 29 Jun 2021 23:59:08 +0800 (CST)
X-189-SAVE-TO-SEND: huangy81@chinatelecom.cn
Received: from  ([172.18.0.218])
 by app0025 with ESMTP id 1bc8e45be66349178d2787d7e3a7398f for
 zhengchuan@huawei.com; Tue Jun 29 23:59:09 2021
X-Transaction-ID: 1bc8e45be66349178d2787d7e3a7398f
X-filter-score: 
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 172.18.0.218
X-MEDUSA-Status: 0
Subject: Re: [PATCH v10 6/6] migration/dirtyrate: implement dirty-ring
 dirtyrate calculation
To: Peter Xu <peterx@redhat.com>
References: <cover.1624811188.git.huangy81@chinatelecom.cn>
 <e0cc5b347011b1cef06ff95446bf8b3d6a6584b0.1624811188.git.huangy81@chinatelecom.cn>
 <YNpV0q1nEF3NiNSt@t490s>
 <effca94d-ccb3-846f-3e8d-134d67a52f2e@chinatelecom.cn>
 <YNs52rBi2bqiNq3e@t490s>
From: Hyman <huangy81@chinatelecom.cn>
Message-ID: <e9b81dfb-c6fd-2b14-4b88-55bd33705058@chinatelecom.cn>
Date: Tue, 29 Jun 2021 23:58:52 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YNs52rBi2bqiNq3e@t490s>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.223;
 envelope-from=huangy81@chinatelecom.cn; helo=chinatelecom.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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



在 2021/6/29 23:18, Peter Xu 写道:
> On Tue, Jun 29, 2021 at 09:04:07PM +0800, Hyman wrote:
>>
>>
>> 在 2021/6/29 7:05, Peter Xu 写道:
>>> On Mon, Jun 28, 2021 at 12:27:46AM +0800, huangy81@chinatelecom.cn wrote:
>>>> +static void dirtyrate_global_dirty_log_stop(void)
>>>> +{
>>>> +    qemu_mutex_lock_iothread();
>>>
>>> One thing I missed: maybe we want to sync dirty before stop, so the value will
>>> be more accurate.  Perhaps a call to memory_global_dirty_log_sync() here?
>> seems good, if the dirty ring reaper is sleeping, we can sync log by
>> ourselves, making dirtyrate more accurate.
> 
> Btw, I commented here because there has the bql so it's easier; please still
> remember to record the pages after sync is done!  Otherwise it'll be an effort
> of no real use (which I think that's missing in your latest repost..).
my fault, not examing the code.
> 

