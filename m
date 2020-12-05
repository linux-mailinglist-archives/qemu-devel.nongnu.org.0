Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78E052CFC2D
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Dec 2020 17:54:12 +0100 (CET)
Received: from localhost ([::1]:35324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1klap1-0004OU-IH
	for lists+qemu-devel@lfdr.de; Sat, 05 Dec 2020 11:54:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1klaWW-0003vo-CA
 for qemu-devel@nongnu.org; Sat, 05 Dec 2020 11:35:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40307)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1klaWU-0006Nu-Ec
 for qemu-devel@nongnu.org; Sat, 05 Dec 2020 11:35:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607186101;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M1LlksFaxDU67ZTZQtScqehv1cBJjZBsGA2HvfjU/do=;
 b=JZgihhkA7htlMt2rZDjjpIag+GmuccSPX2XW7AfVDMt1BMTyB+ko8VKL7WvCLE7KBCO9P5
 eZBDe+IKPBRD6wibWhaT6fpgXFuJFyQCBSdGHy8hKG/VDEy8u5XemqaIx9MQS8Ptd4zQM/
 KHkLOFcQrKRLM4iPNTk8EADWU31NONM=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-347-aQDCz-NqNC6CqiLKQtbZsA-1; Sat, 05 Dec 2020 11:34:57 -0500
X-MC-Unique: aQDCz-NqNC6CqiLKQtbZsA-1
Received: by mail-ed1-f71.google.com with SMTP id f19so3694017edq.20
 for <qemu-devel@nongnu.org>; Sat, 05 Dec 2020 08:34:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=M1LlksFaxDU67ZTZQtScqehv1cBJjZBsGA2HvfjU/do=;
 b=exuh6dQGylZH2micHJmxgedQ5v4nCK4zriVSDox4Ifsk9AARqnH6M/K7vYWTJ5AGz7
 y+pTfh4BXZlL73aW42+3VYZvmmkUvoFWGuNoYfHDsvPpcF3VrhZLT3L9X6VkdPnnttbs
 E0DzvkxPXX4dI05Az2xfx31rN8BTcywJWbBrtrspmtGOanMbsnkS7iHlFevxU+uwv3DR
 usvd6bsokBZOnyPSv1xmh38/hbPgqKjKPSAi56GzER2/3351qk8MeqI1Xwjq3st76406
 L53d5LoDtNkJgeahCKLoxEYHQbRUqmAAEG8jyvhtJ+jw8UyxsuL9SHE2cM4ilPFQrYd1
 lMvg==
X-Gm-Message-State: AOAM532Dp9OkvDk3e4NPDOH/wu7KFQUhe9ud5vmbtMIK36M4LYE9F/UD
 R0VbocxlEsCZLiW3WGXua2lULPbM2X96xbbi98jmvAm1SwuhrjwK1XBMex61mj6XjdEm45ti0o1
 gkPd72uH4CpdxXP4=
X-Received: by 2002:a50:b905:: with SMTP id m5mr8079219ede.292.1607186096526; 
 Sat, 05 Dec 2020 08:34:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwLV/a7UCefuxOuxEHArFAcoLEJtwon0fDJRWEnkGyH2BnpBCq0t9oaRv/70gvKcfzAIc25wg==
X-Received: by 2002:a50:b905:: with SMTP id m5mr8079201ede.292.1607186096378; 
 Sat, 05 Dec 2020 08:34:56 -0800 (PST)
Received: from [192.168.1.36] (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id s9sm5866039edt.51.2020.12.05.08.34.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Dec 2020 08:34:55 -0800 (PST)
Subject: Re: [RFC v8 18/27] cpu: Move cpu_exec_* to tcg_ops
To: Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Wenchao Wang <wenchao.wang@intel.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>
References: <20201205161518.14365-1-cfontana@suse.de>
 <20201205161518.14365-19-cfontana@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <4835d24a-7c31-dfd4-7912-8fc36b692acc@redhat.com>
Date: Sat, 5 Dec 2020 17:34:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201205161518.14365-19-cfontana@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Paul Durrant <paul@xen.org>, Jason Wang <jasowang@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, Dario Faggioli <dfaggioli@suse.com>,
 Cameron Esfahani <dirty@apple.com>, haxm-team@intel.com,
 Colin Xu <colin.xu@intel.com>, Anthony Perard <anthony.perard@citrix.com>,
 Bruce Rogers <brogers@suse.com>, Olaf Hering <ohering@suse.de>,
 "Emilio G . Cota" <cota@braap.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/5/20 5:15 PM, Claudio Fontana wrote:
> From: Eduardo Habkost <ehabkost@redhat.com>
> 
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> [claudio: wrapped in CONFIG_TCG]
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  accel/tcg/cpu-exec.c            | 12 ++++++------
>  include/hw/core/cpu.h           |  6 ------
>  include/hw/core/tcg-cpu-ops.h   |  9 +++++++++
>  target/alpha/cpu.c              |  3 ++-
>  target/arm/cpu.c                |  2 +-
>  target/arm/cpu64.c              |  5 ++++-
>  target/arm/cpu_tcg.c            |  5 ++++-
>  target/avr/cpu.c                |  2 +-
>  target/cris/cpu.c               |  2 +-
>  target/hppa/cpu.c               |  2 +-
>  target/i386/tcg-cpu.c           |  6 +++---
>  target/lm32/cpu.c               |  2 +-
>  target/m68k/cpu.c               |  2 +-
>  target/microblaze/cpu.c         |  2 +-
>  target/mips/cpu.c               |  2 +-
>  target/nios2/cpu.c              |  2 +-
>  target/openrisc/cpu.c           |  2 +-
>  target/ppc/translate_init.c.inc | 10 +++++-----
>  target/riscv/cpu.c              |  2 +-
>  target/rx/cpu.c                 |  2 +-
>  target/s390x/cpu.c              |  2 +-
>  target/sh4/cpu.c                |  2 +-
>  target/sparc/cpu.c              |  2 +-
>  target/tilegx/cpu.c             |  2 +-
>  target/unicore32/cpu.c          |  2 +-
>  target/xtensa/cpu.c             |  2 +-
>  26 files changed, 51 insertions(+), 41 deletions(-)
...

> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index 2f9e27c248..470b7b48c3 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -2239,7 +2239,6 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
>  
>      cc->class_by_name = arm_cpu_class_by_name;
>      cc->has_work = arm_cpu_has_work;
> -    cc->cpu_exec_interrupt = arm_cpu_exec_interrupt;
>      cc->dump_state = arm_cpu_dump_state;
>      cc->set_pc = arm_cpu_set_pc;
>      cc->gdb_read_register = arm_cpu_gdb_read_register;
> @@ -2261,6 +2260,7 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
>      cc->disas_set_info = arm_disas_set_info;
>  #ifdef CONFIG_TCG
>      cc->tcg_ops.initialize = arm_translate_init;
> +    cc->tcg_ops.cpu_exec_interrupt = arm_cpu_exec_interrupt;
>      cc->tcg_ops.synchronize_from_tb = arm_cpu_synchronize_from_tb;
>      cc->tlb_fill = arm_cpu_tlb_fill;
>      cc->debug_excp_handler = arm_debug_excp_handler;
> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> index 649213082f..ebc53c8bdc 100644
> --- a/target/arm/cpu64.c
> +++ b/target/arm/cpu64.c
> @@ -784,7 +784,10 @@ static void aarch64_cpu_class_init(ObjectClass *oc, void *data)
>  {
>      CPUClass *cc = CPU_CLASS(oc);
>  
> -    cc->cpu_exec_interrupt = arm_cpu_exec_interrupt;
> +#ifdef CONFIG_TCG
> +    cc->tcg_ops.cpu_exec_interrupt = arm_cpu_exec_interrupt;
> +#endif /* CONFIG_TCG */

Thanks.


