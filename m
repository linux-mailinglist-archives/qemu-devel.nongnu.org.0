Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ECFE702768
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 10:40:33 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyTjp-0007uN-EH; Mon, 15 May 2023 04:39:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1pyTjm-0007u2-8b; Mon, 15 May 2023 04:39:22 -0400
Received: from smtpout2.mo529.mail-out.ovh.net ([79.137.123.220])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1pyTjX-0003eD-Uk; Mon, 15 May 2023 04:39:22 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.144])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id E9C0220A34;
 Mon, 15 May 2023 08:39:05 +0000 (UTC)
Received: from kaod.org (37.59.142.103) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Mon, 15 May
 2023 10:39:04 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G005638c0227-704f-4242-a2d2-f5e4903ddd6b,
 C2820DDF228AE5DDDBFD944B87CC7F3B41DD1A91) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <0b2514fb-9b6c-a636-7ac7-a607b0cdc950@kaod.org>
Date: Mon, 15 May 2023 10:38:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 04/21] qemu-file: make qemu_file_[sg]et_rate_limit() use
 an uint64_t
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
 <iii@linux.ibm.com>
References: <20230508130909.65420-1-quintela@redhat.com>
 <20230508130909.65420-5-quintela@redhat.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20230508130909.65420-5-quintela@redhat.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG8EX2.mxp5.local (172.16.2.72) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 01001bf9-d271-4be4-8909-d95e58ef5fc0
X-Ovh-Tracer-Id: 17269334248696286105
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrfeehjedgtdejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeffudefleeiudejfeffhfejffeigffhhffhvdekieejheelvdeufffhjedtheeggeenucfkphepuddvjedrtddrtddruddpfeejrdehledrudegvddruddtfedpkedvrdeigedrvdehtddrudejtdenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoegtlhhgsehkrghougdrohhrgheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepqhhuihhnthgvlhgrsehrvgguhhgrthdrtghomhdpthhhuhhthhesrhgvughhrghtrdgtohhmpdhfrghmsegvuhhphhhonhdrnhgvthdpqhgvmhhuqdhsfeeltdigsehnohhnghhnuhdrohhrghdpqhgvmhhuqdhpphgtsehnohhnghhnuhdrohhrghdpfhgrrhhmrghnsehlihhnuhigrdhisghmrdgtohhmpdhhrghrshhhphgssehlihhnuhigrdhisghmrdgtohhmpdgurghvihgusehgihgsshhonhdrughrohhpsggvrghrrdhiugdrrghupdhrih
 gthhgrrhgurdhhvghnuggvrhhsohhnsehlihhnrghrohdrohhrghdplhgvohgsrhgrshesrhgvughhrghtrdgtohhmpdhpvghtvghrgiesrhgvughhrghtrdgtohhmpdhjshhnohifsehrvgguhhgrthdrtghomhdpvhhsvghmvghnthhsohhvseihrghnuggvgidqthgvrghmrdhruhdpvggslhgrkhgvsehrvgguhhgrthdrtghomhdpqhgvmhhuqdgslhhotghksehnohhnghhnuhdrohhrghdpshhtvghfrghnhhgrsehrvgguhhgrthdrtghomhdpuggrvhhiugesrhgvughhrghtrdgtohhmpdgsohhrnhhtrhgrvghgvghrsehlihhnuhigrdhisghmrdgtohhmpdgurghnihgvlhhhsgegudefsehgmhgrihhlrdgtohhmpdhqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgpdhprghsihgtsehlihhnuhigrdhisghmrdgtohhmpdhiihhisehlihhnuhigrdhisghmrdgtohhmpdhgrhhouhhgsehkrghougdrohhrghdpoffvtefjohhsthepmhhohedvledpmhhouggvpehsmhhtphhouhht
Received-SPF: pass client-ip=79.137.123.220; envelope-from=clg@kaod.org;
 helo=smtpout2.mo529.mail-out.ovh.net
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.93,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
> It is really size_t.  Everything else uses uint64_t, so move this to
> uint64_t as well.  A size can't be negative anyways.
> 
> Signed-off-by: Juan Quintela <quintela@redhat.com>
> Message-Id: <20230504113841.23130-4-quintela@redhat.com>



Reviewed-by: Cédric Le Goater <clg@kaod.org>

C. *
> 
> ---
> 
> Don't drop the check if rate_limit_max is zero.
> ---
>   migration/qemu-file.c | 6 +++---
>   migration/qemu-file.h | 4 ++--
>   2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/migration/qemu-file.c b/migration/qemu-file.c
> index 12cf7fb04e..346b683929 100644
> --- a/migration/qemu-file.c
> +++ b/migration/qemu-file.c
> @@ -44,7 +44,7 @@ struct QEMUFile {
>        * Maximum amount of data in bytes to transfer during one
>        * rate limiting time window
>        */
> -    int64_t rate_limit_max;
> +    uint64_t rate_limit_max;
>       /*
>        * Total amount of data in bytes queued for transfer
>        * during this rate limiting time window
> @@ -741,12 +741,12 @@ int qemu_file_rate_limit(QEMUFile *f)
>       return 0;
>   }
>   
> -int64_t qemu_file_get_rate_limit(QEMUFile *f)
> +uint64_t qemu_file_get_rate_limit(QEMUFile *f)
>   {
>       return f->rate_limit_max;
>   }
>   
> -void qemu_file_set_rate_limit(QEMUFile *f, int64_t limit)
> +void qemu_file_set_rate_limit(QEMUFile *f, uint64_t limit)
>   {
>       /*
>        * 'limit' is per second.  But we check it each 100 miliseconds.
> diff --git a/migration/qemu-file.h b/migration/qemu-file.h
> index 4f26bf6961..04ca48cbef 100644
> --- a/migration/qemu-file.h
> +++ b/migration/qemu-file.h
> @@ -138,8 +138,8 @@ void qemu_file_reset_rate_limit(QEMUFile *f);
>    * need to be applied to the rate limiting calcuations
>    */
>   void qemu_file_acct_rate_limit(QEMUFile *f, int64_t len);
> -void qemu_file_set_rate_limit(QEMUFile *f, int64_t new_rate);
> -int64_t qemu_file_get_rate_limit(QEMUFile *f);
> +void qemu_file_set_rate_limit(QEMUFile *f, uint64_t new_rate);
> +uint64_t qemu_file_get_rate_limit(QEMUFile *f);
>   int qemu_file_get_error_obj(QEMUFile *f, Error **errp);
>   int qemu_file_get_error_obj_any(QEMUFile *f1, QEMUFile *f2, Error **errp);
>   void qemu_file_set_error_obj(QEMUFile *f, int ret, Error *err);


