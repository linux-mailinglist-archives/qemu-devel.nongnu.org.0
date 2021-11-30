Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25B65463AFE
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Nov 2021 17:07:15 +0100 (CET)
Received: from localhost ([::1]:48642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ms5ez-0005jj-Nl
	for lists+qemu-devel@lfdr.de; Tue, 30 Nov 2021 11:07:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1ms5cs-0004Ve-JH
 for qemu-devel@nongnu.org; Tue, 30 Nov 2021 11:05:03 -0500
Received: from prt-mail.chinatelecom.cn ([42.123.76.228]:52898
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1ms5co-0007t2-LJ
 for qemu-devel@nongnu.org; Tue, 30 Nov 2021 11:05:01 -0500
HMM_SOURCE_IP: 172.18.0.188:43992.2078133628
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-118.116.19.33 (unknown [172.18.0.188])
 by chinatelecom.cn (HERMES) with SMTP id 6E3F22800DD;
 Wed,  1 Dec 2021 00:04:46 +0800 (CST)
X-189-SAVE-TO-SEND: huangy81@chinatelecom.cn
Received: from  ([172.18.0.188])
 by app0023 with ESMTP id db2ffc58438842d3ab329de9d60b1b8c for
 peterx@redhat.com; Wed, 01 Dec 2021 00:04:49 CST
X-Transaction-ID: db2ffc58438842d3ab329de9d60b1b8c
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 172.18.0.188
X-MEDUSA-Status: 0
Message-ID: <e4e012d6-4725-4f57-e955-251676649b65@chinatelecom.cn>
Date: Wed, 1 Dec 2021 00:04:48 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v7 0/3] support dirty restraint on vCPU
Content-Language: en-US
From: Hyman Huang <huangy81@chinatelecom.cn>
To: Peter Xu <peterx@redhat.com>
References: <cover.1638267778.git.huangy81@chinatelecom.cn>
 <YaYfy7YqZpOopold@xz-m1.local>
 <3118d065-2af5-bbc8-50d6-061a40308de5@chinatelecom.cn>
In-Reply-To: <3118d065-2af5-bbc8-50d6-061a40308de5@chinatelecom.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.228;
 envelope-from=huangy81@chinatelecom.cn; helo=chinatelecom.cn
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.211,
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
Cc: Juan Quintela <quintela@redhat.com>, Markus ArmBruster <armbru@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 11/30/21 22:57, Hyman Huang wrote:
> 1.
> Start vm with kernel+initrd.img with qemu command line as following:
> 
> [root@Hyman_server1 fast_qemu]# cat vm.sh
> #!/bin/bash
> /usr/bin/qemu-system-x86_64 \
>      -display none -vga none \
>      -name guest=simple_vm,debug-threads=on \
>      -monitor stdio \
>      -machine pc-i440fx-2.12 \
>      -accel kvm,dirty-ring-size=65536 -cpu host \
>      -kernel /home/work/fast_qemu/vmlinuz-5.13.0-rc4+ \
>      -initrd /home/work/fast_qemu/initrd-stress.img \
>      -append "noapic edd=off printk.time=1 noreplace-smp 
> cgroup_disable=memory pci=noearly console=ttyS0 debug ramsize=1500 
> ratio=1 sleep=1" \
>      -chardev file,id=charserial0,path=/var/log/vm_console.log \
>      -serial chardev:charserial0 \
>      -qmp unix:/tmp/qmp-sock,server,nowait \
>      -D /var/log/vm.log \
>      --trace events=/home/work/fast_qemu/events \
>      -m 4096 -smp 2 -device sga
> 
> 2.
> Enable the dirtylimit trace event which will output to /var/log/vm.log
> [root@Hyman_server1 fast_qemu]# cat /home/work/fast_qemu/events
> dirtylimit_state_init
> dirtylimit_vcpu
> dirtylimit_impose
> dirtyrate_do_calculate_vcpu
> 
> 
> 3.
> Connect the qmp server with low level qmp client and set-dirty-limit
> 
> [root@Hyman_server1 my_qemu]# python3.6 ./scripts/qmp/qmp-shell -v -p 
> /tmp/qmp-sock
> 
> Welcome to the QMP low-level shell!
> Connected to QEMU 6.1.92
> 
> (QEMU) set-dirty-limit cpu-index=1 dirty-rate=400
> 
> 
> {
>      "arguments": {
>          "cpu-index": 1,
>          "dirty-rate": 400
>      },
>      "execute": "set-dirty-limit"
> }
> 
> 4.
> observe the vcpu current dirty rate and quota dirty rate...
> 
> [root@Hyman_server1 ~]# tail -f /var/log/vm.log
> dirtylimit_state_init dirtylimit state init: max cpus 2
> dirtylimit_vcpu CPU[1] set quota dirtylimit 400
> dirtylimit_impose CPU[1] impose dirtylimit: quota 400, current 0, 
> percentage 0
> dirtyrate_do_calculate_vcpu vcpu[0]: 1075 MB/s
> dirtyrate_do_calculate_vcpu vcpu[1]: 1061 MB/s
> dirtylimit_impose CPU[1] impose dirtylimit: quota 400, current 1061, 
> percentage 62
> dirtyrate_do_calculate_vcpu vcpu[0]: 1133 MB/s
> dirtyrate_do_calculate_vcpu vcpu[1]: 380 MB/s
> dirtylimit_impose CPU[1] impose dirtylimit: quota 400, current 380, 
> percentage 57
> dirtyrate_do_calculate_vcpu vcpu[0]: 1227 MB/s
> dirtyrate_do_calculate_vcpu vcpu[1]: 464 MB/s
> 
> We can observe that vcpu-1's dirtyrate is about 400MB/s with dirty page 
> limit set and the vcpu-0 is not affected.
> 
> 5.
> observe the vm stress info...
> [root@Hyman_server1 fast_qemu]# tail -f /var/log/vm_console.log
> [    0.838051] Run /init as init process
> [    0.839216]   with arguments:
> [    0.840153]     /init
> [    0.840882]   with environment:
> [    0.841884]     HOME=/
> [    0.842649]     TERM=linux
> [    0.843478]     edd=off
> [    0.844233]     ramsize=1500
> [    0.845079]     ratio=1
> [    0.845829]     sleep=1
> /init (00001): INFO: RAM 1500 MiB across 2 CPUs, ratio 1, sleep 1 us
> [    1.158011] random: init: uninitialized urandom read (4096 bytes read)
> [    1.448205] random: init: uninitialized urandom read (4096 bytes read)
> /init (00001): INFO: 1638282593684ms copied 1 GB in 00729ms
> /init (00110): INFO: 1638282593964ms copied 1 GB in 00719ms
> /init (00001): INFO: 1638282594405ms copied 1 GB in 00719ms
> /init (00110): INFO: 1638282594677ms copied 1 GB in 00713ms
> /init (00001): INFO: 1638282595093ms copied 1 GB in 00686ms
> /init (00110): INFO: 1638282595339ms copied 1 GB in 00662ms
> /init (00001): INFO: 1638282595764ms copied 1 GB in 00670m
> 
> PS: the kernel and initrd images comes from:
> 
> kernel image: vmlinuz-5.13.0-rc4+, normal centos vmlinuz copied from 
> /boot directory
> 
> initrd.img: initrd-stress.img, only contains a stress binary, which 
> compiled from qemu source tests/migration/stress.c and run as init
> in vm.
> 
> you can view README.md file of my project 
> "met"(https://github.com/newfriday/met) to compile the 
> initrd-stress.img. :)
> 
> On 11/30/21 20:57, Peter Xu wrote:
>> On Tue, Nov 30, 2021 at 06:28:10PM +0800, huangy81@chinatelecom.cn wrote:
>>> From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
>>>
>>> The patch [2/3] has not been touched so far. Any corrections and
>>> suggetions are welcome.
>>
>> I played with it today, but the vcpu didn't got throttled as expected.
>>
>> What I did was starting two workload with 500mb/s, each pinned on one 
>> vcpu
>> thread:
>>
>> [root@fedora ~]# pgrep -fa mig_mon
>> 595 ./mig_mon mm_dirty 1000 500 sequential
>> 604 ./mig_mon mm_dirty 1000 500 sequential
>> [root@fedora ~]# taskset -pc 595
>> pid 595's current affinity list: 2
>> [root@fedora ~]# taskset -pc 604
>> pid 604's current affinity list: 3
>>
>> Then start throttle with 100mb/s:
>>
>> (QEMU) set-dirty-limit cpu-index=3 dirty-rate=100
>> {"return": {}}
>> (QEMU) set-dirty-limit cpu-index=2 dirty-rate=100
>> {"return": {}}
>>
>> I can see the workload dropped a tiny little bit (perhaps 500mb -> 
>> 499mb), then
>> it keeps going..
The test step above i listed assume that dirtyrate calculated by 
dirtylimit_calc_func via dirty-ring is accurate, which differ from
your test policy.

The macro DIRTYLIMIT_CALC_TIME_MS used as calculation period in 
migration/dirtyrate.c has a big affect on result. So "how we define the 
right dirtyrate" is worth discussing.

Anyway, one of our target is to improve the memory performence during 
migration, so i think memory write/read speed in vm is a convincing 
metric. I'll test the dirtyrate in the way your metioned and analyze the 
result.

>>
>> Further throttle won't work too:
>>
>> (QEMU) set-dirty-limit cpu-index=2 dirty-rate=10
>> {"return": {}}
>>
>> Funnily, the ssh client got slowed down instead... :(
>>
>> Yong, how did you test it?
>>
> 

-- 
Best Regards
Hyman Huang(黄勇)

