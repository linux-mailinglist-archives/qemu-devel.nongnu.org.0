Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EE3B54A3EB
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jun 2022 03:55:23 +0200 (CEST)
Received: from localhost ([::1]:36180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0vm6-0005zn-AL
	for lists+qemu-devel@lfdr.de; Mon, 13 Jun 2022 21:55:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenxiang66@hisilicon.com>)
 id 1o0vkR-0003R3-4p
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 21:53:39 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:3945)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenxiang66@hisilicon.com>)
 id 1o0vkO-0006fR-FV
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 21:53:38 -0400
Received: from kwepemi500016.china.huawei.com (unknown [172.30.72.54])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4LMWf36k7PzjXbj;
 Tue, 14 Jun 2022 09:52:27 +0800 (CST)
Received: from [10.40.193.166] (10.40.193.166) by
 kwepemi500016.china.huawei.com (7.221.188.220) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Tue, 14 Jun 2022 09:53:31 +0800
Subject: Re: [Bug] Take more 150s to boot qemu on ARM64
To: <paulmck@kernel.org>
References: <36a0c658-ee5d-3a1c-416c-c041dc344bff@hisilicon.com>
 <20220613132247.GB1790663@paulmck-ThinkPad-P17-Gen-1>
CC: <linux-kernel@vger.kernel.org>, <qemu-devel@nongnu.org>,
 <linuxarm@huawei.com>
Message-ID: <e6841520-f9c6-be3a-4a75-4f3339c7af83@hisilicon.com>
Date: Tue, 14 Jun 2022 09:53:30 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <20220613132247.GB1790663@paulmck-ThinkPad-P17-Gen-1>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.40.193.166]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemi500016.china.huawei.com (7.221.188.220)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=chenxiang66@hisilicon.com; helo=szxga01-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  "chenxiang (M)" <chenxiang66@hisilicon.com>
From:  "chenxiang (M)" via <qemu-devel@nongnu.org>



在 2022/6/13 21:22, Paul E. McKenney 写道:
> On Mon, Jun 13, 2022 at 08:26:34PM +0800, chenxiang (M) wrote:
>> Hi all,
>>
>> I encounter a issue with kernel 5.19-rc1 on a ARM64 board:  it takes about
>> 150s between beginning to run qemu command and beginng to boot Linux kernel
>> ("EFI stub: Booting Linux Kernel...").
>>
>> But in kernel 5.18-rc4, it only takes about 5s. I git bisect the kernel code
>> and it finds c2445d387850 ("srcu: Add contention check to call_srcu()
>> srcu_data ->lock acquisition").
>>
>> The qemu (qemu version is 6.2.92) command i run is :
>>
>> ./qemu-system-aarch64 -m 4G,slots=4,maxmem=8g \
>> --trace "kvm*" \
>> -cpu host \
>> -machine virt,accel=kvm,gic-version=3  \
>> -machine smp.cpus=2,smp.sockets=2 \
>> -no-reboot \
>> -nographic \
>> -monitor unix:/home/cx/qmp-test,server,nowait \
>> -bios /home/cx/boot/QEMU_EFI.fd \
>> -kernel /home/cx/boot/Image  \
>> -device pcie-root-port,port=0x8,chassis=1,id=net1,bus=pcie.0,multifunction=on,addr=0x1
>> \
>> -device vfio-pci,host=7d:01.3,id=net0 \
>> -device virtio-blk-pci,drive=drive0,id=virtblk0,num-queues=4  \
>> -drive file=/home/cx/boot/boot_ubuntu.img,if=none,id=drive0 \
>> -append "rdinit=init console=ttyAMA0 root=/dev/vda rootfstype=ext4 rw " \
>> -net none \
>> -D /home/cx/qemu_log.txt
>>
>> I am not familiar with rcu code, and don't know how it causes the issue. Do
>> you have any idea about this issue?
> Please see the discussion here:
>
> https://lore.kernel.org/all/20615615-0013-5adc-584f-2b1d5c03ebfc@linaro.org/
>
> Though that report requires ACPI to be forced on to get the
> delay, which results in more than 9,000 back-to-back calls to
> synchronize_srcu_expedited().  I cannot reproduce this on my setup, even
> with an artificial tight loop invoking synchronize_srcu_expedited(),
> but then again I don't have ARM hardware.
>
> My current guess is that the following patch, but with larger values for
> SRCU_MAX_NODELAY_PHASE.  Here "larger" might well be up in the hundreds,
> or perhaps even larger.
>
> If you get a chance to experiment with this, could you please reply
> to the discussion at the above URL?  (Or let me know, and I can CC
> you on the next message in that thread.)

Ok, thanks, i will reply it on above URL.


>
> 						Thanx, Paul
>
> ------------------------------------------------------------------------
>
> diff --git a/kernel/rcu/srcutree.c b/kernel/rcu/srcutree.c
> index 50ba70f019dea..0db7873f4e95b 100644
> --- a/kernel/rcu/srcutree.c
> +++ b/kernel/rcu/srcutree.c
> @@ -513,7 +513,7 @@ static bool srcu_readers_active(struct srcu_struct *ssp)
>   
>   #define SRCU_INTERVAL		1	// Base delay if no expedited GPs pending.
>   #define SRCU_MAX_INTERVAL	10	// Maximum incremental delay from slow readers.
> -#define SRCU_MAX_NODELAY_PHASE	1	// Maximum per-GP-phase consecutive no-delay instances.
> +#define SRCU_MAX_NODELAY_PHASE	3	// Maximum per-GP-phase consecutive no-delay instances.
>   #define SRCU_MAX_NODELAY	100	// Maximum consecutive no-delay instances.
>   
>   /*
> @@ -522,16 +522,22 @@ static bool srcu_readers_active(struct srcu_struct *ssp)
>    */
>   static unsigned long srcu_get_delay(struct srcu_struct *ssp)
>   {
> +	unsigned long gpstart;
> +	unsigned long j;
>   	unsigned long jbase = SRCU_INTERVAL;
>   
>   	if (ULONG_CMP_LT(READ_ONCE(ssp->srcu_gp_seq), READ_ONCE(ssp->srcu_gp_seq_needed_exp)))
>   		jbase = 0;
> -	if (rcu_seq_state(READ_ONCE(ssp->srcu_gp_seq)))
> -		jbase += jiffies - READ_ONCE(ssp->srcu_gp_start);
> -	if (!jbase) {
> -		WRITE_ONCE(ssp->srcu_n_exp_nodelay, READ_ONCE(ssp->srcu_n_exp_nodelay) + 1);
> -		if (READ_ONCE(ssp->srcu_n_exp_nodelay) > SRCU_MAX_NODELAY_PHASE)
> -			jbase = 1;
> +	if (rcu_seq_state(READ_ONCE(ssp->srcu_gp_seq))) {
> +		j = jiffies - 1;
> +		gpstart = READ_ONCE(ssp->srcu_gp_start);
> +		if (time_after(j, gpstart))
> +			jbase += j - gpstart;
> +		if (!jbase) {
> +			WRITE_ONCE(ssp->srcu_n_exp_nodelay, READ_ONCE(ssp->srcu_n_exp_nodelay) + 1);
> +			if (READ_ONCE(ssp->srcu_n_exp_nodelay) > SRCU_MAX_NODELAY_PHASE)
> +				jbase = 1;
> +		}
>   	}
>   	return jbase > SRCU_MAX_INTERVAL ? SRCU_MAX_INTERVAL : jbase;
>   }
> .
>


