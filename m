Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBB7D563ED3
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Jul 2022 08:27:24 +0200 (CEST)
Received: from localhost ([::1]:53284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7WbC-0003xD-PR
	for lists+qemu-devel@lfdr.de; Sat, 02 Jul 2022 02:27:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o7WY7-0001UM-94
 for qemu-devel@nongnu.org; Sat, 02 Jul 2022 02:24:11 -0400
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:44547)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o7WY5-0004mA-Fz
 for qemu-devel@nongnu.org; Sat, 02 Jul 2022 02:24:10 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.83])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id BD9F011391D71;
 Sat,  2 Jul 2022 08:24:07 +0200 (CEST)
Received: from kaod.org (37.59.142.108) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Sat, 2 Jul 2022
 08:24:07 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-108S0026776772c-9528-4057-8194-c05d7aea2f8f,
 FB2626423410402F5F47B43F186DFD06AD25B17E) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <3c17a387-080e-ef86-db03-40ba7f2f455d@kaod.org>
Date: Sat, 2 Jul 2022 08:24:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 3/9] target/ppc: Add error reporting when opening file
 fails
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, <qemu-devel@nongnu.org>
CC: <qemu-ppc@nongnu.org>, jianchunfu <jianchunfu@cmss.chinamobile.com>
References: <20220630194249.886747-1-danielhb413@gmail.com>
 <20220630194249.886747-4-danielhb413@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220630194249.886747-4-danielhb413@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.108]
X-ClientProxiedBy: DAG8EX2.mxp5.local (172.16.2.72) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 77f396ba-d73b-430e-b21d-70d74d28591c
X-Ovh-Tracer-Id: 16467130563932097504
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrudehgedguddtkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepkeetjedtleekjedvveffudfhteetleeifeegfeffuefghfefkeehffeufeeludejnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepjhhirghntghhuhhnfhhusegtmhhsshdrtghhihhnrghmohgsihhlvgdrtghomhdpoffvtefjohhsthepmhhohedvle
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 6/30/22 21:42, Daniel Henrique Barboza wrote:
> From: jianchunfu <jianchunfu@cmss.chinamobile.com>
> 
> Add error reporting before return when opening file fails in
> kvmppc_read_int_dt().
> 
> Signed-off-by: jianchunfu <jianchunfu@cmss.chinamobile.com>
> [danielhb: use error_setg() instead of fprintf]
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>


Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.

> ---
>   target/ppc/kvm.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
> index bc17437097..7611e9ccf6 100644
> --- a/target/ppc/kvm.c
> +++ b/target/ppc/kvm.c
> @@ -1896,7 +1896,7 @@ static int kvmppc_find_cpu_dt(char *buf, int buf_len)
>       return 0;
>   }
>   
> -static uint64_t kvmppc_read_int_dt(const char *filename)
> +static uint64_t kvmppc_read_int_dt(const char *filename, Error **errp)
>   {
>       union {
>           uint32_t v32;
> @@ -1907,6 +1907,7 @@ static uint64_t kvmppc_read_int_dt(const char *filename)
>   
>       f = fopen(filename, "rb");
>       if (!f) {
> +        error_setg(errp, "Error opening %s: %s", filename, strerror(errno));
>           return 0;
>       }
>   
> @@ -1940,7 +1941,7 @@ static uint64_t kvmppc_read_int_cpu_dt(const char *propname, Error **errp)
>       }
>   
>       tmp = g_strdup_printf("%s/%s", buf, propname);
> -    val = kvmppc_read_int_dt(tmp);
> +    val = kvmppc_read_int_dt(tmp, errp);
>       g_free(tmp);
>   
>       return val;


