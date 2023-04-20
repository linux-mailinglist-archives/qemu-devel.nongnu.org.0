Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE8376E8959
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 07:01:38 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppMOq-0006vZ-Ec; Thu, 20 Apr 2023 01:00:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <harshpb@linux.ibm.com>)
 id 1ppMOh-0006vQ-28
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 00:59:56 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <harshpb@linux.ibm.com>)
 id 1ppMOd-00085G-Fz
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 00:59:54 -0400
Received: from pps.filterd (m0353727.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33K22aSq024249; Thu, 20 Apr 2023 04:59:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=11iPoFM2XEG44v2j9XvR4qNhiMKgKBJXDYzRN4l/yOU=;
 b=a1x2SQcjpEGOgrYMshK6yIvn9+i4UJphSOqrSEuPKbpf1pwJwn+OFJeeQW5Jr4SV5eb1
 zVg78PGkvWdc9vDnmWZIy9urtYV3Lz3jbKSzvh/jTOak36gjMM8RX29X+jzvNCsHTcPD
 fjPYCUZ+Qux+SB4hk8uEkBrytzeL4oXim9rbLyAl55Id2tOJd76jSg7j/3+N9WflOlt3
 UV/xMuP7PSmTZGeogPBGDFgV1j/QimXjFc/nlOqDQ926FgbnTlSm7oaTd0/1x43v2Y20
 o0YZEirONBCWm275e1abzbkD/oWEEBVcSODpUnJBlecSeUXgpYv+UfOUnc9E/2o77NJO TQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3q20sctfuh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 Apr 2023 04:59:46 +0000
Received: from m0353727.ppops.net (m0353727.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 33K4mnHY026177;
 Thu, 20 Apr 2023 04:59:46 GMT
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3q20sctfu8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 Apr 2023 04:59:46 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 33K1kjcE010103;
 Thu, 20 Apr 2023 04:59:44 GMT
Received: from smtprelay04.wdc07v.mail.ibm.com ([9.208.129.114])
 by ppma03wdc.us.ibm.com (PPS) with ESMTPS id 3pykj7jcd2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 Apr 2023 04:59:44 +0000
Received: from smtpav02.dal12v.mail.ibm.com (smtpav02.dal12v.mail.ibm.com
 [10.241.53.101])
 by smtprelay04.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 33K4xhQQ37814956
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 20 Apr 2023 04:59:43 GMT
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 489E45805F;
 Thu, 20 Apr 2023 04:59:43 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5BBE458051;
 Thu, 20 Apr 2023 04:59:40 +0000 (GMT)
Received: from [9.109.242.129] (unknown [9.109.242.129])
 by smtpav02.dal12v.mail.ibm.com (Postfix) with ESMTP;
 Thu, 20 Apr 2023 04:59:40 +0000 (GMT)
Message-ID: <f54a3673-577c-0236-17f5-f074f7826c5b@linux.ibm.com>
Date: Thu, 20 Apr 2023 10:29:38 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2] tests/avocado/tuxrun_baselines.py: improve code
 coverage for ppc64
Content-Language: en-US
To: Kautuk Consul <kconsul@linux.vnet.ibm.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>
Cc: qemu-devel@nongnu.org
References: <20230419092219.426230-1-kconsul@linux.vnet.ibm.com>
From: Harsh Prateek Bora <harshpb@linux.ibm.com>
In-Reply-To: <20230419092219.426230-1-kconsul@linux.vnet.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 8v1-VMldS7D9W9prB3KImsWVIYQb1JdS
X-Proofpoint-ORIG-GUID: JcRSH79AMWH3UaG8Ujb8NbTtE_78WwLm
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-20_02,2023-04-18_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 priorityscore=1501
 mlxlogscore=999 spamscore=0 impostorscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 suspectscore=0 clxscore=1011
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304200035
Received-SPF: pass client-ip=148.163.156.1; envelope-from=harshpb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.597, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

One minor comment below:

On 4/19/23 14:52, Kautuk Consul wrote:
> Commit c0c8687ef0fd990db8db1655a8a6c5a5e35dd4bb disabled the
> boot_linux.py test-case due to which the code coverage for ppc
> decreased by around 2%. As per the discussion on
> https://lore.kernel.org/qemu-devel/87sfdpqcy4.fsf@linaro.org/ it
> was mentioned that the baseline test for ppc64 could be modified
> to make up this 2% code coverage. This patch attempts to achieve
> this 2% code coverage by adding various device command line
> arguments (to ./qemu-system-ppc64) in the tuxrun_baselines.py
> test-case.
> 
> The code coverage report with boot_linux.py, without it and finally
> with these tuxrun_baselines.py changes is as follows:
> 
> With boot_linux.py
> ------------------
>    lines......: 13.8% (58006 of 420997 lines)
>    functions..: 20.7% (7675 of 36993 functions)
>    branches...: 9.2% (22146 of 240611 branches)
> Without boot_linux.py (without this patch changes)
> --------------------------------------------------
>    lines......: 11.9% (50174 of 420997 lines)
>    functions..: 18.8% (6947 of 36993 functions)
>    branches...: 7.4% (17580 of 239017 branches)
> Without boot_linux.py (with this patch changes)
> -----------------------------------------------
>    lines......: 13.8% (58287 of 420997 lines)
>    functions..: 20.7% (7640 of 36993 functions)
>    branches...: 8.4% (20223 of 240611 branches)
> 
> Signed-off-by: Kautuk Consul <kconsul@linux.vnet.ibm.com>
> Reported-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   tests/avocado/tuxrun_baselines.py | 124 +++++++++++++++++++++++++++++-
>   1 file changed, 122 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/avocado/tuxrun_baselines.py b/tests/avocado/tuxrun_baselines.py
> index d343376faa..f763ee5d50 100644
> --- a/tests/avocado/tuxrun_baselines.py
> +++ b/tests/avocado/tuxrun_baselines.py
> @@ -11,6 +11,8 @@
>   
>   import os
>   import time
> +import string
> +import random
>   
>   from avocado import skip, skipIf
>   from avocado_qemu import QemuSystemTest
> @@ -308,7 +310,7 @@ def test_ppc64(self):
>           """
>           :avocado: tags=arch:ppc64
>           :avocado: tags=machine:pseries
> -        :avocado: tags=cpu:POWER8
> +        :avocado: tags=cpu:POWER10
>           :avocado: tags=endian:big
>           :avocado: tags=console:hvc0
>           :avocado: tags=tuxboot:ppc64
> @@ -316,21 +318,139 @@ def test_ppc64(self):
>           :avocado: tags=extradev:driver=spapr-vscsi
>           :avocado: tags=root:sda
>           """
> +        # Generate a random string
> +        res = ''.join(random.choices(string.ascii_lowercase +
> +                                     string.digits, k=8))
> +
We can have a tmpres = '/tmp/tuxrun_baselines_ppc64_' + str(res) + 
'.qcow2 which can later be used at all 3 instances below. Same for 
ppc64le as well. Also, prefix could be shortened to tuxrun_ppc64[le]. 
Otherwise, looks good to me.

Reviewed-by: Harsh Prateek Bora <harshpb@linux.ibm.com>

> +        # create qcow2 image to be used later.
> +        process.run('./qemu-img create -f qcow2 '
> +                    '/tmp/tuxrun_baselines_ppc64_' + str(res) +
> +                    '.qcow2 1G')
> +
> +        # add device args to command line.
> +        self.vm.add_args('-netdev', 'user,id=vnet,hostfwd=:127.0.0.1:0-:22',
> +                         '-device', 'virtio-net,netdev=vnet')
> +        self.vm.add_args('-netdev', '{"type":"user","id":"hostnet0"}',
> +                         '-device', '{"driver":"virtio-net-pci","netdev":'
> +                         '"hostnet0","id":"net0","mac":"52:54:00:4c:e3:86",'
> +                         '"bus":"pci.0","addr":"0x9"}')
> +        self.vm.add_args('-device', '{"driver":"qemu-xhci","p2":15,"p3":15,'
> +                         '"id":"usb","bus":"pci.0","addr":"0x2"}')
> +        self.vm.add_args('-device', '{"driver":"virtio-scsi-pci","id":"scsi0"'
> +                         ',"bus":"pci.0","addr":"0x3"}')
> +        self.vm.add_args('-device', '{"driver":"virtio-serial-pci","id":'
> +                         '"virtio-serial0","bus":"pci.0","addr":"0x4"}')
> +        self.vm.add_args('-device', '{"driver":"scsi-cd","bus":"scsi0.0"'
> +                         ',"channel":0,"scsi-id":0,"lun":0,"device_id":'
> +                         '"drive-scsi0-0-0-0","id":"scsi0-0-0-0"}')
> +        self.vm.add_args('-device', '{"driver":"virtio-balloon-pci",'
> +                         '"id":"balloon0","bus":"pci.0","addr":"0x6"}')
> +        self.vm.add_args('-audiodev', '{"id":"audio1","driver":"none"}')
> +        self.vm.add_args('-device', '{"driver":"usb-tablet","id":"input0"'
> +                         ',"bus":"usb.0","port":"1"}')
> +        self.vm.add_args('-device', '{"driver":"usb-kbd","id":"input1"'
> +                         ',"bus":"usb.0","port":"2"}')
> +        self.vm.add_args('-device', '{"driver":"VGA","id":"video0",'
> +                         '"vgamem_mb":16,"bus":"pci.0","addr":"0x7"}')
> +        self.vm.add_args('-object', '{"qom-type":"rng-random","id":"objrng0"'
> +                         ',"filename":"/dev/urandom"}',
> +                         '-device', '{"driver":"virtio-rng-pci","rng":"objrng0"'
> +                         ',"id":"rng0","bus":"pci.0","addr":"0x8"}')
> +        self.vm.add_args('-object', '{"qom-type":"cryptodev-backend-builtin",'
> +                         '"id":"objcrypto0","queues":1}',
> +                         '-device', '{"driver":"virtio-crypto-pci",'
> +                         '"cryptodev":"objcrypto0","id":"crypto0","bus"'
> +                         ':"pci.0","addr":"0xa"}')
> +        self.vm.add_args('-device', '{"driver":"spapr-pci-host-bridge"'
> +                         ',"index":1,"id":"pci.1"}')
> +        self.vm.add_args('-device', '{"driver":"spapr-vscsi","id":"scsi1"'
> +                         ',"reg":12288}')
> +        self.vm.add_args('-m', '2G,slots=32,maxmem=4G',
> +                         '-object', 'memory-backend-ram,id=ram1,size=1G',
> +                         '-device', 'pc-dimm,id=dimm1,memdev=ram1')
> +        self.vm.add_args('-drive', 'file=/tmp/tuxrun_baselines_ppc64_' +
> +                         str(res) + '.qcow2,format=qcow2,if=none,id='
> +                         'drive-virtio-disk1',
> +                         '-device', 'virtio-blk-pci,scsi=off,bus=pci.0,'
> +                         'addr=0xb,drive=drive-virtio-disk1,id=virtio-disk1'
> +                         ',bootindex=2')
>           self.common_tuxrun(drive="scsi-hd")
>   
> +        # remove qcow2 image
> +        process.run('rm /tmp/tuxrun_baselines_ppc64_' + str(res) + '.qcow2')
> +
>       def test_ppc64le(self):
>           """
>           :avocado: tags=arch:ppc64
>           :avocado: tags=machine:pseries
> -        :avocado: tags=cpu:POWER8
> +        :avocado: tags=cpu:POWER10
>           :avocado: tags=console:hvc0
>           :avocado: tags=tuxboot:ppc64le
>           :avocado: tags=image:vmlinux
>           :avocado: tags=extradev:driver=spapr-vscsi
>           :avocado: tags=root:sda
>           """
> +        # Generate a random string
> +        res = ''.join(random.choices(string.ascii_lowercase +
> +                                     string.digits, k=8))
> +
> +        # create qcow2 image to be used later.
> +        process.run('./qemu-img create -f qcow2 '
> +                    '/tmp/tuxrun_baselines_ppc64le_' + str(res) +
> +                    '.qcow2 1G')
> +
> +        # add device args to command line.
> +        self.vm.add_args('-netdev', 'user,id=vnet,hostfwd=:127.0.0.1:0-:22',
> +                         '-device', 'virtio-net,netdev=vnet')
> +        self.vm.add_args('-netdev', '{"type":"user","id":"hostnet0"}',
> +                         '-device', '{"driver":"virtio-net-pci","netdev":'
> +                         '"hostnet0","id":"net0","mac":"52:54:00:4c:e3:86",'
> +                         '"bus":"pci.0","addr":"0x9"}')
> +        self.vm.add_args('-device', '{"driver":"qemu-xhci","p2":15,"p3":15,'
> +                         '"id":"usb","bus":"pci.0","addr":"0x2"}')
> +        self.vm.add_args('-device', '{"driver":"virtio-scsi-pci","id":"scsi0"'
> +                         ',"bus":"pci.0","addr":"0x3"}')
> +        self.vm.add_args('-device', '{"driver":"virtio-serial-pci","id":'
> +                         '"virtio-serial0","bus":"pci.0","addr":"0x4"}')
> +        self.vm.add_args('-device', '{"driver":"scsi-cd","bus":"scsi0.0"'
> +                         ',"channel":0,"scsi-id":0,"lun":0,"device_id":'
> +                         '"drive-scsi0-0-0-0","id":"scsi0-0-0-0"}')
> +        self.vm.add_args('-device', '{"driver":"virtio-balloon-pci",'
> +                         '"id":"balloon0","bus":"pci.0","addr":"0x6"}')
> +        self.vm.add_args('-audiodev', '{"id":"audio1","driver":"none"}')
> +        self.vm.add_args('-device', '{"driver":"usb-tablet","id":"input0"'
> +                         ',"bus":"usb.0","port":"1"}')
> +        self.vm.add_args('-device', '{"driver":"usb-kbd","id":"input1"'
> +                         ',"bus":"usb.0","port":"2"}')
> +        self.vm.add_args('-device', '{"driver":"VGA","id":"video0",'
> +                         '"vgamem_mb":16,"bus":"pci.0","addr":"0x7"}')
> +        self.vm.add_args('-object', '{"qom-type":"rng-random","id":"objrng0"'
> +                         ',"filename":"/dev/urandom"}',
> +                         '-device', '{"driver":"virtio-rng-pci","rng":"objrng0"'
> +                         ',"id":"rng0","bus":"pci.0","addr":"0x8"}')
> +        self.vm.add_args('-object', '{"qom-type":"cryptodev-backend-builtin",'
> +                         '"id":"objcrypto0","queues":1}',
> +                         '-device', '{"driver":"virtio-crypto-pci",'
> +                         '"cryptodev":"objcrypto0","id":"crypto0","bus"'
> +                         ':"pci.0","addr":"0xa"}')
> +        self.vm.add_args('-device', '{"driver":"spapr-pci-host-bridge"'
> +                         ',"index":1,"id":"pci.1"}')
> +        self.vm.add_args('-device', '{"driver":"spapr-vscsi","id":"scsi1"'
> +                         ',"reg":12288}')
> +        self.vm.add_args('-m', '2G,slots=32,maxmem=4G',
> +                         '-object', 'memory-backend-ram,id=ram1,size=1G',
> +                         '-device', 'pc-dimm,id=dimm1,memdev=ram1')
> +        self.vm.add_args('-drive', 'file=/tmp/tuxrun_baselines_ppc64le_' +
> +                         str(res) + '.qcow2,format=qcow2,if=none,'
> +                         'id=drive-virtio-disk1',
> +                         '-device', 'virtio-blk-pci,scsi=off,bus=pci.0,'
> +                         'addr=0xb,drive=drive-virtio-disk1,id=virtio-disk1'
> +                         ',bootindex=2')
>           self.common_tuxrun(drive="scsi-hd")
>   
> +        # remove qcow2 image
> +        process.run('rm /tmp/tuxrun_baselines_ppc64le_' + str(res) + '.qcow2')
> +
>       def test_riscv32(self):
>           """
>           :avocado: tags=arch:riscv32

