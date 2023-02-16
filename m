Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA531699BF9
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 19:13:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSijs-00083S-N0; Thu, 16 Feb 2023 13:12:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1pSijr-000807-9a; Thu, 16 Feb 2023 13:12:11 -0500
Received: from smtpout2.mo529.mail-out.ovh.net ([79.137.123.220])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1pSijo-00029r-4n; Thu, 16 Feb 2023 13:12:10 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.48])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 5E80F206BF;
 Thu, 16 Feb 2023 18:12:04 +0000 (UTC)
Received: from kaod.org (37.59.142.106) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Thu, 16 Feb
 2023 19:12:03 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-106R006c3d769c1-1982-4562-ab08-f9211698d00d,
 6472B0FD1AC4FAE7C483658EB00F62ED22160684) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <e4e0217e-9bd3-1bb7-c91c-0686cf67fc02@kaod.org>
Date: Thu, 16 Feb 2023 19:12:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [RFC PATCH 5/5] hw/ppc/pnv_bmc: Simplify pnv_bmc_find()
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 <qemu-devel@nongnu.org>
CC: Markus Armbruster <armbru@redhat.com>, <qemu-arm@nongnu.org>,
 <qemu-s390x@nongnu.org>, <qemu-ppc@nongnu.org>, <qemu-block@nongnu.org>
References: <20230216122524.67212-1-philmd@linaro.org>
 <20230216122524.67212-6-philmd@linaro.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20230216122524.67212-6-philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.106]
X-ClientProxiedBy: DAG9EX1.mxp5.local (172.16.2.81) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: af17be2c-659b-4256-a52d-3d65338c1a49
X-Ovh-Tracer-Id: 8211188022095940457
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrudeijedguddtjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepffdufeeliedujeeffffhjeffiefghffhhfdvkeeijeehledvueffhfejtdehgeegnecukfhppeduvdejrddtrddtrddupdefjedrheelrddugedvrddutdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeotghlgheskhgrohgurdhorhhgqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehphhhilhhmugeslhhinhgrrhhordhorhhgpdhqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgpdgrrhhmsghruhesrhgvughhrghtrdgtohhmpdhqvghmuhdqrghrmhesnhhonhhgnhhurdhorhhgpdhqvghmuhdqshefledtgiesnhhonhhgnhhurdhorhhgpdhqvghmuhdqphhptgesnhhonhhgnhhurdhorhhgpdhqvghmuhdqsghlohgtkhesnhhonhhgnhhurdhorhhgpdfovfetjfhoshhtpehmohehvdelpdhmohguvgepshhmthhpohhuth
Received-SPF: pass client-ip=79.137.123.220; envelope-from=clg@kaod.org;
 helo=smtpout2.mo529.mail-out.ovh.net
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.351,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 2/16/23 13:25, Philippe Mathieu-Daudé wrote:
> ForeachArgs::name is only used once as TYPE_IPMI_BMC.
> Since the penultimate commit, object_child_foreach_recursive()'s
> handler takes an Error* argument and return a boolean.
> We can directly pass ForeachArgs::obj as context, removing the
> ForeachArgs structure.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>
> ---
> RFC: please double-check...
>
> 
>   hw/ppc/pnv_bmc.c | 25 +++++++++----------------
>   1 file changed, 9 insertions(+), 16 deletions(-)
> 
> diff --git a/hw/ppc/pnv_bmc.c b/hw/ppc/pnv_bmc.c
> index 05acc88a55..566284469f 100644
> --- a/hw/ppc/pnv_bmc.c
> +++ b/hw/ppc/pnv_bmc.c
> @@ -278,36 +278,29 @@ IPMIBmc *pnv_bmc_create(PnvPnor *pnor)
>       return IPMI_BMC(obj);
>   }
>   
> -typedef struct ForeachArgs {
> -    const char *name;
> -    Object *obj;
> -} ForeachArgs;
> -
>   static bool bmc_find(Object *child, void *opaque, Error **errp)
>   {
> -    ForeachArgs *args = opaque;
> +    Object **obj = opaque;
>   
> -    if (object_dynamic_cast(child, args->name)) {
> -        if (args->obj) {
> -            return false;

The purpose of this test was to catch multiple bmc devices and it's removed
now.
  
> +    if (object_dynamic_cast(child, TYPE_IPMI_BMC)) {
> +        if (*obj) {
> +            return true;
>           }
> -        args->obj = child;
> +        *obj = child;
>       }
>       return true;
>   }
>   
>   IPMIBmc *pnv_bmc_find(Error **errp)
>   {
> -    ForeachArgs args = { TYPE_IPMI_BMC, NULL };
> -    int ret;
> +    Object *obj = NULL;
>   
> -    ret = object_child_foreach_recursive(object_get_root(), bmc_find,
> -                                         &args, NULL);
> -    if (ret) {
> +    if (!object_child_foreach_recursive(object_get_root(), bmc_find, &obj,
> +                                        NULL)) {
>           error_setg(errp, "machine should have only one BMC device. "
>                      "Use '-nodefaults'");>           return NULL;
>       }

We don't test obj against NULL any more. This could break the QOM cast below.

Thanks,


C.


>   
> -    return args.obj ? IPMI_BMC(args.obj) : NULL;
> +    return IPMI_BMC(obj);
>   }


