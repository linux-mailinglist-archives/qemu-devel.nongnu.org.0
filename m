Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19D0A2E7EFE
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Dec 2020 10:36:45 +0100 (CET)
Received: from localhost ([::1]:44870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kuuNv-0003yT-N5
	for lists+qemu-devel@lfdr.de; Thu, 31 Dec 2020 04:36:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yezhenyu2@huawei.com>)
 id 1kuuMH-000343-DE
 for qemu-devel@nongnu.org; Thu, 31 Dec 2020 04:35:01 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2842)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yezhenyu2@huawei.com>)
 id 1kuuME-00025k-Re
 for qemu-devel@nongnu.org; Thu, 31 Dec 2020 04:35:01 -0500
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4D62yr33txzkyW6;
 Thu, 31 Dec 2020 17:33:40 +0800 (CST)
Received: from [10.174.186.6] (10.174.186.6) by DGGEMS407-HUB.china.huawei.com
 (10.3.19.207) with Microsoft SMTP Server id 14.3.498.0;
 Thu, 31 Dec 2020 17:34:36 +0800
From: Zhenyu Ye <yezhenyu2@huawei.com>
Subject: Re: [RFC PATCH v2] x86/cpu: initialize the CPU concurrently
To: Eduardo Habkost <ehabkost@redhat.com>
References: <90be4860-cbe0-25d4-ccca-75b96ecb4a3c@huawei.com>
 <20201221213620.GF6040@habkost.net>
 <e823060d-1a8a-a1d8-aa2f-1394c118bdae@huawei.com>
 <20201224180632.GF286050@habkost.net>
Message-ID: <694fb450-7f46-ef3f-e0eb-d5f5df99700a@huawei.com>
Date: Thu, 31 Dec 2020 17:34:35 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20201224180632.GF286050@habkost.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.186.6]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190; envelope-from=yezhenyu2@huawei.com;
 helo=szxga04-in.huawei.com
X-Spam_score_int: -75
X-Spam_score: -7.6
X-Spam_bar: -------
X-Spam_report: (-7.6 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.399,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: "S. Tsirkin, Michael" <mst@redhat.com>, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, Xiexiangyou <xiexiangyou@huawei.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Eduardo,

On 2020/12/25 2:06, Eduardo Habkost wrote:
>>
>> The most time-consuming operation in haxm is ioctl(HAX_VM_IOCTL_VCPU_CREATE).
>> Saddly this can not be split.
>>
>> Even if we fix the problem in haxm, other accelerators may also have
>> this problem.  So I think if we can make the x86_cpu_new() concurrently,
>> we should try to do it.
> 
> Changing the code to run all VCPU initialization actions for all
> accelerators concurrently would require carefully reviewing the
> VCPU thread code for all accelerators, looking for races.  Sounds
> like a challenging task.  We could avoid that if we do something
> that will parallelize only what we really need (and know to be
> safe).
> 

Yes, we must make sure that all accelerators could work parallelly,
even including the corresponding VCPU_CREATE_IOCTL, which is not
under qemu's control.

Fortunately, we have found out why ioctl(HAX_VM_IOCTL_VCPU_CREATE)
in haxm took such a long time.  It alloced vtlb when doing vcpu_create(),
which has been discarded and is useless.  After removing corresponding
operation, the vcpu initialization time is reduced to within 10ms.

Thanks for your attention and discussion.

Thanks,
Zhenyu




