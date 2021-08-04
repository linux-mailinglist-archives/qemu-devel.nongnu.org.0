Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7B3A3DFE0A
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 11:31:42 +0200 (CEST)
Received: from localhost ([::1]:33580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBDFV-0002q4-US
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 05:31:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhengchuan@huawei.com>)
 id 1mBDEN-00020n-VR
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 05:30:31 -0400
Received: from szxga08-in.huawei.com ([45.249.212.255]:2270)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhengchuan@huawei.com>)
 id 1mBDEJ-0007od-TS
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 05:30:31 -0400
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.55])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4Gfmg5664cz1CSHY;
 Wed,  4 Aug 2021 17:30:09 +0800 (CST)
Received: from dggpeml500005.china.huawei.com (7.185.36.59) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 4 Aug 2021 17:30:07 +0800
Received: from [10.174.186.51] (10.174.186.51) by
 dggpeml500005.china.huawei.com (7.185.36.59) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 4 Aug 2021 17:30:06 +0800
Subject: Re: [PATCH V5 00/25] Live Update [restart] : fork mode?
From: Zheng Chuan <zhengchuan@huawei.com>
To: Steve Sistare <steven.sistare@oracle.com>, Qemu Developers
 <qemu-devel@nongnu.org>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "Juan Quintela" <quintela@redhat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, Alex Williamson <alex.williamson@redhat.com>, "Paolo
 Bonzini" <pbonzini@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@redhat.com>, Xiexiangyou <xiexiangyou@huawei.com>
References: <ad3f7ebe-8086-d70c-8db7-997e8a5fa411@huawei.com>
Message-ID: <efd2ef7f-b65b-3551-b581-b25050fbb2ab@huawei.com>
Date: Wed, 4 Aug 2021 17:30:05 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <ad3f7ebe-8086-d70c-8db7-997e8a5fa411@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.186.51]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpeml500005.china.huawei.com (7.185.36.59)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.255;
 envelope-from=zhengchuan@huawei.com; helo=szxga08-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

kindly ping？

On 2021/7/30 21:10, Zheng Chuan wrote:
> Hi, Steve
> I have saw the discussion about the fork+exec mode below:
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg815956.html
> 
> And I am still very curious and I want to discuss about the possibility to support both fork+exec and exec in cpr framework.
> 
> 1.Why
> fork+exec could have some advantages and also drawbacks versus execvp() directly.
> Advantages
> i) fork+exec give the chance to fallback to original process even after we do exec which is important for workload seamless if any error happens.
> ii) smaller downtime since we could remove the vm_start() downtime out of the frozen window.
> Drawbacks
> i）need more codes to handle including fork，address/ports conflict between parent and child.
> ii）more complex life cycle management for the two processes.
> 
> 2.How
> The cpr framework is flexible and scalable, and maybe we can make use of most codes to support both execvp and fork+exec mode.
> However, we may need to do more work compared to execvp method.
> i) do fork mode in a thread like migration thread
> ii) make parent and child talk to each other through socket or anonymous pipe
> iii）make use of sharing mechanism of fds in cpr framework including memfd, vfio and devices fds
> iv）deal with the conflict about the socket address and port like vnc （do by reuse port and pass the different args by cprexec）
> v) do life cycle managements for two qemu processes and need parent exit and reconnection for the child at last by the management service
> 
> Please tell me if I am missing something important:)
> 

-- 
Regards.
Chuan

