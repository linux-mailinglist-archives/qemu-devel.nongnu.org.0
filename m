Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D006F05B3
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 14:25:43 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ps0gQ-0003WC-Sv; Thu, 27 Apr 2023 08:25:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ps0gO-0003W4-Fb
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 08:25:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ps0gK-0006Ig-Pn
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 08:25:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682598303;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RqPcL35IwJ8+8F37M0vRAkVpbiH34N9jqodMr+2BLZE=;
 b=a2RgDKCxsZWb2EaYs6Zp0K1ITl253hwcX5UPSkkT6o8gNmY8wGyDPid7To/Jz1HdNOD/Ap
 +q7W4TYoGIjsn55yYD+xj/YqM7o4YwInbCUknaNM3QWPe54SANm0s7vo+o6S/voz4Vq9nC
 rJuGQGdofjdyB5JiBgsJk/C3D4MrX9M=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-477-y-MVzUqyNFKw40BnFjOa7w-1; Thu, 27 Apr 2023 08:25:02 -0400
X-MC-Unique: y-MVzUqyNFKw40BnFjOa7w-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-304991654ceso846197f8f.0
 for <qemu-devel@nongnu.org>; Thu, 27 Apr 2023 05:25:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682598301; x=1685190301;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RqPcL35IwJ8+8F37M0vRAkVpbiH34N9jqodMr+2BLZE=;
 b=XumhImMNgk2XcQ6cYUWOwFayL45yb3x1PG50laJumj7vuztIOLDoJUm4r4uIEWrGWI
 M5AWQo1SvZc/85DFXGWcWQGNulDRqppxH5zLNgjB+GcftnBfWVZwSbg7El6pzYyHdA/C
 U0fIM6CATY7CMFVa38zJyU3xO49BKrsY6/Z50B7plCHElKdIg7XEhfhPxXSk1TK9n7Bp
 43gdAuB8hg8+GA4btLJBAiuj6m0ISOifKiyIy4yBZcM5A4rir2SeALGQW+dXPQwmMFl3
 jvGbYPW3z+qcjXhN2PeZ1tV1kjhjvfnJdLJpSzD0u75Ty8ePtXHvqhcqJEbqKsk8U8Lw
 04qA==
X-Gm-Message-State: AC+VfDz7GvIQhQFJBy1gm1nQW4oBmxTzGX0kvs25b0CmRUCZqpB6UFi5
 TthwFfGHJyWfJs/8GuWyZec16V6dI197o59CGuAvpxzWKw0ZcSRQOGPBiudMu3yNNFh4iqEnyGC
 1KufStWaTBdvzStg=
X-Received: by 2002:a5d:5222:0:b0:2f9:3af2:47ed with SMTP id
 i2-20020a5d5222000000b002f93af247edmr1178657wra.6.1682598301361; 
 Thu, 27 Apr 2023 05:25:01 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7lfiHiVmGljNLUQodDz9RZGxcL057hHsHhDnmV9dWx1UC62QeXxfL8ahXtVx2TzM6vIeurQg==
X-Received: by 2002:a5d:5222:0:b0:2f9:3af2:47ed with SMTP id
 i2-20020a5d5222000000b002f93af247edmr1178636wra.6.1682598301003; 
 Thu, 27 Apr 2023 05:25:01 -0700 (PDT)
Received: from [10.33.192.205] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 h7-20020a5d6e07000000b003048084a57asm8849421wrz.79.2023.04.27.05.24.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Apr 2023 05:25:00 -0700 (PDT)
Message-ID: <6b0da42b-1588-e3ee-6868-0592784f9483@redhat.com>
Date: Thu, 27 Apr 2023 14:24:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] meson: Pass -j option to sphinx
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20230426160347.8860-1-farosas@suse.de>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230426160347.8860-1-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.422, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 26/04/2023 18.03, Fabiano Rosas wrote:
> Save a bit of build time by passing the number of jobs option to
> sphinx.
> 
> To avoid warnings from sphinx, alter our plugins to inform whether
> they support parallelism. The two plugins touched are quite simple and
> I don't see anything that would indicate they do not support being
> called in parallel, so return True for both reads and writes.
> 
> before:
>   $ time make -j16 man html
>   ...
>   [1/2] Generating docs/QEMU manual with a custom command
>   [2/2] Generating docs/QEMU man pages with a custom command
> 
>   real    0m49.770s
>   user    0m49.425s
>   sys     0m0.716s
> 
> after:
>   $ time make -j16 man html
>   ...
>   [1/2] Generating docs/QEMU manual with a custom command (wrapped by meson because command contains newlines)
>   [2/2] Generating docs/QEMU man pages with a custom command (wrapped by meson because command contains newlines)
>   real    0m30.153s
>   user    1m5.945s
>   sys     0m2.440s
> 
> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> ---
>   docs/meson.build           | 12 ++++++++++++
>   docs/sphinx/fakedbusdoc.py |  5 +++++
>   docs/sphinx/qmp_lexer.py   |  5 +++++
>   3 files changed, 22 insertions(+)
> 
> diff --git a/docs/meson.build b/docs/meson.build
> index f220800e3e..9e4bed6fa0 100644
> --- a/docs/meson.build
> +++ b/docs/meson.build
> @@ -10,6 +10,18 @@ if sphinx_build.found()
>       SPHINX_ARGS += [ '-W', '-Dkerneldoc_werror=1' ]
>     endif
>   
> +  sphinx_version = run_command(SPHINX_ARGS + ['--version'],
> +                               check: false).stdout().split()[1]
> +  if sphinx_version.version_compare('>=5.1.2')
> +    SPHINX_ARGS += ['-j', 'auto']
> +  else
> +    nproc = find_program('nproc')
> +    if nproc.found()
> +      jobs = run_command(nproc, check:false).stdout()
> +      SPHINX_ARGS += ['-j', jobs]
> +    endif
> +  endif

Wouldn't it be better to use the value from "make -jXX" instead of always 
running with the maximum number of processors here?

  Thomas


