Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F161702769
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 10:40:33 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyTkn-0000UA-TQ; Mon, 15 May 2023 04:40:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pyTkZ-0000IC-N5
 for qemu-devel@nongnu.org; Mon, 15 May 2023 04:40:14 -0400
Received: from 3.mo552.mail-out.ovh.net ([178.33.254.192])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pyTkX-0003x6-Pz
 for qemu-devel@nongnu.org; Mon, 15 May 2023 04:40:11 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.194])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 146C5237BE;
 Mon, 15 May 2023 08:40:04 +0000 (UTC)
Received: from kaod.org (37.59.142.99) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Mon, 15 May
 2023 10:40:02 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-99G003cfa22adf-9d55-4cf4-9dba-ea973f3c4d9a,
 C2820DDF228AE5DDDBFD944B87CC7F3B41DD1A91) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <820e587a-51d6-2d3c-893d-e6f9bbe59ff1@kaod.org>
Date: Mon, 15 May 2023 10:40:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 05/21] qemu-file: Make rate_limit_used an uint64_t
Content-Language: en-US
To: Juan Quintela <quintela@redhat.com>, <qemu-devel@nongnu.org>
CC: Daniel Henrique Barboza <danielhb413@gmail.com>, Christian Borntraeger
 <borntraeger@linux.ibm.com>, David Hildenbrand <david@redhat.com>, Stefan
 Hajnoczi <stefanha@redhat.com>, <qemu-block@nongnu.org>, Eric Blake
 <eblake@redhat.com>, Vladimir Sementsov-Ogievskiy
 <vsementsov@yandex-team.ru>, John Snow <jsnow@redhat.com>, Halil Pasic
 <pasic@linux.ibm.com>, Peter Xu <peterx@redhat.com>, Richard Henderson
 <richard.henderson@linaro.org>, David Gibson <david@gibson.dropbear.id.au>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>, Eric Farman
 <farman@linux.ibm.com>, Greg Kurz <groug@kaod.org>, <qemu-ppc@nongnu.org>,
 <qemu-s390x@nongnu.org>, Fam Zheng <fam@euphon.net>, Thomas Huth
 <thuth@redhat.com>, Leonardo Bras <leobras@redhat.com>, Ilya Leoshkevich
 <iii@linux.ibm.com>, =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?=
 <berrange@redhat.com>
References: <20230508130909.65420-1-quintela@redhat.com>
 <20230508130909.65420-6-quintela@redhat.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20230508130909.65420-6-quintela@redhat.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.99]
X-ClientProxiedBy: DAG6EX2.mxp5.local (172.16.2.52) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: ecd2ae8a-5eca-4a8b-be85-26a933d74098
X-Ovh-Tracer-Id: 17285659798340340636
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrfeehjedgtdejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeffudefleeiudejfeffhfejffeigffhhffhvdekieejheelvdeufffhjedtheeggeenucfkphepuddvjedrtddrtddruddpfeejrdehledrudegvddrleelpdekvddrieegrddvhedtrddujedtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeotghlgheskhgrohgurdhorhhgqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehquhhinhhtvghlrgesrhgvughhrghtrdgtohhmpdhlvghosghrrghssehrvgguhhgrthdrtghomhdpthhhuhhthhesrhgvughhrghtrdgtohhmpdhfrghmsegvuhhphhhonhdrnhgvthdpqhgvmhhuqdhsfeeltdigsehnohhnghhnuhdrohhrghdpqhgvmhhuqdhpphgtsehnohhnghhnuhdrohhrghdpfhgrrhhmrghnsehlihhnuhigrdhisghmrdgtohhmpdhhrghrshhhphgssehlihhnuhigrdhisghmrdgtohhmpdgurghvihgusehgihgsshhonh
 drughrohhpsggvrghrrdhiugdrrghupdhrihgthhgrrhgurdhhvghnuggvrhhsohhnsehlihhnrghrohdrohhrghdpihhiiheslhhinhhugidrihgsmhdrtghomhdpphgvthgvrhigsehrvgguhhgrthdrtghomhdpjhhsnhhofiesrhgvughhrghtrdgtohhmpdhvshgvmhgvnhhtshhovheshigrnhguvgigqdhtvggrmhdrrhhupdgvsghlrghkvgesrhgvughhrghtrdgtohhmpdhqvghmuhdqsghlohgtkhesnhhonhhgnhhurdhorhhgpdhsthgvfhgrnhhhrgesrhgvughhrghtrdgtohhmpdgurghvihgusehrvgguhhgrthdrtghomhdpsghorhhnthhrrggvghgvrheslhhinhhugidrihgsmhdrtghomhdpuggrnhhivghlhhgsgedufeesghhmrghilhdrtghomhdpqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghdpphgrshhitgeslhhinhhugidrihgsmhdrtghomhdpsggvrhhrrghnghgvsehrvgguhhgrthdrtghomhdpghhrohhugheskhgrohgurdhorhhgpdfovfetjfhoshhtpehmohehhedvpdhmohguvgepshhmthhpohhuth
Received-SPF: pass client-ip=178.33.254.192; envelope-from=clg@kaod.org;
 helo=3.mo552.mail-out.ovh.net
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.93,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 5/8/23 15:08, Juan Quintela wrote:
> Change all the functions that use it.  It was already passed as
> uint64_t.
> 
> Signed-off-by: Juan Quintela <quintela@redhat.com>
> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
> Message-Id: <20230504113841.23130-5-quintela@redhat.com>


Reviewed-by: Cédric Le Goater <clg@kaod.org>

C.

> ---
>   migration/qemu-file.c | 4 ++--
>   migration/qemu-file.h | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/migration/qemu-file.c b/migration/qemu-file.c
> index 346b683929..f3cb0cd94f 100644
> --- a/migration/qemu-file.c
> +++ b/migration/qemu-file.c
> @@ -49,7 +49,7 @@ struct QEMUFile {
>        * Total amount of data in bytes queued for transfer
>        * during this rate limiting time window
>        */
> -    int64_t rate_limit_used;
> +    uint64_t rate_limit_used;
>   
>       /* The sum of bytes transferred on the wire */
>       uint64_t total_transferred;
> @@ -759,7 +759,7 @@ void qemu_file_reset_rate_limit(QEMUFile *f)
>       f->rate_limit_used = 0;
>   }
>   
> -void qemu_file_acct_rate_limit(QEMUFile *f, int64_t len)
> +void qemu_file_acct_rate_limit(QEMUFile *f, uint64_t len)
>   {
>       f->rate_limit_used += len;
>   }
> diff --git a/migration/qemu-file.h b/migration/qemu-file.h
> index 04ca48cbef..d758e7f10b 100644
> --- a/migration/qemu-file.h
> +++ b/migration/qemu-file.h
> @@ -137,7 +137,7 @@ void qemu_file_reset_rate_limit(QEMUFile *f);
>    * out of band from the main file object I/O methods, and
>    * need to be applied to the rate limiting calcuations
>    */
> -void qemu_file_acct_rate_limit(QEMUFile *f, int64_t len);
> +void qemu_file_acct_rate_limit(QEMUFile *f, uint64_t len);
>   void qemu_file_set_rate_limit(QEMUFile *f, uint64_t new_rate);
>   uint64_t qemu_file_get_rate_limit(QEMUFile *f);
>   int qemu_file_get_error_obj(QEMUFile *f, Error **errp);


