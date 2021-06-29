Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73B613B72FA
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 15:10:22 +0200 (CEST)
Received: from localhost ([::1]:40900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyDVN-0002ag-29
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 09:10:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1lyDQ4-0004Ee-NQ
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 09:04:52 -0400
Received: from prt-mail.chinatelecom.cn ([42.123.76.228]:38303
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1lyDQ2-0008Uo-AB
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 09:04:52 -0400
HMM_SOURCE_IP: 172.18.0.218:33070.984371018
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-125.69.43.101?logid-50b45c0964ce43d28c81cb2b80903ad8
 (unknown [172.18.0.218])
 by chinatelecom.cn (HERMES) with SMTP id 38B47280098;
 Tue, 29 Jun 2021 21:04:27 +0800 (CST)
X-189-SAVE-TO-SEND: huangy81@chinatelecom.cn
Received: from  ([172.18.0.218])
 by app0025 with ESMTP id 50b45c0964ce43d28c81cb2b80903ad8 for
 zhengchuan@huawei.com; Tue Jun 29 21:04:41 2021
X-Transaction-ID: 50b45c0964ce43d28c81cb2b80903ad8
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
From: Hyman <huangy81@chinatelecom.cn>
Message-ID: <effca94d-ccb3-846f-3e8d-134d67a52f2e@chinatelecom.cn>
Date: Tue, 29 Jun 2021 21:04:07 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YNpV0q1nEF3NiNSt@t490s>
Content-Type: text/plain; charset=utf-8; format=flowed
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



在 2021/6/29 7:05, Peter Xu 写道:
> On Mon, Jun 28, 2021 at 12:27:46AM +0800, huangy81@chinatelecom.cn wrote:
>> +static void dirtyrate_global_dirty_log_stop(void)
>> +{
>> +    qemu_mutex_lock_iothread();
> 
> One thing I missed: maybe we want to sync dirty before stop, so the value will
> be more accurate.  Perhaps a call to memory_global_dirty_log_sync() here?
seems good, if the dirty ring reaper is sleeping, we can sync log by 
ourselves, making dirtyrate more accurate.
> 
>> +    memory_global_dirty_log_stop(GLOBAL_DIRTY_DIRTY_RATE);
>> +    qemu_mutex_unlock_iothread();
>> +}
> 

