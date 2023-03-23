Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3889B6C69C4
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Mar 2023 14:44:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfLET-0003u5-At; Thu, 23 Mar 2023 09:43:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pfLER-0003tw-Hh
 for qemu-devel@nongnu.org; Thu, 23 Mar 2023 09:43:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pfLEO-000434-UH
 for qemu-devel@nongnu.org; Thu, 23 Mar 2023 09:43:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679579029;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tGXSC9TQqgSSU3hvsKiHkN8MfJIghIcozpaVZUkXPrk=;
 b=Rf2WLA3rBt8nN7P+5APKjWYsnUoSu9im4au+0NqYdQCQkO+JY01UcNhHJ+vTdYWS/N6cm4
 Sqs+j7vErArlL1Q8IURJEb+Iv0K87A+GNcRxl8Fm/aFRZN4D/GhdP09xjgZlYCcphZYJcY
 1gRKGiagMnKWs6e31pot0B16TILzuQo=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-620-Pf4kOtJGMM62lbu0v1ozZA-1; Thu, 23 Mar 2023 09:43:48 -0400
X-MC-Unique: Pf4kOtJGMM62lbu0v1ozZA-1
Received: by mail-qk1-f199.google.com with SMTP id
 s12-20020a37a90c000000b007468eaf866aso5639619qke.17
 for <qemu-devel@nongnu.org>; Thu, 23 Mar 2023 06:43:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679579028; x=1682171028;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tGXSC9TQqgSSU3hvsKiHkN8MfJIghIcozpaVZUkXPrk=;
 b=aGgZfsXQd9wABgxWpw9FCjiOV6Kplj4L4lyM9J87471KcWit+Vj9B3V88/5ybpM4e3
 LwjQLvAviiHul060Rsj+FEDZN+S/V7Tx/rNrt320fjxIf6zaDREErGtK3zSoSQffdaTA
 DX2ZKp9wkM03qAczshCyNlNz97no4r1bkhosM6GI4jyem6RQ0aa6Ae/R9vFrpkB9vEeT
 W6xJTbZYkn/af8bHM7eENMMPDac2hwUeZkYaT5j9HED5J3gIDX0HwvQn4u8vYrd4Nm/E
 lbtS61eohfHxxWFxuIyXEuzix3/2Eq3CzuHWZJI+himnlw3g2Uzl+m/SmSyngIy6YocP
 ojEw==
X-Gm-Message-State: AO0yUKUtBGQFTUxUNnF5KH+oPgKhvkLRGTo6kp0AoT1bBDe3FlCEQaCn
 hoMLOFxbM2FDMsjZiBH9vvsLnpfkeud6ZVUe8rRaMST9usu3OCs+8onklb+TDlsyn5ueg3vRUvv
 X7npOJTqdopB4pzQ=
X-Received: by 2002:a05:6214:518a:b0:56c:222d:427a with SMTP id
 kl10-20020a056214518a00b0056c222d427amr15299714qvb.1.1679579028089; 
 Thu, 23 Mar 2023 06:43:48 -0700 (PDT)
X-Google-Smtp-Source: AK7set/+8YNNey9fBsPa8nFQJkP3VKZdB/z1Dnc0pnUMms1kvDYJ4Kpc8bw4yFh6nXp3EocWttu11A==
X-Received: by 2002:a05:6214:518a:b0:56c:222d:427a with SMTP id
 kl10-20020a056214518a00b0056c222d427amr15299684qvb.1.1679579027853; 
 Thu, 23 Mar 2023 06:43:47 -0700 (PDT)
Received: from x1n (bras-base-aurron9127w-grc-40-70-52-229-124.dsl.bell.ca.
 [70.52.229.124]) by smtp.gmail.com with ESMTPSA id
 j68-20020a37b947000000b0074577e835f2sm13232164qkf.48.2023.03.23.06.43.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Mar 2023 06:43:47 -0700 (PDT)
Date: Thu, 23 Mar 2023 09:43:46 -0400
From: Peter Xu <peterx@redhat.com>
To: Jiajing Zhou <zhoujiajing.vergil@bytedance.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 'Philippe =?utf-8?Q?Mathieu-Daud=C3=A9'?= <philmd@linaro.org>,
 "'Dr . David Alan Gilbert'" <dgilbert@redhat.com>
Subject: Re: [PATCH 1/1] accel/kvm/kvm-all: fix vm crash when set dirty ring
 and memorybacking
Message-ID: <ZBxXkpcaOrGuApMd@x1n>
References: <20230323131914.35583-1-zhoujiajing.vergil@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230323131914.35583-1-zhoujiajing.vergil@bytedance.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

On Thu, Mar 23, 2023 at 09:19:15PM +0800, Jiajing Zhou wrote:
> From: "zhoujiajing.vergil" <zhoujiajing.vergil@bytedance.com>
> 
> It is possible enter this function when the cpu not finished creating but
> is already in the cpu list. The value of dirty_gfns is null, causing vm
> crash here.
> 
> When both dirty-ring and memorybacking are set, creating a vm will assert
> on kvm_dirty_ring_reap_one. Part of the xml as follows:
> 
> 
> <domain type='kvm' id='9'>
>   ...
>   <memoryBacking>
>     <hugepages>
>       <page size='2048' unit='KiB' memAccess='shared'/>
>     </hugepages>
>   </memoryBacking>
>   ...
>   <features>
>     <acpi/>
>     <kvm>
>       <dirty-ring state='on' size='4096'/>
>     </kvm>
>   </features>
>   ...
> <domain/>
> 
> The kvm-reaper thread was created before vcpu thread, and the value of
> cpu->kvm_dirty_gfns is assigned at cpu thread. In the x86_cpu_realizefn
> function, the cpu is inserted into the cpu list first, and then the cpu
> thread is created for initialization. The entry functions are
> cpu_exec_realizefn and qemu_init_vcpu. In the existing logic, the
> kvm-reaper thread traverses the cpu list every second and finally call
> kvm_dirty_ring_reap_one for each cpu in the list. If cpu has been inserted
> into cpu list but has not been initialized so that the value of dirty_gfns
> is null, kvm-reaper thread call kvm_dirty_ring_reap_one will cause vm crash.
> 
> The call stack is as follows:
>   kvm_dirty_ring_reaper_thread
>     -> kvm_dirty_ring_reap
>        ->kvm_dirty_ring_reap_locked
>          ->kvm_dirty_ring_reap_one
> 
> 
> Signed-off-by: zhoujiajing.vergil <zhoujiajing.vergil@bytedance.com>

Acked-by: Peter Xu <peterx@redhat.com>

And there's a prior fix last year:

https://lore.kernel.org/r/20220927154653.77296-1-peterx@redhat.com

The most recent post that I'm aware of is by Yong:

https://lore.kernel.org/r/1d14deb6684bcb7de1c9633c5bd21113988cc698.1676563222.git.huangy81@chinatelecom.cn

A bunch of people hit this already.

Paolo, ping yet again - would you consider merging any of the versions?
For this one I'd think it'll be good to have even for 8.0.

Thanks!

-- 
Peter Xu


