Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6934E567FF3
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 09:35:52 +0200 (CEST)
Received: from localhost ([::1]:44270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8zZf-00052c-8C
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 03:35:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o8zSp-0002AX-Md
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 03:28:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39061)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o8zSn-0005dt-1K
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 03:28:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657092524;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+U8Q+/0izXxwFdoxYz7wOn6vHeVF5HKlErALMcibXRw=;
 b=FgXwjpFAMqJ13hEQxKc4ErTELVuOSe1wx6x1lCLYYn4BPVQfJo4fkc0ze3lWA8tiWWr4x9
 MTd8KW1d4G/SGZmltYgQ26g2IKdvz3fIw1g/h5mNs2lnR6apvF9oAYjgJ1yrl82JqBsZe5
 kAFXa4ooD/NEko4qOXortVNlE20iW0I=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-590-98esXvRMOBGmMIusBTw74A-1; Wed, 06 Jul 2022 03:28:43 -0400
X-MC-Unique: 98esXvRMOBGmMIusBTw74A-1
Received: by mail-wr1-f71.google.com with SMTP id
 j23-20020adfb317000000b0021d7986c07eso423173wrd.2
 for <qemu-devel@nongnu.org>; Wed, 06 Jul 2022 00:28:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=+U8Q+/0izXxwFdoxYz7wOn6vHeVF5HKlErALMcibXRw=;
 b=D+ctWFXsJifEbWDKDupIgCYvECG0W5lfZGq4G9pwZfzvNgk3HCN3hU+DKwjmwG3fST
 jNY72EW3YuJzx7O+GQqJh1l8yzjhmXbm/Y7u7E/H9UximvAwlogBOZsaydTxacTGEhyR
 jMmIsY9P2sNKp/3RMlAVACpafM9dx1HoKgMkRw60i1Qv4t945yRoPajTbzclB6lhTa5n
 /6B/TGoSa82isuUNlj6pdrl0orfrP2dSFyAHRCes1a5GMKRJ90pnOowTm6Bb2ChmqXzl
 pPV7U5VVnuIK/1pM3GzyGIDYLCPA4AXD2L40DpNaRu+uAuu70pDuGnUcvPwHmR/tF7Oe
 15ZA==
X-Gm-Message-State: AJIora9f0m1RwEZH1FeTXz2b6t6r2YfYgJyjeNaePkMJDSbVKlIUT3gz
 rCLcA8ZeSLymzv91KWwnm8av+FiIpo1TH10wE+Jv4p0vE5dN6/TauI93hV5+zCdgvyFoPOZtB0w
 PhpN5G2Cr02//36E=
X-Received: by 2002:a05:6000:156f:b0:21b:a702:d595 with SMTP id
 15-20020a056000156f00b0021ba702d595mr36643522wrz.341.1657092522127; 
 Wed, 06 Jul 2022 00:28:42 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1ugTE8JIGeMQIzvwIEbrKrcVK3T5JBmoV66BXod3UUoweYee6bUgbcAuwVA+9n5rYzKAYewXA==
X-Received: by 2002:a05:6000:156f:b0:21b:a702:d595 with SMTP id
 15-20020a056000156f00b0021ba702d595mr36643493wrz.341.1657092521775; 
 Wed, 06 Jul 2022 00:28:41 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-176-21.web.vodafone.de.
 [109.43.176.21]) by smtp.gmail.com with ESMTPSA id
 b10-20020a5d4d8a000000b0021d4aca9d1esm17038496wru.99.2022.07.06.00.28.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Jul 2022 00:28:41 -0700 (PDT)
Message-ID: <576f7101-57e8-62e4-82a8-54de487e030c@redhat.com>
Date: Wed, 6 Jul 2022 09:28:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] iotests: fix copy-before-write for macOS and FreeBSD
Content-Language: en-US
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, hreitz@redhat.com, kwolf@redhat.com,
 jsnow@redhat.com, richard.henderson@linaro.org
References: <20220705153708.186418-1-vsementsov@yandex-team.ru>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220705153708.186418-1-vsementsov@yandex-team.ru>
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

On 05/07/2022 17.37, Vladimir Sementsov-Ogievskiy wrote:
> strerror() represents ETIMEDOUT a bit different in Linux and macOS /
> FreeBSD. Let's support the latter too.
> 
> Fixes: 9d05a87b77 ("iotests: copy-before-write: add cases for cbw-timeout option")
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
> ---
> 
> As John and Thomas noted, the new iotests fails for FreeBSD and maxOS.
> Here is a fix. Would be great if someone can test it.

Thanks, seems to work now:

  https://gitlab.com/thuth/qemu/-/jobs/2683487160#L3256
  https://gitlab.com/thuth/qemu/-/jobs/2683487162#L2897

Tested-by: Thomas Huth <thuth@redhat.com>


> I tried to push it by
> 
>    git push --force  -o ci.variable="QEMU_CI=1"
> 
> to my block branch, I get a blocked pipeline
>    https://gitlab.com/vsementsov/qemu/-/pipelines/580573238
> but it doesn't have neither freebsd nor macos jobs.. How to get them?

The instructions are a little bit hidden - you can find them in the 
.gitlab-ci.d/cirrus/README.rst file in your git checkout.

  HTH,
   Thomas


