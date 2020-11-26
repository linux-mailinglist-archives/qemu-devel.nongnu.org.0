Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A476A2C50ED
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Nov 2020 10:15:22 +0100 (CET)
Received: from localhost ([::1]:53316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiDN3-0000fW-6a
	for lists+qemu-devel@lfdr.de; Thu, 26 Nov 2020 04:15:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kiDMJ-0000Dv-6A
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 04:14:35 -0500
Received: from mx2.suse.de ([195.135.220.15]:50992)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kiDMH-0007Yg-Jj
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 04:14:34 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1E2F1AC75;
 Thu, 26 Nov 2020 09:14:32 +0000 (UTC)
Subject: Re: [PATCH v2 2/6] accel: accel_available() function
To: Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org
References: <20201125205636.3305257-1-ehabkost@redhat.com>
 <20201125205636.3305257-3-ehabkost@redhat.com>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <12f82771-9db9-8fcd-ea25-736428d2650a@suse.de>
Date: Thu, 26 Nov 2020 10:14:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201125205636.3305257-3-ehabkost@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Roman Bolshakov <r.bolshakov@yadro.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Eduardo,

On 11/25/20 9:56 PM, Eduardo Habkost wrote:
> This function will be used to replace the xen_available() and
> kvm_available() functions from arch_init.c.
> 
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> ---
> Cc: Richard Henderson <richard.henderson@linaro.org>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Claudio Fontana <cfontana@suse.de>
> Cc: Roman Bolshakov <r.bolshakov@yadro.com>
> ---
>  include/sysemu/accel.h | 1 +
>  accel/accel.c          | 5 +++++
>  2 files changed, 6 insertions(+)
> 
> diff --git a/include/sysemu/accel.h b/include/sysemu/accel.h
> index e08b8ab8fa..a4a00c75c8 100644
> --- a/include/sysemu/accel.h
> +++ b/include/sysemu/accel.h
> @@ -67,6 +67,7 @@ typedef struct AccelClass {
>      OBJECT_GET_CLASS(AccelClass, (obj), TYPE_ACCEL)
>  
>  AccelClass *accel_find(const char *opt_name);
> +bool accel_available(const char *name);
>  int accel_init_machine(AccelState *accel, MachineState *ms);
>  
>  /* Called just before os_setup_post (ie just before drop OS privs) */
> diff --git a/accel/accel.c b/accel/accel.c
> index cb555e3b06..4a64a2b38a 100644
> --- a/accel/accel.c
> +++ b/accel/accel.c
> @@ -46,6 +46,11 @@ AccelClass *accel_find(const char *opt_name)
>      return ac;
>  }
>  
> +bool accel_available(const char *name)
> +{
> +    return accel_find(name) != NULL;


accel_find() in its implementation allocates and then frees memory to generate the string,
the user of accel_available() might be unaware and overuse leading to fragmentation/performance issues?


> +}
> +
>  int accel_init_machine(AccelState *accel, MachineState *ms)
>  {
>      AccelClass *acc = ACCEL_GET_CLASS(accel);
> 


