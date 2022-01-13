Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF34B48DAC9
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 16:41:29 +0100 (CET)
Received: from localhost ([::1]:56502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n82EC-0005To-Sh
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 10:41:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1n82Bo-0003xK-GG
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 10:39:01 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:25306
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1n82Bj-0001pf-J0
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 10:38:59 -0500
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20DEw5Yw010143; 
 Thu, 13 Jan 2022 15:38:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=Lo1GyruhiwoUIBQBTL5YGoTDtzjMgabtXuUgrfJKJOk=;
 b=AtkwmdXumr9XMoXduQEbLktPIJZKrxBYoN9pKMUcEnaPj2A0kSYIFSKfDb0TzGmJ6NVO
 iKcoerhgcOPzPgSNo50CC6Xz4oyxj+YAI4eStJriS0Rj4HbaTbqUgHRVI+DYnoHxP5IJ
 RWG5m2kvb2+zrfZlhA7Kfv02t052k/xQvrmnAQlz0f+PhIkZmIyO2qpbRBKCdT5K6KXY
 LgP2tVADSbSuYJhssvttEvdoPPyE2bHsBgcuwtIQCWotZLuCZJ/D9TT3IaeVBsuwtsZO
 C/BoiMFGb5aQsqt8McqOYDvW1o252P2GmW47fi5GYXSyzaewH1ufOddGATjIgjKjWTsr oA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3djpadrwd3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 13 Jan 2022 15:38:48 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20DEx35n013231;
 Thu, 13 Jan 2022 15:38:48 GMT
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3djpadrwcn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 13 Jan 2022 15:38:48 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20DFXvrc012020;
 Thu, 13 Jan 2022 15:38:47 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma02dal.us.ibm.com with ESMTP id 3df28ccdd5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 13 Jan 2022 15:38:47 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20DFcjH715925732
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 13 Jan 2022 15:38:45 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7D704124069;
 Thu, 13 Jan 2022 15:38:45 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5494112406B;
 Thu, 13 Jan 2022 15:38:45 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 13 Jan 2022 15:38:45 +0000 (GMT)
Message-ID: <a980d96e-3a4b-f06b-dd77-588309f8109e@linux.ibm.com>
Date: Thu, 13 Jan 2022 10:38:45 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 1/2] tpm: CRB: Use ram_device for "tpm-crb-cmd" region
Content-Language: en-US
To: eric.auger@redhat.com, eric.auger.pro@gmail.com,
 stefanb@linux.vnet.ibm.com, qemu-devel@nongnu.org,
 alex.williamson@redhat.com, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?=
 <marcandre.lureau@redhat.com>
References: <20220113103757.2801389-1-eric.auger@redhat.com>
 <20220113103757.2801389-2-eric.auger@redhat.com>
 <75a7ffde-5ca4-cd98-2221-203fc5d771d6@linux.ibm.com>
 <b7eb78c2-4909-508f-b4d0-a5b95d13d6a7@redhat.com>
From: Stefan Berger <stefanb@linux.ibm.com>
In-Reply-To: <b7eb78c2-4909-508f-b4d0-a5b95d13d6a7@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: h-SPa-B8oUUful5eJsopJB7Mau3onmCK
X-Proofpoint-ORIG-GUID: VCmwGTfAret4Ppy6k31YVvPSsrM0EX7W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-13_07,2022-01-13_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0
 clxscore=1015 phishscore=0 mlxlogscore=999 malwarescore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 mlxscore=0 lowpriorityscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201130095
Received-SPF: pass client-ip=148.163.158.5; envelope-from=stefanb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: cohuck@redhat.com, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/13/22 09:40, Eric Auger wrote:

> Hi Stefan,
>
> On 1/13/22 3:06 PM, Stefan Berger wrote:
>> On 1/13/22 05:37, Eric Auger wrote:
>>> Representing the CRB cmd/response buffer as a standard
>>> RAM region causes some trouble when the device is used
>>> with VFIO. Indeed VFIO attempts to DMA_MAP this region
>>> as usual RAM but this latter does not have a valid page
>>> size alignment causing such an error report:
>>> "vfio_listener_region_add received unaligned region".
>>> To allow VFIO to detect that failing dma mapping
>>> this region is not an issue, let's use a ram_device
>>> memory region type instead.
>>>
>>> The change in meson.build is required to include the
>>> cpu.h header.
>>>
>>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>> ---
>>>    hw/tpm/meson.build |  2 +-
>>>    hw/tpm/tpm_crb.c   | 10 ++++++++--
>>>    2 files changed, 9 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/hw/tpm/meson.build b/hw/tpm/meson.build
>>> index 1c68d81d6a..3e74df945b 100644
>>> --- a/hw/tpm/meson.build
>>> +++ b/hw/tpm/meson.build
>>> @@ -1,8 +1,8 @@
>>>    softmmu_ss.add(when: 'CONFIG_TPM_TIS', if_true:
>>> files('tpm_tis_common.c'))
>>>    softmmu_ss.add(when: 'CONFIG_TPM_TIS_ISA', if_true:
>>> files('tpm_tis_isa.c'))
>>>    softmmu_ss.add(when: 'CONFIG_TPM_TIS_SYSBUS', if_true:
>>> files('tpm_tis_sysbus.c'))
>>> -softmmu_ss.add(when: 'CONFIG_TPM_CRB', if_true: files('tpm_crb.c'))
>>>
>>> +specific_ss.add(when: 'CONFIG_TPM_CRB', if_true: files('tpm_crb.c'))
>>>    specific_ss.add(when: ['CONFIG_SOFTMMU', 'CONFIG_TPM_TIS'],
>>> if_true: files('tpm_ppi.c'))
>>>    specific_ss.add(when: ['CONFIG_SOFTMMU', 'CONFIG_TPM_CRB'],
>>> if_true: files('tpm_ppi.c'))
>>>    specific_ss.add(when: 'CONFIG_TPM_SPAPR', if_true:
>>> files('tpm_spapr.c'))
>>> diff --git a/hw/tpm/tpm_crb.c b/hw/tpm/tpm_crb.c
>>> index 58ebd1469c..25f8e685e4 100644
>>> --- a/hw/tpm/tpm_crb.c
>>> +++ b/hw/tpm/tpm_crb.c
>>> @@ -25,6 +25,7 @@
>>>    #include "sysemu/tpm_backend.h"
>>>    #include "sysemu/tpm_util.h"
>>>    #include "sysemu/reset.h"
>>> +#include "cpu.h"
>>>    #include "tpm_prop.h"
>>>    #include "tpm_ppi.h"
>>>    #include "trace.h"
>>> @@ -43,6 +44,7 @@ struct CRBState {
>>>
>>>        bool ppi_enabled;
>>>        TPMPPI ppi;
>>> +    uint8_t *crb_cmd_buf;
>>>    };
>>>    typedef struct CRBState CRBState;
>>>
>>> @@ -291,10 +293,14 @@ static void tpm_crb_realize(DeviceState *dev,
>>> Error **errp)
>>>            return;
>>>        }
>>>
>>> +    s->crb_cmd_buf = qemu_memalign(qemu_real_host_page_size,
>>> +                                HOST_PAGE_ALIGN(CRB_CTRL_CMD_SIZE));
>>> +
>> Do we need an unrealize function now to qemu_vfree() this memory?
> I would say it is needed if the device can be hot-unplugged.
> tpmppi->buf is not freeed either.


Correct about PPI. My main concern would be the CRB related test cases 
that likely currently run without PPI but now could complain about a 
memory leak upon shutdown. I tried to compile with --enable-sanitizers 
and run the tests but it doesn't compile when the sanitizers are enabled.


FAILED: libcommon.fa.p/disas_i386.c.o
cc -m64 -mcx16 -Ilibcommon.fa.p -I../capstone/include/capstone 
-I../dtc/libfdt -I../slirp -I../slirp/src -I/usr/include/pixman-1 
-I/usr/include/p11-kit-1 -I/usr/include/glib-2.0 
-I/usr/lib64/glib-2.0/include -I/usr/include/sysprof-4 
-I/usr/include/libmount -I/usr/include/blkid -I/usr/include/gio-unix-2.0 
-fdiagnostics-color=auto -Wall -Winvalid-pch -Werror -std=gnu11 -O2 -g 
-isystem /home/stefanb/dev/qemu/linux-headers -isystem linux-headers 
-iquote . -iquote /home/stefanb/dev/qemu -iquote 
/home/stefanb/dev/qemu/include -iquote 
/home/stefanb/dev/qemu/disas/libvixl -iquote 
/home/stefanb/dev/qemu/tcg/i386 -pthread -fsanitize=undefined 
-fsanitize=address -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=2 -D_GNU_SOURCE 
-D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -Wstrict-prototypes 
-Wredundant-decls -Wundef -Wwrite-strings -Wmissing-prototypes 
-fno-strict-aliasing -fno-common -fwrapv -Wold-style-declaration 
-Wold-style-definition -Wtype-limits -Wformat-security -Wformat-y2k 
-Winit-self -Wignored-qualifiers -Wempty-body -Wnested-externs 
-Wendif-labels -Wexpansion-to-defined -Wimplicit-fallthrough=2 
-Wno-missing-include-dirs -Wno-shift-negative-value -Wno-psabi 
-fstack-protector-strong -fPIE -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600 
-DNCURSES_WIDECHAR=1 -DSTRUCT_IOVEC_DEFINED -MD -MQ 
libcommon.fa.p/disas_i386.c.o -MF libcommon.fa.p/disas_i386.c.o.d -o 
libcommon.fa.p/disas_i386.c.o -c ../disas/i386.c
In file included from /usr/include/string.h:519,
                  from /home/stefanb/dev/qemu/include/qemu/osdep.h:87,
                  from ../disas/i386.c:34:
In function ?strcpy?,
     inlined from ?PNI_Fixup? at ../disas/i386.c:6434:4,
     inlined from ?PNI_Fixup? at ../disas/i386.c:6400:1:
/usr/include/bits/string_fortified.h:79:10: error: ?__builtin_memcpy? 
offset [0, 7] is out of the bounds [0, 0] [-Werror=array-bounds]
    79 |   return __builtin___strcpy_chk (__dest, __src, __glibc_objsize 
(__dest));
       | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In function ?strcpy?,
     inlined from ?PNI_Fixup? at ../disas/i386.c:6427:4,
     inlined from ?PNI_Fixup? at ../disas/i386.c:6400:1:
/usr/include/bits/string_fortified.h:79:10: error: ?__builtin_memcpy? 
offset [0, 5] is out of the bounds [0, 0] [-Werror=array-bounds]
    79 |   return __builtin___strcpy_chk (__dest, __src, __glibc_objsize 
(__dest));
       | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
cc1: all warnings being treated as errors

    Stefan

>
> Thanks
>
> Eric
>
>>
>>>        memory_region_init_io(&s->mmio, OBJECT(s), &tpm_crb_memory_ops, s,
>>>            "tpm-crb-mmio", sizeof(s->regs));
>>> -    memory_region_init_ram(&s->cmdmem, OBJECT(s),
>>> -        "tpm-crb-cmd", CRB_CTRL_CMD_SIZE, errp);
>>> +    memory_region_init_ram_device_ptr(&s->cmdmem, OBJECT(s),
>>> "tpm-crb-cmd",
>>> +                                      CRB_CTRL_CMD_SIZE,
>>> s->crb_cmd_buf);
>>> +    vmstate_register_ram(&s->cmdmem, DEVICE(s));
>>>        memory_region_add_subregion(get_system_memory(),
>>>            TPM_CRB_ADDR_BASE, &s->mmio);

