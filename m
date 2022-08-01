Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B59515865ED
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Aug 2022 09:58:03 +0200 (CEST)
Received: from localhost ([::1]:41664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIQJO-0002Vr-Dz
	for lists+qemu-devel@lfdr.de; Mon, 01 Aug 2022 03:58:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1oIQF8-0007uj-J1; Mon, 01 Aug 2022 03:53:40 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:7764)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1oIQF6-0003wG-6z; Mon, 01 Aug 2022 03:53:38 -0400
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2716rHQU013751;
 Mon, 1 Aug 2022 07:53:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=c5PQU91NNRqYm/Gl8OpKUVo7J/RMz5mMZrPGV56DNHw=;
 b=V9xgk/IkL03CQI1wtW+8FBv3nm7QlU/Y3Rr0cIzuS7KYAPIyuIdZjOgo45KPI4tYIeEK
 8WeojkS2W6m7Bso2v+XRYdIK0dk0BmNlvLZbS7pZLiI/goAnaHppT6fmKZM0F6W1B0PA
 FsvK4lrsJIYxpMLxagM40sTTPRAPXLzFFp/pXKTH5wPjvAWn7zFAegV7KemLetUgOx7U
 ly36J9sgQaq+FbUvz7pwgojpJCL4Jo3Dr04EbaWRq9+2QNf7xqmdCS4tMZj8Vu2/ZEQC
 x08BTtmFjZS3PaWx+zpv7UgKIyETCe3grHFCdEfk3FASPLO5/neOCDRe/FABbzFI0nR/ Dg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hp9y2ss1x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 01 Aug 2022 07:53:32 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2716vAMq026777;
 Mon, 1 Aug 2022 07:53:32 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hp9y2ss1a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 01 Aug 2022 07:53:32 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2717pQLq031931;
 Mon, 1 Aug 2022 07:53:29 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma03ams.nl.ibm.com with ESMTP id 3hmv98svha-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 01 Aug 2022 07:53:29 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2717rQhQ27984324
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 1 Aug 2022 07:53:26 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AB46F4203F;
 Mon,  1 Aug 2022 07:53:26 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DC4C542042;
 Mon,  1 Aug 2022 07:53:25 +0000 (GMT)
Received: from [9.145.41.76] (unknown [9.145.41.76])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon,  1 Aug 2022 07:53:25 +0000 (GMT)
Message-ID: <a0e9e216-e451-6d76-4511-46ae5f3590ce@linux.ibm.com>
Date: Mon, 1 Aug 2022 09:53:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v4 08/17] dump: Split write of section headers and data
 and add a prepare step
Content-Language: en-US
To: Janis Schoetterl-Glausch <scgl@linux.ibm.com>, qemu-devel@nongnu.org
Cc: marcandre.lureau@redhat.com, pbonzini@redhat.com, mhartmay@linux.ibm.com, 
 borntraeger@linux.ibm.com, imbrenda@linux.ibm.com, pasic@linux.ibm.com,
 cohuck@redhat.com, thuth@redhat.com, qemu-s390x@nongnu.org,
 seiden@linux.ibm.com
References: <20220726092248.128336-1-frankja@linux.ibm.com>
 <20220726092248.128336-9-frankja@linux.ibm.com>
 <50fc36a5-a9f7-777b-4dc5-936cb76c6475@linux.ibm.com>
From: Janosch Frank <frankja@linux.ibm.com>
In-Reply-To: <50fc36a5-a9f7-777b-4dc5-936cb76c6475@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 4lPIcOnFyPFVX3TbHANnsjfp2pilAHcd
X-Proofpoint-GUID: Z5dOdPCUt9dBodzZRAjL6adjmvR6qFEl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-01_03,2022-07-28_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 malwarescore=0 adultscore=0 spamscore=0 impostorscore=0 mlxlogscore=728
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2208010035
Received-SPF: pass client-ip=148.163.156.1; envelope-from=frankja@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
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

On 7/29/22 19:16, Janis Schoetterl-Glausch wrote:
> On 7/26/22 11:22, Janosch Frank wrote:
>> By splitting the writing of the section headers and (future) section
>> data we prepare for the addition of a string table section and
>> architecture sections.
>>
>> At the same time we move the writing of the section to the end of the
>> dump process. This allows the upcoming architecture section code to
>> add data after all of the common dump data has been written.
>>
>> Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
>> ---
>>   dump/dump.c           | 112 ++++++++++++++++++++++++++++++++----------
>>   include/sysemu/dump.h |   4 ++
>>   2 files changed, 90 insertions(+), 26 deletions(-)
>>
[...]
>> +    /* Write special section first */
>> +    if (s->phdr_num == PN_XNUM) {
> 
> Should be >= right?

Yes, just fixed it.

> 
>> +        prepare_elf_section_hdr_zero(s);
>> +    }
>> +}
>> +
> [...]


