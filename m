Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15B7752A5FB
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 17:20:13 +0200 (CEST)
Received: from localhost ([::1]:55642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqyzb-0000EI-HS
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 11:20:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nqysH-0002r3-Sa
 for qemu-devel@nongnu.org; Tue, 17 May 2022 11:12:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50967)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nqysE-0007Ar-F7
 for qemu-devel@nongnu.org; Tue, 17 May 2022 11:12:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652800352;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=002EqBkfhIqQ081b4cdCcCYEZawAEI/hCXEnpodava0=;
 b=XwCl2dDYaE3aUqGnVeS4wnuflHIXq+t+HzCFq5rpE0FJq3ORRV4aF9TW/QbefDhCV84fdq
 52aYMi33OA2HDOj3SLPZJcPbLYWbaPrH+VaTXtDC67Xflmr+rIpvJPkI0HhgbOnJdTepGh
 Bv90Qyf2DTogLoQ6ANM8Vw4cFf0FhLQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-436-6QKpTEeyN1iSFOnijw2iFQ-1; Tue, 17 May 2022 11:12:31 -0400
X-MC-Unique: 6QKpTEeyN1iSFOnijw2iFQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 q128-20020a1c4386000000b003942fe15835so8305609wma.6
 for <qemu-devel@nongnu.org>; Tue, 17 May 2022 08:12:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=002EqBkfhIqQ081b4cdCcCYEZawAEI/hCXEnpodava0=;
 b=NaWA7em7Oklgy/x/SgWAm3r8vYxJTBung7RTy4zxCpNBw71mmrQzCmEiFNBjJDAJON
 R0ZOA0XWdLXDUCTPklp5HeXKjR+pGJn6fPA+Ar5KRlv+bfAMKQp4GS8h/4UcR+hWwx6w
 8qIWlFcMmGL+/FyjkU/rHxE7bqRABDE2dM8chSYmqPLRpPyD3YLSRPIK01YbGco3I6oq
 2rWJgJeHBA3C4iEtoZEXV72XaEQgBFZfRIbMGii43o0u/M4A+rWZ5v8PCxSn/qImdBuz
 N6Lf2iymLK2eDo0vPeEDMUU2tFu5M3Es/5m3TeCB/oTkToERFTVR4HUD81bpBNeY9Ije
 GQ6Q==
X-Gm-Message-State: AOAM530VeXrUfBHfGx0iNxI85OKB7/B7QHCIGGV9hkdy5qyzcyS3X0Cu
 Inxo3/bQDDVDLpBhmY4ZrwcKeXfwSB+L1pz1x5B/mZxV7t8hTqbVCv1w+D+QEqjhAOrZIahf+bH
 pAGGTx+ek1DaMAAo=
X-Received: by 2002:adf:e481:0:b0:20e:5a67:6f9 with SMTP id
 i1-20020adfe481000000b0020e5a6706f9mr2480047wrm.334.1652800350125; 
 Tue, 17 May 2022 08:12:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxWYgfEsfpEgRfePUts3lJV/bzVMnmX/sFoNPahTKP1AQSEzyBh7JuWSsL51aMe8r19r89knQ==
X-Received: by 2002:adf:e481:0:b0:20e:5a67:6f9 with SMTP id
 i1-20020adfe481000000b0020e5a6706f9mr2480024wrm.334.1652800349860; 
 Tue, 17 May 2022 08:12:29 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 o5-20020adf8b85000000b0020c5253d8f0sm12357887wra.60.2022.05.17.08.12.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 May 2022 08:12:29 -0700 (PDT)
Date: Tue, 17 May 2022 17:12:28 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: dzejrou@gmail.com
Cc: qemu-devel@nongnu.org, david@redhat.com, Michal Privoznik
 <mprivozn@redhat.com>
Subject: Re: [PATCH] hostmem: default the amount of prealloc-threads to
 smp-cpus
Message-ID: <20220517171228.44c53748@redhat.com>
In-Reply-To: <20220517123858.7933-1-dzejrou@gmail.com>
References: <20220517123858.7933-1-dzejrou@gmail.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Tue, 17 May 2022 14:38:58 +0200
dzejrou@gmail.com wrote:

> From: Jaroslav Jindrak <dzejrou@gmail.com>
> 
> Prior to the introduction of the prealloc-threads property, the amount
> of threads used to preallocate memory was derived from the value of
> smp-cpus passed to qemu, the amount of physical cpus of the host
> and a hardcoded maximum value. When the prealloc-threads property
> was introduced, it included a default of 1 in backends/hostmem.c and
> a default of smp-cpus using the sugar API for the property itself. The
> latter default is not used when the property is not specified on qemu's
> command line, so guests that were not adjusted for this change suddenly
> started to use the default of 1 thread to preallocate memory, which
> resulted in observable slowdowns in guest boots for guests with large
> memory (e.g. when using libvirt <8.2.0 or managing guests manually).

current behavior in QEMU is intentionally conservative. threads
number is subject to host configuration and limitations management
layer puts on it and it's not QEMU job to conjure magic numbers that
are host/workload depended.
If user needs more prealloc threads they need to specify it explicitly
for each memory backend (i.e. convince management to do it or fix your
scripts to so).

CCing Michal, as he recently looked into similar topic.

To behave it the old way you need to use legacy -mem-prealloc option.


> This commit restores the original behavior for these cases while not
> impacting guests started with the prealloc-threads property in any way.
> 
> Fixes: 220c1fd864e9d ("hostmem: introduce "prealloc-threads" property")
> Signed-off-by: Jaroslav Jindrak <dzejrou@gmail.com>
> ---
>  backends/hostmem.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/backends/hostmem.c b/backends/hostmem.c
> index a7bae3d713..624bb7ecd3 100644
> --- a/backends/hostmem.c
> +++ b/backends/hostmem.c
> @@ -274,7 +274,7 @@ static void host_memory_backend_init(Object *obj)
>      backend->merge = machine_mem_merge(machine);
>      backend->dump = machine_dump_guest_core(machine);
>      backend->reserve = true;
> -    backend->prealloc_threads = 1;
> +    backend->prealloc_threads = machine->smp.cpus;
pls, do not add more dependencies to random external objects to memory backends.

If you have to do that, use machine compat properties instead, but then
the essence of the issue stays the same (user shall define optimal threads
number and provide it to qemu explicitly)

>  }
>  
>  static void host_memory_backend_post_init(Object *obj)


