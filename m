Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C5DD6FC5EB
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 14:09:54 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwM9x-0003jy-Ub; Tue, 09 May 2023 08:09:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <harshpb@linux.ibm.com>)
 id 1pwM9u-0003L0-0T; Tue, 09 May 2023 08:09:34 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <harshpb@linux.ibm.com>)
 id 1pwM9p-0007rL-QW; Tue, 09 May 2023 08:09:33 -0400
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 349BoGs3018974; Tue, 9 May 2023 12:09:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=OMqwtEpjDpRvDIvyIkqsp9Fh2PYga6AhLkr4QFztXuo=;
 b=H6jO/mJYW+3eDKJgTMqqxxESzBkb5TMa+Qt2J9BEoFoqysk1NtV45CLOWrH0nqd4LiKI
 D4I62U+qHyBnZ65yhmN1TaRmKpM7DDkpsqWSWvks/wyaRUEctPPVTZpMtzRUVVzplz23
 eJD5iFCxw5PXl/iiLsQ/dKzDCkakNCDGHV8d9QrX8ZF+jA/u8eCNwcBxPIJjO4xMBULg
 2b3aZKVKUWt9kQxX37aH3N9IQT6nCPJ8m8Zb9v10GxHDSjxjQnfWQIdE5H5DMqLHz/uF
 7Zby0UA9W6dbfo/t99JbYfSrQUsIuEhiX/JxkWSiVygRi/YWIHL/AvdceA1hwlCkc95O dw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qfnn4ghad-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 May 2023 12:09:13 +0000
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 349BpaM5023410;
 Tue, 9 May 2023 12:09:12 GMT
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qfnn4gh9m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 May 2023 12:09:12 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 349AEBfA011436;
 Tue, 9 May 2023 12:09:11 GMT
Received: from smtprelay06.dal12v.mail.ibm.com ([9.208.130.100])
 by ppma02dal.us.ibm.com (PPS) with ESMTPS id 3qf7wdv2kj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 May 2023 12:09:11 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com
 [10.39.53.228])
 by smtprelay06.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 349C99tb58589458
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 9 May 2023 12:09:10 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7992A58072;
 Tue,  9 May 2023 12:09:09 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 179EB58055;
 Tue,  9 May 2023 12:08:51 +0000 (GMT)
Received: from [9.43.112.58] (unknown [9.43.112.58])
 by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
 Tue,  9 May 2023 12:08:50 +0000 (GMT)
Message-ID: <d9331bd1-5713-b1a5-72af-74f777a5b0b1@linux.ibm.com>
Date: Tue, 9 May 2023 17:38:49 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 07/21] migration: Correct transferred bytes value
Content-Language: en-US
To: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-block@nongnu.org,
 Eric Blake <eblake@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 John Snow <jsnow@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Peter Xu <peterx@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 Eric Farman <farman@linux.ibm.com>, Greg Kurz <groug@kaod.org>,
 qemu-ppc@nongnu.org, qemu-s390x@nongnu.org, Fam Zheng <fam@euphon.net>,
 Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>, Leonardo Bras <leobras@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>
References: <20230508130909.65420-1-quintela@redhat.com>
 <20230508130909.65420-8-quintela@redhat.com>
From: Harsh Prateek Bora <harshpb@linux.ibm.com>
In-Reply-To: <20230508130909.65420-8-quintela@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: KnyQp_xT-pbpvHaXWZxxtyaNegoXuKx5
X-Proofpoint-ORIG-GUID: s3qWqi-8RG-PVX2hQd2GEHRdhLHK4a5b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-09_08,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015
 mlxlogscore=999 mlxscore=0 adultscore=0 priorityscore=1501 spamscore=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2304280000
 definitions=main-2305090096
Received-SPF: pass client-ip=148.163.158.5; envelope-from=harshpb@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.421,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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



On 5/8/23 18:38, Juan Quintela wrote:
> We forget several places to add to trasferred amount of data.  With
> this fixes I get:
> 
>     qemu_file_transferred() + multifd_bytes == transferred
> 
> The only place whrer this is not true is during devices sending.  But

s/whrer/where

> going all through the full tree searching for devices that use
> QEMUFile directly is a bit too much.
> 
> Multifd, precopy and xbzrle work as expected. Postocpy still misses 35
> bytes, but searching for them is getting complicated, so I stop here.
> 
> Signed-off-by: Juan Quintela <quintela@redhat.com>
> ---
>   migration/meson.build |  2 +-
>   migration/ram.c       | 14 ++++++++++++++
>   migration/savevm.c    | 19 +++++++++++++++++--
>   migration/vmstate.c   |  3 +++
>   4 files changed, 35 insertions(+), 3 deletions(-)
> 
> diff --git a/migration/meson.build b/migration/meson.build
> index da1897fadf..b27fc9eeb6 100644
> --- a/migration/meson.build
> +++ b/migration/meson.build
> @@ -1,5 +1,6 @@
>   # Files needed by unit tests
>   migration_files = files(
> +  'migration-stats.c',
>     'page_cache.c',
>     'xbzrle.c',
>     'vmstate-types.c',
> @@ -19,7 +20,6 @@ softmmu_ss.add(files(
>     'fd.c',
>     'global_state.c',
>     'migration-hmp-cmds.c',
> -  'migration-stats.c',
>     'migration.c',
>     'multifd.c',
>     'multifd-zlib.c',
> diff --git a/migration/ram.c b/migration/ram.c
> index 5e7bf20ca5..5ae1fdba45 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -337,6 +337,7 @@ int64_t ramblock_recv_bitmap_send(QEMUFile *file,
>   
>       g_free(le_bitmap);
>   
> +    stat64_add(&mig_stats.transferred, 8 + size + 8);

I see lot of hard-coded math like above in below code as well.
Although compiler will do its optimization, but we may choose to write 
it like either of below:
  - sizeof(??) + size + sizeof(??)
  - <macro1> + size + <macro2>
  - size + 16 /* explaining what 8 + 8 means here */
I guess first method or usage of macros instead of hard-coded numbers is 
better. Applies to all instances below.

regards,
Harsh

>       if (qemu_file_get_error(file)) {
>           return qemu_file_get_error(file);
>       }
> @@ -1617,6 +1618,7 @@ static int find_dirty_block(RAMState *rs, PageSearchStatus *pss)
>                       return ret;
>                   }
>                   qemu_put_be64(f, RAM_SAVE_FLAG_MULTIFD_FLUSH);
> +                stat64_add(&mig_stats.transferred, 8);
>                   qemu_fflush(f);
>               }
>               /*
> @@ -3245,6 +3247,7 @@ static int ram_save_setup(QEMUFile *f, void *opaque)
>       RAMState **rsp = opaque;
>       RAMBlock *block;
>       int ret;
> +    size_t size = 0;
>   
>       if (compress_threads_save_setup()) {
>           return -1;
> @@ -3263,16 +3266,20 @@ static int ram_save_setup(QEMUFile *f, void *opaque)
>           qemu_put_be64(f, ram_bytes_total_with_ignored()
>                            | RAM_SAVE_FLAG_MEM_SIZE);
>   
> +        size += 8;
>           RAMBLOCK_FOREACH_MIGRATABLE(block) {
>               qemu_put_byte(f, strlen(block->idstr));
>               qemu_put_buffer(f, (uint8_t *)block->idstr, strlen(block->idstr));
>               qemu_put_be64(f, block->used_length);
> +            size += 1 + strlen(block->idstr) + 8;
>               if (migrate_postcopy_ram() && block->page_size !=
>                                             qemu_host_page_size) {
>                   qemu_put_be64(f, block->page_size);
> +                size += 8;
>               }
>               if (migrate_ignore_shared()) {
>                   qemu_put_be64(f, block->mr->addr);
> +                size += 8;
>               }
>           }
>       }
> @@ -3289,11 +3296,14 @@ static int ram_save_setup(QEMUFile *f, void *opaque)
>   
>       if (!migrate_multifd_flush_after_each_section()) {
>           qemu_put_be64(f, RAM_SAVE_FLAG_MULTIFD_FLUSH);
> +        size += 8;
>       }
>   
>       qemu_put_be64(f, RAM_SAVE_FLAG_EOS);
> +    size += 8;
>       qemu_fflush(f);
>   
> +    stat64_add(&mig_stats.transferred, size);
>       return 0;
>   }
>   
> @@ -3434,6 +3444,7 @@ static int ram_save_complete(QEMUFile *f, void *opaque)
>       RAMState **temp = opaque;
>       RAMState *rs = *temp;
>       int ret = 0;
> +    size_t size = 0;
>   
>       rs->last_stage = !migration_in_colo_state();
>   
> @@ -3478,8 +3489,11 @@ static int ram_save_complete(QEMUFile *f, void *opaque)
>   
>       if (!migrate_multifd_flush_after_each_section()) {
>           qemu_put_be64(f, RAM_SAVE_FLAG_MULTIFD_FLUSH);
> +        size += 8;
>       }
>       qemu_put_be64(f, RAM_SAVE_FLAG_EOS);
> +    size += 8;
> +    stat64_add(&mig_stats.transferred, size);
>       qemu_fflush(f);
>   
>       return 0;
> diff --git a/migration/savevm.c b/migration/savevm.c
> index e33788343a..c7af9050c2 100644
> --- a/migration/savevm.c
> +++ b/migration/savevm.c
> @@ -952,6 +952,7 @@ static void save_section_header(QEMUFile *f, SaveStateEntry *se,
>       qemu_put_byte(f, section_type);
>       qemu_put_be32(f, se->section_id);
>   
> +    size_t size = 1 + 4;
>       if (section_type == QEMU_VM_SECTION_FULL ||
>           section_type == QEMU_VM_SECTION_START) {
>           /* ID string */
> @@ -961,7 +962,9 @@ static void save_section_header(QEMUFile *f, SaveStateEntry *se,
>   
>           qemu_put_be32(f, se->instance_id);
>           qemu_put_be32(f, se->version_id);
> +        size += 1 + len + 4 + 4;
>       }
> +    stat64_add(&mig_stats.transferred, size);
>   }
>   
>   /*
> @@ -973,6 +976,7 @@ static void save_section_footer(QEMUFile *f, SaveStateEntry *se)
>       if (migrate_get_current()->send_section_footer) {
>           qemu_put_byte(f, QEMU_VM_SECTION_FOOTER);
>           qemu_put_be32(f, se->section_id);
> +        stat64_add(&mig_stats.transferred, 1 + 4);
>       }
>   }
>   
> @@ -1032,6 +1036,7 @@ static void qemu_savevm_command_send(QEMUFile *f,
>       qemu_put_be16(f, (uint16_t)command);
>       qemu_put_be16(f, len);
>       qemu_put_buffer(f, data, len);
> +    stat64_add(&mig_stats.transferred, 1 + 2 + 2 + len);
>       qemu_fflush(f);
>   }
>   
> @@ -1212,11 +1217,13 @@ void qemu_savevm_state_header(QEMUFile *f)
>       trace_savevm_state_header();
>       qemu_put_be32(f, QEMU_VM_FILE_MAGIC);
>       qemu_put_be32(f, QEMU_VM_FILE_VERSION);
> -
> +    size_t size = 4 + 4;
>       if (migrate_get_current()->send_configuration) {
>           qemu_put_byte(f, QEMU_VM_CONFIGURATION);
> +        size += 1;
>           vmstate_save_state(f, &vmstate_configuration, &savevm_state, 0);
>       }
> +    stat64_add(&mig_stats.transferred, size);
>   }
>   
>   bool qemu_savevm_state_guest_unplug_pending(void)
> @@ -1384,6 +1391,7 @@ void qemu_savevm_state_complete_postcopy(QEMUFile *f)
>   {
>       SaveStateEntry *se;
>       int ret;
> +    size_t size = 0;
>   
>       QTAILQ_FOREACH(se, &savevm_state.handlers, entry) {
>           if (!se->ops || !se->ops->save_live_complete_postcopy) {
> @@ -1398,7 +1406,7 @@ void qemu_savevm_state_complete_postcopy(QEMUFile *f)
>           /* Section type */
>           qemu_put_byte(f, QEMU_VM_SECTION_END);
>           qemu_put_be32(f, se->section_id);
> -
> +        size += 1 + 4;
>           ret = se->ops->save_live_complete_postcopy(f, se->opaque);
>           trace_savevm_section_end(se->idstr, se->section_id, ret);
>           save_section_footer(f, se);
> @@ -1409,6 +1417,8 @@ void qemu_savevm_state_complete_postcopy(QEMUFile *f)
>       }
>   
>       qemu_put_byte(f, QEMU_VM_EOF);
> +    size += 1;
> +    stat64_add(&mig_stats.transferred, size);
>       qemu_fflush(f);
>   }
>   
> @@ -1484,6 +1494,7 @@ int qemu_savevm_state_complete_precopy_non_iterable(QEMUFile *f,
>       if (!in_postcopy) {
>           /* Postcopy stream will still be going */
>           qemu_put_byte(f, QEMU_VM_EOF);
> +        stat64_add(&mig_stats.transferred, 1);
>       }
>   
>       json_writer_end_array(vmdesc);
> @@ -1664,15 +1675,18 @@ void qemu_savevm_live_state(QEMUFile *f)
>       /* save QEMU_VM_SECTION_END section */
>       qemu_savevm_state_complete_precopy(f, true, false);
>       qemu_put_byte(f, QEMU_VM_EOF);
> +    stat64_add(&mig_stats.transferred, 1);
>   }
>   
>   int qemu_save_device_state(QEMUFile *f)
>   {
>       SaveStateEntry *se;
> +    size_t size = 0;
>   
>       if (!migration_in_colo_state()) {
>           qemu_put_be32(f, QEMU_VM_FILE_MAGIC);
>           qemu_put_be32(f, QEMU_VM_FILE_VERSION);
> +        size = 4 + 4;
>       }
>       cpu_synchronize_all_states();
>   
> @@ -1690,6 +1704,7 @@ int qemu_save_device_state(QEMUFile *f)
>   
>       qemu_put_byte(f, QEMU_VM_EOF);
>   
> +    stat64_add(&mig_stats.transferred, size + 1);
>       return qemu_file_get_error(f);
>   }
>   
> diff --git a/migration/vmstate.c b/migration/vmstate.c
> index af01d54b6f..ee3b70a6a8 100644
> --- a/migration/vmstate.c
> +++ b/migration/vmstate.c
> @@ -12,6 +12,7 @@
>   
>   #include "qemu/osdep.h"
>   #include "migration.h"
> +#include "migration-stats.h"
>   #include "migration/vmstate.h"
>   #include "savevm.h"
>   #include "qapi/qmp/json-writer.h"
> @@ -394,6 +395,7 @@ int vmstate_save_state_v(QEMUFile *f, const VMStateDescription *vmsd,
>                   written_bytes = qemu_file_transferred_fast(f) - old_offset;
>                   vmsd_desc_field_end(vmsd, vmdesc_loop, field, written_bytes, i);
>   
> +                stat64_add(&mig_stats.transferred, written_bytes);
>                   /* Compressed arrays only care about the first element */
>                   if (vmdesc_loop && vmsd_can_compress(field)) {
>                       vmdesc_loop = NULL;
> @@ -517,6 +519,7 @@ static int vmstate_subsection_save(QEMUFile *f, const VMStateDescription *vmsd,
>               qemu_put_byte(f, len);
>               qemu_put_buffer(f, (uint8_t *)vmsdsub->name, len);
>               qemu_put_be32(f, vmsdsub->version_id);
> +            stat64_add(&mig_stats.transferred, 1 + 1 + len + 4);
>               ret = vmstate_save_state(f, vmsdsub, opaque, vmdesc);
>               if (ret) {
>                   return ret;

