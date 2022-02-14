Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35A984B45A8
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 10:27:58 +0100 (CET)
Received: from localhost ([::1]:48802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJXeH-0006Gm-B1
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 04:27:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1nJXbU-0004As-Ti
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 04:25:04 -0500
Received: from prt-mail.chinatelecom.cn ([42.123.76.228]:56870
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1nJXbS-00052A-RF
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 04:25:04 -0500
HMM_SOURCE_IP: 172.18.0.188:36768.1713644080
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-182.150.57.243 (unknown [172.18.0.188])
 by chinatelecom.cn (HERMES) with SMTP id 50C842800FE;
 Mon, 14 Feb 2022 17:24:58 +0800 (CST)
X-189-SAVE-TO-SEND: huangy81@chinatelecom.cn
Received: from  ([172.18.0.188])
 by app0023 with ESMTP id 0f64289039394573941f67f153bbb300 for
 peterx@redhat.com; Mon, 14 Feb 2022 17:25:01 CST
X-Transaction-ID: 0f64289039394573941f67f153bbb300
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 172.18.0.188
X-MEDUSA-Status: 0
Message-ID: <723740d8-cf5c-b22b-da6e-28eeec75ac78@chinatelecom.cn>
Date: Mon, 14 Feb 2022 17:24:57 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v14 7/7] softmmu/dirtylimit: Implement dirty page rate
 limit
To: Peter Xu <peterx@redhat.com>
References: <cover.1644509582.git.huangy81@chinatelecom.cn>
 <32a65f0fbb691aa66094fc9162bff4daa6d7771d.1644509582.git.huangy81@chinatelecom.cn>
 <YgoSEDGhvGlMMRBE@xz-m1.local>
From: Hyman Huang <huangy81@chinatelecom.cn>
In-Reply-To: <YgoSEDGhvGlMMRBE@xz-m1.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.228;
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
Cc: Eduardo Habkost <eduardo@habkost.net>, David Hildenbrand <david@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Markus ArmBruster <armbru@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



在 2022/2/14 16:25, Peter Xu 写道:
> On Fri, Feb 11, 2022 at 12:17:41AM +0800, huangy81@chinatelecom.cn wrote:
>> +static struct DirtyLimitInfoList *dirtylimit_query_all(void)
>> +{
>> +    int i, index;
>> +    DirtyLimitInfo *info = NULL;
>> +    DirtyLimitInfoList *head = NULL, **tail = &head;
>> +
>> +    dirtylimit_state_lock();
>> +
>> +    if (!dirtylimit_in_service()) {
> 
> Need to unlock?
Yes, i'll fix it next version.
> 
>> +        return NULL;
>> +    }
>> +
>> +    for (i = 0; i < dirtylimit_state->max_cpus; i++) {
>> +        index = dirtylimit_state->states[i].cpu_index;
>> +        if (dirtylimit_vcpu_get_state(index)->enabled) {
>> +            info = dirtylimit_query_vcpu(index);
>> +            QAPI_LIST_APPEND(tail, info);
>> +        }
>> +    }
>> +
>> +    dirtylimit_state_unlock();
>> +
>> +    return head;
>> +}
> 

-- 
Best regard

Hyman Huang(黄勇)

