Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81E1E2AD715
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 14:06:44 +0100 (CET)
Received: from localhost ([::1]:53818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcTMB-0000gf-J2
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 08:06:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kcTKL-0008SY-0Z
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 08:04:49 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:43540
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kcTKI-0001Gb-BV
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 08:04:48 -0500
Received: from host86-184-131-53.range86-184.btcentralplus.com
 ([86.184.131.53] helo=[192.168.1.110])
 by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kcTKR-0006F1-7s; Tue, 10 Nov 2020 13:05:00 +0000
To: Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org
References: <20201104172512.2381656-1-ehabkost@redhat.com>
 <20201104172512.2381656-8-ehabkost@redhat.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <b73ef05c-a5b8-706c-1421-b6c676f3be18@ilande.co.uk>
Date: Tue, 10 Nov 2020 13:04:38 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201104172512.2381656-8-ehabkost@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 86.184.131.53
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 7/7] sparc: Use FIELD_PTR at nwindows getter/setter
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.uk0.bigv.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.uk0.bigv.io
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Igor Mammedov <imammedo@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 04/11/2020 17:25, Eduardo Habkost wrote:

> This makes the nwindows getter and setter more consistent with
> the other field getters and setters (which work with any struct
> field).
> 
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> ---
> Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Cc: Artyom Tarasenko <atar4qemu@gmail.com>
> Cc: qemu-devel@nongnu.org
> ---
>   target/sparc/cpu.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/target/sparc/cpu.c b/target/sparc/cpu.c
> index 3acc99c29c..8bf02a4fe0 100644
> --- a/target/sparc/cpu.c
> +++ b/target/sparc/cpu.c
> @@ -789,8 +789,8 @@ static void sparc_cpu_initfn(Object *obj)
>   static void sparc_get_nwindows(Object *obj, Visitor *v, const char *name,
>                                  Property *prop, Error **errp)
>   {
> -    SPARCCPU *cpu = SPARC_CPU(obj);
> -    int64_t value = cpu->env.def.nwindows;
> +    uint32_t *ptr = FIELD_PTR(obj, prop, uint32_t);
> +    int64_t value = *ptr;
>   
>       visit_type_int(v, name, &value, errp);
>   }
> @@ -798,9 +798,9 @@ static void sparc_get_nwindows(Object *obj, Visitor *v, const char *name,
>   static void sparc_set_nwindows(Object *obj, Visitor *v, const char *name,
>                                  Property *prop, Error **errp)
>   {
> +    uint32_t *ptr = FIELD_PTR(obj, prop, uint32_t);
>       const int64_t min = MIN_NWINDOWS;
>       const int64_t max = MAX_NWINDOWS;
> -    SPARCCPU *cpu = SPARC_CPU(obj);
>       int64_t value;
>   
>       if (!visit_type_int(v, name, &value, errp)) {
> @@ -814,7 +814,7 @@ static void sparc_set_nwindows(Object *obj, Visitor *v, const char *name,
>                      value, min, max);
>           return;
>       }
> -    cpu->env.def.nwindows = value;
> +    *ptr = value;
>   }
>   
>   static PropertyInfo qdev_prop_nwindows = {

This looks correct to me:

Acked-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>


ATB,

Mark.

