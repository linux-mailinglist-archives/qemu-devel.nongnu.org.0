Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD8776CBFCC
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Mar 2023 14:52:48 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ph8nA-00045M-F1; Tue, 28 Mar 2023 08:51:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1ph8n5-00044j-L4
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 08:51:07 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1ph8n2-0008NO-5P
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 08:51:07 -0400
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32SCAnZh006276; Tue, 28 Mar 2023 12:50:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=35X0sFruK19nsMgdRTotgsg+SBNZCDSP4iUFdMsuXLI=;
 b=Qino7FgZBUSMDaiBEFfhlfxVMF32fI3gC4NE70U/yXeELTof63CXf6S8SPnTZcnrsgdk
 2R/9ZwxxpznovqwZap6vqsbfYqxqonqyaADhzWov9PsY3H5jHguUuC/fRyqvLUJDL9VE
 SxWlcXcSFvBjJNfEUS6evpZK923wICQo/sUnKpBo+RjfApPW3Xrja05r8yY8hPnp57aW
 OoNk4M9rpLKK5I0hCOBjMcKmRjAFqUkJqgcRcOa1RT+Cm8YOncdaY8oSZC6SHPP5w7eN
 TJhPeipirVL7dzWpjsEBpx8xYwT3pgSGdl6cJaRrEKqzdsNrRGt9K8eI0dx+y5BMsBzf FA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pky9f1xc9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Mar 2023 12:50:53 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32SCkksi021797;
 Tue, 28 Mar 2023 12:50:53 GMT
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pky9f1xbs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Mar 2023 12:50:53 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32SCaWCQ005815;
 Tue, 28 Mar 2023 12:50:52 GMT
Received: from smtprelay05.dal12v.mail.ibm.com ([9.208.130.101])
 by ppma04wdc.us.ibm.com (PPS) with ESMTPS id 3phrk70pta-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Mar 2023 12:50:52 +0000
Received: from smtpav03.wdc07v.mail.ibm.com (smtpav03.wdc07v.mail.ibm.com
 [10.39.53.230])
 by smtprelay05.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 32SCopV310748570
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 28 Mar 2023 12:50:51 GMT
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E0D6F58054;
 Tue, 28 Mar 2023 12:50:50 +0000 (GMT)
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3B3BD58062;
 Tue, 28 Mar 2023 12:50:50 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
 by smtpav03.wdc07v.mail.ibm.com (Postfix) with ESMTP;
 Tue, 28 Mar 2023 12:50:50 +0000 (GMT)
Message-ID: <7e67b073-1437-cc54-3b2b-fbf94e56a010@linux.ibm.com>
Date: Tue, 28 Mar 2023 08:50:49 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] tests/avocado/aspeed: Add TPM TIS I2C test
Content-Language: en-US
To: Joel Stanley <joel@jms.id.au>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>, ninad@linux.ibm.com
Cc: Cleber Rosa <crosa@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, qemu-devel@nongnu.org
References: <20230328120844.190914-1-joel@jms.id.au>
From: Stefan Berger <stefanb@linux.ibm.com>
In-Reply-To: <20230328120844.190914-1-joel@jms.id.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: fYjtizBv8IFHBrZ9711mecyuvkSGpkAC
X-Proofpoint-GUID: xWfW6-fa3VWz0X7Bc6XPmCtZ7aDCr2p1
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-24_11,2023-03-28_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxlogscore=999
 adultscore=0 mlxscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2303280100
Received-SPF: pass client-ip=148.163.156.1; envelope-from=stefanb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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



On 3/28/23 08:08, Joel Stanley wrote:
> Add a new buildroot image based test that attaches a TPM emulator to the
> I2C bus and checks for a known PCR0 value for the image that was booted.
> 
> Note that this does not tear down swtpm process when qemu execution fails.
> The swtpm process will exit when qemu exits if a connection has been
> made, but if the test errors before connection then the swtpm process
> will still be around.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>

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

