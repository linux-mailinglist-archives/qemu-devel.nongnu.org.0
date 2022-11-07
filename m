Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF8EF61ED00
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Nov 2022 09:36:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1orxb5-0005aD-Ma; Mon, 07 Nov 2022 03:35:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1orxb3-0005ZX-0H
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 03:35:09 -0500
Received: from smtp-out2.suse.de ([195.135.220.29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1orxb1-0002Sb-2b
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 03:35:08 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 1CF2A1F890;
 Mon,  7 Nov 2022 08:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1667810104; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LTOwMeqeQUFcSkfZsJRu13eS366rhRnjR/Hf5O3Wib0=;
 b=eoN9FoqFcUqV2njRr1twzk+NAjUQq9t3dFWUN9wIeF/QFU8PBZslM9539hPaloHcgV2LL/
 00vK/x1yJcly2KXdL+ZiMsWab25R3AXDUEZuR+Usk1XllJR3pbArufKhzJvBwWGO3pN9MF
 OW5+JhoyDXd4n901SVVNVQSYCWX7G8E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1667810104;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LTOwMeqeQUFcSkfZsJRu13eS366rhRnjR/Hf5O3Wib0=;
 b=4r1h1SjBSHFB3YZ5HIsf44d+pE87kj/Pa2Oz06/z2u4SKL/XaHQSI+l2d4UXEcalCFf4TC
 ZX115ws+L1aC3gDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DEAB913494;
 Mon,  7 Nov 2022 08:35:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ns+7NDfDaGNPLgAAMHmgww
 (envelope-from <cfontana@suse.de>); Mon, 07 Nov 2022 08:35:03 +0000
Message-ID: <188a93f2-30e6-c69b-7a49-a4014e74b2df@suse.de>
Date: Mon, 7 Nov 2022 09:35:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PULL 12/12] accel: abort if we fail to load the accelerator
 plugin
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Markus Armbruster <armbru@redhat.com>
References: <20221106085115.257018-1-pbonzini@redhat.com>
 <20221106085115.257018-13-pbonzini@redhat.com>
From: Claudio Fontana <cfontana@suse.de>
In-Reply-To: <20221106085115.257018-13-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.29; envelope-from=cfontana@suse.de;
 helo=smtp-out2.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Hi all,

and thanks Paolo for taking care of this series, I think I noticed something that seems off:

On 11/6/22 09:51, Paolo Bonzini wrote:
> From: Claudio Fontana <cfontana@suse.de>
> 
> if QEMU is configured with modules enabled, it is possible that the
> load of an accelerator module will fail.
> Exit in this case, relying on module_object_class_by_name to report
> the specific load error if any.
> 
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> 
> [claudio: changed abort() to exit(1)]
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Reviewed-by: Markus Armbruster <armbru@redhat.com>
> Message-Id: <20220929093035.4231-6-cfontana@suse.de>
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  accel/accel-softmmu.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/accel/accel-softmmu.c b/accel/accel-softmmu.c
> index 67276e4f5222..f9cdafb148ac 100644
> --- a/accel/accel-softmmu.c
> +++ b/accel/accel-softmmu.c
> @@ -66,6 +66,7 @@ void accel_init_ops_interfaces(AccelClass *ac)
>  {
>      const char *ac_name;
>      char *ops_name;
> +    ObjectClass *oc;
>      AccelOpsClass *ops;
>  
>      ac_name = object_class_get_name(OBJECT_CLASS(ac));
> @@ -73,8 +74,13 @@ void accel_init_ops_interfaces(AccelClass *ac)
>  
>      ops_name = g_strdup_printf("%s" ACCEL_OPS_SUFFIX, ac_name);
>      ops = ACCEL_OPS_CLASS(module_object_class_by_name(ops_name));

I think this last line should be removed. I somehow left it there by mistake.
Not sure if it hurts, but we assign to "ops" here,

only to reassign to the same variable...

I 

> +    oc = module_object_class_by_name(ops_name);
> +    if (!oc) {
> +        error_report("fatal: could not load module for type '%s'", ops_name);
> +        exit(1);
> +    }
>      g_free(ops_name);
> -
> +    ops = ACCEL_OPS_CLASS(oc);

here. Do I see it right?

>      /*
>       * all accelerators need to define ops, providing at least a mandatory
>       * non-NULL create_vcpu_thread operation.

So I suggest:

-     ops = ACCEL_OPS_CLASS(module_object_class_by_name(ops_name));                                                                          

Thanks and sorry for the oversight,

Claudio

