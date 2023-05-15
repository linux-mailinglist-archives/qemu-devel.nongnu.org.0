Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3F5E702753
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 10:35:08 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyTfG-0003O5-2j; Mon, 15 May 2023 04:34:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1pyTf7-00035z-Np; Mon, 15 May 2023 04:34:33 -0400
Received: from 3.mo548.mail-out.ovh.net ([188.165.32.156])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1pyTf5-0002lv-JL; Mon, 15 May 2023 04:34:33 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.54])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 3F29E21345;
 Mon, 15 May 2023 08:34:29 +0000 (UTC)
Received: from kaod.org (37.59.142.96) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Mon, 15 May
 2023 10:34:28 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-96R0012580a613-b031-44fc-a27a-b3d0d882c428,
 C2820DDF228AE5DDDBFD944B87CC7F3B41DD1A91) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <0e21e709-211b-86b5-5b71-760c436e2319@kaod.org>
Date: Mon, 15 May 2023 10:34:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 02/21] migration: Don't use INT64_MAX for unlimited rate
Content-Language: en-US
To: <quintela@redhat.com>, Harsh Prateek Bora <harshpb@linux.ibm.com>
CC: <qemu-devel@nongnu.org>, Daniel Henrique Barboza <danielhb413@gmail.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, David Hildenbrand
 <david@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 <qemu-block@nongnu.org>, Eric Blake <eblake@redhat.com>, Vladimir
 Sementsov-Ogievskiy <vsementsov@yandex-team.ru>, John Snow
 <jsnow@redhat.com>, Halil Pasic <pasic@linux.ibm.com>, Peter Xu
 <peterx@redhat.com>, Richard Henderson <richard.henderson@linaro.org>, David
 Gibson <david@gibson.dropbear.id.au>, Eric Farman <farman@linux.ibm.com>,
 Greg Kurz <groug@kaod.org>, <qemu-ppc@nongnu.org>, <qemu-s390x@nongnu.org>,
 Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>, Leonardo Bras
 <leobras@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>
References: <20230508130909.65420-1-quintela@redhat.com>
 <20230508130909.65420-3-quintela@redhat.com>
 <9ab54244-b804-e066-580f-3d4e89fb7862@linux.ibm.com>
 <87cz39en8j.fsf@secure.mitica>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <87cz39en8j.fsf@secure.mitica>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.96]
X-ClientProxiedBy: DAG2EX1.mxp5.local (172.16.2.11) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 07d6998b-3e40-46c5-962a-873d3d756c08
X-Ovh-Tracer-Id: 17191647154909449113
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrfeehjedgtdeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeuuddtteelgeejhfeikeegffekhfelvefgfeejveffjeeiveegfeehgfdtgfeitdenucfkphepuddvjedrtddrtddruddpfeejrdehledrudegvddrleeipdekvddrieegrddvhedtrddujedtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeotghlgheskhgrohgurdhorhhgqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehquhhinhhtvghlrgesrhgvughhrghtrdgtohhmpdhthhhuthhhsehrvgguhhgrthdrtghomhdpfhgrmhesvghuphhhohhnrdhnvghtpdhqvghmuhdqshefledtgiesnhhonhhgnhhurdhorhhgpdhqvghmuhdqphhptgesnhhonhhgnhhurdhorhhgpdhfrghrmhgrnheslhhinhhugidrihgsmhdrtghomhdpuggrvhhiugesghhisghsohhnrdgurhhophgsvggrrhdrihgurdgruhdprhhitghhrghrugdrhhgvnhguvghrshhonheslhhinhgrrhhord
 horhhgpdhpvghtvghrgiesrhgvughhrghtrdgtohhmpdhlvghosghrrghssehrvgguhhgrthdrtghomhdpphgrshhitgeslhhinhhugidrihgsmhdrtghomhdpvhhsvghmvghnthhsohhvseihrghnuggvgidqthgvrghmrdhruhdpvggslhgrkhgvsehrvgguhhgrthdrtghomhdpqhgvmhhuqdgslhhotghksehnohhnghhnuhdrohhrghdpshhtvghfrghnhhgrsehrvgguhhgrthdrtghomhdpuggrvhhiugesrhgvughhrghtrdgtohhmpdgsohhrnhhtrhgrvghgvghrsehlihhnuhigrdhisghmrdgtohhmpdgurghnihgvlhhhsgegudefsehgmhgrihhlrdgtohhmpdhqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgpdhhrghrshhhphgssehlihhnuhigrdhisghmrdgtohhmpdhjshhnohifsehrvgguhhgrthdrtghomhdpihhiiheslhhinhhugidrihgsmhdrtghomhdpghhrohhugheskhgrohgurdhorhhgpdfovfetjfhoshhtpehmohehgeekpdhmohguvgepshhmthhpohhuth
Received-SPF: pass client-ip=188.165.32.156; envelope-from=clg@kaod.org;
 helo=3.mo548.mail-out.ovh.net
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.93,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

On 5/9/23 13:51, Juan Quintela wrote:
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

yep. and I would drop the comment qemu_file_rate_limit().

Thanks,

C.


> 
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


