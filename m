Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ECA63CC0CE
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Jul 2021 04:59:12 +0200 (CEST)
Received: from localhost ([::1]:56642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4aXm-0002ad-VY
	for lists+qemu-devel@lfdr.de; Fri, 16 Jul 2021 22:59:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1m4aWp-0001wN-TO
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 22:58:11 -0400
Received: from prt-mail.chinatelecom.cn ([42.123.76.223]:42777
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1m4aWn-0004Ik-8r
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 22:58:11 -0400
HMM_SOURCE_IP: 172.18.0.218:58976.756743716
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-171.223.97.37?logid-7db4d6e1224b4b73a368c1467e182a32
 (unknown [172.18.0.218])
 by chinatelecom.cn (HERMES) with SMTP id C4B3B2800A6;
 Sat, 17 Jul 2021 10:57:53 +0800 (CST)
X-189-SAVE-TO-SEND: huangy81@chinatelecom.cn
Received: from  ([172.18.0.218])
 by app0025 with ESMTP id 7db4d6e1224b4b73a368c1467e182a32 for
 zhengchuan@huawei.com; Sat Jul 17 10:57:54 2021
X-Transaction-ID: 7db4d6e1224b4b73a368c1467e182a32
X-filter-score: 
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 172.18.0.218
X-MEDUSA-Status: 0
Subject: Re: [PATCH v6 2/2] migration/dirtyrate: implement dirty-bitmap
 dirtyrate calculation
To: Peter Xu <peterx@redhat.com>
References: <cover.1626433753.git.huangy81@chinatelecom.cn>
 <156478c0b13ea74783925bc6fc730452260c81dd.1626433753.git.huangy81@chinatelecom.cn>
 <YPHfxRAbsIhOFyKl@t490s>
From: Hyman <huangy81@chinatelecom.cn>
Message-ID: <7e12280a-db24-d947-fdb5-83b83f3ac814@chinatelecom.cn>
Date: Sat, 17 Jul 2021 10:57:50 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <YPHfxRAbsIhOFyKl@t490s>
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



在 2021/7/17 3:36, Peter Xu 写道:
> On Fri, Jul 16, 2021 at 07:13:47PM +0800, huangy81@chinatelecom.cn wrote:
>> +static void calculate_dirtyrate_dirty_bitmap(struct DirtyRateConfig config)
>> +{
>> +    int64_t msec = 0;
>> +    int64_t start_time;
>> +    DirtyPageRecord dirty_pages;
> 
> [1]
> 
>> +
>> +    dirtyrate_global_dirty_log_start();
>> +
>> +    /*
>> +     * 1'round of log sync may return all 1 bits with
>> +     * KVM_DIRTY_LOG_INITIALLY_SET enable
>> +     * skip it unconditionally and start dirty tracking
>> +     * from 2'round of log sync
>> +     */
>> +    dirtyrate_global_dirty_log_sync();
>> +
>> +    /*
>> +     * reset page protect manually and unconditionally.
>> +     * this make sure kvm dirty log be cleared if
>> +     * KVM_DIRTY_LOG_MANUAL_PROTECT_ENABLE cap is enabled.
>> +     */
>> +    dirtyrate_manual_reset_protect();
>> +
> 
> [2]
> 
>> +    record_dirtypages_bitmap(&dirty_pages, true);
> 
> [3]
> 
>> +
>> +    start_time = qemu_clock_get_ms(QEMU_CLOCK_REALTIME);
>> +    DirtyStat.start_time = start_time / 1000;
>> +
>> +    msec = config.sample_period_seconds * 1000;
>> +    msec = set_sample_page_period(msec, start_time);
>> +    DirtyStat.calc_time = msec / 1000;
>> +
>> +    /* fetch dirty bitmap from kvm and stop dirty tracking */
> 
> I don't think it really fetched anything..  So I think we need:
> 
>         dirtyrate_global_dirty_log_sync();
> 
> It seems to be there in older versions but not in the latest two versions.
yes, latest version dropped this because dirtyrate_global_dirty_log_stop 
below already do the sync before stop dirty log, which is recommended in 
patchset of "support dirtyrate at the granualrity of vcpu" and make 
dirtyrate more accurate. the older version do not consider this. :)
> 
> Please still remember to smoke the patches before posting, because without the
> log sync we'll read nothing.
> 
>> +    dirtyrate_global_dirty_log_stop();
>> +
>> +    record_dirtypages_bitmap(&dirty_pages, false);
> 
> [4]
> 
> I think it's easier we take bql at [1]/[3] and release at [2]/[4], rather than
> taking it for every function.  Then we can move the bql operations out of
> dirtyrate_global_dirty_log_stop() in this patch.
yeah, take bql at [1] and release at [2] is reasonable.
but if we try to take bql at [3], it will sleep for calculation time in 
set_sample_page_period which is configured by user, which may be a heavy 
overhead.
how about we take bql at [1] and release at [2], ingore bql at [3]/[4] 
and let it be the same as older versoin. since we only copy 
total_dirty_pages to local var in "get_dirtyrate" thread and maybe we 
don't need bql.
> 
> Thanks,
> 
>> +
>> +    do_calculate_dirtyrate_bitmap(dirty_pages);
>> +}
> 

