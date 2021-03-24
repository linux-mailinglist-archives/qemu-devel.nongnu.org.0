Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3ADF347E71
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 18:03:10 +0100 (CET)
Received: from localhost ([::1]:55932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lP6uT-00033s-DP
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 13:03:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lP6sL-0002Zc-7m
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 13:00:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45879)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lP6sI-00042Q-I8
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 13:00:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616605253;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iHOTpkaN+6wE14nrGyIffNKVIHuHV5YhZsq4b5jWKKI=;
 b=HZxbg15yQOKIVEPNtr6jRefhamRbQSf7wkTRA5vVVsG3o+eORKpXmpV3S1/Y2U4TY24e67
 FoMsqJAS8EuLtJaRjGd/LAB7u1vEWG1QIJhHUDsvCTf7QuHD4Xo+knBFlEShH41hUv9Xh+
 xwueiX8YQJPVCz4EIlqyflUS7rY74L4=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-311-AFAPsWftPL24_kJ25la-bg-1; Wed, 24 Mar 2021 13:00:50 -0400
X-MC-Unique: AFAPsWftPL24_kJ25la-bg-1
Received: by mail-wr1-f69.google.com with SMTP id n17so1354316wrq.5
 for <qemu-devel@nongnu.org>; Wed, 24 Mar 2021 10:00:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=iHOTpkaN+6wE14nrGyIffNKVIHuHV5YhZsq4b5jWKKI=;
 b=ErHWEOUH0e/gkVbrLtE9jAy6P04WJt9F6ipc6YQhkUaXa0jozOKALGhEW7987B2E4F
 wXzwXoQlfQXovTZRr6gMXr+POI66TenzaP58jO6WKCeq6o3VeZTYIlM3WaQh4blTXVvY
 7babi2q2TgklWmz5BwcQ5K7WdM/scrd8eTTgjAXnqkfrW9XZsPrct550qfsQ2gtntVE+
 kbSi3akuMYjDSsgcVNS/HNd241q/FrZLnwBx2yevbedIJ5SgKN9ERUvTaBOTKL/TddEg
 4YEoyi5yQ3tTDxgC+Q9FPkF28ynMGCPMlzAYXK8LHTWQwoK/xKKib+FUXWiX/fnyy94H
 fFSw==
X-Gm-Message-State: AOAM530+ZDiQ+6sjQvszxfgg7+X88jIkVhBwTe8swMeE6GJXYoqSjo0Y
 +wiAGnNRqaQipOwJ7y2332Y0CG1cPLPH6eoRNUOeuz48j3x6L+oo9Bmj5Xw5N9QcF7ScK8bdafE
 x6hooj2vUk8U/q7U=
X-Received: by 2002:a05:600c:203:: with SMTP id 3mr3830719wmi.88.1616605248919; 
 Wed, 24 Mar 2021 10:00:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx1NYPKJnFzGxZE739aqB1yU42K8p+lQ0KaYglajYiCqHKv7GWt+4/aZcU09jzevaTozfi2rg==
X-Received: by 2002:a05:600c:203:: with SMTP id 3mr3830361wmi.88.1616605245132; 
 Wed, 24 Mar 2021 10:00:45 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id l21sm3151193wmg.41.2021.03.24.10.00.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Mar 2021 10:00:44 -0700 (PDT)
Subject: Re: [PATCH] target/i386: Verify memory operand for lcall and ljmp
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210324164650.128608-1-richard.henderson@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <d30a07ee-cbdd-d643-043f-49461af9b1da@redhat.com>
Date: Wed, 24 Mar 2021 18:00:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210324164650.128608-1-richard.henderson@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 24/03/21 17:46, Richard Henderson wrote:
> These two opcodes only allow a memory operand.
> 
> Lacking the check for a register operand, we used the A0 temp
> without initialization, which led to a tcg abort.
> 
> Buglink: https://bugs.launchpad.net/qemu/+bug/1921138
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/i386/tcg/translate.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
> index af1faf9342..880bc45561 100644
> --- a/target/i386/tcg/translate.c
> +++ b/target/i386/tcg/translate.c
> @@ -5061,6 +5061,9 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
>               gen_jr(s, s->T0);
>               break;
>           case 3: /* lcall Ev */
> +            if (mod == 3) {
> +                goto illegal_op;
> +            }
>               gen_op_ld_v(s, ot, s->T1, s->A0);
>               gen_add_A0_im(s, 1 << ot);
>               gen_op_ld_v(s, MO_16, s->T0, s->A0);
> @@ -5088,6 +5091,9 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
>               gen_jr(s, s->T0);
>               break;
>           case 5: /* ljmp Ev */
> +            if (mod == 3) {
> +                goto illegal_op;
> +            }
>               gen_op_ld_v(s, ot, s->T1, s->A0);
>               gen_add_A0_im(s, 1 << ot);
>               gen_op_ld_v(s, MO_16, s->T0, s->A0);
> 

Acked-by: Paolo Bonzini <pbonzini@redhat.com>


