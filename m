Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 417FE49247E
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 12:18:06 +0100 (CET)
Received: from localhost ([::1]:42374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9mV2-0000nY-SE
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 06:18:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1n9mR8-00089W-OO; Tue, 18 Jan 2022 06:14:02 -0500
Received: from [201.28.113.2] (port=58302 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1n9mR7-0006UQ-1q; Tue, 18 Jan 2022 06:14:02 -0500
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Tue, 18 Jan 2022 08:13:56 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id F05208000A7;
 Tue, 18 Jan 2022 08:13:55 -0300 (-03)
Subject: Re: [PATCH v2 1/2] target/ppc: Remove last user of .load_state_old
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
References: <20220118104150.1899661-1-clg@kaod.org>
 <20220118104150.1899661-2-clg@kaod.org>
From: "Matheus K. Ferst" <matheus.ferst@eldorado.org.br>
Message-ID: <c9e94bfc-a648-7f3d-fefb-73ecdeb3c54e@eldorado.org.br>
Date: Tue, 18 Jan 2022 08:13:55 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220118104150.1899661-2-clg@kaod.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 18 Jan 2022 11:13:56.0299 (UTC)
 FILETIME=[7BEB91B0:01D80C5C]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Greg Kurz <groug@kaod.org>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18/01/2022 07:41, Cédric Le Goater wrote:
> This breaks migration compatibility from (very) old versions of
> QEMU. This should not be a problem for the pseries machine for which
> migration is only supported on recent QEMUs ( > 2.x). There is no
> clear status on what is supported or not for the other machines. Let's
> move forward and remove the .load_state_old handler.
> 
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>   target/ppc/machine.c | 112 -------------------------------------------
>   1 file changed, 112 deletions(-)
> 
> diff --git a/target/ppc/machine.c b/target/ppc/machine.c
> index 756d8de5d8dd..df547385ff1e 100644
> --- a/target/ppc/machine.c
> +++ b/target/ppc/machine.c
> @@ -23,117 +23,6 @@ static void post_load_update_msr(CPUPPCState *env)
>       pmu_update_summaries(env);
>   }
> 
> -static int cpu_load_old(QEMUFile *f, void *opaque, int version_id)
> -{
> -    PowerPCCPU *cpu = opaque;

<snip>

> -
>   static int get_avr(QEMUFile *f, void *pv, size_t size,
>                      const VMStateField *field)
>   {
> @@ -808,7 +697,6 @@ const VMStateDescription vmstate_ppc_cpu = {
>       .version_id = 5,
>       .minimum_version_id = 5,
>       .minimum_version_id_old = 4,
> -    .load_state_old = cpu_load_old,

According to docs/devel/migration.rst, .minimum_version_id_old is 
ignored if no load_state_old handler is provided, I think we can drop it 
too.

>       .pre_save = cpu_pre_save,
>       .post_load = cpu_post_load,
>       .fields = (VMStateField[]) {
> --
> 2.31.1
Thanks,
Matheus K. Ferst
Instituto de Pesquisas ELDORADO <http://www.eldorado.org.br/>
Analista de Software
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

