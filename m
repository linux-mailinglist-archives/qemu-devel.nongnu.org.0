Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAB764027B5
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 13:22:19 +0200 (CEST)
Received: from localhost ([::1]:53420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNZBC-0003j1-Pp
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 07:22:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mNZ8t-0001av-Rt
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 07:19:55 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:36836)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mNZ8s-0007Gq-3P
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 07:19:55 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 l18-20020a05600c4f1200b002f8cf606262so1073121wmq.1
 for <qemu-devel@nongnu.org>; Tue, 07 Sep 2021 04:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=PIz/0Kaysz5qP+i3bh1t2bvemo5YvREvyMKBvAmNMlY=;
 b=QOjvjRStuMEm5BTgLJbWn4Ub7F5I22x2YJAro1ks2cKxDCOZTn3Ps9ZynUswPZGH1k
 /jkT1GBcsKvGi7TAaNo52Gl+hD6iwAa+crPXluWP+GddnVamUi4BINqS6Z302iqasNDO
 y4hd/jN9OPvwkNQHeo2sRkrh0ZrXPRnmBMLaOwGrMTGKSlguxFUcbQLojlt4aWag6mQA
 tJdKMl3XRY7z1P5ZPihAk4505vJdUvXj7TvAYX5ZXFSvunOeh3Vov/3cud73Dv8OHabF
 YCewHAsLDicjCHJLmy+/yCSGdtTej4G+jaFacZu0wkLVNYsSh05Vr00DTBLf+KSANiej
 Cseg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PIz/0Kaysz5qP+i3bh1t2bvemo5YvREvyMKBvAmNMlY=;
 b=Cqgku44tYRcBtYq/4VBd5poV6LJYA9biojgYToeR6aZSOipV466vhWr9cMrmc9HKIm
 uXKoShX2TpNRXBdl4mqkf7xu/DH9czOrK11YvGNfxreP2fkpY1VadbMyPcShmQK8JKyE
 vk8pCnuAxT9OmCdjVVfaR/EiB6xmrddmXXrbuCmoDraxWc5uxModdzcaS8gpliKE4P6S
 dR910bTNvhxfFTFd0ZZ/x1II52Kqi8wsuA1ILE2ioJBk+p0Mf1UIlXQlTQTeq1xgnu/0
 mf4pvmGiVBy5afwvwyILgY/BXP2uMcw/DiF0tA2rddv6bmYVW8lg0FkLMvm0CX3liYaL
 k/mw==
X-Gm-Message-State: AOAM531M3FAl/XI4qW+R5Ifk5kU0nmYAgRehIjEEq8q9P2XJehv05TSg
 eAjbBycmsyZRUxiGbbjNXFo=
X-Google-Smtp-Source: ABdhPJzTkLoRVBURgMZXTIOl+EJKffj4Bu03buA2kRLcjojhDUCIyhyy15vpsJGf+jTBRjXjFySsEA==
X-Received: by 2002:a1c:f60c:: with SMTP id w12mr3435777wmc.3.1631013591540;
 Tue, 07 Sep 2021 04:19:51 -0700 (PDT)
Received: from [192.168.1.36] (21.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id v10sm2261687wrg.15.2021.09.07.04.19.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Sep 2021 04:19:51 -0700 (PDT)
Subject: Re: [PATCH] linux-user: Correct host errno for IP[V6]_RECVERR socket
 options
To: qemu-devel@nongnu.org
References: <20210907111313.1880866-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <1eb2a320-67cd-8a1c-62e6-6c2afa3dd580@amsat.org>
Date: Tue, 7 Sep 2021 13:19:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210907111313.1880866-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-2.332,
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
Cc: Helge Deller <deller@gmx.de>, Laurent Vivier <laurent@vivier.eu>,
 Conrad Meyer <cem@FreeBSD.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/7/21 1:13 PM, Philippe Mathieu-Daudé wrote:
> Target errno should be converted to host errno in IP_RECVERR
> and IPV6_RECVERR socket options.

I meant "Host errno must be converted to target errno ..."

> Fixes: ee1ac3a1822 ("linux-user: Add sockopts for IPv6")
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/602
> Reported-by: Conrad Meyer <cem@FreeBSD.org>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  linux-user/syscall.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index ccd3892b2df..edc9d6b5ba2 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -1967,7 +1967,8 @@ static inline abi_long host_to_target_cmsg(struct target_msghdr *target_msgh,
>                      tgt_len != sizeof(struct errhdr_t)) {
>                      goto unimplemented;
>                  }
> -                __put_user(errh->ee.ee_errno, &target_errh->ee.ee_errno);
> +                __put_user(get_errno(errh->ee.ee_errno),
> +                           &target_errh->ee.ee_errno);
>                  __put_user(errh->ee.ee_origin, &target_errh->ee.ee_origin);
>                  __put_user(errh->ee.ee_type,  &target_errh->ee.ee_type);
>                  __put_user(errh->ee.ee_code, &target_errh->ee.ee_code);
> @@ -2011,7 +2012,8 @@ static inline abi_long host_to_target_cmsg(struct target_msghdr *target_msgh,
>                      tgt_len != sizeof(struct errhdr6_t)) {
>                      goto unimplemented;
>                  }
> -                __put_user(errh->ee.ee_errno, &target_errh->ee.ee_errno);
> +                __put_user(get_errno(errh->ee.ee_errno),
> +                           &target_errh->ee.ee_errno);
>                  __put_user(errh->ee.ee_origin, &target_errh->ee.ee_origin);
>                  __put_user(errh->ee.ee_type,  &target_errh->ee.ee_type);
>                  __put_user(errh->ee.ee_code, &target_errh->ee.ee_code);
> 

