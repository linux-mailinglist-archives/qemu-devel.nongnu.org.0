Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC22F2C5DBE
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Nov 2020 23:19:57 +0100 (CET)
Received: from localhost ([::1]:39294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiPcK-0002jK-OH
	for lists+qemu-devel@lfdr.de; Thu, 26 Nov 2020 17:19:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kiPai-0001ep-RH
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 17:18:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:27924)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kiPah-0006iO-Ef
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 17:18:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606429094;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Cb8Zv7Us93ZclFUD1ChcH5jTB77zVSWs9yexiJbaFPM=;
 b=EW1seHfHjLcXyVEPnQlPjIT3U2lCYd0AhknZaNxcEcJpLLlQCGJebCsyn61R/sFmJJmCuR
 9CtNKWTlOd1LmCUt5PrnvZUTbAm17UCTUFI3wZ611/SvCzVJsBm3NHTD4P8ShfpLkjK3a7
 OWsLA1ZUNtgA8BYrshFLaZ0MdcTp3Xs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-226-6LNn82KgM_GbYrWJKMk1lA-1; Thu, 26 Nov 2020 17:18:11 -0500
X-MC-Unique: 6LNn82KgM_GbYrWJKMk1lA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 763831005D5F;
 Thu, 26 Nov 2020 22:18:09 +0000 (UTC)
Received: from localhost (unknown [10.10.67.2])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3E4745D6AC;
 Thu, 26 Nov 2020 22:18:09 +0000 (UTC)
Date: Thu, 26 Nov 2020 17:18:08 -0500
From: Eduardo Habkost <ehabkost@redhat.com>
To: Alexander Graf <agraf@csgraf.de>
Subject: Re: [PATCH 6/8] hvf: Use OS provided vcpu kick function
Message-ID: <20201126221808.GU2271382@habkost.net>
References: <20201126215017.41156-1-agraf@csgraf.de>
 <20201126215017.41156-7-agraf@csgraf.de>
MIME-Version: 1.0
In-Reply-To: <20201126215017.41156-7-agraf@csgraf.de>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 qemu-arm@nongnu.org, Claudio Fontana <cfontana@suse.de>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Nov 26, 2020 at 10:50:15PM +0100, Alexander Graf wrote:
> When kicking another vCPU, we get an OS function that explicitly does that for us
> on Apple Silicon. That works better than the current signaling logic, let's make
> use of it there.
> 
> Signed-off-by: Alexander Graf <agraf@csgraf.de>
> ---
>  accel/hvf/hvf-cpus.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/accel/hvf/hvf-cpus.c b/accel/hvf/hvf-cpus.c
> index b9f674478d..74a272d2e8 100644
> --- a/accel/hvf/hvf-cpus.c
> +++ b/accel/hvf/hvf-cpus.c
> @@ -418,8 +418,20 @@ static void hvf_start_vcpu_thread(CPUState *cpu)
>                         cpu, QEMU_THREAD_JOINABLE);
>  }
>  
> +#ifdef __aarch64__
> +static void hvf_kick_vcpu_thread(CPUState *cpu)
> +{
> +    if (!qemu_cpu_is_self(cpu)) {
> +        hv_vcpus_exit(&cpu->hvf_fd, 1);
> +    }
> +}
> +#endif
> +
>  static const CpusAccel hvf_cpus = {
>      .create_vcpu_thread = hvf_start_vcpu_thread,
> +#ifdef __aarch64__
> +    .kick_vcpu_thread = hvf_kick_vcpu_thread,
> +#endif

Interesting.  We have considered the possibility of adding
arch-specific TYPE_ACCEL subclasses when discussing Claudio's,
series.  Here we have another arch-specific hack that could be
avoided if we had a TYPE_ARM_HVF_ACCEL QOM class.

>  
>      .synchronize_post_reset = hvf_cpu_synchronize_post_reset,
>      .synchronize_post_init = hvf_cpu_synchronize_post_init,
> -- 
> 2.24.3 (Apple Git-128)
> 

-- 
Eduardo


