Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D1266FC5C5
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 14:04:41 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwM4I-0002YW-D0; Tue, 09 May 2023 08:03:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <harshpb@linux.ibm.com>)
 id 1pwM4F-0002XZ-8g; Tue, 09 May 2023 08:03:43 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <harshpb@linux.ibm.com>)
 id 1pwM4C-0006Zr-PH; Tue, 09 May 2023 08:03:42 -0400
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 349BoDbo018874; Tue, 9 May 2023 12:03:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=EOyorRkaXbKHTkgxIl1i+Z6VLvLWPGm9rqVgkUYMezE=;
 b=pzlbympj6RAYdWPM7tJLnSR+dRQtSQw48HpirnHyorIn3fvA1WjE0FgFoKK0eJGAsWq+
 4ogM+7GNEHwUugguebZvf+lF5GlnelPFi/x5OBZplw0fGFNwyToytCi6vxMSAJhDO6VR
 bHUE7vMpQePGbXSMG8X0IzIvITUiuz3h0NrRRhe1b+WV/g2K1MKVPgVDCwllXkwAQ+Sp
 FaXKdoDSqjBGFuJgLXGjStFehfbNgWZgfnq6z0u1hSo8sJ22YoPWHaxlYxacukJxWoEH
 bO01CASRxN4MYFw5D3qPE27E8RD7YbF5ZAZ5BrY1YMEUaRuA9y031PHkBHuALhG3y+ET hg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qfnn4gbpv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 May 2023 12:03:27 +0000
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 349BsJgc032259;
 Tue, 9 May 2023 12:03:25 GMT
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qfnn4gbca-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 May 2023 12:03:25 +0000
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3498nTdh014991;
 Tue, 9 May 2023 12:03:13 GMT
Received: from smtprelay04.wdc07v.mail.ibm.com ([9.208.129.114])
 by ppma01wdc.us.ibm.com (PPS) with ESMTPS id 3qf7ptk9qm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 May 2023 12:03:13 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com
 [10.39.53.228])
 by smtprelay04.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 349C3CGL34734720
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 9 May 2023 12:03:12 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1E16958059;
 Tue,  9 May 2023 12:03:12 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 604BC58055;
 Tue,  9 May 2023 12:03:01 +0000 (GMT)
Received: from [9.43.112.58] (unknown [9.43.112.58])
 by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
 Tue,  9 May 2023 12:03:01 +0000 (GMT)
Message-ID: <689a5594-9877-1e4c-5471-d7423e00cd8e@linux.ibm.com>
Date: Tue, 9 May 2023 17:32:59 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 02/21] migration: Don't use INT64_MAX for unlimited rate
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
 <20230508130909.65420-3-quintela@redhat.com>
 <9ab54244-b804-e066-580f-3d4e89fb7862@linux.ibm.com>
 <87cz39en8j.fsf@secure.mitica>
From: Harsh Prateek Bora <harshpb@linux.ibm.com>
In-Reply-To: <87cz39en8j.fsf@secure.mitica>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 98JSlkeciW_eJ2RDtBbG_UeE95gXZz46
X-Proofpoint-ORIG-GUID: YsiP-jPeBXhVXYHmmX5becxEb-3zXLrE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-09_07,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015
 mlxlogscore=845 mlxscore=0 adultscore=0 priorityscore=1501 spamscore=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2304280000
 definitions=main-2305090092
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



On 5/9/23 17:21, Juan Quintela wrote:
> Harsh Prateek Bora <harshpb@linux.ibm.com> wrote:
>> On 5/8/23 18:38, Juan Quintela wrote:
>>> Use 0 instead.
>>> Signed-off-by: Juan Quintela <quintela@redhat.com>
>>> ---
>>>    migration/migration.c | 4 ++--
>>>    migration/qemu-file.c | 3 +++
>>>    2 files changed, 5 insertions(+), 2 deletions(-)
>>> diff --git a/migration/migration.c b/migration/migration.c
>>> index 1192f1ebf1..3979a98949 100644
>>> --- a/migration/migration.c
>>> +++ b/migration/migration.c
>>> @@ -2296,7 +2296,7 @@ static void migration_completion(MigrationState *s)
>>>                }
>>>                if (ret >= 0) {
>>>                    s->block_inactive = !migrate_colo();
>>> -                qemu_file_set_rate_limit(s->to_dst_file, INT64_MAX);
>>> +                qemu_file_set_rate_limit(s->to_dst_file, 0);
>>
>> #define RATE_LIMIT_MAX 0
>>
>> How about having a macro and use that which conveys the meaning in all
>> call instances wherever it is getting passed ?
> 
> I almost preffer the macro.
> 
>        qemu_file_set_rate_limit(s->to_dst_file, RATE_LIMIT_MAX);
> 
> seems quite explanatory?
> 
Yes, definitely.

Thanks
Harsh
> Thanks, Juan.
> 
>>
>>>                    ret = qemu_savevm_state_complete_precopy(s->to_dst_file, false,
>>>                                                             s->block_inactive);
>>>                }
>>> @@ -3044,7 +3044,7 @@ static void *bg_migration_thread(void *opaque)
>>>        rcu_register_thread();
>>>        object_ref(OBJECT(s));
>>>    -    qemu_file_set_rate_limit(s->to_dst_file, INT64_MAX);
>>> +    qemu_file_set_rate_limit(s->to_dst_file, 0);
>>>          setup_start = qemu_clock_get_ms(QEMU_CLOCK_HOST);
>>>        /*
>>> diff --git a/migration/qemu-file.c b/migration/qemu-file.c
>>> index f4cfd05c67..745361d238 100644
>>> --- a/migration/qemu-file.c
>>> +++ b/migration/qemu-file.c
>>> @@ -731,6 +731,9 @@ int qemu_file_rate_limit(QEMUFile *f)
>>>        if (qemu_file_get_error(f)) {
>>>            return 1;
>>>        }
>>> +    /*
>>> +     *  rate_limit_max == 0 means no rate_limit enfoncement.
>>> +     */
>>>        if (f->rate_limit_max > 0 && f->rate_limit_used > f->rate_limit_max) {
>>>            return 1;
>>>        }
> 

