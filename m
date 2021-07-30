Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBC163DBE7A
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Jul 2021 20:45:09 +0200 (CEST)
Received: from localhost ([::1]:40086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9XVN-0007zA-0u
	for lists+qemu-devel@lfdr.de; Fri, 30 Jul 2021 14:45:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m9XSM-0005QP-EU
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 14:42:03 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:35353)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m9XSK-0002to-I7
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 14:42:02 -0400
Received: by mail-pl1-x633.google.com with SMTP id u16so3596193ple.2
 for <qemu-devel@nongnu.org>; Fri, 30 Jul 2021 11:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=PzYaf7eGedK3kZFy6CdHGehBxj+B+Btx2e8Ufmg8qP8=;
 b=hWWoa5gbIix0pCaI3EN/ymKL0qiBXpGJSg4NgOxtXn3t1q5+RkP/eLkLLDf2R6P0pW
 LeP9QAKhDWvRLVMcjUiOKRAhOz+0koZYRRdakGoublM5nGC7VhUzBzqCXpPgQqPg0zxK
 v8Uc+nghrC2zPU8l5ixcgokcXa9jEQZvIJ3hHDqYJWCI73QZcQfVjngLsstC0wGSfUWw
 nSgkUyPEPjkvW/U/iwZuZZ7ssqMxLjbRBC3Ta3AtOpTTNIw4LjhE2WOOsOM4C5tqSPg8
 a/TMSwpc3RBQGvMz+MVXNvVa/Y79sa3HzS5gIr2rSa5/SkDAGYTzk4EJJOsIdp1VxOkl
 OrfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PzYaf7eGedK3kZFy6CdHGehBxj+B+Btx2e8Ufmg8qP8=;
 b=oPW4g0J0tCSIMjpNN6klxILZ3VdmKIwZ8VExuCMs52lBAeRq4fttHCksF689iLxxkO
 HDhUFjry2sL4Jt1EOyBBtIFNUHJfuOFodMd/t1WHKIeK0x9kl+eO3sYdNmYSGGHWE3dz
 VM72O27ysJOMoUPh6Jr1KjkByeKD+euu40kf323sU29YggBVAAoHEYDNKqUa26+96ZDR
 frdMIQtP3XQWrrcvVrv7n3+QDMiATb0J3bECBJBTa3ZmXHLkflXyHpnwOqsLjaUip8Q9
 F8tWtC6wU46EutUZ4c843QptwfjazroxJ7O2mtdEKIC+kDrdEJZBmFIbcTwveGs86uxc
 hdWg==
X-Gm-Message-State: AOAM5327CCpBE20GDU4ylpgqWeB0Nh4ogpaEzX0NxyoZrJz2DVzpwvYr
 OyBcGyHRSQL75jieDohMXv7x5A==
X-Google-Smtp-Source: ABdhPJzysXkzvmMtXgXpT12IdGM+/Mfquhwk849XYwg1Y3dTGDJ0VeXX9Vs5q2JtLfPcTVBpbro/pg==
X-Received: by 2002:a17:902:6bc8:b029:117:6a8a:f7af with SMTP id
 m8-20020a1709026bc8b02901176a8af7afmr3179292plt.51.1627670518762; 
 Fri, 30 Jul 2021 11:41:58 -0700 (PDT)
Received: from ?IPv6:2603:800c:3202:ffa7:c4c7:6719:c57e:8ffe?
 (2603-800c-3202-ffa7-c4c7-6719-c57e-8ffe.res6.spectrum.com.
 [2603:800c:3202:ffa7:c4c7:6719:c57e:8ffe])
 by smtp.gmail.com with ESMTPSA id b19sm79066pfp.5.2021.07.30.11.41.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Jul 2021 11:41:58 -0700 (PDT)
Subject: Re: [PATCH for-6.2 2/8] monitor: Use accel_find("kvm") instead of
 kvm_available()
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20210730105947.28215-1-peter.maydell@linaro.org>
 <20210730105947.28215-3-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <fa4ce57b-2bc8-c8bf-485b-918d6890ffa5@linaro.org>
Date: Fri, 30 Jul 2021 08:41:55 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210730105947.28215-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.125,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/30/21 12:59 AM, Peter Maydell wrote:
> The kvm_available() function reports whether KVM support was
> compiled into the QEMU binary; it returns the value of the
> CONFIG_KVM define.
> 
> The only place in the codebase where we use this function is
> in qmp_query_kvm(). Now that accelerators are based on QOM
> classes we can instead use accel_find("kvm") and remove the
> kvm_available() function.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   include/sysemu/arch_init.h | 2 --
>   monitor/qmp-cmds.c         | 2 +-
>   softmmu/arch_init.c        | 9 ---------
>   3 files changed, 1 insertion(+), 12 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

