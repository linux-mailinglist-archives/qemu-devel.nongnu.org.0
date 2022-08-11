Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5680558FD26
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Aug 2022 15:14:01 +0200 (CEST)
Received: from localhost ([::1]:60692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oM80e-0001LN-AZ
	for lists+qemu-devel@lfdr.de; Thu, 11 Aug 2022 09:14:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1oM7r2-0006Z1-Ly; Thu, 11 Aug 2022 09:04:05 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:20440)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1oM7r0-0001KV-A0; Thu, 11 Aug 2022 09:04:04 -0400
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27BCFuY0039106;
 Thu, 11 Aug 2022 13:04:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : from : to : cc : references : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=NMzvpOJ5ODl9vbCevbeUqG5/WjpaYjkdCDr5ykLRuFo=;
 b=GpwB6UZTee4CLx/iKbXGVup15uwVwXhc6DV1UEo1Yrksm6VlQdXJloXO4tqaeTxOZehy
 81MI6UgSiH3t5DB4wJSNpaQ1ClB7VWdIzChQOARdHLNysRYSfv0DF+DldP0hC9j9B2UV
 zcc6ptxO0NFCsCrfEnpw/CW6/UCEONEQKoPekRlAPmK4Fp011vDti/cm/DaETgVq/+yi
 RB58GvNwCLD0RyPhvgl2rbm/pecnElRakKdt4s7qPTXtCDvfb8g3f7AO7zFUS7Gg4cOv
 awcJoYotcuHiOmZcgWmyvRliUS+wP83g2/+RZXXn1pzv4zYZIudO2dzbyCDt4SpF3ANu 1A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hw17sj6pg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Aug 2022 13:03:59 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 27BCe31c027887;
 Thu, 11 Aug 2022 13:03:59 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hw17sj6ng-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Aug 2022 13:03:59 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 27BCpRuU001918;
 Thu, 11 Aug 2022 13:03:57 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma03fra.de.ibm.com with ESMTP id 3huwvfshxa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Aug 2022 13:03:57 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 27BD3rGQ18809198
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 11 Aug 2022 13:03:53 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C49E4A4055;
 Thu, 11 Aug 2022 13:03:53 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3107AA404D;
 Thu, 11 Aug 2022 13:03:53 +0000 (GMT)
Received: from [9.145.33.87] (unknown [9.145.33.87])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 11 Aug 2022 13:03:53 +0000 (GMT)
Message-ID: <01558297-dc6f-956c-ec48-9506707ec165@linux.ibm.com>
Date: Thu, 11 Aug 2022 15:03:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v5 18/18] s390x: pv: Add dump support
Content-Language: en-US
From: Janosch Frank <frankja@linux.ibm.com>
To: qemu-devel@nongnu.org
Cc: marcandre.lureau@redhat.com, pbonzini@redhat.com, mhartmay@linux.ibm.com, 
 borntraeger@linux.ibm.com, imbrenda@linux.ibm.com, pasic@linux.ibm.com,
 cohuck@redhat.com, thuth@redhat.com, qemu-s390x@nongnu.org,
 seiden@linux.ibm.com, scgl@linux.ibm.com
References: <20220811121111.9878-1-frankja@linux.ibm.com>
 <20220811121111.9878-19-frankja@linux.ibm.com>
In-Reply-To: <20220811121111.9878-19-frankja@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: B3ILLU33LXn9hMUD0BrdRR6BZzfqqyjU
X-Proofpoint-GUID: brTqP-cOUBHJRqC_tGc7YEJGJ05K6Xys
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-11_10,2022-08-11_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 spamscore=0 suspectscore=0 impostorscore=0 mlxlogscore=999 malwarescore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208110041
Received-SPF: pass client-ip=148.163.158.5; envelope-from=frankja@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/11/22 14:11, Janosch Frank wrote:
> Sometimes dumping a guest from the outside is the only way to get the
> data that is needed. This can be the case if a dumping mechanism like
> KDUMP hasn't been configured or data needs to be fetched at a specific
> point. Dumping a protected guest from the outside without help from
> fw/hw doesn't yield sufficient data to be useful. Hence we now
> introduce PV dump support.
> 
> The PV dump support works by integrating the firmware into the dump
> process. New Ultravisor calls are used to initiate the dump process,
> dump cpu data, dump memory state and lastly complete the dump process.
> The UV calls are exposed by KVM via the new KVM_PV_DUMP command and
> its subcommands. The guest's data is fully encrypted and can only be
> decrypted by the entity that owns the customer communication key for
> the dumped guest. Also dumping needs to be allowed via a flag in the
> SE header.
> 
> On the QEMU side of things we store the PV dump data in the newly
> introduced architecture ELF sections (storage state and completion
> data) and the cpu notes (for cpu dump data).
> 
> Users can use the zgetdump tool to convert the encrypted QEMU dump to an
> unencrypted one.
> 
> Signed-off-by: Janosch Frank <frankja@linux.ibm.com>


Seems like I forgot to amend this commit with the naming changes before 
sending:

diff --git i/target/s390x/arch_dump.c w/target/s390x/arch_dump.c
index 5e8e03d536..233f23c071 100644
--- i/target/s390x/arch_dump.c
+++ w/target/s390x/arch_dump.c
@@ -286,14 +286,14 @@ int 
s390_cpu_write_elf64_note(WriteCoreDumpFunction f, CPUState *cs,
  }

  /* PV dump section size functions */
-static uint64_t get_dump_stor_state_size_from_len(uint64_t len)
+static uint64_t get_stor_state_size_from_len(uint64_t len)
  {
      return (len / (1 << 20)) * kvm_s390_pv_dmp_get_size_stor_state();
  }

  static uint64_t get_size_stor_state(DumpState *s)
  {
-    return get_dump_stor_state_size_from_len(s->total_size);
+    return get_stor_state_size_from_len(s->total_size);
  }

  static uint64_t get_size_complete(DumpState *s)
@@ -316,7 +316,8 @@ static int get_data_complete(DumpState *s, uint8_t 
*buff)
      return rc;
  }

-static int dump_mem(DumpState *s, uint64_t gaddr, uint8_t *buff, 
uint64_t buff_len)
+static int get_stor_state_block(DumpState *s, uint64_t gaddr, uint8_t 
*buff,
+                                uint64_t buff_len)
  {
      /* We need the gaddr + len and something to write to */
      if (!pv_dump_initialized) {
@@ -325,7 +326,7 @@ static int dump_mem(DumpState *s, uint64_t gaddr, 
uint8_t *buff, uint64_t buff_l
      return kvm_s390_dump_mem(gaddr, buff_len, buff);
  }

-static int get_data_mem(DumpState *s, uint8_t *buff)
+static int get_store_state(DumpState *s, uint8_t *buff)
  {
      int64_t memblock_size, memblock_start;
      GuestPhysBlock *block;
@@ -341,9 +342,9 @@ static int get_data_mem(DumpState *s, uint8_t *buff)
          memblock_size = dump_filtered_memblock_size(block, 
s->filter_area_begin,
 
s->filter_area_length);

-        off = get_dump_stor_state_size_from_len(block->target_start);
-        dump_mem(s, block->target_start, buff + off,
-                 get_dump_stor_state_size_from_len(memblock_size));
+        off = get_stor_state_size_from_len(block->target_start);
+        get_stor_state_block(s, block->target_start, buff + off,
+                             get_stor_state_size_from_len(memblock_size));
      }

      return 0;
@@ -354,7 +355,7 @@ struct sections {
      int (*sections_contents_func)(DumpState *s, uint8_t *buff);
      char sctn_str[12];
  } sections[] = {
-    { get_size_stor_state, get_data_mem, "pv_mem_meta"},
+    { get_size_stor_state, get_store_state, "pv_mem_meta"},
      { get_size_complete, get_data_complete, "pv_compl"},
      {NULL , NULL, ""}
  };

