Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B096469678B
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 16:02:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRwoN-0004oY-OS; Tue, 14 Feb 2023 10:01:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1pRwoD-0004hi-Vw; Tue, 14 Feb 2023 10:01:33 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1pRwo9-0000iC-L7; Tue, 14 Feb 2023 10:01:28 -0500
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31EEM8Xb030871; Tue, 14 Feb 2023 15:01:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : to : cc : references : from : subject : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=3fcNsLla1ldafzgsQ79F6T/bv26KQxeJ9quWHisyhT4=;
 b=VgfXobRl6DJtsReMTmkUF3d0gSTW9qYOZgEK65U+U75G/JV9e+1Qwx3fk3w1rocF5RpA
 TDafCXQGxqWgUyIHBSAAwWd++FhmEzj0eygg4Qc/xfqf/zuGW4lJyPWdV5yGaLs931xY
 9r1ptS/XotCPAB/EK3gmk5y1x3QebSz3V8HNMIA4FKK9xUihZ0GmQnzzFv9E6WfXCBRJ
 Qj920ezmu+/Lh6S2w/QrV3C0qElIaiC9ZOmrZVizBa1h+ihSo9g5jlEtFDMVXx4J+k42
 L2beVfhgSn8HLvGzTJR8TIrwlgPnwHJgUIFo+x/tjtU15J6QN9xfssnQYnxdZq60LkYy wg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nrc0jh3eu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Feb 2023 15:01:14 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 31EEkG79028020;
 Tue, 14 Feb 2023 15:01:14 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nrc0jh3cn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Feb 2023 15:01:14 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 31E5Pagi011623;
 Tue, 14 Feb 2023 15:01:11 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
 by ppma04ams.nl.ibm.com (PPS) with ESMTPS id 3np2n6v5n4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Feb 2023 15:01:11 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com
 [10.20.54.106])
 by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 31EF198B28967396
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 14 Feb 2023 15:01:09 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id ECF2D20040;
 Tue, 14 Feb 2023 15:01:08 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A1BD52004E;
 Tue, 14 Feb 2023 15:01:08 +0000 (GMT)
Received: from [9.179.9.103] (unknown [9.179.9.103])
 by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Tue, 14 Feb 2023 15:01:08 +0000 (GMT)
Message-ID: <ef30d5bf-6e8d-e038-d091-05f2ef607c5c@linux.ibm.com>
Date: Tue, 14 Feb 2023 16:01:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
To: Thomas Huth <thuth@redhat.com>, qemu-s390x@nongnu.org,
 David Hildenbrand <david@redhat.com>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>
References: <20230214141056.680969-1-thuth@redhat.com>
Content-Language: en-US
From: Janosch Frank <frankja@linux.ibm.com>
Subject: Re: [PATCH] target/s390x/arch_dump: Fix memory corruption in
 s390x_write_elf64_notes()
In-Reply-To: <20230214141056.680969-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: p7rm4co2F3JMeNumIikVQJEIe-KM2ekq
X-Proofpoint-GUID: Mecm3BV_QNhTurjGoyju_Dm50y3CcT9e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-14_07,2023-02-14_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 mlxlogscore=999 phishscore=0
 mlxscore=0 malwarescore=0 adultscore=0 impostorscore=0 clxscore=1011
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302140125
Received-SPF: pass client-ip=148.163.156.1; envelope-from=frankja@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.35, SPF_HELO_NONE=0.001,
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

On 2/14/23 15:10, Thomas Huth wrote:
> "note_size" can be smaller than sizeof(note), so unconditionally calling
> memset(notep, 0, sizeof(note)) could cause a memory corruption here in
> case notep has been allocated dynamically, thus let's use note_size as
> length argument for memset() instead.
> 
> Fixes: 113d8f4e95 ("s390x: pv: Add dump support")
> Signed-off-by: Thomas Huth <thuth@redhat.com>

This was found because a machine was used that has PV support but 
doesn't have the PV dump support (I currently don't have access to a 
previous generation machine). In that case the size of the PV cpu note 
is reported as 0 but it's still being written / processed.

I added proper checks for dump support on my todo list so we can avoid 
writing empty notes. However it's easier said than done since "dump 
support" is actually a combination of KVM, QEMU, the machine AND a bit 
in the SE header that allows dumping. Additionally we need to report the 
size of the notes way before we start the PV dump process where we get 
told if the machine is allowed to dump.

Thanks for helping with the debug effort and creating a patch Thomas!

Reviewed-by: Janosch Frank <frankja@linux.ibm.com>

Also:
Reported-by: Sebastian Mitterle <smitterl@redhat.com>

> ---
>   target/s390x/arch_dump.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/s390x/arch_dump.c b/target/s390x/arch_dump.c
> index a2329141e8..a7c44ba49d 100644
> --- a/target/s390x/arch_dump.c
> +++ b/target/s390x/arch_dump.c
> @@ -248,7 +248,7 @@ static int s390x_write_elf64_notes(const char *note_name,
>               notep = g_malloc(note_size);
>           }
>   
> -        memset(notep, 0, sizeof(note));
> +        memset(notep, 0, note_size);
>   
>           /* Setup note header data */
>           notep->hdr.n_descsz = cpu_to_be32(content_size);


