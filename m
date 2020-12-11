Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 647CC2D7E12
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 19:29:00 +0100 (CET)
Received: from localhost ([::1]:42270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knnA3-00059a-Cv
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 13:28:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1knmgk-0005if-Vs
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 12:58:43 -0500
Received: from mail-oo1-xc44.google.com ([2607:f8b0:4864:20::c44]:36357)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1knmgg-0002qh-5m
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 12:58:42 -0500
Received: by mail-oo1-xc44.google.com with SMTP id j8so2344051oon.3
 for <qemu-devel@nongnu.org>; Fri, 11 Dec 2020 09:58:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=W9Fj1tHnWea4raCWw/4AczCJoYaNDEhwpNFqzPT0pF4=;
 b=KwXTyrmzHtMRukZicQs7bMjgjagtru8TI21SPT/5kd/2NoLKoY2N+SZjaw+GLkIGzy
 UCK1yMcbXDi/UMDtPt8T8L2WuvuVlHPreDVTYrvtBeX0LnyZpyj7aT1LD+EO94korrZI
 injTUobFssMmoJTGWJFdTm6BoWar0THMZ/QmfRSswsx3Hml9YSJWwSYJavjLnvZhglhv
 MUcN7VCA3HCnniV+gOi6CYtX2kyUKffkGm5qV/MJlC34dkay+uXgDg3bPOTrM7WVV+20
 P12K6YpDNsvOEBN3Xz5fujV6Vb5e2jASn26Yv9YFbJLsdHwLMyL1hVAU1z5yOhG3zknM
 yu4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=W9Fj1tHnWea4raCWw/4AczCJoYaNDEhwpNFqzPT0pF4=;
 b=qNA6gUr592nJhRkECc5q+5hzgqFJprJPzMMrrIm0UeAm871cQzuxKYN0BiihcmM55h
 /rYXaiIYImMmO1eOshhecOrONAS7RjQZ4xDdtPMsm9ghGVife+69k10iE3T5xKjOIWMW
 WoJT09ebgPhhlIqh3y4iV4/jCprvDhUhRaW7XrfONCDvlNHR2OUkNXLaAtIWP5nESXMs
 kTVslmVBTIA0KF76XG0/y8FY0zpS3VuPNzEOAmvKuHVamLRRqKFwJ5s9E5vL9T+2lCLp
 G3DpJ5k/hT6qjiB7dj4EoN7lOgWmtRdRajQH5zd05xQf8E7wi6aD75vgiXo4b2tSX1A7
 b4lA==
X-Gm-Message-State: AOAM531okuQuYaZFZPab7df/GqswSWsXW2LRcpuhSfoktVpeT6gI5Do9
 VOXmrg6NYgbSG/oNJcCxKb+qcw==
X-Google-Smtp-Source: ABdhPJxRfy5JgIjMuod+sVFhy4EWY24kZGzVlW6QJHJuxAen0EFNuPHXRrBGkTiSlWg4COLfDczpow==
X-Received: by 2002:a4a:4988:: with SMTP id z130mr11035098ooa.34.1607709516671; 
 Fri, 11 Dec 2020 09:58:36 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id d62sm1945483oia.6.2020.12.11.09.58.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Dec 2020 09:58:35 -0800 (PST)
Subject: Re: [PATCH v11 25/25] cpu: move do_unaligned_access to tcg_ops
To: Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Wenchao Wang <wenchao.wang@intel.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
References: <20201211083143.14350-1-cfontana@suse.de>
 <20201211083143.14350-26-cfontana@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ef309063-196b-9b73-4770-5602349b0a6f@linaro.org>
Date: Fri, 11 Dec 2020 11:58:32 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201211083143.14350-26-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c44;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc44.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Jason Wang <jasowang@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>,
 Dario Faggioli <dfaggioli@suse.com>, Cameron Esfahani <dirty@apple.com>,
 haxm-team@intel.com, Colin Xu <colin.xu@intel.com>,
 Anthony Perard <anthony.perard@citrix.com>, Bruce Rogers <brogers@suse.com>,
 Olaf Hering <ohering@suse.de>, "Emilio G . Cota" <cota@braap.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/11/20 2:31 AM, Claudio Fontana wrote:
> +++ b/include/hw/core/tcg-cpu-ops.h
> @@ -66,6 +66,13 @@ typedef struct TcgCpuOperations {
>                                    unsigned size, MMUAccessType access_type,
>                                    int mmu_idx, MemTxAttrs attrs,
>                                    MemTxResult response, uintptr_t retaddr);
> +    /**
> +     * @do_unaligned_access: Callback for unaligned access handling, if
> +     * the target defines #TARGET_ALIGNED_ONLY.
> +     */
> +    void (*do_unaligned_access)(CPUState *cpu, vaddr addr,
> +                                MMUAccessType access_type,
> +                                int mmu_idx, uintptr_t retaddr);

The comment is out of date.  TARGET_ALIGNED_ONLY is no longer relevant.  That
define only controls the default for MO_ALIGN.  The target can specify all
sorts of alignment apart from the default.

So let's lose everything after the "," and everything is ok.

Amusingly, I was this week considering how easy it would be to add alignment
checks to user-only.  But we're a fair way off from that now, so,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

