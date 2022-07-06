Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24334569130
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 19:55:45 +0200 (CEST)
Received: from localhost ([::1]:46562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o99FY-0001Ph-8l
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 13:55:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o99D9-0007iH-PX
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 13:53:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24888)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o99D6-0007po-PJ
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 13:53:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657129992;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Hx13yUJXSSu7CSH68vjxi8rALd/q5KTEE3eLRedjEsQ=;
 b=OZ7V6Tn11JVhcV/5FEeHkmi6W6nHZJ2EvcHhdUBGaJX8W5jgHtOPf3eTqVAzPqqZphmp4T
 qYevskmW4SGjmQNGkFC/G4nG8NmTBkTlaU3dK8O/whlorVakVJN99YvvtcWK5x+/5QniwO
 cTgVDcSxYmQR1/3AjLIoIgmwCVYJcFs=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-478-83znwpZ1MKuMZymM51v7XQ-1; Wed, 06 Jul 2022 13:53:10 -0400
X-MC-Unique: 83znwpZ1MKuMZymM51v7XQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 h125-20020a1c2183000000b003a0374f1eb8so10630534wmh.8
 for <qemu-devel@nongnu.org>; Wed, 06 Jul 2022 10:53:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Hx13yUJXSSu7CSH68vjxi8rALd/q5KTEE3eLRedjEsQ=;
 b=GeAllpyY1iS/I+QsxhGnkhzb7V+XkdIeHNKP1ensuh0UvUSc1JnV4ucAjW3OfdriVs
 kBoga4+RDqr93jdf+AKup9NYVsWq44mbWkUdvAIj546UzDSck1vlVRpGRsakjTlLYYNz
 tXkOF83H43LO/u+bIkSEIq+MfAee0p9oKkgKiTPlur8bl6sg7q9DbplaQfCbixO8RO6E
 eEz7QpAgAeM1WZ57nKOyv+dNgiQEYWuzxmUkVFXAeyps2RfACDwsRbgfv0BbYaFohS6Q
 VMGRsmNewRVLYLzytjveA7CYBCSjX5pDFA/h5KmX/w2kqE7e047pE726rrj/VGfzv5nJ
 EoiA==
X-Gm-Message-State: AJIora+W96JEyE54Mi8vmDLzNV4FiRnZ/JgsSc/P2/NaeNeGs/APuVBF
 lCMzUxCUCfLX6ub0m/mooTHkAJZNrT1+jFgwjUjlBM+jrTCvPINjMEOgi6zRwnfrG5xc7YkLDpt
 E2/0AOekJJE3qeaA=
X-Received: by 2002:a5d:6a01:0:b0:21a:338c:4862 with SMTP id
 m1-20020a5d6a01000000b0021a338c4862mr37974731wru.631.1657129989601; 
 Wed, 06 Jul 2022 10:53:09 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tx3NQKAM5yVfQ25euwTbkRovH9Is+yInwEbMR1UT4kAxEs/sIzhRYawIMMtr8001W72biQ0A==
X-Received: by 2002:a5d:6a01:0:b0:21a:338c:4862 with SMTP id
 m1-20020a5d6a01000000b0021a338c4862mr37974715wru.631.1657129989384; 
 Wed, 06 Jul 2022 10:53:09 -0700 (PDT)
Received: from [192.168.8.104] (tmo-098-39.customers.d1-online.com.
 [80.187.98.39]) by smtp.gmail.com with ESMTPSA id
 f18-20020adffcd2000000b0021d65675583sm11121457wrs.52.2022.07.06.10.53.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Jul 2022 10:53:08 -0700 (PDT)
Message-ID: <2dbc0fa7-5dab-1a95-a050-71b007b2d9bf@redhat.com>
Date: Wed, 6 Jul 2022 19:53:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] iotests/copy-before-write: specify required_fmts
Content-Language: en-US
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, hreitz@redhat.com, kwolf@redhat.com
References: <20220706170834.242277-1-vsementsov@yandex-team.ru>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220706170834.242277-1-vsementsov@yandex-team.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 06/07/2022 19.08, Vladimir Sementsov-Ogievskiy wrote:
> Declare that we need copy-before-write filter to avoid failure when
> filter is not whitelisted.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
> ---
>   tests/qemu-iotests/tests/copy-before-write | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/qemu-iotests/tests/copy-before-write b/tests/qemu-iotests/tests/copy-before-write
> index 56937b9dff..2ffe092b31 100755
> --- a/tests/qemu-iotests/tests/copy-before-write
> +++ b/tests/qemu-iotests/tests/copy-before-write
> @@ -218,4 +218,5 @@ read failed: Permission denied
>   
>   if __name__ == '__main__':
>       iotests.main(supported_fmts=['qcow2'],
> -                 supported_protocols=['file'])
> +                 supported_protocols=['file'],
> +                 required_fmts=['copy-before-write'])

Thanks, that fixes the issue for me!

Tested-by: Thomas Huth <thuth@redhat.com>


