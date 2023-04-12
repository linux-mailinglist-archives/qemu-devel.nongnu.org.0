Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2F556DF225
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Apr 2023 12:46:18 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmXy3-0003B2-GI; Wed, 12 Apr 2023 06:44:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pmXy2-0003At-8N
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 06:44:46 -0400
Received: from 5.mo552.mail-out.ovh.net ([188.165.45.220])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pmXxz-0006YD-5H
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 06:44:45 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.132])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 712552AC7E;
 Wed, 12 Apr 2023 10:44:31 +0000 (UTC)
Received: from kaod.org (37.59.142.96) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Wed, 12 Apr
 2023 12:44:30 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-96R001d1409ba4-f6fe-4359-9299-1e0a9d594ad5,
 5163A029651DE878447B53959E60E0FA73EB9D10) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.66.77.115
Message-ID: <a4343274-6634-f014-aa7f-baeaf215e43b@kaod.org>
Date: Wed, 12 Apr 2023 12:44:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 1/3] softmmu/qtest: Move the target-specific pseries RTAS
 code out of qtest.c
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 <qemu-devel@nongnu.org>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>
CC: <qemu-ppc@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>, Richard
 Henderson <richard.henderson@linaro.org>, David Gibson
 <david@gibson.dropbear.id.au>, Daniel Henrique Barboza
 <danielhb413@gmail.com>
References: <20230411183418.1640500-1-thuth@redhat.com>
 <20230411183418.1640500-2-thuth@redhat.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20230411183418.1640500-2-thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.96]
X-ClientProxiedBy: DAG1EX2.mxp5.local (172.16.2.2) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 4a3536a9-fa1d-40fd-983e-aa7d7a97252f
X-Ovh-Tracer-Id: 10056256495304411951
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrvdekiedgfedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeffudefleeiudejfeffhfejffeigffhhffhvdekieejheelvdeufffhjedtheeggeenucfkphepuddvjedrtddrtddruddpfeejrdehledrudegvddrleeipdekvddrieeirdejjedrudduheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoegtlhhgsehkrghougdrohhrgheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepthhhuhhthhesrhgvughhrghtrdgtohhmpdhlvhhivhhivghrsehrvgguhhgrthdrtghomhdpqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghdpphhhihhlmhgusehlihhnrghrohdrohhrghdpqhgvmhhuqdhpphgtsehnohhnghhnuhdrohhrghdpphgsohhniihinhhisehrvgguhhgrthdrtghomhdprhhitghhrghrugdrhhgvnhguvghrshhonheslhhinhgrrhhordhorhhgpdgurghvihgusehgihgsshhonhdrughrohhpsggvrghrrdhiug
 drrghupdgurghnihgvlhhhsgegudefsehgmhgrihhlrdgtohhmpdfovfetjfhoshhtpehmohehhedvpdhmohguvgepshhmthhpohhuth
Received-SPF: pass client-ip=188.165.45.220; envelope-from=clg@kaod.org;
 helo=5.mo552.mail-out.ovh.net
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.17,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 4/11/23 20:34, Thomas Huth wrote:
> Ideally, qtest.c should be independent from target specific code, so
> we only have to compile it once for all targets. Thus start improving
> the situation by moving the pseries related code to hw/ppc/spapr_rtas.c
> instead and allow target code to register a callback handler for such
> target specific commands.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>

That #ifdef CONFIG_PSERIES was really ugly.

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.

> ---
>   include/sysemu/qtest.h |  4 ++++
>   hw/ppc/spapr_rtas.c    | 29 +++++++++++++++++++++++++++++
>   softmmu/qtest.c        | 39 +++++++++++++--------------------------
>   3 files changed, 46 insertions(+), 26 deletions(-)
> 
> diff --git a/include/sysemu/qtest.h b/include/sysemu/qtest.h
> index 4c53537ef3..85f05b0e46 100644
> --- a/include/sysemu/qtest.h
> +++ b/include/sysemu/qtest.h
> @@ -14,6 +14,7 @@
>   #ifndef QTEST_H
>   #define QTEST_H
>   
> +#include "chardev/char.h"
>   
>   extern bool qtest_allowed;
>   
> @@ -22,6 +23,9 @@ static inline bool qtest_enabled(void)
>       return qtest_allowed;
>   }
>   
> +void qtest_send_prefix(CharBackend *chr);
> +void G_GNUC_PRINTF(2, 3) qtest_sendf(CharBackend *chr, const char *fmt, ...);
> +void qtest_set_command_cb(bool (*pc_cb)(CharBackend *chr, gchar **words));
>   bool qtest_driver(void);
>   
>   void qtest_server_init(const char *qtest_chrdev, const char *qtest_log, Error **errp);
> diff --git a/hw/ppc/spapr_rtas.c b/hw/ppc/spapr_rtas.c
> index 3f664ea02c..7df21581c2 100644
> --- a/hw/ppc/spapr_rtas.c
> +++ b/hw/ppc/spapr_rtas.c
> @@ -33,6 +33,7 @@
>   #include "sysemu/cpus.h"
>   #include "sysemu/hw_accel.h"
>   #include "sysemu/runstate.h"
> +#include "sysemu/qtest.h"
>   #include "kvm_ppc.h"
>   
>   #include "hw/ppc/spapr.h"
> @@ -548,6 +549,32 @@ uint64_t qtest_rtas_call(char *cmd, uint32_t nargs, uint64_t args,
>       return H_PARAMETER;
>   }
>   
> +static bool spapr_qtest_callback(CharBackend *chr, gchar **words)
> +{
> +    if (strcmp(words[0], "rtas") == 0) {
> +        uint64_t res, args, ret;
> +        unsigned long nargs, nret;
> +        int rc;
> +
> +        rc = qemu_strtoul(words[2], NULL, 0, &nargs);
> +        g_assert(rc == 0);
> +        rc = qemu_strtou64(words[3], NULL, 0, &args);
> +        g_assert(rc == 0);
> +        rc = qemu_strtoul(words[4], NULL, 0, &nret);
> +        g_assert(rc == 0);
> +        rc = qemu_strtou64(words[5], NULL, 0, &ret);
> +        g_assert(rc == 0);
> +        res = qtest_rtas_call(words[1], nargs, args, nret, ret);
> +
> +        qtest_send_prefix(chr);
> +        qtest_sendf(chr, "OK %"PRIu64"\n", res);
> +
> +        return true;
> +    }
> +
> +    return false;
> +}
> +
>   void spapr_rtas_register(int token, const char *name, spapr_rtas_fn fn)
>   {
>       assert((token >= RTAS_TOKEN_BASE) && (token < RTAS_TOKEN_MAX));
> @@ -630,6 +657,8 @@ static void core_rtas_register_types(void)
>                           rtas_ibm_nmi_register);
>       spapr_rtas_register(RTAS_IBM_NMI_INTERLOCK, "ibm,nmi-interlock",
>                           rtas_ibm_nmi_interlock);
> +
> +    qtest_set_command_cb(spapr_qtest_callback);
>   }
>   
>   type_init(core_rtas_register_types)
> diff --git a/softmmu/qtest.c b/softmmu/qtest.c
> index 34bd2a33a7..76cbb8bcee 100644
> --- a/softmmu/qtest.c
> +++ b/softmmu/qtest.c
> @@ -29,10 +29,6 @@
>   #include "qemu/module.h"
>   #include "qemu/cutils.h"
>   #include "qom/object_interfaces.h"
> -#include CONFIG_DEVICES
> -#ifdef CONFIG_PSERIES
> -#include "hw/ppc/spapr_rtas.h"
> -#endif
>   
>   #define MAX_IRQ 256
>   
> @@ -263,7 +259,7 @@ static int hex2nib(char ch)
>       }
>   }
>   
> -static void qtest_send_prefix(CharBackend *chr)
> +void qtest_send_prefix(CharBackend *chr)
>   {
>       if (!qtest_log_fp || !qtest_opened) {
>           return;
> @@ -302,8 +298,7 @@ static void qtest_send(CharBackend *chr, const char *str)
>       qtest_server_send(qtest_server_send_opaque, str);
>   }
>   
> -static void G_GNUC_PRINTF(2, 3) qtest_sendf(CharBackend *chr,
> -                                           const char *fmt, ...)
> +void qtest_sendf(CharBackend *chr, const char *fmt, ...)
>   {
>       va_list ap;
>       gchar *buffer;
> @@ -361,6 +356,15 @@ static void qtest_clock_warp(int64_t dest)
>       qemu_clock_notify(QEMU_CLOCK_VIRTUAL);
>   }
>   
> +static bool (*process_command_cb)(CharBackend *chr, gchar **words);
> +
> +void qtest_set_command_cb(bool (*pc_cb)(CharBackend *chr, gchar **words))
> +{
> +    assert(!process_command_cb);  /* Switch to a list if we need more than one */
> +
> +    process_command_cb = pc_cb;
> +}
> +
>   static void qtest_process_command(CharBackend *chr, gchar **words)
>   {
>       const gchar *command;
> @@ -717,25 +721,6 @@ static void qtest_process_command(CharBackend *chr, gchar **words)
>           qtest_sendf(chr, "OK big\n");
>   #else
>           qtest_sendf(chr, "OK little\n");
> -#endif
> -#ifdef CONFIG_PSERIES
> -    } else if (strcmp(words[0], "rtas") == 0) {
> -        uint64_t res, args, ret;
> -        unsigned long nargs, nret;
> -        int rc;
> -
> -        rc = qemu_strtoul(words[2], NULL, 0, &nargs);
> -        g_assert(rc == 0);
> -        rc = qemu_strtou64(words[3], NULL, 0, &args);
> -        g_assert(rc == 0);
> -        rc = qemu_strtoul(words[4], NULL, 0, &nret);
> -        g_assert(rc == 0);
> -        rc = qemu_strtou64(words[5], NULL, 0, &ret);
> -        g_assert(rc == 0);
> -        res = qtest_rtas_call(words[1], nargs, args, nret, ret);
> -
> -        qtest_send_prefix(chr);
> -        qtest_sendf(chr, "OK %"PRIu64"\n", res);
>   #endif
>       } else if (qtest_enabled() && strcmp(words[0], "clock_step") == 0) {
>           int64_t ns;
> @@ -777,6 +762,8 @@ static void qtest_process_command(CharBackend *chr, gchar **words)
>           qtest_send_prefix(chr);
>           qtest_sendf(chr, "OK %"PRIi64"\n",
>                       (int64_t)qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL));
> +    } else if (process_command_cb && process_command_cb(chr, words)) {
> +        /* Command got consumed by the callback handler */
>       } else {
>           qtest_send_prefix(chr);
>           qtest_sendf(chr, "FAIL Unknown command '%s'\n", words[0]);


