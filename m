Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A10A54C369
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jun 2022 10:24:36 +0200 (CEST)
Received: from localhost ([::1]:42452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1OKJ-0006sx-Bq
	for lists+qemu-devel@lfdr.de; Wed, 15 Jun 2022 04:24:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1o1OF3-00082r-Gh
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 04:19:09 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:39397)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1o1OF1-00082s-Rv
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 04:19:09 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 c130-20020a1c3588000000b0039c6fd897b4so675944wma.4
 for <qemu-devel@nongnu.org>; Wed, 15 Jun 2022 01:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=kq4T7KcSO5QyZg4jlma/qtM7fIn3blOTWbHQzfpPUl4=;
 b=NX2sDE8a6Qbxnst1Dt4l8dVeUnXmOtJnrbqjLMMWFamdg7BuSI6HJTVZvhsx9gIIns
 oIF4zSrpuZU0w0WpqccmVoisIf+7BIxr+JJBjwQKcTzb9qpxXM2XRxJi+ycCqo6Y9TRk
 tGE5EVmlAgyc49k4+XI6zMbsvSiQhJ+rjQej/HLBwIeUqXf3rebn5yaEzNPADRtr/bnw
 7XxoSuQEG3xfeqMpo4k5bLlJmA3H1gbgt/EOuddY2s3li1yTnd03Is1SqGN3+KXwRruy
 9yBoWnIA5NLY0IXPsMsOaT04cNps7tcawxMnDj0TGgIt/BSiEULA7zOuOctvzx3z2y/D
 p1BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=kq4T7KcSO5QyZg4jlma/qtM7fIn3blOTWbHQzfpPUl4=;
 b=q1EsLyyiwnY9v9mz6p16mUyiTWaLzPAVqLW180V04TZJOZoZIVghxyMouAwSQwWJnE
 eowX/oznXA8nlFjI/et8UYpUpOHswm1yJWkP7UKnaBNJ+2wJCCJ6hd/tJOfs3RMzg99l
 N6NV9w82QMDe2ClznbHRxuqtcf7FWyK77JkS5Y6+B+1clDeqwY83lej6HLJjUgzKaPaU
 2ur2kpnAuUcmSbdiI+TvBngYERtPM2JNwE37FZORh13lpekNYJtY+dYVHnffdxMx6rGH
 XFcBT9WlF4ETZOFpsGWNfgFQ+c9crRm7ZWbAt9P3PPuztBQ7Kr0tQ28FdBld0nvt0VE/
 mO2A==
X-Gm-Message-State: AOAM531+PvtldnE2wVvmOxte71W72xgIBGDcV6ytC0YqYi6CeNRK57bV
 ypZALyvSlBKIJxhpvHAu3Qc=
X-Google-Smtp-Source: ABdhPJy7Ji9K+cXtaTr1FHlLy0SBPlGu6ICtRehPgHCiUiDepxP6MZL/Ec786OdgfRIv4O7722YxRA==
X-Received: by 2002:a7b:c2aa:0:b0:39c:9039:e74b with SMTP id
 c10-20020a7bc2aa000000b0039c9039e74bmr8605766wmk.127.1655281145420; 
 Wed, 15 Jun 2022 01:19:05 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 l12-20020a5d674c000000b002185d79dc7fsm13863222wrw.75.2022.06.15.01.19.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Jun 2022 01:19:04 -0700 (PDT)
Message-ID: <4fd9cd45-c756-5607-1760-ddbddc670756@redhat.com>
Date: Wed, 15 Jun 2022 10:19:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] build: fix check for -fsanitize-coverage-allowlist
Content-Language: en-US
To: Alexander Bulekov <alxndr@bu.edu>, qemu-devel@nongnu.org
References: <20220614155415.4023833-1-alxndr@bu.edu>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220614155415.4023833-1-alxndr@bu.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On 6/14/22 17:54, Alexander Bulekov wrote:
> The existing check has two problems:
> 1. Meson uses a private directory for the get_supported_arguments check.
> ./instrumentation-filter does not exist in that private directory (it is
> copied into the root of the build-directory).
> 
> 2. fsanitize-coverage-allowlist is unused when coverage instrumentation
> is not configured. No instrumentation are passed for the
> get_supported_arguments check
> 
> Thus the check always fails. To work around this, change the check to an
> "if cc.compiles" check and provide /dev/null, instead of the real
> filter.
> 
> Meson log:
> Working directory:  build/meson-private/tmpl6wld2d9
> Command line:  clang-13 -m64 -mcx16
> build/meson-private/tmpl6wld2d9/output.obj -c -O3 -D_FILE_OFFSET_BITS=64
> -O0 -Werror=implicit-function-declaration -Werror=unknown-warning-option
> -Werror=unused-command-line-argument
> -Werror=ignored-optimization-argument
> -fsanitize-coverage-allowlist=instrumentation-filter
> 
> Error:
> error: argument unused during compilation:
> '-fsanitize-coverage-allowlist=instrumentation-filter'
> 
> Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
> ---
>   meson.build | 10 +++++++---
>   1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/meson.build b/meson.build
> index 0c2e11ff07..85134267b5 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -209,9 +209,13 @@ if get_option('fuzzing')
>     configure_file(output: 'instrumentation-filter',
>                    input: 'scripts/oss-fuzz/instrumentation-filter-template',
>                    copy: true)
> -  add_global_arguments(
> -      cc.get_supported_arguments('-fsanitize-coverage-allowlist=instrumentation-filter'),
> -      native: false, language: ['c', 'cpp', 'objc'])
> +
> +  if cc.compiles('int main () { return 0; }',
> +                  name: '-fsanitize-coverage-allowlist=/dev/null',
> +                 args: ['-fsanitize-coverage-allowlist=/dev/null'] )
> +    add_global_arguments('-fsanitize-coverage-allowlist=instrumentation-filter',
> +                         native: false, language: ['c', 'cpp', 'objc'])
> +  endif
>   
>     if get_option('fuzzing_engine') == ''
>       # Add CFLAGS to tell clang to add fuzzer-related instrumentation to all the

Queued, thanks.

Paolo

