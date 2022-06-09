Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5789A5443D5
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 08:34:25 +0200 (CEST)
Received: from localhost ([::1]:46460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzBkN-0004wN-Vv
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 02:34:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nzBf2-0003vY-Ci
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 02:28:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37452)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nzBez-00066c-6Y
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 02:28:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654756128;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tUWLF5v68Gzh/95Chw72qDZ0AEM+UkVlUhHdi8GHuH8=;
 b=ZC9kaO0s5nLu/7QuIahGhgC73e9BpHG+602lWVteJ+aKPFZFK/Db32hZtu5IJkQTaau8Gx
 22TDr+EXNCA9GcK6Ba6SX/Ejmx/1Nu4MnULvZMvNUFZ8LMdYnyKzZdkdHa1z1QQk57irni
 zeiC2txfldIW+0+nUxpl00rTGaN3VIw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-94-SOxKNxRbMgC6cFJtn3DYEg-1; Thu, 09 Jun 2022 02:28:40 -0400
X-MC-Unique: SOxKNxRbMgC6cFJtn3DYEg-1
Received: by mail-wm1-f69.google.com with SMTP id
 v8-20020a7bcb48000000b0039c62488f77so1707038wmj.4
 for <qemu-devel@nongnu.org>; Wed, 08 Jun 2022 23:28:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=tUWLF5v68Gzh/95Chw72qDZ0AEM+UkVlUhHdi8GHuH8=;
 b=kDwsQGzK4RCatobS1sSpL6M69YPprzVtP5UZK0Mqmvmu3i0bU9YTekGrc59oZ5T7SK
 o5Zi1GH0wmo6qzXXh2FyBIaxevtscC6xGIMQJwnp3xxtTlkwvWwnZbNZPIwSuvaLCzuf
 xy5e7gnB6tYJRzbValJb9liVR9xmQVI7x7Vyi0ZZepRJi5W10S5TSE/doWTMJy5aGHAF
 cqjAn/2s8i5/syu8z4Ct7JziV8zMjuR8X/XfHJUf7A5SH8H2HOjErHCVCrE4MG50y/Od
 JKkbyWu2NKcZnNEjh49qcFoun8KLiQaJi4r5Gy01sA9dlzuKHclpwfuwSNly2jU/tzS1
 Rl0A==
X-Gm-Message-State: AOAM5312FbavDPWsUYFuKQgnLjZyC0GK3R0QjKQSPCSk/fUf2MEkkOLf
 mTw8HPBAn04lSfhqURTyas3wMj2UK+Wt0ceUxR33qe00Nk/I1tHWgwK8MlIfs0IJT1JoJnlTtmD
 AoI+RS9s1vFE8+m4=
X-Received: by 2002:a5d:61c9:0:b0:213:b518:444c with SMTP id
 q9-20020a5d61c9000000b00213b518444cmr33327274wrv.509.1654756118927; 
 Wed, 08 Jun 2022 23:28:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwrcuaeR5n+3HPjO+9NdN4QShf/Je6UsZjxDKT+6hxDknMdt/eWWdL1jnSZuRRoh0h4XtQTyQ==
X-Received: by 2002:a5d:61c9:0:b0:213:b518:444c with SMTP id
 q9-20020a5d61c9000000b00213b518444cmr33327255wrv.509.1654756118678; 
 Wed, 08 Jun 2022 23:28:38 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-42-115-130.web.vodafone.de.
 [109.42.115.130]) by smtp.gmail.com with ESMTPSA id
 p4-20020a1c2904000000b0039c673952bfsm2835628wmp.6.2022.06.08.23.28.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Jun 2022 23:28:38 -0700 (PDT)
Message-ID: <f2938a0d-1e28-14bc-6e72-9a3ba3a288a0@redhat.com>
Date: Thu, 9 Jun 2022 08:28:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] gitlab: compare CIRRUS_nn vars against 'null' not ""
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
References: <20220608160651.248781-1-berrange@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220608160651.248781-1-berrange@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 08/06/2022 18.06, Daniel P. Berrangé wrote:
> The GitLab variable comparisons don't have shell like semantics where
> an unset variable compares equal to empty string. We need to explicitly
> test against 'null' to detect an unset variable.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   .gitlab-ci.d/base.yml | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/.gitlab-ci.d/base.yml b/.gitlab-ci.d/base.yml
> index f334f3ded7..69b36c148a 100644
> --- a/.gitlab-ci.d/base.yml
> +++ b/.gitlab-ci.d/base.yml
> @@ -13,7 +13,7 @@
>       #############################################################
>   
>       # Cirrus jobs can't run unless the creds / target repo are set
> -    - if: '$QEMU_JOB_CIRRUS && ($CIRRUS_GITHUB_REPO == "" || $CIRRUS_API_TOKEN == "")'
> +    - if: '$QEMU_JOB_CIRRUS && ($CIRRUS_GITHUB_REPO == null || $CIRRUS_API_TOKEN == null)'
>         when: never
>   
>       # Publishing jobs should only run on the default branch in upstream

Reviewed-by: Thomas Huth <thuth@redhat.com>


