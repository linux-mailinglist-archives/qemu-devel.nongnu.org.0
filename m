Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41175702E1A
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 15:29:30 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyYFw-0004du-G4; Mon, 15 May 2023 09:28:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1pyYFn-0004dU-Mq; Mon, 15 May 2023 09:28:43 -0400
Received: from 3.mo548.mail-out.ovh.net ([188.165.32.156])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1pyYFl-0006fO-KM; Mon, 15 May 2023 09:28:43 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.188])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 2F46120F02;
 Mon, 15 May 2023 13:28:38 +0000 (UTC)
Received: from kaod.org (37.59.142.107) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Mon, 15 May
 2023 15:28:36 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-107S001502c21d8-a6b6-4c84-b75a-d470bc9853d5,
 C2820DDF228AE5DDDBFD944B87CC7F3B41DD1A91) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <eda6df92-f363-ef12-3f70-e07b26ed0512@kaod.org>
Date: Mon, 15 May 2023 15:28:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 10/21] migration: Move rate_limit_max and rate_limit_used
 to migration_stats
Content-Language: en-US
To: <quintela@redhat.com>
CC: <qemu-devel@nongnu.org>, Daniel Henrique Barboza <danielhb413@gmail.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, David Hildenbrand
 <david@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 <qemu-block@nongnu.org>, Eric Blake <eblake@redhat.com>, Vladimir
 Sementsov-Ogievskiy <vsementsov@yandex-team.ru>, John Snow
 <jsnow@redhat.com>, Halil Pasic <pasic@linux.ibm.com>, Peter Xu
 <peterx@redhat.com>, Richard Henderson <richard.henderson@linaro.org>, David
 Gibson <david@gibson.dropbear.id.au>, Harsh Prateek Bora
 <harshpb@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>, Greg Kurz
 <groug@kaod.org>, <qemu-ppc@nongnu.org>, <qemu-s390x@nongnu.org>, Fam Zheng
 <fam@euphon.net>, Thomas Huth <thuth@redhat.com>, Leonardo Bras
 <leobras@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>
References: <20230508130909.65420-1-quintela@redhat.com>
 <20230508130909.65420-11-quintela@redhat.com>
 <4a7fcac1-a8f1-44d2-1a5a-284a80486633@kaod.org>
 <87h6sdzqoo.fsf@secure.mitica>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <87h6sdzqoo.fsf@secure.mitica>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.107]
X-ClientProxiedBy: DAG5EX2.mxp5.local (172.16.2.42) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 5bdb8741-c003-4b25-898a-cbfec2e337b6
X-Ovh-Tracer-Id: 3712654946403715993
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrfeehjedgieehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeffudefleeiudejfeffhfejffeigffhhffhvdekieejheelvdeufffhjedtheeggeenucfkphepuddvjedrtddrtddruddpfeejrdehledrudegvddruddtjedpkedvrdeigedrvdehtddrudejtdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoegtlhhgsehkrghougdrohhrgheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepqhhuihhnthgvlhgrsehrvgguhhgrthdrtghomhdpthhhuhhthhesrhgvughhrghtrdgtohhmpdhfrghmsegvuhhphhhonhdrnhgvthdpqhgvmhhuqdhsfeeltdigsehnohhnghhnuhdrohhrghdpqhgvmhhuqdhpphgtsehnohhnghhnuhdrohhrghdpfhgrrhhmrghnsehlihhnuhigrdhisghmrdgtohhmpdhhrghrshhhphgssehlihhnuhigrdhisghmrdgtohhmpdgurghvihgusehgihgsshhonhdrughrohhpsggvrghrrdhiugdrrghupdhrih
 gthhgrrhgurdhhvghnuggvrhhsohhnsehlihhnrghrohdrohhrghdplhgvohgsrhgrshesrhgvughhrghtrdgtohhmpdhpvghtvghrgiesrhgvughhrghtrdgtohhmpdhjshhnohifsehrvgguhhgrthdrtghomhdpvhhsvghmvghnthhsohhvseihrghnuggvgidqthgvrghmrdhruhdpvggslhgrkhgvsehrvgguhhgrthdrtghomhdpqhgvmhhuqdgslhhotghksehnohhnghhnuhdrohhrghdpshhtvghfrghnhhgrsehrvgguhhgrthdrtghomhdpuggrvhhiugesrhgvughhrghtrdgtohhmpdgsohhrnhhtrhgrvghgvghrsehlihhnuhigrdhisghmrdgtohhmpdgurghnihgvlhhhsgegudefsehgmhgrihhlrdgtohhmpdhqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgpdhprghsihgtsehlihhnuhigrdhisghmrdgtohhmpdhiihhisehlihhnuhigrdhisghmrdgtohhmpdhgrhhouhhgsehkrghougdrohhrghdpoffvtefjohhsthepmhhoheegkedpmhhouggvpehsmhhtphhouhht
Received-SPF: pass client-ip=188.165.32.156; envelope-from=clg@kaod.org;
 helo=3.mo548.mail-out.ovh.net
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.811,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 URG_BIZ=0.573 autolearn=unavailable autolearn_force=no
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

On 5/15/23 15:09, Juan Quintela wrote:
> Cédric Le Goater <clg@kaod.org> wrote:
>> On 5/8/23 15:08, Juan Quintela wrote:
>>> This way we can make them atomic and use this functions from any
>>> place.  I also moved all functions that use rate_limit to
>>> migration-stats.
>>> Functions got renamed, they are not qemu_file anymore.
>>> qemu_file_rate_limit -> migration_rate_limit_exceeded
>>> qemu_file_set_rate_limit -> migration_rate_limit_set
>>> qemu_file_get_rate_limit -> migration_rate_limit_get
>>> qemu_file_reset_rate_limit -> migration_rate_limit_reset
>>> qemu_file_acct_rate_limit -> migration_rate_limit_account.
>>> Signed-off-by: Juan Quintela <quintela@redhat.com>
>>> ---
>>> If you have any good suggestion for better names, I am all ears.
>>
>> May be :
>>
>>   qemu_file_rate_limit -> migration_rate_limit_is_exceeded
> 
> I try not to put _is_ in function names.  If it needs to be there, I
> think that I need to rename the functino.

It is common practice for functions doing a simple test and returning a bool.
No big deal anyway.
  
> migration_rate_limit_exceeded()
> 
> seems clear to me.
> 
>>   qemu_file_acct_rate_limit -> migration_rate_limit_inc
> 
> My problem for this one is that we are not increasing the rate_limit, we
> are "decreasing" the amount of data we have for this period.  That is
> why I thought about _account(), but who knows.
> 
> 
>> Also, migration_rate_limit() would need some prefix to understand what is
>> its purpose.
> 
> What do you mean here?

I am referring to :

   /* Returns true if the rate limiting was broken by an urgent request */
   bool migration_rate_limit(void)
   {
       ...
       return urgent;
   }

which existed prior to the name changes and I thought migration_rate_limit()
would suffer the same fate. May be keep the '_limit' suffix for this one if
you remove it for the others ?

Thanks,

C.


> This is the only rate_limit that I can think in migration.
> 
>> Do we really need "_limit" in the names ?
> 
> You have a point here.
> 
> If nobody complains/suggest anything else, I will drop the _limit for
> the next submission.
> 
> Thanks very much.
> 


