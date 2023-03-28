Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 745146CC1BF
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Mar 2023 16:12:13 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phA38-0001ED-Uc; Tue, 28 Mar 2023 10:11:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@linux.vnet.ibm.com>)
 id 1phA36-0001CV-VC
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 10:11:44 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@linux.vnet.ibm.com>)
 id 1phA35-0003YA-3E
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 10:11:44 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32SDxkfT009657; Tue, 28 Mar 2023 14:11:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=fdsP/qsRzh3olcY5ZWUC+f7SovUTpTfOZQCmatA2opk=;
 b=JB9PXsWRVKe6B4TFBzbDRr+j+f9P5LdiypSJ7bJLot023Z1MlcG57bK18AONYMhSDknz
 AUQJ9pIzsOuzr7LPbVQ6XqnQkDfqS8FjXuL1+G5O3xGHl4nQabg3lqUNaLTJiaBIPnHl
 WkasJvybDtd/veDb5O+eV1wE0CiB9j+mc2I8430/ga5OkOKh6YoCh729SKt68KSzReyE
 ItDMWn/n68bn6+OcNxV1IKRyi7GeLotIr7TFc1wS2qb3Tsc5dE57nBNK9703XOju44dY
 CbQTcAMo8uytxHV/Kdn34Ktcl5zK8qc+BfsZdCakotfrTly2w2IDiseEJbUREQYkx+TU FQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pm1m3rcp5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Mar 2023 14:11:29 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32SE1JoF015315;
 Tue, 28 Mar 2023 14:11:28 GMT
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pm1m3rcnp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Mar 2023 14:11:28 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32SDmYYQ019640;
 Tue, 28 Mar 2023 14:11:27 GMT
Received: from smtprelay04.dal12v.mail.ibm.com ([9.208.130.102])
 by ppma04dal.us.ibm.com (PPS) with ESMTPS id 3phrk7na2q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Mar 2023 14:11:27 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com
 [10.241.53.100])
 by smtprelay04.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 32SEBQFW2622060
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 28 Mar 2023 14:11:26 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 660E158058;
 Tue, 28 Mar 2023 14:11:26 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 17F3858057;
 Tue, 28 Mar 2023 14:11:26 +0000 (GMT)
Received: from [9.163.13.29] (unknown [9.163.13.29])
 by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
 Tue, 28 Mar 2023 14:11:26 +0000 (GMT)
Message-ID: <bd670493-1ea7-b341-f412-787c69fcf797@linux.vnet.ibm.com>
Date: Tue, 28 Mar 2023 09:11:25 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH] tests/avocado/aspeed: Add TPM TIS I2C test
Content-Language: en-US
To: Joel Stanley <joel@jms.id.au>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>, stefanb@linux.ibm.com, ninad@linux.ibm.com
Cc: Cleber Rosa <crosa@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, qemu-devel@nongnu.org
References: <20230328120844.190914-1-joel@jms.id.au>
From: Ninad Palsule <ninad@linux.vnet.ibm.com>
In-Reply-To: <20230328120844.190914-1-joel@jms.id.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: UtdJy0LSY-yNHWqR4PQ67GyjV9_OgGV5
X-Proofpoint-ORIG-GUID: pMiT5LrQuvAHHhWwctcABPekJDb0CTCg
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-24_11,2023-03-28_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 spamscore=0 mlxlogscore=999 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2303280111
Received-SPF: none client-ip=148.163.156.1;
 envelope-from=ninad@linux.vnet.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

Hi Joel,

Thanks for the test.

Ninad


On 3/28/23 7:08 AM, Joel Stanley wrote:
> Add a new buildroot image based test that attaches a TPM emulator to the
> I2C bus and checks for a known PCR0 value for the image that was booted.
>
> Note that this does not tear down swtpm process when qemu execution fails.
> The swtpm process will exit when qemu exits if a connection has been
> made, but if the test errors before connection then the swtpm process
> will still be around.
>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>   tests/avocado/machine_aspeed.py | 42 +++++++++++++++++++++++++++++++--
>   1 file changed, 40 insertions(+), 2 deletions(-)
>
> diff --git a/tests/avocado/machine_aspeed.py b/tests/avocado/machine_aspeed.py
> index 35723af4ede0..a4485a5c4d4d 100644
> --- a/tests/avocado/machine_aspeed.py
> +++ b/tests/avocado/machine_aspeed.py
> @@ -7,14 +7,18 @@
>   
>   import time
>   import os
> +import tempfile
> +import subprocess
>   
>   from avocado_qemu import QemuSystemTest
>   from avocado_qemu import wait_for_console_pattern
>   from avocado_qemu import exec_command
>   from avocado_qemu import exec_command_and_wait_for_pattern
>   from avocado_qemu import interrupt_interactive_console_until_pattern
> +from avocado_qemu import has_cmd
>   from avocado.utils import archive
>   from avocado import skipIf
> +from avocado import skipUnless
>   
>   
>   class AST1030Machine(QemuSystemTest):
> @@ -132,7 +136,7 @@ def test_arm_ast2500_romulus_openbmc_v2_9_0(self):
>   
>           self.do_test_arm_aspeed(image_path)
>   
> -    def do_test_arm_aspeed_buildroot_start(self, image, cpu_id):
> +    def do_test_arm_aspeed_buildroot_start(self, image, cpu_id, pattern='Aspeed EVB'):
>           self.require_netdev('user')
>   
>           self.vm.set_console()
> @@ -146,7 +150,7 @@ def do_test_arm_aspeed_buildroot_start(self, image, cpu_id):
>           self.wait_for_console_pattern('Booting Linux on physical CPU ' + cpu_id)
>           self.wait_for_console_pattern('lease of 10.0.2.15')
>           # the line before login:
> -        self.wait_for_console_pattern('Aspeed EVB')
> +        self.wait_for_console_pattern(pattern)
>           time.sleep(0.1)
>           exec_command(self, 'root')
>           time.sleep(0.1)
> @@ -229,6 +233,40 @@ def test_arm_ast2600_evb_buildroot(self):
>                '0000000 ffaa ffff ffff ffff ffff ffff ffff ffff');
>           self.do_test_arm_aspeed_buildroot_poweroff()
>   
> +    @skipUnless(*has_cmd('swtpm'))
> +    def test_arm_ast2600_evb_buildroot_tpm(self):
> +        """
> +        :avocado: tags=arch:arm
> +        :avocado: tags=machine:ast2600-evb
> +        """
> +
> +        image_url = ('https://github.com/legoater/qemu-aspeed-boot/raw/master/'
> +                     'images/ast2600-evb/buildroot-2023.02-tpm/flash.img')
> +        image_hash = ('a46009ae8a5403a0826d607215e731a8c68d27c14c41e55331706b8f9c7bd997')
> +        image_path = self.fetch_asset(image_url, asset_hash=image_hash,
> +                                      algorithm='sha256')
> +
> +        socket = os.path.join(self.vm.sock_dir, 'swtpm-socket')
> +
> +        subprocess.run(['swtpm', 'socket', '-d', '--tpm2',
> +                        '--tpmstate', f'dir={self.vm.temp_dir}',
> +                        '--ctrl', f'type=unixio,path={socket}'])
> +
> +        self.vm.add_args('-chardev', f'socket,id=chrtpm,path={socket}')
> +        self.vm.add_args('-tpmdev', 'emulator,id=tpm0,chardev=chrtpm')
> +        self.vm.add_args('-device',
> +                         'tpm-tis-i2c,tpmdev=tpm0,bus=aspeed.i2c.bus.12,address=0x2e')
> +        self.do_test_arm_aspeed_buildroot_start(image_path, '0xf00', 'Aspeed AST2600 EVB')
> +        exec_command(self, "passw0rd")
> +
> +        exec_command_and_wait_for_pattern(self,
> +            'echo tpm_tis_i2c 0x2e > /sys/bus/i2c/devices/i2c-12/new_device',
> +            'tpm_tis_i2c 12-002e: 2.0 TPM (device-id 0x1, rev-id 1)');
> +        exec_command_and_wait_for_pattern(self,
> +            'cat /sys/class/tpm/tpm0/pcr-sha256/0',
> +            'B804724EA13F52A9072BA87FE8FDCC497DFC9DF9AA15B9088694639C431688E0');
> +
> +        self.do_test_arm_aspeed_buildroot_poweroff()
>   
>   class AST2x00MachineSDK(QemuSystemTest):
>   

