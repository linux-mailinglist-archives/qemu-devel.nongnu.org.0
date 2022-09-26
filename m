Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ADB85EA953
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 16:57:23 +0200 (CEST)
Received: from localhost ([::1]:40630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocpXt-0000eW-Nw
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 10:57:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1ocpPb-00009H-V9; Mon, 26 Sep 2022 10:48:47 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:59696)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1ocpPa-0007kY-09; Mon, 26 Sep 2022 10:48:47 -0400
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28QEgFck026256;
 Mon, 26 Sep 2022 14:48:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : to : cc : references : from : subject : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=lYpO2yxHps2Db7/kLiQ66m8hoAtqqYBcLyrSbDwdcNA=;
 b=anxp1NgqyE/bR5BIzx9e6ppOaqCb0siaZGs3U0YZDtG1S7WMlQkEV2Fk3MSZ5cNeeCn5
 4M4FJqZmukZt9PnYjRdHrHP4G02Eyszs5aldAQNpzY7roxhX9W+as9mYdLr8PkJWodOm
 9qirbzRCKKpibWOckuJFZMQYKl9Vm5Vy9VRC+qpuvsiPXuV1Fkm/jm8q7ZTXt4G3DSC4
 5oQ9rIhkgUHoZayQJ6RaFcQuiLJFWe5YY9LG5tNWXdxwkTW3maxfCh1sWhufMWvggTjT
 gr4Yzq5s1jrBFW32K9WlStg8MCKDQ1Mzhf8n0lgcLlt93SLV6uDoFOeluFaUpTqdkgzP dQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jue2s06ty-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 26 Sep 2022 14:48:42 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 28QEh3IU028493;
 Mon, 26 Sep 2022 14:48:41 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jue2s06sr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 26 Sep 2022 14:48:41 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28QEZe6F009677;
 Mon, 26 Sep 2022 14:48:39 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma06ams.nl.ibm.com with ESMTP id 3jss5j2k8s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 26 Sep 2022 14:48:39 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 28QEn3xI53346586
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 26 Sep 2022 14:49:03 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F369CAE055;
 Mon, 26 Sep 2022 14:48:35 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 74E8FAE045;
 Mon, 26 Sep 2022 14:48:35 +0000 (GMT)
Received: from [9.171.72.93] (unknown [9.171.72.93])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 26 Sep 2022 14:48:35 +0000 (GMT)
Message-ID: <8fffaf2e-e074-bd74-0376-db577d174b35@linux.ibm.com>
Date: Mon, 26 Sep 2022 16:48:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Content-Language: en-US
To: Janis Schoetterl-Glausch <scgl@linux.ibm.com>, qemu-devel@nongnu.org
Cc: marcandre.lureau@redhat.com, pbonzini@redhat.com, mhartmay@linux.ibm.com, 
 borntraeger@linux.ibm.com, imbrenda@linux.ibm.com, pasic@linux.ibm.com,
 cohuck@redhat.com, thuth@redhat.com, qemu-s390x@nongnu.org,
 seiden@linux.ibm.com
References: <20220811121111.9878-1-frankja@linux.ibm.com>
 <20220811121111.9878-5-frankja@linux.ibm.com>
 <47bc40f30c49a6e55f435e25ec4fd0386deb798b.camel@linux.ibm.com>
From: Janosch Frank <frankja@linux.ibm.com>
Subject: Re: [PATCH v5 04/18] dump: Rework get_start_block
In-Reply-To: <47bc40f30c49a6e55f435e25ec4fd0386deb798b.camel@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: qUZFfmhl3uNO8vuVE6zWHaXwjAIMoMAN
X-Proofpoint-ORIG-GUID: qclCYfOH7A2VnYCF7xvhOpfKbLyClPGn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-26_08,2022-09-22_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0
 priorityscore=1501 spamscore=0 phishscore=0 mlxlogscore=999 suspectscore=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209260092
Received-SPF: pass client-ip=148.163.156.1; envelope-from=frankja@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.319,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/29/22 22:17, Janis Schoetterl-Glausch wrote:
> On Thu, 2022-08-11 at 12:10 +0000, Janosch Frank wrote:
>> get_start_block() returns the start address of the first memory block
>> or -1.
>>
>> With the GuestPhysBlock iterator conversion we don't need to set the
>> start address and can therefore remove that code and the "start"
>> DumpState struct member. The only functionality left is the validation
>> of the start block so it only makes sense to re-name the function to
>> validate_start_block()
> 
> Nit, since you don't return an address anymore, I find retaining the -
> 1/0 return value instead of true/false weird.

I'm trying to wrap up fixing things for a new version.
My fix for this is calling it is_start_block_valid() and making the 
return bool. That being said, having int for true/false is not uncommon 
in C but explicitly checking -1 makes it look weird.



diff --git i/dump/dump.c w/dump/dump.c
index e204912a89..2239bd324e 100644
--- i/dump/dump.c
+++ w/dump/dump.c
@@ -1500,12 +1500,12 @@ static void create_kdump_vmcore(DumpState *s, 
Error **errp)
      }
  }

-static int validate_start_block(DumpState *s)
+static bool is_start_block_valid(DumpState *s)
  {
      GuestPhysBlock *block;

      if (!s->has_filter) {
-        return 0;
+        return true;
      }

      QTAILQ_FOREACH(block, &s->guest_phys_blocks.head, next) {
@@ -1514,10 +1514,10 @@ static int validate_start_block(DumpState *s)
              block->target_end <= s->begin) {
              continue;
          }
-        return 0;
+        return true;
     }

-    return -1;
+    return false;
  }

  static void get_max_mapnr(DumpState *s)
@@ -1663,7 +1663,7 @@ static void dump_init(DumpState *s, int fd, bool 
has_format,
      }

      /* Is the filter filtering everything? */
-    if (validate_start_block(s) == -1) {
+    if (!is_start_block_valid(s)) {
          error_setg(errp, QERR_INVALID_PARAMETER, "begin");
          goto cleanup;
      }


