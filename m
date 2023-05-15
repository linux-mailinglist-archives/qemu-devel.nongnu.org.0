Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DCEF70279E
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 10:53:33 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyTwO-00081X-Um; Mon, 15 May 2023 04:52:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <harshpb@linux.ibm.com>)
 id 1pyTw5-0007ST-FZ; Mon, 15 May 2023 04:52:14 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <harshpb@linux.ibm.com>)
 id 1pyTw2-00062r-MA; Mon, 15 May 2023 04:52:04 -0400
Received: from pps.filterd (m0353727.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34F8cDH1003377; Mon, 15 May 2023 08:51:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=2Q6nRT3p2naC1gF7fEjbXGA6CUWMQlpLVi5Y7TlHWrQ=;
 b=pTlbi/fvYkD3u1i0H/rVQeDTZtXl6Axvzg0ViUeq1Me2IB/+u0jG12jLx8K5meEYYLyu
 pwxt+fWwt+5relyCHIpthuzYkTfqrhUYzMZLEqwfqjxZI82/Wq8gT6K4vAl7BZvozqbD
 JeUKm2HL2F7nsYluLPFWe8MvUBFoHMK2BtCRtkpct+Ildnc/5uGb46wx1xtHfgTHYpYt
 lBnoitRwhOHUGrkQ5EQC7YirDBDry6hJ2PnsgY19b8cyFTqaYYjkrf7RlQTlIVPON99s
 TtMYBO6bOcw/2WjblTp0vZ8kif6cAFlGMLqZJREMJwDM6Qrp/Jc2nlkVsKVEq4Ht01M7 1Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qkd3mqy8s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 May 2023 08:51:44 +0000
Received: from m0353727.ppops.net (m0353727.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 34F8kDQn011108;
 Mon, 15 May 2023 08:51:43 GMT
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qkd3mqy81-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 May 2023 08:51:43 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 34F6EiZ1009147;
 Mon, 15 May 2023 08:51:41 GMT
Received: from smtprelay06.wdc07v.mail.ibm.com ([9.208.129.118])
 by ppma04wdc.us.ibm.com (PPS) with ESMTPS id 3qj265a7yw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 May 2023 08:51:41 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com
 [10.241.53.105])
 by smtprelay06.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 34F8pd1r8716752
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 15 May 2023 08:51:40 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D592158043;
 Mon, 15 May 2023 08:51:39 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1F74258055;
 Mon, 15 May 2023 08:51:32 +0000 (GMT)
Received: from [9.43.90.211] (unknown [9.43.90.211])
 by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
 Mon, 15 May 2023 08:51:31 +0000 (GMT)
Message-ID: <7e502900-a639-b027-11af-7ccba60eb532@linux.ibm.com>
Date: Mon, 15 May 2023 14:21:30 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 10/21] migration: Move rate_limit_max and rate_limit_used
 to migration_stats
Content-Language: en-US
To: quintela@redhat.com
Cc: qemu-devel@nongnu.org, Daniel Henrique Barboza <danielhb413@gmail.com>,
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
 <20230508130909.65420-11-quintela@redhat.com>
 <303c2198-c7a5-0f3c-496b-eed7b931e51a@linux.ibm.com>
 <87lehxep5g.fsf@secure.mitica>
From: Harsh Prateek Bora <harshpb@linux.ibm.com>
In-Reply-To: <87lehxep5g.fsf@secure.mitica>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 5j9kN-F3p9iHHCQ1D_MMjhTg7i2sVSAa
X-Proofpoint-ORIG-GUID: klW455HnkXQHmmvaWoYrUYGh7odFIry0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-15_06,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 suspectscore=0
 adultscore=0 mlxlogscore=730 bulkscore=0 malwarescore=0 clxscore=1015
 mlxscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305150073
Received-SPF: pass client-ip=148.163.156.1; envelope-from=harshpb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.93,
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



On 5/9/23 16:40, Juan Quintela wrote:
> Harsh Prateek Bora <harshpb@linux.ibm.com> wrote:
>> On 5/8/23 18:38, Juan Quintela wrote:
>>> This way we can make them atomic and use this functions from any
>>
>> s/this/these
>>
> 
> Fixed.
> 
Sure, providing ack from ppc/spapr perspective.

Reviewed-by: Harsh Prateek Bora <harshpb@linux.ibm.com>

> Thanks.
> 
> 

