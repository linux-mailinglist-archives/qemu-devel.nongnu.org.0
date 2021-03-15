Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 462F433C17C
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 17:18:40 +0100 (CET)
Received: from localhost ([::1]:46378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLpvT-0007Zi-Bw
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 12:18:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1lLptV-0005mG-Un
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 12:16:37 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:38828)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1lLptU-0002LG-7B
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 12:16:37 -0400
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12FG3Gun033863; Mon, 15 Mar 2021 12:16:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=sSAU1x0jzR/EWGz3mULqEUyaVOfJHxPnLn7vRMzPRLE=;
 b=Vk6vVA93LjsAkU4v0EU6kxfLjtuc8JNoiIXCczEwQdo1LAzF0trD2nIUaIzVBzHgpcS7
 7pWcnsWuRDED1eOh8ORfcx83dyXfm2v/aQl5OZBrtwkKKHPxNCWdWmmiFbS9mRKbskoM
 JRMFhAV/XulOxsuVhYxLgHMO307vhuOD0qdeehlK5CAAGF3TihbZ52VQNql//FBwyPzM
 TNIeWlnEDczVxIC5N7YADCJLCdqe4yS/hEYrkPJHVM7HuAFytqv3SgB915CqzkIWDNtM
 7N6+R57U89UAZz2HX66NEKEAtWKyt2mvW46UiTjThV8WsSXDHV7kzip9O17AlZ4xwtIo AQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37aafs938c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Mar 2021 12:16:34 -0400
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 12FGGYht100305;
 Mon, 15 Mar 2021 12:16:34 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37aafs9378-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Mar 2021 12:16:33 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12FG2u0C016171;
 Mon, 15 Mar 2021 16:16:31 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma04ams.nl.ibm.com with ESMTP id 378n18j1cw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Mar 2021 16:16:31 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 12FGGTXc58130780
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 15 Mar 2021 16:16:29 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4BBC142047;
 Mon, 15 Mar 2021 16:16:29 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 07C4042042;
 Mon, 15 Mar 2021 16:16:29 +0000 (GMT)
Received: from oc7455500831.ibm.com (unknown [9.171.7.179])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 15 Mar 2021 16:16:28 +0000 (GMT)
Subject: Re: [PULL 13/18] hw/core: implement a guest-loader to support static
 hypervisor guests
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 peter.maydell@linaro.org
References: <20210308135104.24903-1-alex.bennee@linaro.org>
 <20210308135104.24903-14-alex.bennee@linaro.org>
From: Christian Borntraeger <borntraeger@de.ibm.com>
Message-ID: <2bcd9ae8-b304-a9a1-9f14-d238a9b2f6a2@de.ibm.com>
Date: Mon, 15 Mar 2021 17:16:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210308135104.24903-14-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-15_08:2021-03-15,
 2021-03-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 lowpriorityscore=0 clxscore=1011 adultscore=0 mlxscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 mlxlogscore=999 spamscore=0
 phishscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2009150000 definitions=main-2103150112
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 08.03.21 14:50, Alex Bennée wrote:
> Hypervisors, especially type-1 ones, need the firmware/bootcode to put
> their initial guest somewhere in memory and pass the information to it
> via platform data. The guest-loader is modelled after the generic
> loader for exactly this sort of purpose:
> 
>    $QEMU $ARGS  -kernel ~/xen.git/xen/xen \
>      -append "dom0_mem=1G,max:1G loglvl=all guest_loglvl=all" \
>      -device guest-loader,addr=0x42000000,kernel=Image,bootargs="root=/dev/sda2 ro console=hvc0 earlyprintk=xen" \
>      -device guest-loader,addr=0x47000000,initrd=rootfs.cpio
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> Message-Id: <20210303173642.3805-5-alex.bennee@linaro.org>
> 

This now results in

     /usr/bin/ld: libcommon.fa.p/hw_core_guest-loader.c.o: in function `loader_insert_platform_data':
     build/../hw/core/guest-loader.c:56: undefined reference to `qemu_fdt_add_subnode'
     /usr/bin/ld: build/../hw/core/guest-loader.c:57: undefined reference to `qemu_fdt_setprop'
     /usr/bin/ld: build/../hw/core/guest-loader.c:61: undefined reference to `qemu_fdt_setprop_string_array'
     /usr/bin/ld: build/../hw/core/guest-loader.c:68: undefined reference to `qemu_fdt_setprop_string'
     /usr/bin/ld: build/../hw/core/guest-loader.c:74: undefined reference to `qemu_fdt_setprop_string_array'
     collect2: error: ld returned 1 exit status
     ninja: build stopped: subcommand failed.

when building s390-softmmu on s390 with  --disable-fdt, which was in my build script.

