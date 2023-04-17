Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B72186E40BD
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Apr 2023 09:23:13 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1poJBg-0000Au-8g; Mon, 17 Apr 2023 03:22:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <harshpb@linux.ibm.com>)
 id 1poJBb-0008Vd-SR; Mon, 17 Apr 2023 03:22:03 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <harshpb@linux.ibm.com>)
 id 1poJBY-0006Ht-DJ; Mon, 17 Apr 2023 03:22:03 -0400
Received: from pps.filterd (m0353726.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33H763PF010759; Mon, 17 Apr 2023 07:21:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=H/kkEHk4iaFkP3iIuS2NCBBRCjW5ghEvx7o3Xp5zfI0=;
 b=cnU0cGCxRpuSkG6rGmhLU6RJmbhk66alJNWilH17yYWfYRbN0hRyqyTsvUlQkrl7xS+q
 krZjaSdbAhWHlTzkLPm4N8rSogLzKHDBvsgt8z4XscLbHxfjmRmnUF/rnDuqnSs4h5Qd
 nv/6mUxHMpPB8A311FQ+IWIcFMe+kr/H65trvltYeqoz23hRd8B688kzyS38ftfYpqTb
 DXIHnArQsEF+MeWFgok1jz0lKcvckmR8mfy3bHr8hAbHdRPgljL5rp4+0sDzDNdj7JlX
 dIY6lSlAsdvdrle8XyEkgJRPzFESq+Jv2X7MWIWXmRP/bqv8ai0hnNAdsZBLVKSmybv1 Dw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pym2g8f61-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Apr 2023 07:21:58 +0000
Received: from m0353726.ppops.net (m0353726.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 33H76EF9011092;
 Mon, 17 Apr 2023 07:21:58 GMT
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pym2g8f5s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Apr 2023 07:21:58 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 33H5BRnH013985;
 Mon, 17 Apr 2023 07:21:57 GMT
Received: from smtprelay04.dal12v.mail.ibm.com ([9.208.130.102])
 by ppma03dal.us.ibm.com (PPS) with ESMTPS id 3pykj6v3w2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Apr 2023 07:21:57 +0000
Received: from smtpav05.wdc07v.mail.ibm.com (smtpav05.wdc07v.mail.ibm.com
 [10.39.53.232])
 by smtprelay04.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 33H7Lu4i4653612
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 17 Apr 2023 07:21:56 GMT
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E9DDB58059;
 Mon, 17 Apr 2023 07:21:55 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 97DB85805F;
 Mon, 17 Apr 2023 07:21:54 +0000 (GMT)
Received: from [9.109.242.129] (unknown [9.109.242.129])
 by smtpav05.wdc07v.mail.ibm.com (Postfix) with ESMTP;
 Mon, 17 Apr 2023 07:21:54 +0000 (GMT)
Message-ID: <32f9d902-5967-4c43-8522-c1bdc4dda47c@linux.ibm.com>
Date: Mon, 17 Apr 2023 12:51:53 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 5/5] MAINTAINERS: Adding myself in the list for ppc/spapr
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org
Cc: qemu-devel@nongnu.org
References: <20230331065344.112341-1-harshpb@linux.ibm.com>
 <20230331065344.112341-6-harshpb@linux.ibm.com>
 <a1b5b50a-9a2c-b6f7-6b89-3977643a892f@gmail.com>
From: Harsh Prateek Bora <harshpb@linux.ibm.com>
In-Reply-To: <a1b5b50a-9a2c-b6f7-6b89-3977643a892f@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: EdKTbFnQ_bj9ed_nHCmarduRw0eJnyN7
X-Proofpoint-ORIG-GUID: 6fqKQv-s7WRmlPJSgg_GZp1O2W4WFn3t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-17_04,2023-04-14_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxscore=0
 mlxlogscore=999 priorityscore=1501 impostorscore=0 adultscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2303200000 definitions=main-2304170063
Received-SPF: pass client-ip=148.163.156.1; envelope-from=harshpb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.976, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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



On 4/14/23 17:27, Daniel Henrique Barboza wrote:
> 
> 
> On 3/31/23 03:53, Harsh Prateek Bora wrote:
>> Would like to get notified of changes in this area and review them.
>>
>> Signed-off-by: Harsh Prateek Bora <harshpb@linux.ibm.com>
>> ---
> 
> All reviewers are welcome.
> 
> Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> 

Thanks for the warm welcome, Daniel.

regards,
Harsh

> 
> 
>>   MAINTAINERS | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 9b56ccdd92..be99e5c4e9 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -1406,6 +1406,7 @@ M: Daniel Henrique Barboza <danielhb413@gmail.com>
>>   R: Cédric Le Goater <clg@kaod.org>
>>   R: David Gibson <david@gibson.dropbear.id.au>
>>   R: Greg Kurz <groug@kaod.org>
>> +R: Harsh Prateek Bora <harshpb@linux.ibm.com>
>>   L: qemu-ppc@nongnu.org
>>   S: Odd Fixes
>>   F: hw/*/spapr*

