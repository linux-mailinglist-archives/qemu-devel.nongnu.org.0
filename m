Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9547E343C85
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 10:19:51 +0100 (CET)
Received: from localhost ([::1]:38796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOGj0-0004M9-5h
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 05:19:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhukeqian1@huawei.com>)
 id 1lOGhR-0003s1-VT
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 05:18:14 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:4056)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhukeqian1@huawei.com>)
 id 1lOGhL-0005um-Jd
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 05:18:11 -0400
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4F3plM0pNPzkdHW;
 Mon, 22 Mar 2021 17:16:15 +0800 (CST)
Received: from [10.174.184.42] (10.174.184.42) by
 DGGEMS412-HUB.china.huawei.com (10.3.19.212) with Microsoft SMTP Server id
 14.3.498.0; Mon, 22 Mar 2021 17:17:48 +0800
Subject: Re: [PATCH v5 09/10] KVM: Disable manual dirty log when dirty ring
 enabled
To: Peter Xu <peterx@redhat.com>, <qemu-devel@nongnu.org>
References: <20210310203301.194842-1-peterx@redhat.com>
 <20210310203301.194842-10-peterx@redhat.com>
From: Keqian Zhu <zhukeqian1@huawei.com>
Message-ID: <c49abf47-412c-26b8-0a28-c1007eed0159@huawei.com>
Date: Mon, 22 Mar 2021 17:17:47 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <20210310203301.194842-10-peterx@redhat.com>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.184.42]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.32; envelope-from=zhukeqian1@huawei.com;
 helo=szxga06-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Hyman <huangy81@chinatelecom.cn>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Peter,

On 2021/3/11 4:33, Peter Xu wrote:
> KVM_CAP_MANUAL_DIRTY_LOG_PROTECT2 is for KVM_CLEAR_DIRTY_LOG, which is only
> useful for KVM_GET_DIRTY_LOG.  Skip enabling it for kvm dirty ring.
> 
> More importantly, KVM_DIRTY_LOG_INITIALLY_SET will not wr-protect all the pages
> initially, which is against how kvm dirty ring is used - there's no way for kvm
> dirty ring to re-protect a page before it's notified as being written first
> with a GFN entry in the ring!  So when KVM_DIRTY_LOG_INITIALLY_SET is enabled
> with dirty ring, we'll see silent data loss after migration.
I feel a little regret that dirty ring can not work with KVM_DIRTY_LOG_INITIALLY_SET ...
With KVM_DIRTY_LOG_INITIALLY_SET, we can speedup dirty log start. More important, we can
enable dirty log gradually. For write fault based dirty log, it greatly reduces the side
effect of dirty log over guest.

I hope we can put forward another similar optimization under dirty ring mode. :)

Thanks,
Keqian

> 
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>  accel/kvm/kvm-all.c | 37 +++++++++++++++++++++++--------------
>  1 file changed, 23 insertions(+), 14 deletions(-)
> 
> diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
> index 10137b6af11..ae9393266b2 100644
> --- a/accel/kvm/kvm-all.c
> +++ b/accel/kvm/kvm-all.c
> @@ -2173,20 +2173,29 @@ static int kvm_init(MachineState *ms)
>          }
>      }
>  
> -    dirty_log_manual_caps =
> -        kvm_check_extension(s, KVM_CAP_MANUAL_DIRTY_LOG_PROTECT2);
> -    dirty_log_manual_caps &= (KVM_DIRTY_LOG_MANUAL_PROTECT_ENABLE |
> -                              KVM_DIRTY_LOG_INITIALLY_SET);
> -    s->manual_dirty_log_protect = dirty_log_manual_caps;
> -    if (dirty_log_manual_caps) {
> -        ret = kvm_vm_enable_cap(s, KVM_CAP_MANUAL_DIRTY_LOG_PROTECT2, 0,
> -                                   dirty_log_manual_caps);
> -        if (ret) {
> -            warn_report("Trying to enable capability %"PRIu64" of "
> -                        "KVM_CAP_MANUAL_DIRTY_LOG_PROTECT2 but failed. "
> -                        "Falling back to the legacy mode. ",
> -                        dirty_log_manual_caps);
> -            s->manual_dirty_log_protect = 0;
> +    /*
> +     * KVM_CAP_MANUAL_DIRTY_LOG_PROTECT2 is not needed when dirty ring is
> +     * enabled.  More importantly, KVM_DIRTY_LOG_INITIALLY_SET will assume no
> +     * page is wr-protected initially, which is against how kvm dirty ring is
> +     * usage - kvm dirty ring requires all pages are wr-protected at the very
> +     * beginning.  Enabling this feature for dirty ring causes data corruption.
> +     */
> +    if (!s->kvm_dirty_ring_enabled) {
> +        dirty_log_manual_caps =
> +            kvm_check_extension(s, KVM_CAP_MANUAL_DIRTY_LOG_PROTECT2);
> +        dirty_log_manual_caps &= (KVM_DIRTY_LOG_MANUAL_PROTECT_ENABLE |
> +                                  KVM_DIRTY_LOG_INITIALLY_SET);
> +        s->manual_dirty_log_protect = dirty_log_manual_caps;
> +        if (dirty_log_manual_caps) {
> +            ret = kvm_vm_enable_cap(s, KVM_CAP_MANUAL_DIRTY_LOG_PROTECT2, 0,
> +                                    dirty_log_manual_caps);
> +            if (ret) {
> +                warn_report("Trying to enable capability %"PRIu64" of "
> +                            "KVM_CAP_MANUAL_DIRTY_LOG_PROTECT2 but failed. "
> +                            "Falling back to the legacy mode. ",
> +                            dirty_log_manual_caps);
> +                s->manual_dirty_log_protect = 0;
> +            }
>          }
>      }
>  
> 

