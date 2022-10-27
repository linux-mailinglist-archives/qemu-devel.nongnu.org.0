Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A4C860FA89
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 16:38:19 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo40J-00021R-VR; Thu, 27 Oct 2022 10:37:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1oo40E-0001tb-7r
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 10:37:03 -0400
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1oo406-0003xl-EG
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 10:37:02 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.123])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 15A8A13715254;
 Thu, 27 Oct 2022 16:36:31 +0200 (CEST)
Received: from kaod.org (37.59.142.108) by DAG8EX2.mxp5.local (172.16.2.72)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12; Thu, 27 Oct
 2022 16:36:31 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-108S002ba7d64b6-4bdd-49c8-a7f5-92e99578f79c,
 12214A5382596B9A7152AE05734170724E9AD55A) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 78.197.208.248
Date: Thu, 27 Oct 2022 16:36:30 +0200
From: Greg Kurz <groug@kaod.org>
To: <qemu-devel@nongnu.org>
CC: Paolo Bonzini <pbonzini@redhat.com>, Alex =?UTF-8?B?QmVubsOpZQ==?=
 <alex.bennee@linaro.org>, "Daniel P . =?UTF-8?B?QmVycmFuZ8Op?="
 <berrange@redhat.com>, <richard.henderson@linaro.org>,
 <qemu-stable@nongnu.org>
Subject: Re: [PATCH] util/log: Close per-thread log file on thread termination
Message-ID: <20221027163630.4863d4be@bahia>
In-Reply-To: <20221021105734.555797-1-groug@kaod.org>
References: <20221021105734.555797-1-groug@kaod.org>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.108]
X-ClientProxiedBy: DAG1EX2.mxp5.local (172.16.2.2) To DAG8EX2.mxp5.local
 (172.16.2.72)
X-Ovh-Tracer-GUID: 162aacd5-1783-4dc8-a203-9f98acd2d467
X-Ovh-Tracer-Id: 10911940422978345254
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvgedrtdeggdejjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhfogggtgfhisehtjeertdertddvnecuhfhrohhmpefirhgvghcumfhurhiiuceoghhrohhugheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeegkeejtdevgeekieelffdvtedvvdegtdduudeigffhhffgvdfhgeejteekheefkeenucfkphepuddvjedrtddrtddruddpfeejrdehledrudegvddruddtkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoehgrhhouhhgsehkrghougdrohhrgheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghdpphgsohhniihinhhisehrvgguhhgrthdrtghomhdprghlvgigrdgsvghnnhgvvgeslhhinhgrrhhordhorhhgpdgsvghrrhgrnhhgvgesrhgvughhrghtrdgtohhmpdhrihgthhgrrhgurdhhvghnuggvrhhsohhnsehlihhnrghrohdrohhrghdpqhgvmhhuqdhsthgrsghlvgesnhhonhhgnhhurdhorhhgpdfovfetjfhoshhtpehmohehvdelpdhmohguvgepshhmthhpohhuth
Received-SPF: pass client-ip=178.32.125.2; envelope-from=groug@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Cc'ing stable

On Fri, 21 Oct 2022 12:57:34 +0200
Greg Kurz <groug@kaod.org> wrote:

> When `-D ${logfile} -d tid` is passed, qemu_log_trylock() creates
> a dedicated log file for the current thread and opens it. The
> corresponding file descriptor is cached in a __thread variable.
> Nothing is done to close the corresponding file descriptor when the
> thread terminates though and the file descriptor is leaked.
> 
> The issue was found during code inspection and reproduced manually.
> 
> Fix that with an atexit notifier.
> 
> Fixes: 4e51069d6793 ("util/log: Support per-thread log files")
> Cc: richard.henderson@linaro.org
> Signed-off-by: Greg Kurz <groug@kaod.org>
> ---
>  util/log.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/util/log.c b/util/log.c
> index d6eb0378c3a3..39866bdaf2fa 100644
> --- a/util/log.c
> +++ b/util/log.c
> @@ -42,6 +42,7 @@ static QemuMutex global_mutex;
>  static char *global_filename;
>  static FILE *global_file;
>  static __thread FILE *thread_file;
> +static __thread Notifier qemu_log_thread_cleanup_notifier;
>  
>  int qemu_loglevel;
>  static bool log_append;
> @@ -77,6 +78,12 @@ static int log_thread_id(void)
>  #endif
>  }
>  
> +static void qemu_log_thread_cleanup(Notifier *n, void *unused)
> +{
> +    fclose(thread_file);
> +    thread_file = NULL;
> +}
> +
>  /* Lock/unlock output. */
>  
>  FILE *qemu_log_trylock(void)
> @@ -93,6 +100,8 @@ FILE *qemu_log_trylock(void)
>                  return NULL;
>              }
>              thread_file = logfile;
> +            qemu_log_thread_cleanup_notifier.notify = qemu_log_thread_cleanup;
> +            qemu_thread_atexit_add(&qemu_log_thread_cleanup_notifier);
>          } else {
>              rcu_read_lock();
>              /*


