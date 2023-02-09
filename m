Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2233C69026D
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 09:48:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQ2Zm-0005vM-8R; Thu, 09 Feb 2023 03:46:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pQ2Zi-0005un-MQ
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 03:46:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pQ2Zg-00077J-AW
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 03:46:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675932384;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=64KGhJoWU3dP7xMkQYbD11H30C53vCj4+NCZ/6ApNcU=;
 b=aH++1/MqhkUFZfWNyYMaFNBr9Hnm3dL+UPQ7qU+h9GKUwdOhRKDj+TUbZQnLh/i8wEyV6j
 jsAhRkJUgMeLY+Py4kvhSNEcRd/TtKHHzqY3bGceiSMrElm+pkH1Hi9ZDjXL0rpXRxaj1/
 ds2mgk7fgZImRjyVQ55LWQbWDqaKKdo=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-340-hJTmpgDKOAuY_4vB2TzaJA-1; Thu, 09 Feb 2023 03:46:22 -0500
X-MC-Unique: hJTmpgDKOAuY_4vB2TzaJA-1
Received: by mail-qk1-f198.google.com with SMTP id
 x7-20020a05620a098700b007242aa494ddso801257qkx.19
 for <qemu-devel@nongnu.org>; Thu, 09 Feb 2023 00:46:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=64KGhJoWU3dP7xMkQYbD11H30C53vCj4+NCZ/6ApNcU=;
 b=I6v0W/c1bCO9nEsvHiFB1MU7MQOj/AGUdI+/F/bM3dQZv4+cOcWy3B9YDlcbvqS2lK
 ZUxlYHvc/KF6G/0NsULx5PZNTb+SVCfQoa2Cw7TJBCsv2m+gR6AI3wFFgnOJDCdw7Px+
 9RcvOY03gnN2X3zPzG71DXJbXk252tb5UBZwjreSfAHFMdxAtnFeRvx7XPQtwYmOR3DN
 xv+6eHNpcZyhi8ZXu7X0nL2zrXnv1cWZur1oWJezc3pFehTrI/Senu3e4mNuoa3azhfE
 Vk2cqgBYBWJb1nRckE/8hN5NWmE3EQ/GhRXXmMw9TJYgQSK3/hy9CoGZxuqBeDnPuIBj
 bKZA==
X-Gm-Message-State: AO0yUKU+fi2w54BWhawYnmraEwawfLj9EAuoUgqmg/+MNhgmPrcI+LZ7
 K0ifU1qdd2+9CJfrXvITR5ZvhBgJysTk+ruy6la79/j5SDGCn6yXXPxk69OPHBlTydNcDpHd/h6
 fqTP9IZt1DXLUQEY=
X-Received: by 2002:a05:622a:91:b0:3b8:629e:68a8 with SMTP id
 o17-20020a05622a009100b003b8629e68a8mr18039624qtw.20.1675932382422; 
 Thu, 09 Feb 2023 00:46:22 -0800 (PST)
X-Google-Smtp-Source: AK7set+WkXsCDd2w/CsCdP1DINtqN7uUOFxghSMhx23qtOaCW947OczmPzisZqN1ZcMeCFo0ue5lhQ==
X-Received: by 2002:a05:622a:91:b0:3b8:629e:68a8 with SMTP id
 o17-20020a05622a009100b003b8629e68a8mr18039610qtw.20.1675932382185; 
 Thu, 09 Feb 2023 00:46:22 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-176-209.web.vodafone.de.
 [109.43.176.209]) by smtp.gmail.com with ESMTPSA id
 o24-20020ac84298000000b003b880ef08acsm885429qtl.35.2023.02.09.00.46.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Feb 2023 00:46:21 -0800 (PST)
Message-ID: <a81b78ca-6d1d-a201-1754-efd3e44dd838@redhat.com>
Date: Thu, 9 Feb 2023 09:46:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 10/12] tests/qtest: Do not include hexloader-test if
 loader device is not present
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20230208194700.11035-1-farosas@suse.de>
 <20230208194700.11035-11-farosas@suse.de>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230208194700.11035-11-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.146, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 08/02/2023 20.46, Fabiano Rosas wrote:
> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> ---
>   tests/qtest/meson.build | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
> index eccdfca235..c6dba4f87e 100644
> --- a/tests/qtest/meson.build
> +++ b/tests/qtest/meson.build
> @@ -197,11 +197,11 @@ qtests_arm = \
>     (config_all_devices.has_key('CONFIG_PFLASH_CFI02') ? ['pflash-cfi02-test'] : []) +         \
>     (config_all_devices.has_key('CONFIG_ASPEED_SOC') ? qtests_aspeed : []) + \
>     (config_all_devices.has_key('CONFIG_NPCM7XX') ? qtests_npcm7xx : []) + \
> +  (config_all_devices.has_key('CONFIG_GENERIC_LOADER') ? ['hexloader-test'] : []) + \
>     ['arm-cpu-features',
>      'microbit-test',
>      'test-arm-mptimer',
> -   'boot-serial-test',
> -   'hexloader-test']
> +   'boot-serial-test']
>   
>   # TODO: once aarch64 TCG is fixed on ARM 32 bit host, make bios-tables-test unconditional
>   qtests_aarch64 = \

Reviewed-by: Thomas Huth <thuth@redhat.com>


