Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAF8669F3CC
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 12:57:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUnjs-00054N-4q; Wed, 22 Feb 2023 06:56:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pUnjj-000548-1D
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 06:56:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pUnjh-0002fo-Ew
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 06:56:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677066996;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J4v7ETda/es6bNaGBKzFS9yzlIqTW7v28+rnvx164ac=;
 b=hs7CEOtIZVioddCpFECRAbPYEX7m+JCSIFeH0OLSrAQ/9/Psi18kwafAE5WuCjBhk4dEM9
 F2xEd7B30tfC1xy+Z8llY15ey/HtsmjLOZvcBmLU+y4QJo0PS0nViaQYf9o13DwhkK8IPN
 aM3FRfEfRl6l1ImXblU102ZO3JDeMxo=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-38-8Xb2bzj_NMev-SSzuIeICw-1; Wed, 22 Feb 2023 06:56:35 -0500
X-MC-Unique: 8Xb2bzj_NMev-SSzuIeICw-1
Received: by mail-wr1-f71.google.com with SMTP id
 a7-20020a056000188700b002c53d342406so1538861wri.2
 for <qemu-devel@nongnu.org>; Wed, 22 Feb 2023 03:56:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=J4v7ETda/es6bNaGBKzFS9yzlIqTW7v28+rnvx164ac=;
 b=hFR8yn2MH96fQwVa/dud9FaaG7sujmt/GxAOjB6GhGBIWkzw0P2FnW/fVsfOXDUyzJ
 ZlDGRWe9eSrG+mZPmPJQS1I17NoQpEz9aS7RhKHJQH+yWmtvxymyAE+3kU16L8sOJiVR
 6JbuswlGdm3wYtd4FVLGHUzX+a7UrGRHxXwIGutQeEowtJZv5DnbD6RC0gEtk4kEsf6R
 c7MlYwGgEdbT7oYVYjC0MEBCdV83psmqId56+YR26QUPpF1Vd5q1LfzAvRpxtZwLshpn
 XzXpf2vQFKIWpT/HQ/T422cFeig0b5Rp3zxTUpYGXtu5z9OXHgdMDQSibg6fs7XuMtEj
 ueNA==
X-Gm-Message-State: AO0yUKUOslMSuLza+Vh7YmFhnVR/SrEgyYId0P+wgusrxqcFDb55pjcu
 neEbuz1ofOxaB7yTFsfoz//nP32S2+uwM7EuE2J25DdPtv+b8P1SvcCg0NSMsKtXpGJyrPVe3MG
 5B0+6oTuWQYftiok=
X-Received: by 2002:a5d:45c6:0:b0:2c7:aed:b981 with SMTP id
 b6-20020a5d45c6000000b002c70aedb981mr1763715wrs.30.1677066994195; 
 Wed, 22 Feb 2023 03:56:34 -0800 (PST)
X-Google-Smtp-Source: AK7set9cxZWMAFzYmmZav57RDIJPcW+pvGVST/Q+H5AV9+Nw3sfbDk3AAooQ08C7sTcxahe+xMRusQ==
X-Received: by 2002:a5d:45c6:0:b0:2c7:aed:b981 with SMTP id
 b6-20020a5d45c6000000b002c70aedb981mr1763691wrs.30.1677066993890; 
 Wed, 22 Feb 2023 03:56:33 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-177-156.web.vodafone.de.
 [109.43.177.156]) by smtp.gmail.com with ESMTPSA id
 bl1-20020adfe241000000b002c54d8b89efsm7992286wrb.26.2023.02.22.03.56.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Feb 2023 03:56:33 -0800 (PST)
Message-ID: <484c6eed-cf57-14b3-ba38-3ed4cbad2df6@redhat.com>
Date: Wed, 22 Feb 2023 12:56:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 3/5] bulk: Replace [g_]assert(0) -> g_assert_not_reached()
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Eric Blake <eblake@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Rob Herring <robh@kernel.org>, Peter Maydell <peter.maydell@linaro.org>,
 Michael Rolnik <mrolnik@gmail.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Helge Deller <deller@gmx.de>, Jason Wang <jasowang@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Huacai Chen <chenhuacai@kernel.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Jiaxun Yang
 <jiaxun.yang@flygoat.com>, Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 Corey Minyard <minyard@acm.org>, Laurent Vivier <lvivier@redhat.com>
References: <20230221232520.14480-1-philmd@linaro.org>
 <20230221232520.14480-4-philmd@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230221232520.14480-4-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.095, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 RCVD_IN_SORBS_WEB=1.5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 22/02/2023 00.25, Philippe Mathieu-Daudé wrote:
> In order to avoid warnings such commit c0a6665c3c ("target/i386:
> Remove compilation errors when -Werror=maybe-uninitialized"),
> replace all assert(0) and g_assert(0) by g_assert_not_reached().
> 
> Remove any code following g_assert_not_reached().
> 
> See previous commit for rationale.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
...
> diff --git a/hw/net/i82596.c b/hw/net/i82596.c
> index ec21e2699a..eda0f586fb 100644
> --- a/hw/net/i82596.c
> +++ b/hw/net/i82596.c
> @@ -285,7 +285,7 @@ static void command_loop(I82596State *s)
>           case CmdDump:
>           case CmdDiagnose:
>               printf("FIXME Command %d !!\n", cmd & 7);
> -            assert(0);
> +            g_assert_not_reached();
>           }

While looking at this patch a second time, this hunk caught my eye. It looks 
like the guest could use these commands to crash QEMU? Should this be a 
qemu_log_mask(LOG_UNIMP,...) + graceful return instead?

  Thomas


