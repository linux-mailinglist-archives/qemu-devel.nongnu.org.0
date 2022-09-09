Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A79F45B2ED2
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Sep 2022 08:25:02 +0200 (CEST)
Received: from localhost ([::1]:57978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWXRl-0008K4-3x
	for lists+qemu-devel@lfdr.de; Fri, 09 Sep 2022 02:25:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oWXGg-0002JT-ES
 for qemu-devel@nongnu.org; Fri, 09 Sep 2022 02:13:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40341)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oWXGd-0002zR-Eu
 for qemu-devel@nongnu.org; Fri, 09 Sep 2022 02:13:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662704010;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rNLh4hKFEpap8uDZVtpLjKKsyiyJp2moh14q/PZu9mo=;
 b=IBszp51vvBiDgiAbxamCKauUHYufr5EJ9PvRUKG/GBZuSZYF+/XmHEhXvXWIF1Ax+2t0ip
 VcUBirL4RE0dgb7SM+gQfc7Aer26iCIIdjEF6HTZKXhONWcZQjGIKK3SrgnpB+Y1pJbFyt
 iOSdqRCpoSx9x3f7QYxL98zCnzBOods=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-531-yGW5pi3lP6SiPiFnXku7Ew-1; Fri, 09 Sep 2022 02:13:29 -0400
X-MC-Unique: yGW5pi3lP6SiPiFnXku7Ew-1
Received: by mail-wm1-f70.google.com with SMTP id
 o25-20020a05600c339900b003b2973dab88so352026wmp.6
 for <qemu-devel@nongnu.org>; Thu, 08 Sep 2022 23:13:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=rNLh4hKFEpap8uDZVtpLjKKsyiyJp2moh14q/PZu9mo=;
 b=zpal9b606/AQZ1ejjM+l3fnfHLqxNvfkon48RNPxo6hvg2seiamUO79McAXYs9KQfI
 6vOEdrjYqVTqzx2NKBTVgL0DX+9DWa0/1Ul5VtxRBAoXq3lyRTEiAO3nSljwRT53pPSD
 2bUe5JodaeiNOapCpls/TBPSe00s0FhfF84p+MY6Gfpukxx+WWj0TS+Uqpnomt3U3b8O
 Ud+a3311mHeY0nqfvvn00MG2dvx3YVfJU38jUBZItM210FA3sDPCIyIBMCZZd2qK7oBd
 pG2m4fnrJNpf+hKT2jHLAEW26j4E3b3n0ibzYjxXO/0EhLyQ9bHg55YsLCRJXH/ywP5H
 NgiA==
X-Gm-Message-State: ACgBeo2peq7wZpEC3XJRiBaxTe0tAt/AbeDKAcBs5CovhQS1iqxj1uFf
 mozCQyJ/JU/0a1J1uMQ/gnnp7L2pyjjtZ/niGaOZPjG+bZxM9aLp0mIFWJQ7dbFHTImXkiRBUHU
 XaG0Q+qBnxsOTiO4=
X-Received: by 2002:a5d:5350:0:b0:225:7560:8403 with SMTP id
 t16-20020a5d5350000000b0022575608403mr6627111wrv.507.1662704008008; 
 Thu, 08 Sep 2022 23:13:28 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5S0Avumx7TLlDBIxldAD6k1vkdGmnLy165kGjXCLD0Znmbo2lEl3oPZ0StD+kgXAJRbFOXFw==
X-Received: by 2002:a5d:5350:0:b0:225:7560:8403 with SMTP id
 t16-20020a5d5350000000b0022575608403mr6627098wrv.507.1662704007768; 
 Thu, 08 Sep 2022 23:13:27 -0700 (PDT)
Received: from redhat.com ([176.12.154.16]) by smtp.gmail.com with ESMTPSA id
 p12-20020adfce0c000000b0022a2f4fa042sm995562wrn.103.2022.09.08.23.13.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Sep 2022 23:13:27 -0700 (PDT)
Date: Fri, 9 Sep 2022 02:13:20 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-devel@nongnu.org, kvm@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Marcelo Tosatti <mtosatti@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Sergio Lopez <slp@redhat.com>, Eduardo Habkost <eduardo@habkost.net>
Subject: Re: [PATCH v2 2/2] [RfC] expose host-phys-bits to guest
Message-ID: <20220909021213-mutt-send-email-mst@kernel.org>
References: <20220908113109.470792-1-kraxel@redhat.com>
 <20220908113109.470792-3-kraxel@redhat.com>
 <20220908101757-mutt-send-email-mst@kernel.org>
 <20220909051817.vlai3l6cjl5sfgmv@sirius.home.kraxel.org>
 <20220909014106-mutt-send-email-mst@kernel.org>
 <20220909060653.s4cf7caaem3p7ac3@sirius.home.kraxel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220909060653.s4cf7caaem3p7ac3@sirius.home.kraxel.org>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

On Fri, Sep 09, 2022 at 08:06:53AM +0200, Gerd Hoffmann wrote:
>   Hi,
> 
> > > > I think we still want to key this one off host_phys_bits
> > > > so it works for e.g. hyperv emulation too.
> > > 
> > > I think that should be the case.  The chunks above change the
> > > host-phys-bits option from setting cpu->host_phys_bits to setting
> > > the FEAT_KVM_HINTS bit.  That should also happen with hyperv emulation
> > > enabled, and the bit should also be visible to the guest then, just at
> > > another location (base 0x40000100 instead of 0x40000000).
> > > 
> > > take care,
> > >   Gerd
> > 
> > 
> > You are right, I forgot. Hmm, ok. What about !cpu->expose_kvm ?
> > 
> > We have
> > 
> >     if (!kvm_enabled() || !cpu->expose_kvm) {
> >         env->features[FEAT_KVM] = 0;
> >     }   
> >         
> > This is quick grep, I didn't check whether this is called
> > after the point where you currently use it, but
> > it frankly seems fragile to pass a generic user specified flag
> > inside a cpuid where everyone pokes at it.
> 
> I tried to avoid keeping the state of the host_phys_bits option at
> multiple places.  Maybe that wasn't a good idea after all.  How about
> doing this instead:
> 
> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> index 1db1278a599b..279fde095d7c 100644
> --- a/target/i386/cpu.c
> +++ b/target/i386/cpu.c
> @@ -6219,6 +6219,11 @@ void x86_cpu_expand_features(X86CPU *cpu, Error **errp)
>          env->features[FEAT_KVM] = 0;
>      }
>  
> +    if (kvm_enabled() && cpu->host_phys_bits) {
> +        env->features[FEAT_KVM_HINTS] |=
> +            (1U << KVM_HINTS_PHYS_ADDRESS_SIZE_DATA_VALID);
> +    }
> +
>      x86_cpu_enable_xsave_components(cpu);
>  
>      /* CPUID[EAX=7,ECX=0].EBX always increased level automatically: */
> diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
> index a1fd1f53791d..3335c57b21b2 100644
> --- a/target/i386/kvm/kvm.c
> +++ b/target/i386/kvm/kvm.c
> @@ -459,6 +459,7 @@ uint32_t kvm_arch_get_supported_cpuid(KVMState *s, uint32_t function,
>          }
>      } else if (function == KVM_CPUID_FEATURES && reg == R_EDX) {
>          ret |= 1U << KVM_HINTS_REALTIME;
> +        ret |= 1U << KVM_HINTS_PHYS_ADDRESS_SIZE_DATA_VALID;
>      }
>  
>      return ret;


/me nods.
That seems much more straight-forward.

-- 
MST


