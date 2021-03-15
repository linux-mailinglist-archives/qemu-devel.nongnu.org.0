Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6526433C32A
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 18:01:34 +0100 (CET)
Received: from localhost ([::1]:55608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLqaz-0006IX-Da
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 13:01:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1lLqSA-0000vd-Ts
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 12:52:26 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:17442)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1lLqS8-0006AQ-L7
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 12:52:26 -0400
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12FGY1KJ128543; Mon, 15 Mar 2021 12:52:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=fzxwmtMhqjIbxHj+vGvABtg3DYTQi8j/mRare/naBHk=;
 b=cOzFr0k32dRT/P0cZ8sZWqbni7GqIqkz/Huq3uWxkx1XdWp/7zrv5gkimCKv8yRUzxVw
 E1V/rjhx6bFRB1YAS4v8Mhv6KPQy7JmjdOQTH92aBCOn0zhltBQAAnI/0xG3hbm6Vq9j
 UNqFjJs381DOQU0si8lM1Zuosz1qNGJhXHD0bmgMLZ3FXjw8dTh3P2lYB0VVBiolLtB2
 Cx0y+SSqa02D5vP7bRWHIRXXaEZchfYnoGWvFU4RnK5yBu6RtFWuAchPxUkAKVL44kKM
 aoRq3s+BTY2PHe+eRa+52iYZHq43f5AFXjENHxxVqtbp0dNi+Yt4gYtIAE+aVpbqVWDc dA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37aa21ue6j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Mar 2021 12:52:21 -0400
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 12FGYVVW131124;
 Mon, 15 Mar 2021 12:52:21 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37aa21ue5p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Mar 2021 12:52:20 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12FGlsAo005072;
 Mon, 15 Mar 2021 16:52:18 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma06ams.nl.ibm.com with ESMTP id 378mnh22h5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Mar 2021 16:52:18 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 12FGqGhx50397558
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 15 Mar 2021 16:52:16 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 36FED42047;
 Mon, 15 Mar 2021 16:52:16 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E598542042;
 Mon, 15 Mar 2021 16:52:15 +0000 (GMT)
Received: from oc7455500831.ibm.com (unknown [9.171.7.179])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 15 Mar 2021 16:52:15 +0000 (GMT)
Subject: Re: [PULL 13/18] hw/core: implement a guest-loader to support static
 hypervisor guests
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 peter.maydell@linaro.org
References: <20210308135104.24903-1-alex.bennee@linaro.org>
 <20210308135104.24903-14-alex.bennee@linaro.org>
 <2bcd9ae8-b304-a9a1-9f14-d238a9b2f6a2@de.ibm.com>
 <e690a377-2f3e-0774-03f8-813f2631e4f0@redhat.com>
From: Christian Borntraeger <borntraeger@de.ibm.com>
Message-ID: <cd4e45b5-3e2e-35f3-72af-9ed87ae134ce@de.ibm.com>
Date: Mon, 15 Mar 2021 17:52:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <e690a377-2f3e-0774-03f8-813f2631e4f0@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-15_08:2021-03-15,
 2021-03-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxlogscore=999
 impostorscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0 mlxscore=0
 adultscore=0 clxscore=1015 spamscore=0 malwarescore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103150113
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=borntraeger@de.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 15.03.21 17:44, Philippe Mathieu-Daudé wrote:
> On 3/15/21 5:16 PM, Christian Borntraeger wrote:
>>
>>
>> On 08.03.21 14:50, Alex Bennée wrote:
>>> Hypervisors, especially type-1 ones, need the firmware/bootcode to put
>>> their initial guest somewhere in memory and pass the information to it
>>> via platform data. The guest-loader is modelled after the generic
>>> loader for exactly this sort of purpose:
>>>
>>>     $QEMU $ARGS  -kernel ~/xen.git/xen/xen \
>>>       -append "dom0_mem=1G,max:1G loglvl=all guest_loglvl=all" \
>>>       -device
>>> guest-loader,addr=0x42000000,kernel=Image,bootargs="root=/dev/sda2 ro
>>> console=hvc0 earlyprintk=xen" \
>>>       -device guest-loader,addr=0x47000000,initrd=rootfs.cpio
>>>
>>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>>> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
>>> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>>> Message-Id: <20210303173642.3805-5-alex.bennee@linaro.org>
>>>
>>
>> This now results in
>>
>>      /usr/bin/ld: libcommon.fa.p/hw_core_guest-loader.c.o: in function
>> `loader_insert_platform_data':
>>      build/../hw/core/guest-loader.c:56: undefined reference to
>> `qemu_fdt_add_subnode'
>>      /usr/bin/ld: build/../hw/core/guest-loader.c:57: undefined reference
>> to `qemu_fdt_setprop'
>>      /usr/bin/ld: build/../hw/core/guest-loader.c:61: undefined reference
>> to `qemu_fdt_setprop_string_array'
>>      /usr/bin/ld: build/../hw/core/guest-loader.c:68: undefined reference
>> to `qemu_fdt_setprop_string'
>>      /usr/bin/ld: build/../hw/core/guest-loader.c:74: undefined reference
>> to `qemu_fdt_setprop_string_array'
>>      collect2: error: ld returned 1 exit status
>>      ninja: build stopped: subcommand failed.
>>
>> when building s390-softmmu on s390 with  --disable-fdt, which was in my
>> build script.
>>
> 
> Oops. Quick fix:
> 
> -- >8 --
> diff --git a/hw/core/meson.build b/hw/core/meson.build
> index 9cd72edf513..5827996206e 100644
> --- a/hw/core/meson.build
> +++ b/hw/core/meson.build
> @@ -37,7 +37,7 @@
>     'clock-vmstate.c',
>   ))
> 
> -softmmu_ss.add(when: 'CONFIG_TCG', if_true: files('guest-loader.c'))
> +softmmu_ss.add(when: ['CONFIG_TCG', fdt], if_true: files('guest-loader.c'))
> 
>   specific_ss.add(when: 'CONFIG_SOFTMMU', if_true: files(
>     'machine-qmp-cmds.c',
> 

At least this one is
Tested-by: Christian Borntraeger <borntraeger@de.ibm.com>


