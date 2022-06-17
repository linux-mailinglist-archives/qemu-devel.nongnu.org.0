Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C79C754F475
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Jun 2022 11:37:00 +0200 (CEST)
Received: from localhost ([::1]:48168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o28PT-0007f2-EV
	for lists+qemu-devel@lfdr.de; Fri, 17 Jun 2022 05:36:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o28J4-0005rb-AA
 for qemu-devel@nongnu.org; Fri, 17 Jun 2022 05:30:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52042)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o28J2-0000MG-Q5
 for qemu-devel@nongnu.org; Fri, 17 Jun 2022 05:30:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655458220;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N6/hP47ntI9vA+KC7i1pkRngpdM1XBszj3kCdox8qYk=;
 b=SquR2oh8hcVST43QypjarNeGiCNcZsybDpKJ+XgpVkP7prvMBwLfcBJN7USg2H90GfBrI7
 DeVu1YjGeQsJvwNU5JdoHLIUHewpSnTUDE5AeeUofyY3VJoncJlYkhW2i0cNytH5HGyzWR
 tcnlWc8+5cw5SgJqqGoOKZvbyx4pEms=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-28-ZwBAQQk-MVuHu12OEGVJDw-1; Fri, 17 Jun 2022 05:30:11 -0400
X-MC-Unique: ZwBAQQk-MVuHu12OEGVJDw-1
Received: by mail-wm1-f71.google.com with SMTP id
 k5-20020a05600c0b4500b003941ca130f9so1383649wmr.0
 for <qemu-devel@nongnu.org>; Fri, 17 Jun 2022 02:30:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=N6/hP47ntI9vA+KC7i1pkRngpdM1XBszj3kCdox8qYk=;
 b=js8G+fFCM8kI12eNhPnBWP5aOtzSJW3+E9pUXW/1j770MCgTplPqAxk0TWtwN3B/Xm
 hKQ64zzMJThulBqzNj5XATsq5L5cnZUZY1i6En+qDobP0n21btrmAWE1ZVGDholN83jq
 H0Frku66mdu0K1+8wFqNPjGyGOOx3stpJgYf/IIzJQ7d/jPs6ZP14zJPS4B531EP+dF3
 B1tlbQmDyfhC7WPJDLCPek2XUH4B2e6Lnyj3L5dleYtFLuDhm5G5cndw7Rqn7uKqhazC
 je5uoIaB1YLbdsj9LB7BoObsVqk/bp+Hx9pXpqQgB6AyE1P3yD7Lq5KLvREqgN325CGl
 8BLA==
X-Gm-Message-State: AJIora90aM2dp5HHVqntRbGZHp79GFiwyFi4wycOMJgoXRHIS/wOQqrW
 ybc7AU2MCutNAEIbozmM6+jGG9ZWTjq33QCOhqVnEvkdOm8sGxb5BxKvOpaclL8SXrbLfNqU//F
 JDF7PJAZxs7uQNGY=
X-Received: by 2002:a5d:44d1:0:b0:218:418a:3e8e with SMTP id
 z17-20020a5d44d1000000b00218418a3e8emr8418418wrr.112.1655458209870; 
 Fri, 17 Jun 2022 02:30:09 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vk1re8YUmVssAE292V0GAFPx4AcjvYgm/XYNBtgLr8iMlqQuImEUpvUItL17xNwrHQ8ZR24Q==
X-Received: by 2002:a5d:44d1:0:b0:218:418a:3e8e with SMTP id
 z17-20020a5d44d1000000b00218418a3e8emr8418379wrr.112.1655458209479; 
 Fri, 17 Jun 2022 02:30:09 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-42-114-75.web.vodafone.de.
 [109.42.114.75]) by smtp.gmail.com with ESMTPSA id
 s6-20020a05600c29c600b0039c948dbb61sm4784042wmd.26.2022.06.17.02.30.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Jun 2022 02:30:09 -0700 (PDT)
Message-ID: <e0612eeb-3764-11ab-d6ca-7d39dc418a61@redhat.com>
Date: Fri, 17 Jun 2022 11:30:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 09/10] tests/vm: remove duplicate 'centos' VM test
Content-Language: en-US
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
Cc: Beraldo Leal <bleal@redhat.com>, qemu-block@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Kevin Wolf <kwolf@redhat.com>, Daniel Berrange <berrange@redhat.com>,
 Michael Roth <michael.roth@amd.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>
References: <20220616142659.3184115-1-jsnow@redhat.com>
 <20220616142659.3184115-10-jsnow@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220616142659.3184115-10-jsnow@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 16/06/2022 16.26, John Snow wrote:
> This is listed twice by accident; we require genisoimage to run the
> test, so remove the unconditional entry.
> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>   tests/vm/Makefile.include | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/vm/Makefile.include b/tests/vm/Makefile.include
> index 70eee2510c6..f3b7a9d299d 100644
> --- a/tests/vm/Makefile.include
> +++ b/tests/vm/Makefile.include
> @@ -6,7 +6,7 @@ HOST_ARCH = $(if $(ARCH),$(ARCH),$(shell uname -m))
>   
>   EFI_AARCH64 = $(wildcard $(BUILD_DIR)/pc-bios/edk2-aarch64-code.fd)
>   
> -X86_IMAGES := freebsd netbsd openbsd centos fedora haiku.x86_64
> +X86_IMAGES := freebsd netbsd openbsd fedora haiku.x86_64
>   ifneq ($(GENISOIMAGE),)
>   X86_IMAGES += centos
>   ifneq ($(EFI_AARCH64),)

Reviewed-by: Thomas Huth <thuth@redhat.com>


