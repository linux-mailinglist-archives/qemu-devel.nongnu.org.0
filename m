Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F3E24928AF
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 15:47:22 +0100 (CET)
Received: from localhost ([::1]:34770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9plZ-0001iG-CL
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 09:47:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1n9ocu-00054J-CO
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 08:34:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44637)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1n9ocs-0004xQ-KX
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 08:34:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642512852;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bEkR8+MrwW8tzcVTmYI6szc2/HCt+h/VfjoSD3TB6NY=;
 b=ZdrlbO+4NwBzGv5ygW9Q8BqVCW1IrfmRNUzxLm1YyElLJe3xqC8DDXk/47Y678ghlU790R
 LHZW3EMWgkRunjcKsIqpPJ+zWtOE2ourK2WKFPWb78LAsaUz/0gRDGBcjb9iySoWkVtAcU
 R+sjI0sl8iRAmkVP1QKqxeq7irGiltM=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-213-nvQ8MJWhMuSZCDykBLvrKQ-1; Tue, 18 Jan 2022 08:34:06 -0500
X-MC-Unique: nvQ8MJWhMuSZCDykBLvrKQ-1
Received: by mail-ed1-f72.google.com with SMTP id
 t13-20020a05640203cd00b00403cefbefe7so223224edw.7
 for <qemu-devel@nongnu.org>; Tue, 18 Jan 2022 05:34:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=bEkR8+MrwW8tzcVTmYI6szc2/HCt+h/VfjoSD3TB6NY=;
 b=c8a3+P1OPriL9LiBWgwu+JvclK5OFRZZtbX4ejxn/Sp/mEysmg1SnsDkB735rMdl40
 pcHa8vMqcU7O/bl/QKkig08YBDWB7Cx2zTLP5QxpVNsef66t1IfJkRUAhfKJe90xxqGd
 6iqIxvI+/RaxegFn/EF9/FHtssemjgRnFnHckkXSrMTTae+yuuzKjnnSbs4JXHyknz7n
 +YNcfWBL5iQVkc8DhL8oUqkRfqIdwqN9LSLOPvmo8K8jWtJpQQ+ZOScA4UXVsMTZVOoV
 oREgP5C23snMjEi288/xg6Uuh8Am4U+VUCs3nVtljM9dt12+GyaqLZqKPmfRSd1Q2ccq
 ln6Q==
X-Gm-Message-State: AOAM532I/Bx0B2taseRquEo6aQuve73033dJcHs0b8ZBJBkig/GrZGoZ
 LvdBRoW/OO4G2hbFEPgHK+hW504Qru3QxJZRPF42bBpUw1V2NbXELMU//NFAy1RiOjnjGT1MSLX
 8gL52gHH54KXee+k=
X-Received: by 2002:a17:907:2bce:: with SMTP id
 gv14mr10774820ejc.228.1642512845319; 
 Tue, 18 Jan 2022 05:34:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwt0M42ZvRgR0TfFQY2L4i1amooDHsnrtAJ1O2Rb1a5Mut6ujd0bVLRq20G3yXsrLSYpMxMoA==
X-Received: by 2002:a17:907:2bce:: with SMTP id
 gv14mr10774791ejc.228.1642512844979; 
 Tue, 18 Jan 2022 05:34:04 -0800 (PST)
Received: from ?IPV6:2003:cb:c70c:2500:5b4d:fa8e:5311:1e28?
 (p200300cbc70c25005b4dfa8e53111e28.dip0.t-ipconnect.de.
 [2003:cb:c70c:2500:5b4d:fa8e:5311:1e28])
 by smtp.gmail.com with ESMTPSA id lm24sm5334540ejb.2.2022.01.18.05.34.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Jan 2022 05:34:04 -0800 (PST)
Message-ID: <afbc20ac-5be6-c260-c9aa-afa2980b7b6e@redhat.com>
Date: Tue, 18 Jan 2022 14:34:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [RFC PATCH v5 1/1] s390x: sigp: Reorder the SIGP STOP code
To: Eric Farman <farman@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Thomas Huth <thuth@redhat.com>
References: <20211213210919.856693-1-farman@linux.ibm.com>
 <20211213210919.856693-2-farman@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20211213210919.856693-2-farman@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 13.12.21 22:09, Eric Farman wrote:
> Let's wait to mark the VCPU STOPPED until the possible
> STORE STATUS operation is completed, so that we know the
> CPU is fully stopped and done doing anything. (When we
> also clear the possible sigp_order field for STOP orders.)
> 
> Suggested-by: David Hildenbrand <david@redhat.com>
> Signed-off-by: Eric Farman <farman@linux.ibm.com>
> ---
>  target/s390x/sigp.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/target/s390x/sigp.c b/target/s390x/sigp.c
> index 51c727834c..9dd977349a 100644
> --- a/target/s390x/sigp.c
> +++ b/target/s390x/sigp.c
> @@ -139,7 +139,7 @@ static void sigp_stop_and_store_status(CPUState *cs, run_on_cpu_data arg)
>      case S390_CPU_STATE_OPERATING:
>          cpu->env.sigp_order = SIGP_STOP_STORE_STATUS;
>          cpu_inject_stop(cpu);
> -        /* store will be performed in do_stop_interrup() */
> +        /* store will be performed in do_stop_interrupt() */
>          break;
>      case S390_CPU_STATE_STOPPED:
>          /* already stopped, just store the status */
> @@ -479,13 +479,17 @@ void do_stop_interrupt(CPUS390XState *env)
>  {
>      S390CPU *cpu = env_archcpu(env);
>  
> -    if (s390_cpu_set_state(S390_CPU_STATE_STOPPED, cpu) == 0) {
> -        qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
> -    }
> +    /*
> +     * Complete the STOP operation before exposing the CPU as
> +     * STOPPED to the system.
> +     */
>      if (cpu->env.sigp_order == SIGP_STOP_STORE_STATUS) {
>          s390_store_status(cpu, S390_STORE_STATUS_DEF_ADDR, true);
>      }
>      env->sigp_order = 0;
> +    if (s390_cpu_set_state(S390_CPU_STATE_STOPPED, cpu) == 0) {
> +        qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
> +    }
>      env->pending_int &= ~INTERRUPT_STOP;
>  }
>  

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


