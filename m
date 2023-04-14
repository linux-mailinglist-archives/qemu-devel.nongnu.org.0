Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC2696E22B9
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Apr 2023 13:58:20 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pnI3f-0004gx-Nk; Fri, 14 Apr 2023 07:57:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1pnI3d-0004dk-7C; Fri, 14 Apr 2023 07:57:37 -0400
Received: from mail-oa1-x2a.google.com ([2001:4860:4864:20::2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1pnI3a-0005rK-6k; Fri, 14 Apr 2023 07:57:36 -0400
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-1842cddca49so21808251fac.1; 
 Fri, 14 Apr 2023 04:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681473452; x=1684065452;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=v4f3ziGr3ZUdZuawE+TCVbmFp6dZG42vtKLGxVt+NFA=;
 b=nEt92NVKrQOqyhYZ+rpbI6hg/++8x08urw1TY9tUOy+fRPqMMRiTjD3a+/TEb88bDv
 tej3DPko5xpmMCh7i37+w/gBwAaJtioHOQIY3bp7zc96clt1RoUGvU5gfdZtAUSGld50
 Cj5JzCknGI7NkFE9HAl2THQ1Yb4cVDv136qyPQlCgMOeU24Ht9JRqDANkGvY9HbW09j9
 OBo3TOGRFV+y56vMjcsTRrtPm1oSc6/AV2HZkNRNww1wyTI6sKuIRmFySdnZfk1emKgA
 nThId3gWPuow+8wW1ZiWQRrJpfhN5uEU0KDv+NnxwA6Ka5iiQLXFxkExO6rYEj78K1Z2
 Z+og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681473452; x=1684065452;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=v4f3ziGr3ZUdZuawE+TCVbmFp6dZG42vtKLGxVt+NFA=;
 b=eqXePn6PgqDzIU/F8oU6xON+JzZPo0HWVM8qwu8gPK8pzvk1ywsYVjyVd7yCgOFO/m
 GhquMUrY3oTjKsnDl79w+xHh8EzVVg36KbaSC7ttAseaLCj82badMrKwJq2KgKy4zPKw
 HeQogpH9RTEDHT3/OU4u7v5SYy0bSk/XvkdDN8kAAwyMS7HCioOVZUR2YbJrt6nj6wIj
 fRHhZaQOw4rJWIldCluCfrULAW+J1uSGxxQi0I9aw7HIYVE+0DuYZxocezN7xozbK0da
 W9Giw+mHCAqq8+hySXVPhxMKC0LCfqhwUALIRGW7+1dRwzHqvxcggwmdYetPn0RqvASF
 MEdA==
X-Gm-Message-State: AAQBX9cWBIGuLW7V6wtpScBg8ovDH278BFCJ9pgePlm2fdNQIUYCG+Hb
 S7MY6wK5zv4igCr+dSfYHto=
X-Google-Smtp-Source: AKy350ZX6RCMLwqOh12Dx9Yopd1tQTQ2TacrHrVdWIBOB6ejzOCOD1hu+MwG3MNJkhiZGQrWVANHGQ==
X-Received: by 2002:a05:6871:82b:b0:177:9a66:2a88 with SMTP id
 q43-20020a056871082b00b001779a662a88mr3574591oap.45.1681473452420; 
 Fri, 14 Apr 2023 04:57:32 -0700 (PDT)
Received: from [192.168.68.107] ([191.255.108.232])
 by smtp.gmail.com with ESMTPSA id
 m18-20020a9d7ad2000000b00690e21a46e1sm1579142otn.56.2023.04.14.04.57.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Apr 2023 04:57:32 -0700 (PDT)
Message-ID: <a1b5b50a-9a2c-b6f7-6b89-3977643a892f@gmail.com>
Date: Fri, 14 Apr 2023 08:57:29 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 5/5] MAINTAINERS: Adding myself in the list for ppc/spapr
Content-Language: en-US
To: Harsh Prateek Bora <harshpb@linux.ibm.com>, qemu-ppc@nongnu.org
Cc: qemu-devel@nongnu.org
References: <20230331065344.112341-1-harshpb@linux.ibm.com>
 <20230331065344.112341-6-harshpb@linux.ibm.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20230331065344.112341-6-harshpb@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2a;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x2a.google.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-2.282,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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



On 3/31/23 03:53, Harsh Prateek Bora wrote:
> Would like to get notified of changes in this area and review them.
> 
> Signed-off-by: Harsh Prateek Bora <harshpb@linux.ibm.com>
> ---

All reviewers are welcome.

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>



>   MAINTAINERS | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 9b56ccdd92..be99e5c4e9 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1406,6 +1406,7 @@ M: Daniel Henrique Barboza <danielhb413@gmail.com>
>   R: Cédric Le Goater <clg@kaod.org>
>   R: David Gibson <david@gibson.dropbear.id.au>
>   R: Greg Kurz <groug@kaod.org>
> +R: Harsh Prateek Bora <harshpb@linux.ibm.com>
>   L: qemu-ppc@nongnu.org
>   S: Odd Fixes
>   F: hw/*/spapr*

