Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A23B034CD40
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Mar 2021 11:44:13 +0200 (CEST)
Received: from localhost ([::1]:40486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQoRQ-0005Co-M2
	for lists+qemu-devel@lfdr.de; Mon, 29 Mar 2021 05:44:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lQoPT-0004JQ-Q2
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 05:42:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44407)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lQoPR-00071a-Nm
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 05:42:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617010928;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x5L/eDmDCAvzaYN5dvju0sGKlr7YSEquNMe8rI00VTY=;
 b=euHoaOvVxB3ttNEu4lpOj5wvVaLksukB21lRVC9lmf8dnQSU1daFsCytspU2P6hJaUbBG/
 4/MKTQKnISUrX7W1GHUDV1/sJMLtc+yGmAEmPfMi8Xc7Btlt1LB6bV2cyQAzRQNByfTkRY
 R2nt0+1ffJTLs8U/1y6A9HSBUGrGw7w=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-409-ncA2d6DaO6m62wmXIesc4g-1; Mon, 29 Mar 2021 05:42:06 -0400
X-MC-Unique: ncA2d6DaO6m62wmXIesc4g-1
Received: by mail-wr1-f70.google.com with SMTP id n16so8445034wro.1
 for <qemu-devel@nongnu.org>; Mon, 29 Mar 2021 02:42:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=x5L/eDmDCAvzaYN5dvju0sGKlr7YSEquNMe8rI00VTY=;
 b=djQYHGgktJk2z2y19M3R+jj2SMbxG5r9uvhw+aB0OTKXfftGIzSKh3nwpxjO+LLfOp
 sdxqHR9gcw3QAnUAMTaXM7Xwc3OO6hthUp56WFkUrNNARY2/2nQNc9MXpWaoTHoWeD2/
 ORy7Aqk4fxaw0mOtAoyo1eRXtyijZYhctxkntZQ59BQq4Hv604z9MuE6IxDNDlGYLdeu
 cdkQXn+Rdn3DNqMnUvJnyp9Xw9D0RvcTgBvbOSszek9/c4FMUMtOWqVIGShMxSTM5498
 izTPhuAWN04IOjetSQiGv5lZF0440W0mXPeB5yXSX6JREJlIr9m6YFLds+EwuNVKLlZt
 5Dbg==
X-Gm-Message-State: AOAM531zs1VlOwjPcMobAHAVGhSRO5TdanoHD/LZ7BW9Qu9ASod7uegE
 tBstta/K7XNkYHWFFtPPaurH10KwqYeHerJ4g/w/nKBG98tC2Ppba6PzXvsMsGGcAXZh6SoD32H
 uEZswwffGYaU4XxE=
X-Received: by 2002:adf:cd81:: with SMTP id q1mr27394546wrj.125.1617010924907; 
 Mon, 29 Mar 2021 02:42:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwDucGL+tCbcaLZp0Ih7Ye6Z57WVw0huIN0Aor+P2Q0Xm/Zck6IwGUjFfvz3aDc+xitdlbSLQ==
X-Received: by 2002:adf:cd81:: with SMTP id q1mr27394533wrj.125.1617010924757; 
 Mon, 29 Mar 2021 02:42:04 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id o8sm15378337wmr.28.2021.03.29.02.42.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Mar 2021 02:42:03 -0700 (PDT)
Subject: Re: [PATCH] replay: don't wait in run_on_cpu
To: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>, qemu-devel@nongnu.org
References: <161700514781.1141125.8890164582302771524.stgit@pasha-ThinkPad-X280>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <e18262ca-c41b-2257-323a-ff22ba462ed5@redhat.com>
Date: Mon, 29 Mar 2021 11:42:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <161700514781.1141125.8890164582302771524.stgit@pasha-ThinkPad-X280>
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
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: richard.henderson@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 29/03/21 10:05, Pavel Dovgalyuk wrote:
> @@ -136,7 +137,13 @@ void do_run_on_cpu(CPUState *cpu, run_on_cpu_func func, run_on_cpu_data data,
>   {
>       struct qemu_work_item wi;
>   
> -    if (qemu_cpu_is_self(cpu)) {
> +    if (qemu_cpu_is_self(cpu)
> +        /*
> +         * vCPU thread is waiting when replay mutex is locked
> +         * and the task is not exclusive, the function may be called
> +         * without other synchronization.
> +         */
> +        || (replay_mode != REPLAY_MODE_NONE && replay_mutex_locked())) {
>           func(cpu, data);
>           return;
>       }

Is the "or" saying that the execution is using the lockstep mode?  If 
so, can you put it in a separate function so that it's more 
self-explanatory and check if it should be used elsewhere?

Thanks,

Paolo


