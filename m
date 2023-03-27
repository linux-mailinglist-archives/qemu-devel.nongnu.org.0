Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2E516CA236
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Mar 2023 13:12:21 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pgklL-0001rA-Cw; Mon, 27 Mar 2023 07:11:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1pgklI-0001r1-G3
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 07:11:40 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1pgklF-0008PN-Bk
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 07:11:39 -0400
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32RAvqgd000729; Mon, 27 Mar 2023 11:11:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=5tRar9I9++kXcYS4HS+PBYLIqtuLWbvDedB8teoBDg0=;
 b=Vx8CgQ13wnKZf1nLo+vXJ1qVJCMFWv5Homr7rLO+5llAVvTDRqTW5rlgbGVtBYDIKIaM
 CFLdillkiT87gE4+YsMZdMFoIrxsjVhPjTC1MSK29RRo8za95s42TULv7+PnpAwUgt3U
 ULAklvlpHliwgzqSobBEwGLSCdxeIbB07N+AY0/fyT787UmkxKyR3czxJS2Do8aYTwM7
 H3GqHwE/23udhttarJBH/TPL/FN09m3zX3TrJi5bsQJSY6SLsqfCBCwDdnrXQJ157SLE
 rSK1oExkl6kYGpLrmiMXsnjn8Y4JOa3ijHZ4KWAhLAJBjM5ZJWEnzUjXC/msQrjvoJ6e ZQ== 
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pjaru5ts4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Mar 2023 11:11:27 +0000
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32RA0pYA020158;
 Mon, 27 Mar 2023 11:11:25 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([9.208.129.120])
 by ppma01wdc.us.ibm.com (PPS) with ESMTPS id 3phrk6tumt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Mar 2023 11:11:25 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com
 [10.241.53.105])
 by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 32RBBOhN25756162
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 27 Mar 2023 11:11:24 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8427158059;
 Mon, 27 Mar 2023 11:11:24 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 328CE58055;
 Mon, 27 Mar 2023 11:11:24 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
 by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
 Mon, 27 Mar 2023 11:11:24 +0000 (GMT)
Message-ID: <2ef78250-dfe6-688f-eb27-9af97ce593e7@linux.ibm.com>
Date: Mon, 27 Mar 2023 07:11:23 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v7 0/3] Add support for TPM devices over I2C bus
Content-Language: en-US
To: Joel Stanley <joel@jms.id.au>, Ninad Palsule <ninad@linux.ibm.com>
Cc: qemu-devel@nongnu.org, andrew@aj.id.au, clg@kaod.org
References: <20230326224426.3918167-1-ninad@linux.ibm.com>
 <CACPK8XeZA8nqhgjH_SUDrk3A49dUqnKVONtj+QtcnjOsLUjvGQ@mail.gmail.com>
From: Stefan Berger <stefanb@linux.ibm.com>
In-Reply-To: <CACPK8XeZA8nqhgjH_SUDrk3A49dUqnKVONtj+QtcnjOsLUjvGQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Dz4aKJ5JkM70ajtwxPDhCiXrWEiIBkHr
X-Proofpoint-GUID: Dz4aKJ5JkM70ajtwxPDhCiXrWEiIBkHr
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-24_11,2023-03-27_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 clxscore=1015
 mlxlogscore=999 impostorscore=0 priorityscore=1501 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2303270088
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



On 3/26/23 21:05, Joel Stanley wrote:
> Hi Ninad,
> 
> On Sun, 26 Mar 2023 at 22:44, Ninad Palsule <ninad@linux.ibm.com> wrote:
>>
>> Hello,
>>
>> I have incorporated review comments from Stefan. Please review.
>>
>> This drop adds support for the TPM devices attached to the I2C bus. It
>> only supports the TPM2 protocol. You need to run it with the external
>> TPM emulator like swtpm. I have tested it with swtpm.
> 
> Nice work. I tested these stop cedric's aspeed-8.0 qemu tree, using
> the rainier machine and the openbmc dev-6.1 kernel.
> 
> We get this message when booting from a kernel:
> 
> [    0.582699] tpm_tis_i2c 12-002e: 2.0 TPM (device-id 0x1, rev-id 1)
> [    0.586361] tpm tpm0: A TPM error (256) occurred attempting the self test
> [    0.586623] tpm tpm0: starting up the TPM manually
> 
> Do we understand why the error appears?

The firmware did not initialize the TPM 2.



> 
> # grep -r . /sys/class/tpm/tpm0/pcr-sha256/ | sort -n -k 7 -t /
> /sys/class/tpm/tpm0/pcr-sha256/0:0000000000000000000000000000000000000000000000000000000000000000
> /sys/class/tpm/tpm0/pcr-sha256/1:0000000000000000000000000000000000000000000000000000000000000000
> /sys/class/tpm/tpm0/pcr-sha256/2:0000000000000000000000000000000000000000000000000000000000000000
> /sys/class/tpm/tpm0/pcr-sha256/3:0000000000000000000000000000000000000000000000000000000000000000
> /sys/class/tpm/tpm0/pcr-sha256/4:0000000000000000000000000000000000000000000000000000000000000000
> /sys/class/tpm/tpm0/pcr-sha256/5:0000000000000000000000000000000000000000000000000000000000000000
> /sys/class/tpm/tpm0/pcr-sha256/6:0000000000000000000000000000000000000000000000000000000000000000
> /sys/class/tpm/tpm0/pcr-sha256/7:0000000000000000000000000000000000000000000000000000000000000000
> /sys/class/tpm/tpm0/pcr-sha256/8:0000000000000000000000000000000000000000000000000000000000000000
> /sys/class/tpm/tpm0/pcr-sha256/9:0000000000000000000000000000000000000000000000000000000000000000
> /sys/class/tpm/tpm0/pcr-sha256/10:0000000000000000000000000000000000000000000000000000000000000000
> /sys/class/tpm/tpm0/pcr-sha256/11:0000000000000000000000000000000000000000000000000000000000000000
> /sys/class/tpm/tpm0/pcr-sha256/12:0000000000000000000000000000000000000000000000000000000000000000
> /sys/class/tpm/tpm0/pcr-sha256/13:0000000000000000000000000000000000000000000000000000000000000000
> /sys/class/tpm/tpm0/pcr-sha256/14:0000000000000000000000000000000000000000000000000000000000000000
> /sys/class/tpm/tpm0/pcr-sha256/15:0000000000000000000000000000000000000000000000000000000000000000
> /sys/class/tpm/tpm0/pcr-sha256/16:0000000000000000000000000000000000000000000000000000000000000000
> /sys/class/tpm/tpm0/pcr-sha256/17:FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
> /sys/class/tpm/tpm0/pcr-sha256/18:FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
> /sys/class/tpm/tpm0/pcr-sha256/19:FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
> /sys/class/tpm/tpm0/pcr-sha256/20:FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
> /sys/class/tpm/tpm0/pcr-sha256/21:FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
> /sys/class/tpm/tpm0/pcr-sha256/22:FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
> /sys/class/tpm/tpm0/pcr-sha256/23:0000000000000000000000000000000000000000000000000000000000000000
> 
> If I boot through the openbmc u-boot for the p10bmc machine, which
> measures things into the PCRs:
> 
> [    0.556713] tpm_tis_i2c 12-002e: 2.0 TPM (device-id 0x1, rev-id 1)

In this case the firmware started up the TPM 2. Also the PCRs have been touched by the firmware in this case.

> 
> / # grep -r . /sys/class/tpm/tpm0/pcr-sha256/ | sort -n -k 7 -t /
> /sys/class/tpm/tpm0/pcr-sha256/0:AFA13691EFC7BC6E189E92347F20676FB4523302CB957DA9A65C3430C45E8BCC
> /sys/class/tpm/tpm0/pcr-sha256/1:37F0F710A5502FAE6DB7433B36001FEE1CBF15BA2A7D6923207FF56888584714
> /sys/class/tpm/tpm0/pcr-sha256/2:E21B703EE69C77476BCCB43EC0336A9A1B2914B378944F7B00A10214CA8FEA93
> /sys/class/tpm/tpm0/pcr-sha256/3:E21B703EE69C77476BCCB43EC0336A9A1B2914B378944F7B00A10214CA8FEA93
> /sys/class/tpm/tpm0/pcr-sha256/4:E21B703EE69C77476BCCB43EC0336A9A1B2914B378944F7B00A10214CA8FEA93
> /sys/class/tpm/tpm0/pcr-sha256/5:E21B703EE69C77476BCCB43EC0336A9A1B2914B378944F7B00A10214CA8FEA93
> /sys/class/tpm/tpm0/pcr-sha256/6:E21B703EE69C77476BCCB43EC0336A9A1B2914B378944F7B00A10214CA8FEA93
> /sys/class/tpm/tpm0/pcr-sha256/7:E21B703EE69C77476BCCB43EC0336A9A1B2914B378944F7B00A10214CA8FEA93
> /sys/class/tpm/tpm0/pcr-sha256/8:AE67485BD01E8D6FE0208C46C473940173F66E9C6F43C75ABB404375787E9705
> /sys/class/tpm/tpm0/pcr-sha256/9:DB99D92EADBB446894CB0C062AEB673F60DDAFBC62BC2A9CA561A13B31E5357C
> /sys/class/tpm/tpm0/pcr-sha256/10:0000000000000000000000000000000000000000000000000000000000000000
> /sys/class/tpm/tpm0/pcr-sha256/11:0000000000000000000000000000000000000000000000000000000000000000
> /sys/class/tpm/tpm0/pcr-sha256/12:0000000000000000000000000000000000000000000000000000000000000000
> /sys/class/tpm/tpm0/pcr-sha256/13:0000000000000000000000000000000000000000000000000000000000000000
> /sys/class/tpm/tpm0/pcr-sha256/14:0000000000000000000000000000000000000000000000000000000000000000
> /sys/class/tpm/tpm0/pcr-sha256/15:0000000000000000000000000000000000000000000000000000000000000000
> /sys/class/tpm/tpm0/pcr-sha256/16:0000000000000000000000000000000000000000000000000000000000000000
> /sys/class/tpm/tpm0/pcr-sha256/17:FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
> /sys/class/tpm/tpm0/pcr-sha256/18:FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
> /sys/class/tpm/tpm0/pcr-sha256/19:FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
> /sys/class/tpm/tpm0/pcr-sha256/20:FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
> /sys/class/tpm/tpm0/pcr-sha256/21:FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
> /sys/class/tpm/tpm0/pcr-sha256/22:FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
> /sys/class/tpm/tpm0/pcr-sha256/23:0000000000000000000000000000000000000000000000000000000000000000
> 
> However on a clean boot into the TPM, the u-boot tpm commands fail:
> 
> ast# tpm info
> tpm@2e v2.0: VendorID 0x1014, DeviceID 0x0001, RevisionID 0x01 [closed]
> ast# tpINTERRUPT>

Is this normal output? Is it an indication of some sort of IRQ?

> ast# tpm init
> ast# tpm info
> tpm@2e v2.0: VendorID 0x1014, DeviceID 0x0001, RevisionID 0x01 [open]
> ast# tpm pcr_read 0 0x81000000
> Error: 256
> ast# md.l 0x81000000 16
> 81000000: 00000000 00000000 00000000 00000000    ................
> 81000010: 00000000 00000000 00000000 00000000    ................
> 81000020: 00000000 00000000 00000000 00000000    ................
> 81000030: 00000000 00000000 00000000 00000000    ................
> 81000040: 00000000 00000000 00000000 00000000    ................
> 81000050: 00000000 00000000                      ........
> 
> This doesn't need to block merging into qemu, as the model works fine
> for pcr measurement and accessing under Linux. However it would be
> good to work though these issues in case there's a modelling
> discrepancy.


It reads the didvid and rid registers just fine and per the touched PCRs it knows how to talk to the TPM 2 to extend the PCRs.
So this is strange. What is the 0x81000000 parameter in this command? Is it some memory location?


    Stefan

> 
> 
> 
>>
>> I have refered to the work done by zhdaniel@meta.com but at the core
>> level out implementation is different.
>> https://github.com/theopolis/qemu/commit/2e2e57cde9e419c36af8071bb85392ad1ed70966
>>
>> Based-on: $MESSAGE_ID
>>
>>
>> Ninad Palsule (3):
>>    docs: Add support for TPM devices over I2C bus
>>    tpm: Extend common APIs to support TPM TIS I2C
>>    tpm: Add support for TPM device over I2C bus
>>
>>   docs/specs/tpm.rst      |  32 +++
>>   hw/arm/Kconfig          |   1 +
>>   hw/tpm/Kconfig          |   7 +
>>   hw/tpm/meson.build      |   1 +
>>   hw/tpm/tpm_tis.h        |   3 +
>>   hw/tpm/tpm_tis_common.c |  36 ++-
>>   hw/tpm/tpm_tis_i2c.c    | 540 ++++++++++++++++++++++++++++++++++++++++
>>   hw/tpm/trace-events     |   6 +
>>   include/hw/acpi/tpm.h   |  31 +++
>>   include/sysemu/tpm.h    |   3 +
>>   10 files changed, 652 insertions(+), 8 deletions(-)
>>   create mode 100644 hw/tpm/tpm_tis_i2c.c
>>
>> --
>> 2.37.2
>>

