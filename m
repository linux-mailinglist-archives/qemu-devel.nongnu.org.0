Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41E12584B39
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jul 2022 07:34:07 +0200 (CEST)
Received: from localhost ([::1]:33552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oHIdR-0003Io-Pd
	for lists+qemu-devel@lfdr.de; Fri, 29 Jul 2022 01:34:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <seiden@linux.ibm.com>)
 id 1oHIbu-0001n4-7x; Fri, 29 Jul 2022 01:32:30 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:62224)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <seiden@linux.ibm.com>)
 id 1oHIbs-0005lP-A5; Fri, 29 Jul 2022 01:32:30 -0400
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26T5HTcc031631;
 Fri, 29 Jul 2022 05:32:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=cQrKrMEXXbzZCOMC2YkAsLioi9sAyNrZ8otRCU4EbbU=;
 b=tChVwwor3MCUpxq45bcuPeXUDRyFHdhTHsBbTSzD3msJ9g6smhnOROabEaha3UA9TZCE
 bmaagjBDmNJCG4koLTL7/knR7cxecJdvY0Xs7ALKpEOPsv6QkBLPnMKgIgAtNIKjHkC2
 iIT70Ddu1TaYPddmwAYDtad9X3zhnAwGA3DQuChNj4vpbUwXeK069h5QSnhSJSITUky5
 JMpESyOP/CfMnHtNkM6iZRMRudZ3PBbNIGPq+wKLZip6l06eDlgQ9EUJWpScVYgE3Lr9
 v0NZt4OyyMZEg+GliPoGV+nJuNQe93xswdHdPdXdi5d4ykNRRjRWdunECoSaPcWZIUQ+ Lg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hm998rbg8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 29 Jul 2022 05:32:25 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26T5IZ6t001250;
 Fri, 29 Jul 2022 05:32:24 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hm998rbfe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 29 Jul 2022 05:32:24 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 26T5M20n020692;
 Fri, 29 Jul 2022 05:32:22 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma06fra.de.ibm.com with ESMTP id 3hg98fjgkc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 29 Jul 2022 05:32:22 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 26T5WXIb32768266
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 29 Jul 2022 05:32:33 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E40C711C052;
 Fri, 29 Jul 2022 05:32:18 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6728611C04A;
 Fri, 29 Jul 2022 05:32:18 +0000 (GMT)
Received: from [9.145.84.114] (unknown [9.145.84.114])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 29 Jul 2022 05:32:18 +0000 (GMT)
Message-ID: <dc708d21-d460-ffa1-44b3-b59df93f9df5@linux.ibm.com>
Date: Thu, 28 Jul 2022 19:20:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v4 01/17] dump: Rename write_elf_loads to
 write_elf_phdr_loads
Content-Language: en-US
To: Janosch Frank <frankja@linux.ibm.com>, qemu-devel@nongnu.org
Cc: marcandre.lureau@redhat.com, pbonzini@redhat.com, mhartmay@linux.ibm.com, 
 borntraeger@linux.ibm.com, imbrenda@linux.ibm.com, pasic@linux.ibm.com,
 cohuck@redhat.com, thuth@redhat.com, qemu-s390x@nongnu.org,
 scgl@linux.ibm.com
References: <20220726092248.128336-1-frankja@linux.ibm.com>
 <20220726092248.128336-2-frankja@linux.ibm.com>
From: Steffen Eiden <seiden@linux.ibm.com>
Organization: IBM
In-Reply-To: <20220726092248.128336-2-frankja@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: VQ6oG58KjJKPLpbfnV5k9PQSs6RbaHeu
X-Proofpoint-GUID: KHxJ_99cHFQJSY8bq8OJ9lEFP3yo5LCh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-28_06,2022-07-28_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 malwarescore=0
 bulkscore=0 impostorscore=0 clxscore=1015 mlxscore=0 spamscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207290020
Received-SPF: pass client-ip=148.163.156.1; envelope-from=seiden@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_12_24=1.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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



On 7/26/22 11:22, Janosch Frank wrote:
> Let's make it a bit clearer that we write the program headers of the
> PT_LOAD type.
> 
> Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
> Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Steffen Eiden <seiden@ibm.linux.com>
> ---
>   dump/dump.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/dump/dump.c b/dump/dump.c
> index 4d9658ffa2..0ed7cf9c7b 100644
> --- a/dump/dump.c
> +++ b/dump/dump.c
> @@ -490,7 +490,7 @@ static void get_offset_range(hwaddr phys_addr,
>       }
>   }
>   
> -static void write_elf_loads(DumpState *s, Error **errp)
> +static void write_elf_phdr_loads(DumpState *s, Error **errp)
>   {
>       ERRP_GUARD();
>       hwaddr offset, filesz;
> @@ -573,8 +573,8 @@ static void dump_begin(DumpState *s, Error **errp)
>           return;
>       }
>   
> -    /* write all PT_LOAD to vmcore */
> -    write_elf_loads(s, errp);
> +    /* write all PT_LOADs to vmcore */
> +    write_elf_phdr_loads(s, errp);
>       if (*errp) {
>           return;
>       }

