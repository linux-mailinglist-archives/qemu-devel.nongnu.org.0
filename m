Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D864369BF1
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 23:18:38 +0200 (CEST)
Received: from localhost ([::1]:34068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1la3C9-00061r-04
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 17:18:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1la3A0-00051q-SW
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 17:16:24 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:47035)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1la39v-0004SL-DC
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 17:16:20 -0400
Received: by mail-wr1-x434.google.com with SMTP id c15so40702464wro.13
 for <qemu-devel@nongnu.org>; Fri, 23 Apr 2021 14:16:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=W80dleuuH4SzOgyP2NEoEsWVAAbrM2dcJjMIryBo/Yk=;
 b=eyOaCrfw82jF094Z4nDk7zbJsx8uum+8NfqMrfk6LHFCeegJueZLJUlAHOJBXrU7Cp
 A8x4oL8D0v8OmIQJ+LpPV402hXWAb9ekgrVBkBGzlzIYw73tkv896Q8SCsIE8OHQFxlY
 Idzo6zK0ApL6NIJGgFSoWOfiyg57XnP8O7j4RORUasbodtZTq0NiInv6956NXcjmTXD5
 b/3B67F1Lb2nLsH0isx/n8yScUjqSVCjzhpL4ZRKmsMTZ37iQLKbwd9gZmGQG766CxXp
 pdKBs4muvfIxQfjnyZjNQO6062UEwlEjth9eJYhvn1h5VafpM8wXIZ1jMg6NCBveIL23
 JYQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=W80dleuuH4SzOgyP2NEoEsWVAAbrM2dcJjMIryBo/Yk=;
 b=OkSYVoRYJv8ifxnIxg3iazLGCG2U9Xi5GLc9rKdLSBhQzCE0URtkKfyF1Ib0ewWl5X
 vnGCRTsOE0CvGJMpzjVJOYFijRQ6yJEVv2Z7yoT3oLZTLqU2gJajkSn8fEbvbvJmuEyG
 6BH/u6DKxsm3kKo+un8+calLeeVPTjInuziynXd8TLl9KpiEXBTkPoRBCbaZAzA4SYth
 kChkSIZ4f9VEdLhpfRfhTA33aD81ORkeotYxCWi3lA9Gw8oni1/TXJPVBUl26TeaxiMf
 JEy9NW1Qf4JFerbki6nQ27aP/b+X+V+vKrWRhzWZLbfBVm+4EHJbiua84w2HXVdpfU4w
 SPKg==
X-Gm-Message-State: AOAM533e0fkmjc37qEHtsHaxEHMZ1xN8mPWTcZdbvAxgQ9i6rrYDz1ea
 WmqSBBrlU5aYhLZr/g88mN8=
X-Google-Smtp-Source: ABdhPJz3XM2+IJ2yxGZm2Patc7ohATcOLkKdaEwohb8NHapPO+lu1XWmfkedi6i/5KuDkol2rb2GCQ==
X-Received: by 2002:a5d:6487:: with SMTP id o7mr7030426wri.152.1619212577099; 
 Fri, 23 Apr 2021 14:16:17 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id t63sm8875373wma.20.2021.04.23.14.16.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Apr 2021 14:16:16 -0700 (PDT)
Subject: Re: [PULL 19/24] bsd-user: use qemu_strtol in preference to strtol
To: imp@bsdimp.com, qemu-devel@nongnu.org
References: <20210423203959.78275-1-imp@bsdimp.com>
 <20210423203959.78275-10-imp@bsdimp.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <8e2ebe60-b2d3-c69b-eedc-3424684a24aa@amsat.org>
Date: Fri, 23 Apr 2021 23:16:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210423203959.78275-10-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: kevans@freebsd.org, arichardson@freebsd.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/23/21 10:39 PM, imp@bsdimp.com wrote:
> From: Warner Losh <imp@bsdimp.com>
> 
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> ---
>  bsd-user/main.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/bsd-user/main.c b/bsd-user/main.c
> index 69e5525607..95fda8c5ae 100644
> --- a/bsd-user/main.c
> +++ b/bsd-user/main.c
> @@ -821,7 +821,7 @@ int main(int argc, char **argv)
>              }
>          } else if (!strcmp(r, "s")) {
>              r = argv[optind++];
> -            x86_stack_size = strtol(r, (char **)&r, 0);
> +            x86_stack_size = qemu_strtol(r, (char **)&r, 0);
>              if (x86_stack_size <= 0) {
>                  usage();
>              }
> @@ -853,7 +853,7 @@ int main(int argc, char **argv)
>                  exit(1);
>              }
>          } else if (!strcmp(r, "B")) {
> -            guest_base = strtol(argv[optind++], NULL, 0);
> +            guest_base = qemu_strtol(argv[optind++], NULL, 0);

Missing error check (-EINVAL & -ERANGE).

>              have_guest_base = true;
>          } else if (!strcmp(r, "drop-ld-preload")) {
>              (void) envlist_unsetenv(envlist, "LD_PRELOAD");
> 


