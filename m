Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5D3C6C43B0
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 07:56:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pesO5-00053q-Q0; Wed, 22 Mar 2023 02:55:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pesO3-000535-NX
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 02:55:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pesO2-00069h-7G
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 02:55:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679468153;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K2FiTWCM6TtwllN/awY/lGUDQCwJ6oN3XsNns6mnfhE=;
 b=WmIR85snjA/htLDqRB6vrCM+lVlDUUsFaj7B7hvkujtYqEO9X1Ox+H5nBTuuKME6DGZIN1
 vobAvU7t8KPkeXBgY6MuKB59HfJHIhCY8DZJlEK+4DrVsRV5cTw1OvxMNFBzRCEJJijAgU
 BsJT/D1hBc2alUkDGJ4dOOsUsNkxVQo=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-8-uLqyVaPqMViighA3GW_IEw-1; Wed, 22 Mar 2023 02:55:52 -0400
X-MC-Unique: uLqyVaPqMViighA3GW_IEw-1
Received: by mail-qk1-f198.google.com with SMTP id
 o63-20020a374142000000b007467ef381beso4262326qka.16
 for <qemu-devel@nongnu.org>; Tue, 21 Mar 2023 23:55:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679468152;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=K2FiTWCM6TtwllN/awY/lGUDQCwJ6oN3XsNns6mnfhE=;
 b=O3ZAX0fPi5fXoimtXWJ71xV54QoVxI6XOoG5kTQp9VrxshXn5dxNOl3Xm1z+eoh/U0
 IdcOnMwtPVSLiKtoC6LAQg4JVvBrfVWMUN22sNf66qpFXdEJ6PRbXWUfbLldWauAdxmw
 C7sccDn7iTHkYwolZuuIM+1OYpmtrNQx49/idTab1+l22PM9EfIhHYovVMrzkr/HlghR
 VmPRe+vK2M++Is7sCMQi9y/99wTKRowEdfVvm0ByI9UYLd9WaQyC66vI7mjoiudI9Sr/
 /0SO95XnM5K4vSIAuxncQTYQOADwmEybNLW4mKdK5R0O/+9xULwJKMoGSRIWEftNpWkU
 KMSw==
X-Gm-Message-State: AO0yUKXzo81FfVS52QQuTrenBwgD+5LF+VV/IE8obs10EwOdlihxt2L1
 +ScETMFUceQSEIW/szQmz1OAIfPRjowbhz2QDwWIxgT7ghGYkVslPt9kKmMdav5oHbvfPPUP6tU
 HGJ7rq2r0p+7JS4w=
X-Received: by 2002:a05:6214:2aaf:b0:5a2:d726:b84c with SMTP id
 js15-20020a0562142aaf00b005a2d726b84cmr4484350qvb.19.1679468151778; 
 Tue, 21 Mar 2023 23:55:51 -0700 (PDT)
X-Google-Smtp-Source: AK7set/gIyXP0PV0UAg0rDHV0Kc6tmfX4IqPND+0fsAgg3weoh3U17JhQC2SIAmhSRC7hilmaRDfJw==
X-Received: by 2002:a05:6214:2aaf:b0:5a2:d726:b84c with SMTP id
 js15-20020a0562142aaf00b005a2d726b84cmr4484343qvb.19.1679468151528; 
 Tue, 21 Mar 2023 23:55:51 -0700 (PDT)
Received: from [192.168.8.106] (tmo-102-206.customers.d1-online.com.
 [80.187.102.206]) by smtp.gmail.com with ESMTPSA id
 p17-20020a374211000000b007428e743508sm10799346qka.70.2023.03.21.23.55.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Mar 2023 23:55:51 -0700 (PDT)
Message-ID: <f1379bd6-e6b5-9198-69e2-a8dda5133545@redhat.com>
Date: Wed, 22 Mar 2023 07:55:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH for-8.0 v2 3/3] target/ppc: Fix helper_pminsn() prototype
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 QEMU Trivial <qemu-trivial@nongnu.org>
References: <20230321161609.716474-1-clg@kaod.org>
 <20230321161609.716474-4-clg@kaod.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230321161609.716474-4-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 21/03/2023 17.16, Cédric Le Goater wrote:
> From: Cédric Le Goater <clg@redhat.com>
> 
> GCC13 reports an error:
> 
> ../target/ppc/excp_helper.c:2625:6: error: conflicting types for ‘helper_pminsn’ due to enum/integer mismatch; have ‘void(CPUPPCState *, powerpc_pm_insn_t)’ {aka ‘void(struct CPUArchState *, powerpc_pm_insn_t)’} [-Werror=enum-int-mismatch]
>   2625 | void helper_pminsn(CPUPPCState *env, powerpc_pm_insn_t insn)
>        |      ^~~~~~~~~~~~~
> In file included from /home/legoater/work/qemu/qemu.git/include/qemu/osdep.h:49,
>                   from ../target/ppc/excp_helper.c:19:
> /home/legoater/work/qemu/qemu.git/include/exec/helper-head.h:23:27: note: previous declaration of ‘helper_pminsn’ with type ‘void(CPUArchState *, uint32_t)’ {aka ‘void(CPUArchState *, unsigned int)’}
>     23 | #define HELPER(name) glue(helper_, name)
>        |                           ^~~~~~~
> 
> Cc: Daniel Henrique Barboza <danielhb413@gmail.com>
> Fixes: 7778a575c7 ("ppc: Add P7/P8 Power Management instructions")
> Signed-off-by: Cédric Le Goater <clg@redhat.com>
> Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>   target/ppc/excp_helper.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
> index 287659c74d..199328f4b6 100644
> --- a/target/ppc/excp_helper.c
> +++ b/target/ppc/excp_helper.c
> @@ -2622,7 +2622,7 @@ void helper_scv(CPUPPCState *env, uint32_t lev)
>       }
>   }
>   
> -void helper_pminsn(CPUPPCState *env, powerpc_pm_insn_t insn)
> +void helper_pminsn(CPUPPCState *env, uint32_t insn)
>   {
>       CPUState *cs;
>   

Reviewed-by: Thomas Huth <thuth@redhat.com>


