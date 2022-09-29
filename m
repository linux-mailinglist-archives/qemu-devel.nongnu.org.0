Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0C7D5EFD0C
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 20:29:28 +0200 (CEST)
Received: from localhost ([::1]:55710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odyHn-0003Zj-L1
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 14:29:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1odx6X-00078K-Ex
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 13:13:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29219)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1odx6T-0002AI-Sc
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 13:13:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664471620;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+jP2+V//iwKHWAsMXL2UuJlJ8Pu2Vn0yXrg4O0Po/pQ=;
 b=Bq8/GiOdRjF3VdDkoCoLRBuUbv4YVZwpOYjD0uRpUACqPwLuwlsXmLVlB/p0VwJwKzoHxE
 HH3lpo3RYOsIp2Pww0NqLCxp09Yk0e9+kqa2NsCO350ALaGxmNHak9lZ1EcGA+iVJVsgvE
 qTgumwh8WdfvAVFVSCzYFlkeiGyvMxY=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-118-JfHydpyTO4CqlLIJNJrq0Q-1; Thu, 29 Sep 2022 13:13:39 -0400
X-MC-Unique: JfHydpyTO4CqlLIJNJrq0Q-1
Received: by mail-ed1-f71.google.com with SMTP id
 b16-20020a056402279000b0044f1102e6e2so1755101ede.20
 for <qemu-devel@nongnu.org>; Thu, 29 Sep 2022 10:13:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=+jP2+V//iwKHWAsMXL2UuJlJ8Pu2Vn0yXrg4O0Po/pQ=;
 b=HUs8Sjr1c33H6BL2FvmcbJT3T6tioIzv/KFmlWLSyuD61Xs7dOlsE51vyo5JF6LOGL
 +dUyzAfmnhisS5zZQs0Tj5bVHMQUvm8oilyT8+iYEi3rTciMkBeqwCXIZMGev8UcXEGJ
 dqzXrUQJ6H9OJS4lvlNVGrZMcgpcQlE6VBOkddtLDAbXbEN2PF9H0g1tAKEDTJEd/0QT
 TPAj0CjVzU5jvCwztWwepme8EuvOFWSAqGn0b/YLoZ+E0hP3W5Xr6b3OfJWetSLL/Cc7
 UDKZVOBy1Otms+DcFTZVlQYUXKomZsUXYEXkEeUI24bJogZyL2VX8uVO1PobSZDj1I5u
 LG2w==
X-Gm-Message-State: ACrzQf27dUrl6E1Y+mRURKiMcu70A9iwhjHdQgjYDSk2BoFHEXru7sIN
 yYPpDENIAb7U4Ca6z2ObYvAfmeYwo3wCzSPQBlO3100TOIBkazfvS/23pw2ixNGxNMn6Jg1cS4R
 bfoK176GVohZhkQw=
X-Received: by 2002:a05:6402:44c:b0:445:f2f1:4add with SMTP id
 p12-20020a056402044c00b00445f2f14addmr4278357edw.257.1664471618440; 
 Thu, 29 Sep 2022 10:13:38 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM55NWq0dd/K0GXYaHWuZoiCkHyATpx7PrXwwgAPZSEWFIFQ+us5fRFF1etkh0JX4vOCrcWxpg==
X-Received: by 2002:a05:6402:44c:b0:445:f2f1:4add with SMTP id
 p12-20020a056402044c00b00445f2f14addmr4278338edw.257.1664471618218; 
 Thu, 29 Sep 2022 10:13:38 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:1c09:f536:3de6:228c?
 ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.googlemail.com with ESMTPSA id
 ss4-20020a170907038400b00781be3e7badsm4263254ejb.53.2022.09.29.10.13.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Sep 2022 10:13:37 -0700 (PDT)
Message-ID: <0e1eef64-b157-c87d-ef54-3b5a8bae9aad@redhat.com>
Date: Thu, 29 Sep 2022 19:13:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v2] hyperv: fix SynIC SINT assertion failure on guest reset
Content-Language: en-US
To: "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Cc: Marcelo Tosatti <mtosatti@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, kvm@vger.kernel.org,
 qemu-devel@nongnu.org
References: <8474c6ca63bbbf85ac7721732a7bbdb033f7aa50.1664378882.git.maciej.szmigiero@oracle.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <8474c6ca63bbbf85ac7721732a7bbdb033f7aa50.1664378882.git.maciej.szmigiero@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -62
X-Spam_score: -6.3
X-Spam_bar: ------
X-Spam_report: (-6.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.08,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-4.099, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/28/22 18:17, Maciej S. Szmigiero wrote:
> From: "Maciej S. Szmigiero"<maciej.szmigiero@oracle.com>
> 
> Resetting a guest that has Hyper-V VMBus support enabled triggers a QEMU
> assertion failure:
> hw/hyperv/hyperv.c:131: synic_reset: Assertion `QLIST_EMPTY(&synic->sint_routes)' failed.
> 
> This happens both on normal guest reboot or when using "system_reset" HMP
> command.
> 
> The failing assertion was introduced by commit 64ddecc88bcf ("hyperv: SControl is optional to enable SynIc")
> to catch dangling SINT routes on SynIC reset.
> 
> The root cause of this problem is that the SynIC itself is reset before
> devices using SINT routes have chance to clean up these routes.
> 
> Since there seems to be no existing mechanism to force reset callbacks (or
> methods) to be executed in specific order let's use a similar method that
> is already used to reset another interrupt controller (APIC) after devices
> have been reset - by invoking the SynIC reset from the machine reset
> handler via a new x86_cpu_after_reset() function co-located with
> the existing x86_cpu_reset() in target/i386/cpu.c.
> 
> Fixes: 64ddecc88bcf ("hyperv: SControl is optional to enable SynIc") # exposed the bug
> Signed-off-by: Maciej S. Szmigiero<maciej.szmigiero@oracle.com>

Thanks, looks good.

hw/i386/microvm.c has to be adjusted too, what do you think of this:

diff --git a/hw/i386/microvm.c b/hw/i386/microvm.c
index dc929727dc..64eb6374ad 100644
--- a/hw/i386/microvm.c
+++ b/hw/i386/microvm.c
@@ -485,9 +485,7 @@ static void microvm_machine_reset(MachineState *machine)
      CPU_FOREACH(cs) {
          cpu = X86_CPU(cs);

-        if (cpu->apic_state) {
-            device_legacy_reset(cpu->apic_state);
-        }
+        x86_cpu_after_reset(cpu);
      }
  }

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 655439fe62..15a854b149 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -1863,10 +1863,6 @@ static void pc_machine_reset(MachineState *machine)
          cpu = X86_CPU(cs);

          x86_cpu_after_reset(cpu);
-
-        if (cpu->apic_state) {
-            device_legacy_reset(cpu->apic_state);
-        }
      }
  }

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 27ee8c1ced..349bd5d048 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -6042,6 +6042,10 @@ void x86_cpu_after_reset(X86CPU *cpu)
      if (kvm_enabled()) {
          kvm_arch_after_reset_vcpu(cpu);
      }
+
+    if (cpu->apic_state) {
+        device_legacy_reset(cpu->apic_state);
+    }
  #endif
  }



