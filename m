Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79EDE65EAC2
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 13:34:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDPRE-00066O-Lr; Thu, 05 Jan 2023 07:33:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pDPRC-00065m-ME
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 07:33:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pDPRA-0006EI-Uf
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 07:33:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672922015;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9/d5oQuimzxC5XHO7Yq5b0f6qvukHoRQkjQBeG0roU8=;
 b=O6NVrXW3oxlKkiU8DYVnCWovw0UmmAbOlucDqyufYdGTYAAcYtmfvCIlCLiBwA7kVSBRuK
 kbiQ32WIZMIn2DAWJLnnRFsMyewbeg8kUh4UI5/Yl45leH0di4r3tMY5qtGOsWu0JDpXG8
 arOh74xzPvQ+5aw3z18jT+UIL+ipfbs=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-639-gqyOk0X8Pc25E44VCpF0_A-1; Thu, 05 Jan 2023 07:33:34 -0500
X-MC-Unique: gqyOk0X8Pc25E44VCpF0_A-1
Received: by mail-wr1-f72.google.com with SMTP id
 r10-20020adfa14a000000b0025ba73dff40so4865479wrr.12
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 04:33:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9/d5oQuimzxC5XHO7Yq5b0f6qvukHoRQkjQBeG0roU8=;
 b=z+oxGIogag3nV104ULJu1B5q07QN1tRLnPFSUt6UPqLD6vjAes6B6Vh6qXMRJ+qcAg
 eP+j9tbpO11V987NFdS2UT2fhZ4UVQkMkvNCCrxVJpZl8sNl5FjOJj9JABG4/HBQKDuY
 u2cD+Bii1CVBhZcZuI4/yAVfFJ3TBn6NR1VUAESt9FztL4c1vhGeTxh+xNuouv9tW5TO
 TCL1z3NvwUxxLuTCryYAZpXspxVQBq1ekmkvXfmyUgZ8Tbg0Uai7T7jRkT9xNaaj6Grk
 ryBwUzTU/LU0rRATyjjXob3wt8DivCKl4YH29kkAa/d/u/EKXeI6PsVDFibAZyKYSRj7
 c/fw==
X-Gm-Message-State: AFqh2kpH5o3kXqWOgAHwUuguoObQHp5UkOFdzm5W0WUfdvrxocir8jo0
 hPL0EM/WdenBiDqZlGsmzNWmLlCXZXPxMwfM3IVIHli5AgkD3hR7NqwphdX6x/oFSGUysBXcddH
 fe22lixfFfs+rBF0=
X-Received: by 2002:adf:e199:0:b0:296:ab0a:54a0 with SMTP id
 az25-20020adfe199000000b00296ab0a54a0mr11017765wrb.70.1672922013182; 
 Thu, 05 Jan 2023 04:33:33 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsEmVeDkX0ArjmJZYUaVJAcaRYFR3xdBv/1qtcJrHr9sfSNintnsNJtRWdfHBzS8JgVcT6lyA==
X-Received: by 2002:adf:e199:0:b0:296:ab0a:54a0 with SMTP id
 az25-20020adfe199000000b00296ab0a54a0mr11017741wrb.70.1672922012922; 
 Thu, 05 Jan 2023 04:33:32 -0800 (PST)
Received: from [192.168.0.5] (ip-109-43-176-239.web.vodafone.de.
 [109.43.176.239]) by smtp.gmail.com with ESMTPSA id
 r15-20020a0560001b8f00b002709e616fa2sm36395794wru.64.2023.01.05.04.33.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Jan 2023 04:33:32 -0800 (PST)
Message-ID: <e8f398f6-24a7-d6e6-bb82-758b7eb14463@redhat.com>
Date: Thu, 5 Jan 2023 13:33:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 4/5] s390x/pv: Introduce a s390_pv_check() helper for
 runtime
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-s390x@nongnu.org,
 Janosch Frank <frankja@linux.ibm.com>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>
Cc: qemu-devel@nongnu.org, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@redhat.com>, Nico Boehr <nrb@linux.ibm.com>
References: <20230104115111.3240594-1-clg@kaod.org>
 <20230104115111.3240594-5-clg@kaod.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230104115111.3240594-5-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.939, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 04/01/2023 12.51, Cédric Le Goater wrote:
> From: Cédric Le Goater <clg@redhat.com>
> 
> If a secure kernel is started in a non-protected VM, the OS will hang
> during boot without giving a proper error message to the user.
> 
> Perform the checks on Confidential Guest support at runtime with an
> helper called from the service call switching the guest to protected
> mode.
> 
> Signed-off-by: Cédric Le Goater <clg@redhat.com>
> ---
>   include/hw/s390x/pv.h |  2 ++
>   hw/s390x/pv.c         | 14 ++++++++++++++
>   target/s390x/diag.c   |  7 +++++++
>   3 files changed, 23 insertions(+)
> 
> diff --git a/include/hw/s390x/pv.h b/include/hw/s390x/pv.h
> index 9360aa1091..ca7dac2e20 100644
> --- a/include/hw/s390x/pv.h
> +++ b/include/hw/s390x/pv.h
> @@ -55,6 +55,7 @@ int kvm_s390_dump_init(void);
>   int kvm_s390_dump_cpu(S390CPU *cpu, void *buff);
>   int kvm_s390_dump_mem_state(uint64_t addr, size_t len, void *dest);
>   int kvm_s390_dump_completion_data(void *buff);
> +bool s390_pv_check(Error **errp);
>   #else /* CONFIG_KVM */
>   static inline bool s390_is_pv(void) { return false; }
>   static inline int s390_pv_query_info(void) { return 0; }
> @@ -75,6 +76,7 @@ static inline int kvm_s390_dump_cpu(S390CPU *cpu, void *buff) { return 0; }
>   static inline int kvm_s390_dump_mem_state(uint64_t addr, size_t len,
>                                             void *dest) { return 0; }
>   static inline int kvm_s390_dump_completion_data(void *buff) { return 0; }
> +static inline bool s390_pv_check(Error **errp) { return false; }
>   #endif /* CONFIG_KVM */
>   
>   int s390_pv_kvm_init(ConfidentialGuestSupport *cgs, Error **errp);
> diff --git a/hw/s390x/pv.c b/hw/s390x/pv.c
> index 8d0d3f4adc..96c0728ec9 100644
> --- a/hw/s390x/pv.c
> +++ b/hw/s390x/pv.c
> @@ -307,6 +307,20 @@ static bool s390_pv_guest_check(const Object *obj, Error **errp)
>       return s390_pv_check_cpus(errp) && s390_pv_check_host(errp);
>   }
>   
> +bool s390_pv_check(Error **errp)
> +{
> +    MachineState *ms = MACHINE(qdev_get_machine());
> +    Object *obj = OBJECT(ms->cgs);
> +
> +    if (!obj) {
> +        error_setg(errp, "Protected VM started without a Confidential"
> +                   " Guest support interface");
> +        return false;
> +    }
> +
> +    return s390_pv_guest_check(obj, errp);
> +}
> +
>   OBJECT_DEFINE_TYPE_WITH_INTERFACES(S390PVGuest,
>                                      s390_pv_guest,
>                                      S390_PV_GUEST,
> diff --git a/target/s390x/diag.c b/target/s390x/diag.c
> index 76b01dcd68..9b16e25930 100644
> --- a/target/s390x/diag.c
> +++ b/target/s390x/diag.c
> @@ -79,6 +79,7 @@ void handle_diag_308(CPUS390XState *env, uint64_t r1, uint64_t r3, uintptr_t ra)
>       uint64_t addr =  env->regs[r1];
>       uint64_t subcode = env->regs[r3];
>       IplParameterBlock *iplb;
> +    Error *local_err = NULL;
>   
>       if (env->psw.mask & PSW_MASK_PSTATE) {
>           s390_program_interrupt(env, PGM_PRIVILEGED, ra);
> @@ -176,6 +177,12 @@ out:
>               return;
>           }
>   
> +        if (!s390_pv_check(&local_err)) {
> +            error_report_err(local_err);
> +            env->regs[r1 + 1] = DIAG_308_RC_INVAL_FOR_PV;

I hope someone from IBM can double-check whether that return code is fine in 
this case here.

If so, the patch looks fine to me.

  Thomas


> +            return;
> +        }
> +
>           s390_ipl_reset_request(cs, S390_RESET_PV);
>           break;
>       default:


