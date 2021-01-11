Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2C0B2F1238
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 13:19:57 +0100 (CET)
Received: from localhost ([::1]:36368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kywAu-00078P-VA
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 07:19:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kyw9m-0006Jr-H0
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 07:18:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41068)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kyw9f-00051R-Dp
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 07:18:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610367518;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1AjvC5+dw4Qw073mtSYIgTURdRW1Ay/E2tYBqZ2woyQ=;
 b=XL1SW0lJJU/NK2T+BV/UEWbKflvtI6p7mpj99oUzFUstne/sBq8D9CeEMz2oFfDx4b1sMh
 uHWQCKf5Em9YA9Lggy70x9RpELcCkvQLZUN2bAJl84I0citu8qGl+TT2jnmdc4PtgZrtxR
 4QGXlMKolB/t93CGyuHBIlRAf5/8tW0=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-269-Z8V9cXd0PxSg4vV6R7YPpg-1; Mon, 11 Jan 2021 07:18:35 -0500
X-MC-Unique: Z8V9cXd0PxSg4vV6R7YPpg-1
Received: by mail-ed1-f69.google.com with SMTP id g25so8171839edu.4
 for <qemu-devel@nongnu.org>; Mon, 11 Jan 2021 04:18:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1AjvC5+dw4Qw073mtSYIgTURdRW1Ay/E2tYBqZ2woyQ=;
 b=lrfupuQjbDL2jHeF4gnOyKeStPmhQTBloFUO7SPqM07yPd9pBHXzo46pQcIuE7avFW
 rICFHZW8CrNLfOKcJm2aOE09tO+Bcos+duVD+dBHKvXFGbpMlSwHZZ4HycDEJeyh2VbX
 TFori2eD/4FPMzeT00wllw2Lxvgq+zgQ+kM63zFmZaKQWPUJX6NxxRCvWIrbpUeTfdxV
 nWdlhwDEQ3pnpO8h4FzttwtXCIM1eidvkne1q/aciAlOr3skRcQE7Ln9rGUrX0sQSF9S
 DCUu1zsjCBV2PM1BZhR0JCo8Hm9muA/3/fd4UuLR4vkM1zw6jybY76BAiMsvr1iEoCqP
 Z2WQ==
X-Gm-Message-State: AOAM531gFYBlZhv2n36uR+2Pw51owBDuWqIhvHnMKxrklkyoagloMKtl
 BTp5YHsUn+XZGwXXIuDiH6lYNx/g1k0yJaDA3jxMqj2ZOD7YgAN48W3sXr7Zq04namUHdHfjdnp
 Lxr8LHTZ9nmZ28AQ=
X-Received: by 2002:a50:f604:: with SMTP id c4mr14792757edn.307.1610367514589; 
 Mon, 11 Jan 2021 04:18:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyiliHETxgMmb6mEn1z8idujtjg5Lf7fvClL78UJC0P/AiZuReqKxOXNPfvGMdZgqC66hcKEA==
X-Received: by 2002:a50:f604:: with SMTP id c4mr14792744edn.307.1610367514475; 
 Mon, 11 Jan 2021 04:18:34 -0800 (PST)
Received: from [192.168.1.36] (129.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.129])
 by smtp.gmail.com with ESMTPSA id f11sm6946756ejd.40.2021.01.11.04.18.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Jan 2021 04:18:33 -0800 (PST)
Subject: Re: [PATCH 6/6] get_maintainer: update repo URL to GitLab
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
References: <20210111115017.156802-1-stefanha@redhat.com>
 <20210111115017.156802-7-stefanha@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <0ef3e086-1839-f6af-c940-7d6a800ba3b5@redhat.com>
Date: Mon, 11 Jan 2021 13:18:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210111115017.156802-7-stefanha@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Daniel Berrange <berrange@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/11/21 12:50 PM, Stefan Hajnoczi wrote:
> qemu.org is running out of bandwidth and the QEMU project is moving
> towards a gating CI on GitLab. Use the GitLab repos instead of qemu.org
> (they will become mirrors).
> 
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  scripts/get_maintainer.pl | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


