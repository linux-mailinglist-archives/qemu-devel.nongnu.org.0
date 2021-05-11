Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C4D037A87A
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 16:07:18 +0200 (CEST)
Received: from localhost ([::1]:41884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgT2b-0005MV-JB
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 10:07:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangyicong@huawei.com>)
 id 1lgJKY-0005O5-1k
 for qemu-devel@nongnu.org; Mon, 10 May 2021 23:45:10 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:2048)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangyicong@huawei.com>)
 id 1lgJKU-0007jM-SY
 for qemu-devel@nongnu.org; Mon, 10 May 2021 23:45:09 -0400
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4FfNy762Z9zmg73;
 Tue, 11 May 2021 11:41:35 +0800 (CST)
Received: from [127.0.0.1] (10.69.38.196) by DGGEMS412-HUB.china.huawei.com
 (10.3.19.212) with Microsoft SMTP Server id 14.3.498.0; Tue, 11 May 2021
 11:44:49 +0800
Subject: Re: [Question] Indefinitely block in the host when remove the PF
 driver
To: Alex Williamson <alex.williamson@redhat.com>, <qemu-devel@nongnu.org>
References: <c9466e2c-385d-8298-d03c-80dcfc359f52@hisilicon.com>
 <20210430082940.4b0e0397@redhat.com>
From: Yicong Yang <yangyicong@hisilicon.com>
Message-ID: <c09fed39-bde5-b7a9-d945-79ef85260e5a@hisilicon.com>
Date: Tue, 11 May 2021 11:44:49 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20210430082940.4b0e0397@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.69.38.196]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190;
 envelope-from=yangyicong@huawei.com; helo=szxga04-in.huawei.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 11 May 2021 09:59:56 -0400
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
Cc: cohuck@redhat.com, "Zengtao \(B\)" <prime.zeng@hisilicon.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, kvm@vger.kernel.org,
 Linuxarm <linuxarm@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[ +qemu-devel ]

On 2021/4/30 22:29, Alex Williamson wrote:
> On Fri, 30 Apr 2021 15:57:47 +0800
> Yicong Yang <yangyicong@hisilicon.com> wrote:
> 
>> When I try to remove the PF driver in the host, the process will be blocked
>> if the related VF of the device is added in the Qemu as an iEP.
>>
>> here's what I got in the host:
>>
>> [root@localhost 0000:75:00.0]# rmmod hisi_zip
>> [99760.571352] vfio-pci 0000:75:00.1: Relaying device request to user (#0)
>> [99862.992099] vfio-pci 0000:75:00.1: Relaying device request to user (#10)
>> [...]
>>
>> and in the Qemu:
>>
>> estuary:/$ lspci -tv
>> -[0000:00]-+-00.0  Device 1b36:0008
>>            +-01.0  Device 1af4:1000
>>            +-02.0  Device 1af4:1009
>>            \-03.0  Device 19e5:a251 <----- the related VF device
>> estuary:/$ qemu-system-aarch64: warning: vfio 0000:75:00.1: Bus 'pcie.0' does not support hotplugging
>> qemu-system-aarch64: warning: vfio 0000:75:00.1: Bus 'pcie.0' does not support hotplugging
>> qemu-system-aarch64: warning: vfio 0000:75:00.1: Bus 'pcie.0' does not support hotplugging
>> qemu-system-aarch64: warning: vfio 0000:75:00.1: Bus 'pcie.0' does not support hotplugging
>> [...]
>>
>> The rmmod process will be blocked until I kill the Qemu process. That's the only way if I
>> want to end the rmmod.
>>
>> So my question is: is such block reasonable? If the VF devcie is occupied or doesn't
>> support hotplug in the Qemu, shouldn't we fail the rmmod and return something like -EBUSY
>> rather than make the host blocked indefinitely?
> 
> Where would we return -EBUSY?  pci_driver.remove() returns void.
> Without blocking, I think our only option would be to kill the user
> process.
>  

yes. the remove() callback of pci_driver doesn't provide a way to abort the process.

>> Add the VF under a pcie root port will avoid this. Is it encouraged to always
>> add the VF under a pcie root port rather than directly add it as an iEP?
> 
> Releasing a device via the vfio request interrupt is always a
> cooperative process currently, the VM needs to be configured such that
> the device is capable of being unplugged and the guest needs to respond
> to the ejection request.  Thanks,
> 

Does it make sense to abort the VM creation and give some warnings if user try to
pass a vfio pci device to the Qemu and doesn't attach it to a hotpluggable
bridge? Currently I think there isn't such a mechanism in Qemu.

Thanks,
Yicong


