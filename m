Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14A67494F8D
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jan 2022 14:49:51 +0100 (CET)
Received: from localhost ([::1]:37648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAXp1-0004DM-2O
	for lists+qemu-devel@lfdr.de; Thu, 20 Jan 2022 08:49:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1nAUqY-0006i8-La
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 05:39:15 -0500
Received: from prt-mail.chinatelecom.cn ([42.123.76.219]:34727
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1nAUqW-00081i-Hy
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 05:39:14 -0500
HMM_SOURCE_IP: 172.18.0.48:47984.2115731125
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-182.150.57.243 (unknown [172.18.0.48])
 by chinatelecom.cn (HERMES) with SMTP id 58CEB2800A8;
 Thu, 20 Jan 2022 18:39:02 +0800 (CST)
X-189-SAVE-TO-SEND: huangy81@chinatelecom.cn
Received: from  ([172.18.0.48])
 by app0024 with ESMTP id 2a1a70e8628d4fb4a885d3abfd452ddc for
 peterx@redhat.com; Thu, 20 Jan 2022 18:39:05 CST
X-Transaction-ID: 2a1a70e8628d4fb4a885d3abfd452ddc
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 172.18.0.48
X-MEDUSA-Status: 0
Message-ID: <c6086788-da45-d023-edaa-5fca9a602c5a@chinatelecom.cn>
Date: Thu, 20 Jan 2022 18:39:01 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v11 3/4] softmmu/dirtylimit: implement virtual CPU throttle
To: Peter Xu <peterx@redhat.com>
References: <cover.1641316375.git.huangy81@chinatelecom.cn>
 <0381e32c2cc70613613aaa284b8e8c9760d6932f.1641316375.git.huangy81@chinatelecom.cn>
 <YeUbhC7MG32K9pxu@xz-m1.local>
 <d34dbb85-f8a9-cb21-a312-a4f4f3cafd07@chinatelecom.cn>
 <Yekqn90HOtFMWupM@xz-m1.local>
From: Hyman Huang <huangy81@chinatelecom.cn>
In-Reply-To: <Yekqn90HOtFMWupM@xz-m1.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.219;
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



在 2022/1/20 17:25, Peter Xu 写道:

> 
> ... I think what you explained makes sense to me.
> 
> Note that there's also the reaper thread running in the background that can
> reap all the cores too.
> 
> It only runs once per second so it shouldn't bring a lot of differences, but
> I'm also wondering whether we should also turn that temporarily off too when
> dirtylimit is enabled - we can simply let it keep sleeping if dirtylimit is in
> service.
Does this work ok when dirtylimit and migration happens concurrently?
Migration may fetch the aged dirty bitmap info from slot if we turn 
reaper thread off. As you metioned above, reaper thread only runs once 
per second. Is it more suitable for not touching the reaper thread logic?
> 
> Dropping BQL may not be safe, as it serializes the reaping with other possible
> kvm memslot updates.  I don't know whether it's a must in the future to use BQL
> for reaping the rings, but so far I'd say we can still stick with it.
> 
> Note that even if you don't take BQL you'll still need the slots_lock and so
> far that's also global, so I don't see how it can help on vcpu concurrency
> anyway even if we dropped one of them.
> 
> If to do this, could you not introduce kvm_dirty_ring_reset_one() but just let
> it take one more CPUState* parameter?  Most of the codes you added should be
> similar to kvm_dirty_ring_reap_locked(), and I wanted to keep the trace point
> there (trace_kvm_dirty_ring_reap, though that needs another parameter too).
> 
> And that patch can be done on top of this patch, so it can be reviewed easier
> outside of dirtylimit details.
> 
> Thanks,
> 

-- 
Best regard

Hyman Huang(黄勇)

