Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9C176EA3EB
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 08:38:59 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppkPp-0003BB-UH; Fri, 21 Apr 2023 02:38:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kconsul@linux.vnet.ibm.com>)
 id 1ppkPi-00039h-QC
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 02:38:34 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kconsul@linux.vnet.ibm.com>)
 id 1ppkPU-0005qY-Cr
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 02:38:34 -0400
Received: from pps.filterd (m0353728.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33L6WdHo001745; Fri, 21 Apr 2023 06:38:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : references : content-type : in-reply-to :
 content-transfer-encoding : mime-version; s=pp1;
 bh=JIMsH7KhHgi2uAmlD7lGwTIRH4LMwXtA1SBRxwnmBG8=;
 b=Y4djXGcoBPPkC1JRWYI5DlRkrnjRnSZ4QK+dkKFIJSfbO4ZytpYVTTEePubQKR53nYm9
 ++OVuIQGorZKlCStwx4K+iBo991X0DgM2e7n+sUYMVEYOV/phk1KbjYz2/3V1OQ39KRK
 IoT18U0B8kCnUqU0K51eru1kB69f81tT9pS1QVjSxj61h1dlaAvpezMwRU7gTiKyXrya
 M9fsisatBnpKeitb4uZ75N96KsWEKoBWJ+y1f42hu1pocH+gnYzRE5zCW+afk9HT2wNE
 /b04Br0eEity890w2M6dBh3vKDMxUTlLj+0Mh00cj1nSluDWR8nc5R8l/SVAFKA4jm/+ 8A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3q3nae0k30-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 Apr 2023 06:38:17 +0000
Received: from m0353728.ppops.net (m0353728.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 33L6Wuvq002962;
 Fri, 21 Apr 2023 06:38:17 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3q3nae0jy5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 Apr 2023 06:38:16 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 33L2Laqi012795;
 Fri, 21 Apr 2023 06:38:13 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
 by ppma03ams.nl.ibm.com (PPS) with ESMTPS id 3pykj6kv4x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 Apr 2023 06:38:13 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com
 [10.20.54.105])
 by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 33L6cB4Y45089192
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 21 Apr 2023 06:38:11 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 019B020043;
 Fri, 21 Apr 2023 06:38:11 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7527920040;
 Fri, 21 Apr 2023 06:38:08 +0000 (GMT)
Received: from li-a450e7cc-27df-11b2-a85c-b5a9ac31e8ef.ibm.com (unknown
 [9.43.121.215])
 by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTPS;
 Fri, 21 Apr 2023 06:38:08 +0000 (GMT)
Date: Fri, 21 Apr 2023 12:08:05 +0530
From: Kautuk Consul <kconsul@linux.vnet.ibm.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH v4 2/2] tests/avocado/tuxrun_baselines.py: improve code
 coverage for ppc64
Message-ID: <ZEIvTdzgkejpARdX@li-a450e7cc-27df-11b2-a85c-b5a9ac31e8ef.ibm.com>
References: <20230421042322.684093-1-kconsul@linux.vnet.ibm.com>
 <20230421042322.684093-3-kconsul@linux.vnet.ibm.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20230421042322.684093-3-kconsul@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: rrZujj2s0nF5BWYn1ASJpNDcq7BTg9Mw
X-Proofpoint-GUID: u3bnuvVcKSe_CV7JCiOOliYp4EkbiBom
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-21_01,2023-04-20_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0
 mlxlogscore=999 impostorscore=0 phishscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 priorityscore=1501 mlxscore=0 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304210055
Received-SPF: none client-ip=148.163.156.1;
 envelope-from=kconsul@linux.vnet.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Adding Harsh Prateek Bora <harshpb@linux.ibm.com>.

On 2023-04-20 23:23:22, Kautuk Consul wrote:
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
>   lines......: 13.8% (58006 of 420997 lines)
>   functions..: 20.7% (7675 of 36993 functions)
>   branches...: 9.2% (22146 of 240611 branches)
> Without boot_linux.py (without this patch changes)
> --------------------------------------------------
>   lines......: 11.9% (50174 of 420997 lines)
>   functions..: 18.8% (6947 of 36993 functions)
>   branches...: 7.4% (17580 of 239017 branches)
> Without boot_linux.py (with this patch changes)
> -----------------------------------------------
>   lines......: 13.8% (58287 of 420997 lines)
>   functions..: 20.7% (7640 of 36993 functions)
>   branches...: 8.4% (20223 of 240611 branches)
> 
> Signed-off-by: Kautuk Consul <kconsul@linux.vnet.ibm.com>
> Reported-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  tests/avocado/tuxrun_baselines.py | 68 +++++++++++++++++++++++++++++--
>  1 file changed, 64 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/avocado/tuxrun_baselines.py b/tests/avocado/tuxrun_baselines.py
> index d343376faa..546abd9396 100644
> --- a/tests/avocado/tuxrun_baselines.py
> +++ b/tests/avocado/tuxrun_baselines.py
> @@ -11,6 +11,7 @@
>  
>  import os
>  import time
> +import tempfile
>  
>  from avocado import skip, skipIf
>  from avocado_qemu import QemuSystemTest
> @@ -72,6 +73,8 @@ def setUp(self):
>          # Occasionally we need extra devices to hook things up
>          self.extradev = self.get_tag('extradev')
>  
> +        self.qemu_img = super().get_qemu_img()
> +
>      def wait_for_console_pattern(self, success_message, vm=None):
>          wait_for_console_pattern(self, success_message,
>                                   failure_message='Kernel panic - not syncing',
> @@ -164,6 +167,63 @@ def common_tuxrun(self, dt=None,
>          self.vm.launch()
>          self.run_tuxtest_tests(haltmsg)
>  
> +    def ppc64_common_tuxrun(self, prefix):
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
> +
> +        # Create a temporary qcow2 and launch the test-case
> +        with tempfile.NamedTemporaryFile(prefix=prefix,
> +                                         suffix='.qcow2') as qcow2:
> +            process.run(self.qemu_img + ' create -f qcow2 ' +
> +                        qcow2.name + ' 1G')
> +
> +            self.vm.add_args('-drive', 'file=' + qcow2.name +
> +                         ',format=qcow2,if=none,id='
> +                         'drive-virtio-disk1',
> +                         '-device', 'virtio-blk-pci,scsi=off,bus=pci.0,'
> +                         'addr=0xb,drive=drive-virtio-disk1,id=virtio-disk1'
> +                         ',bootindex=2')
> +            self.common_tuxrun(drive="scsi-hd")
> +
>      #
>      # The tests themselves. The configuration is derived from how
>      # tuxrun invokes qemu (with minor tweaks like using -blockdev
> @@ -308,7 +368,7 @@ def test_ppc64(self):
>          """
>          :avocado: tags=arch:ppc64
>          :avocado: tags=machine:pseries
> -        :avocado: tags=cpu:POWER8
> +        :avocado: tags=cpu:POWER10
>          :avocado: tags=endian:big
>          :avocado: tags=console:hvc0
>          :avocado: tags=tuxboot:ppc64
> @@ -316,20 +376,20 @@ def test_ppc64(self):
>          :avocado: tags=extradev:driver=spapr-vscsi
>          :avocado: tags=root:sda
>          """
> -        self.common_tuxrun(drive="scsi-hd")
> +        self.ppc64_common_tuxrun(prefix='tuxrun_ppc64_')
>  
>      def test_ppc64le(self):
>          """
>          :avocado: tags=arch:ppc64
>          :avocado: tags=machine:pseries
> -        :avocado: tags=cpu:POWER8
> +        :avocado: tags=cpu:POWER10
>          :avocado: tags=console:hvc0
>          :avocado: tags=tuxboot:ppc64le
>          :avocado: tags=image:vmlinux
>          :avocado: tags=extradev:driver=spapr-vscsi
>          :avocado: tags=root:sda
>          """
> -        self.common_tuxrun(drive="scsi-hd")
> +        self.ppc64_common_tuxrun(prefix='tuxrun_ppc64le_')
>  
>      def test_riscv32(self):
>          """
> -- 
> 2.25.1
> 
> 

