Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C799F214AD4
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Jul 2020 09:13:44 +0200 (CEST)
Received: from localhost ([::1]:43736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jryqN-0000sX-TE
	for lists+qemu-devel@lfdr.de; Sun, 05 Jul 2020 03:13:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jrypZ-0000DB-H8
 for qemu-devel@nongnu.org; Sun, 05 Jul 2020 03:12:53 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:47905
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jrypW-0006ov-8D
 for qemu-devel@nongnu.org; Sun, 05 Jul 2020 03:12:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593933169;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LvIwUW+HT9nLceqRk75QgxghUvMJ3y0FU0XGr+ELl2E=;
 b=S2cX1OX28+Nx53/vkFj2x9dwLf2puDT9cf02NctmcqPWPDgTRgx4xKh3x1+eAw4ZA73NWa
 cRAC3TrIPQPW+y/zV1DbXP2bkLQ/UPGbQqbv4XVNSoTJNXZ3UCIu8OaFBfqkeMHENnPpCq
 PUZXYd36VAng1nQb+3s68OVvoFTPCqw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-250-SoPsfCbvM8SXy9QZ0-XkMw-1; Sun, 05 Jul 2020 03:12:47 -0400
X-MC-Unique: SoPsfCbvM8SXy9QZ0-XkMw-1
Received: by mail-wm1-f70.google.com with SMTP id g187so41345202wme.0
 for <qemu-devel@nongnu.org>; Sun, 05 Jul 2020 00:12:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LvIwUW+HT9nLceqRk75QgxghUvMJ3y0FU0XGr+ELl2E=;
 b=cCetxwU9SsAPAkBmPJTbExxdDzIvZFWeTDmvHSAuE+Muz6+0G5UW9gxrv/eYhu8k+5
 hrxGkincs+phbl8GmcpywuTps2+K8OGOIbKC2U9H2qjYf/dK85YTyUxdXvRuR2kw75Tm
 0e45YwqBn80eEYphelrEapK8vWL5NA3SQbjI9QUjInRGsNwZeYickxw6XmpTRpuYuYpl
 AAbi6uL/XHwdEcO41xKUo1nyKWD1z0XJvpXj6bmGqEdk1UdniISudd5T0P5eHsY2Y5Ej
 7PLOHvXj+UZxVwn57xcEg6UM3q2RTROogZqW8jk0sD/+q9wU75yr73jkPo3iTdiTn7rc
 AO9A==
X-Gm-Message-State: AOAM530y4J6bY5BxJjHbqdSeUwZugTmXc5+udFpYbqdKUIO70v3xYb/6
 6pUPc5nAH8VcTJ8g83FYWyVs8ay1XXlSlmgpjVT4fR8oEK6Ts9ponNnspaRgN+d4jqZPW3vvsbC
 pwEqpBz5owerDanY=
X-Received: by 2002:a7b:c3d0:: with SMTP id t16mr47478482wmj.117.1593933166526; 
 Sun, 05 Jul 2020 00:12:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz0+d0dZ1omt34yPDVaA2FiJgGrGyIrSmc2NfwD69NaUT2OQigz0vREsB/hC0Cisob9O6lzAw==
X-Received: by 2002:a7b:c3d0:: with SMTP id t16mr47478437wmj.117.1593933166172; 
 Sun, 05 Jul 2020 00:12:46 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:adf2:29a0:7689:d40c?
 ([2001:b07:6468:f312:adf2:29a0:7689:d40c])
 by smtp.gmail.com with ESMTPSA id 59sm19816795wrj.37.2020.07.05.00.12.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 05 Jul 2020 00:12:45 -0700 (PDT)
Subject: Re: [RFC PATCH 4/7] accel/kvm: Simplify kvm_set_sigmask_len()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20200623105052.1700-1-philmd@redhat.com>
 <20200623105052.1700-5-philmd@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <cc7b7da2-fcf8-5c5c-5c3c-9e96368ddd22@redhat.com>
Date: Sun, 5 Jul 2020 09:12:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200623105052.1700-5-philmd@redhat.com>
Content-Language: en-US
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/05 01:37:44
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Cornelia Huck <cohuck@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-s390x@nongnu.org,
 Marcelo Tosatti <mtosatti@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Thomas Huth <thuth@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Aurelien Jarno <aurelien@aurel32.net>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23/06/20 12:50, Philippe Mathieu-Daudé wrote:
> The sigmask_len is a property of the accelerator, not the VM.
> Simplify by directly using the global kvm_state, remove the
> unnecessary KVMState* argument.

This is not entirely true, if there were multiple KVMStates how would
you know which one to read from?  So it would have to be a global variable.

Paolo

> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  include/sysemu/kvm.h | 2 +-
>  accel/kvm/kvm-all.c  | 4 ++--
>  target/mips/kvm.c    | 2 +-
>  3 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/include/sysemu/kvm.h b/include/sysemu/kvm.h
> index 3662641c99..44c1767a7f 100644
> --- a/include/sysemu/kvm.h
> +++ b/include/sysemu/kvm.h
> @@ -469,7 +469,7 @@ uint32_t kvm_arch_get_supported_cpuid(KVMState *env, uint32_t function,
>  uint64_t kvm_arch_get_supported_msr_feature(KVMState *s, uint32_t index);
>  
>  
> -void kvm_set_sigmask_len(KVMState *s, unsigned int sigmask_len);
> +void kvm_set_sigmask_len(unsigned int sigmask_len);
>  
>  #if !defined(CONFIG_USER_ONLY)
>  int kvm_physical_memory_addr_from_host(KVMState *s, void *ram_addr,
> diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
> index afd14492a0..7b3f76f23d 100644
> --- a/accel/kvm/kvm-all.c
> +++ b/accel/kvm/kvm-all.c
> @@ -2240,9 +2240,9 @@ err:
>      return ret;
>  }
>  
> -void kvm_set_sigmask_len(KVMState *s, unsigned int sigmask_len)
> +void kvm_set_sigmask_len(unsigned int sigmask_len)
>  {
> -    s->sigmask_len = sigmask_len;
> +    kvm_state->sigmask_len = sigmask_len;
>  }
>  
>  static void kvm_handle_io(uint16_t port, MemTxAttrs attrs, void *data, int direction,
> diff --git a/target/mips/kvm.c b/target/mips/kvm.c
> index 0adfa70210..cc3e09bdef 100644
> --- a/target/mips/kvm.c
> +++ b/target/mips/kvm.c
> @@ -48,7 +48,7 @@ unsigned long kvm_arch_vcpu_id(CPUState *cs)
>  int kvm_arch_init(MachineState *ms, KVMState *s)
>  {
>      /* MIPS has 128 signals */
> -    kvm_set_sigmask_len(s, 16);
> +    kvm_set_sigmask_len(16);
>  
>      kvm_mips_fpu_cap = kvm_check_extension(KVM_CAP_MIPS_FPU);
>      kvm_mips_msa_cap = kvm_check_extension(KVM_CAP_MIPS_MSA);
> 


