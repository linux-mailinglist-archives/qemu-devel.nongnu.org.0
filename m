Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 155C346B1E7
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Dec 2021 05:34:31 +0100 (CET)
Received: from localhost ([::1]:54446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muSBQ-0008Dx-OH
	for lists+qemu-devel@lfdr.de; Mon, 06 Dec 2021 23:34:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1muSAO-0007Vw-DI
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 23:33:24 -0500
Received: from prt-mail.chinatelecom.cn ([42.123.76.228]:56521
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1muSAK-0004ny-3N
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 23:33:24 -0500
HMM_SOURCE_IP: 172.18.0.48:48316.1497966173
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-125.69.41.245 (unknown [172.18.0.48])
 by chinatelecom.cn (HERMES) with SMTP id 78CBE2800F3;
 Tue,  7 Dec 2021 12:32:52 +0800 (CST)
X-189-SAVE-TO-SEND: huangy81@chinatelecom.cn
Received: from  ([172.18.0.48])
 by app0024 with ESMTP id 4d8265fbba44473da2e9c45e7a82300c for
 peterx@redhat.com; Tue, 07 Dec 2021 12:33:09 CST
X-Transaction-ID: 4d8265fbba44473da2e9c45e7a82300c
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 172.18.0.48
X-MEDUSA-Status: 0
Message-ID: <502e1ef9-c86e-73f1-48c4-e60965bcac6f@chinatelecom.cn>
Date: Tue, 7 Dec 2021 12:32:52 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH v9 3/3] cpus-common: implement dirty page limit on vCPU
To: Peter Xu <peterx@redhat.com>
References: <cover.1638495274.git.huangy81@chinatelecom.cn>
 <cover.1638495274.git.huangy81@chinatelecom.cn>
 <9cc3cc5377e4330cbe0e87e89f452889516a4c09.1638495274.git.huangy81@chinatelecom.cn>
 <87tufpyiij.fsf@dusky.pond.sub.org>
 <65a49c9f-9287-b950-8fde-40fa9a4a28fe@chinatelecom.cn>
 <Ya3Jy1nWVRz12NHv@xz-m1.local>
 <9446cb24-c132-64e7-d696-ac959327d861@chinatelecom.cn>
 <Ya7F3BtHw4mFBKfT@xz-m1.local>
From: Hyman <huangy81@chinatelecom.cn>
In-Reply-To: <Ya7F3BtHw4mFBKfT@xz-m1.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.228;
 envelope-from=huangy81@chinatelecom.cn; helo=chinatelecom.cn
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.076,
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
Cc: Juan Quintela <quintela@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



在 2021/12/7 10:24, Peter Xu 写道:
> On Mon, Dec 06, 2021 at 10:56:00PM +0800, Hyman wrote:
>>> I found that it'll be challenging for any human being to identify "whether
>>> he/she has turned throttle off for all vcpus"..  I think that could be useful
>>> when we finally decided to cancel current migration.
>> That's question, how about adding an optional argument "global" and making
>> "cpu-index", "enable", "dirty-rate" all optional in "vcpu-dirty-limit",
>> keeping the "cpu-index" and "global" options mutually exclusive?
>> { 'command': 'vcpu-dirty-limit',
>>    'data': { '*cpu-index': 'int',
>>              '*global': 'bool'
>>              '*enable': 'bool',
>>              '*dirty-rate': 'uint64'} }
>> In the case of enabling all vcpu throttle:
>> Either use "global=true,enable=true,dirty-rate=XXX" or
>> "global=true,dirty-rate=XXX"
>>
>> In the case of disabling all vcpu throttle:
>> use "global=true,enable=false,dirty-rate=XXX"
>>
>> In other case, we pass the same option just like what we did for specified
>> vcpu throttle before.
> 
> Could we merge "cpu-index" and "global" somehow?  They're mutual exclusive. >
> For example, merge them into one "vcpu" parameter, "vcpu=all" means global,
> "vcpu=1" means vcpu 1.  But then we'll need to make it a string.
>Ok, sound good

