Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64C395782AC
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 14:46:34 +0200 (CEST)
Received: from localhost ([::1]:42376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDQ8v-0008Lg-2E
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 08:46:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1oDQ4q-0005p0-LE
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 08:42:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48453)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1oDQ4n-0006bv-4N
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 08:42:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658148134;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cg/FpnpLiNLnJnAtuyyHEBt2paN6NQFOjuo7l/yMxsg=;
 b=JV/2/wGGzCL+X2tboFXIyat1oUdy/4aODeHq/vIbQWVx38US+vp1c1LTb/QeQ85FC0/xFz
 v3U3gOTPPVVRRSKhWlM2odEZaQNhz00xwHbZoLgJ6hMRjE99DacM7SXeItoLuHvJ4u7pmg
 xV2XQJUUWCOd+J1TRyGnoxV+u5Wzycg=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-576-0ETvVWc8PDemKOQTqKa6Lw-1; Mon, 18 Jul 2022 08:42:13 -0400
X-MC-Unique: 0ETvVWc8PDemKOQTqKa6Lw-1
Received: by mail-ed1-f70.google.com with SMTP id
 z5-20020a05640235c500b0043ae18edeeeso7844845edc.5
 for <qemu-devel@nongnu.org>; Mon, 18 Jul 2022 05:42:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cg/FpnpLiNLnJnAtuyyHEBt2paN6NQFOjuo7l/yMxsg=;
 b=ORM787fF8ly5mmg1yJzWLUsd0+zks+KGK4kQBjaxdtIxB3BH/O9ruSQ4KP4zM8lYOT
 cG6+jQ/qM7lK0PXoUGX0MiHv9pnWamWJsZ85CW13SOqjFg0VtKqBTxlr3ZKxNmQwooSk
 X8iMbQDlZxP4gVn2zhLwLiHh7Rd+PKjWzhES1SFsuluej7TA/SJareZvLIot99ivO2Er
 gAa27oVaCZqFVRxR7FzYk7hO8NdU6XeKhbtz+IqN7POf8/f5Fp7F51DbBAp3WG2m0Ht0
 D8RThzzxc+5MwpmiKCdnsG+8aZ8rWnrUWhnn3r33TKtws12exCQPhV1J1GmhwIQjRZ6x
 S09w==
X-Gm-Message-State: AJIora/g5euXUmHHDk23oT/p4UGEr3TCTT08WbJU+/6Ol32YogAVOHML
 j6zLHVHM+v58HBRkVf0SG7HOLMGdTcLgtArqfqsEmuKfKl27pidq9hVisLyP3DZXtdSje4erVYV
 asKPtJ1g2c8CM8MY=
X-Received: by 2002:a17:907:7355:b0:72b:977f:65 with SMTP id
 dq21-20020a170907735500b0072b977f0065mr25158292ejc.768.1658148131902; 
 Mon, 18 Jul 2022 05:42:11 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tZtRmZ44BCAKG2sdZpCZKpyyvpXqEmvNO5eLq4FfhMeMVY5/Od4nuJboflQ0yuveL91Ua+kA==
X-Received: by 2002:a17:907:7355:b0:72b:977f:65 with SMTP id
 dq21-20020a170907735500b0072b977f0065mr25158273ejc.768.1658148131676; 
 Mon, 18 Jul 2022 05:42:11 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 b19-20020a17090636d300b00722e7e48dfdsm5373808ejc.218.2022.07.18.05.42.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Jul 2022 05:42:11 -0700 (PDT)
Date: Mon, 18 Jul 2022 14:42:10 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Nikunj A Dadhania <nikunj@amd.com>
Cc: <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>, Vitaly
 Kuznetsov <vkuznets@redhat.com>, Sean Christopherson
 <sean.j.christopherson@intel.com>, <f4bug@amsat.org>,
 <Abraham.Shaju@amd.com>, <bharata@amd.com>, Joao Martins
 <joao.m.martins@oracle.com>
Subject: Re: [PATCH] x86: cpu: Error out if memory exceeds addressable range
Message-ID: <20220718144210.4ef95c53@redhat.com>
In-Reply-To: <20220718081734.135598-1-nikunj@amd.com>
References: <20220718081734.135598-1-nikunj@amd.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Mon, 18 Jul 2022 13:47:34 +0530
Nikunj A Dadhania <nikunj@amd.com> wrote:

> Currently it is possible to start a guest with memory that is beyond
> the addressable range of CPU and QEMU does not even warn about it.
> The default phys_bits is 40 and can address 1TB. However it allows to
> start a guest with greater than 1TB memory.
> 
> Prevent this by erroring out in such a scenario.
> 
> Reported-by: Shaju Abraham <Abraham.Shaju@amd.com>
> Signed-off-by: Nikunj A Dadhania <nikunj@amd.com>


Following shall care of your issue:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg900136.html

> ---
>  target/i386/cpu.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> index 6a57ef13af..1afbdbac7d 100644
> --- a/target/i386/cpu.c
> +++ b/target/i386/cpu.c
> @@ -6376,6 +6376,7 @@ static void x86_cpu_hyperv_realize(X86CPU *cpu)
>  
>  static void x86_cpu_realizefn(DeviceState *dev, Error **errp)
>  {
> +    MachineState *machine = MACHINE(qdev_get_machine());
>      CPUState *cs = CPU(dev);
>      X86CPU *cpu = X86_CPU(dev);
>      X86CPUClass *xcc = X86_CPU_GET_CLASS(dev);
> @@ -6541,6 +6542,15 @@ static void x86_cpu_realizefn(DeviceState *dev, Error **errp)
>          }
>      }
>  
> +    if (BIT_ULL(cpu->phys_bits) < machine->maxram_size) {
> +        error_setg(&local_err, "cannot setup guest memory: "
> +                   "%s memory(%lu MiB) exceeds addressable limit(%llu MiB)",
> +                   machine->maxram_size == machine->ram_size ? "" : "max",
> +                   machine->maxram_size / MiB,
> +                   BIT_ULL(cpu->phys_bits) / MiB);
> +        goto out;
> +    }
> +
>      /* Cache information initialization */
>      if (!cpu->legacy_cache) {
>          if (!xcc->model || !xcc->model->cpudef->cache_info) {


