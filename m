Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E62653AA80
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Jun 2022 17:53:30 +0200 (CEST)
Received: from localhost ([::1]:35666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwQf3-00016p-4W
	for lists+qemu-devel@lfdr.de; Wed, 01 Jun 2022 11:53:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nwQdo-00087K-Js
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 11:52:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57069)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nwQdm-0001Fp-TN
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 11:52:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654098730;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=osWXJRxDEx5e3VGCRTg4ed0fasmA8dL3ONc6frBrcIg=;
 b=eUtF8FkTJZU7qLeSAS/5zN+Niifh739q4jixZUKNc3hgHiVRb6D9AiRI2toefqiWYBOaim
 GD+NL1LDZ9nVraJ657LnA02yaVqfMp7YZXUXYhrGGM5abLedgqsvyf/1NJux5G91zwzDq0
 yz2AxneDE0/expACMv+0lQFFWT5T/QA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-247-frSQ7L1gNdOggZMh7j5ODA-1; Wed, 01 Jun 2022 11:52:07 -0400
X-MC-Unique: frSQ7L1gNdOggZMh7j5ODA-1
Received: by mail-wm1-f70.google.com with SMTP id
 k16-20020a7bc310000000b0038e6cf00439so1355726wmj.0
 for <qemu-devel@nongnu.org>; Wed, 01 Jun 2022 08:52:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=osWXJRxDEx5e3VGCRTg4ed0fasmA8dL3ONc6frBrcIg=;
 b=b13Bn+7dNM1Yw3It4264Q5S946CfHfh8rq8w8Px6SIqXcXkE04Ns31aTehsTAD+kiZ
 tqYfaTfN9g8We3JkQIszsRH+b6M44RmZuoy5tLwlmttf7hRh+phEj3vuABORmaysRMup
 RiP90Pp1m2+eO7bVC+lIJb72PmGAVzLRx9+knL0Gzjj2TBDTI+EmQfNX9KptkzIzMCbC
 NoJfGbMV7P5lQZqZA/XzZM7LV6SAcSzCr/agJaWqyBA3SD/HgE7DKBcn2LX1EMlqpu0y
 fO+oeN9oP9b/z2ikAiLlTiiwz3Q03x6nJZiVJ6V4ryuswN7rFYPWvVbzHJJKJ61llh8c
 AVSw==
X-Gm-Message-State: AOAM533OgVMq7LXwR5g7EMpqm4miBcT16ViBBAyWEPvSp+qjVIvA5k3x
 DUIoF/Ef1npjb/n+ZVxLtKr8IMEpArQfyu8arsl+N/ozBVCm4JJN7kBK5LuDEtTg55SSJflH2+r
 hobGjMZETzNKsbxQ=
X-Received: by 2002:a05:600c:4618:b0:397:84aa:5585 with SMTP id
 m24-20020a05600c461800b0039784aa5585mr36795wmo.21.1654098725989; 
 Wed, 01 Jun 2022 08:52:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJweYJvr7B6RnmTnuD5onVR4hIaTX16crvH+NmBzAR4uU/oGV7YLF6ME+z9uzrURiCDsLx4Obw==
X-Received: by 2002:a05:600c:4618:b0:397:84aa:5585 with SMTP id
 m24-20020a05600c461800b0039784aa5585mr36777wmo.21.1654098725824; 
 Wed, 01 Jun 2022 08:52:05 -0700 (PDT)
Received: from [192.168.0.2] (ip-109-43-179-51.web.vodafone.de.
 [109.43.179.51]) by smtp.gmail.com with ESMTPSA id
 h13-20020a05600c2cad00b00397623ff335sm2539769wmc.10.2022.06.01.08.52.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Jun 2022 08:52:05 -0700 (PDT)
Message-ID: <7f9ded05-2b08-ec4f-bd3e-2e0b710795d6@redhat.com>
Date: Wed, 1 Jun 2022 17:52:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2] tests/tcg/s390x: Test overflow conditions
Content-Language: en-US
To: Gautam Agrawal <gautamnagrawal@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, cohuck@redhat.com, david@redhat.com,
 richard.henderson@linaro.org
References: <20220531183524.40948-1-gautamnagrawal@gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220531183524.40948-1-gautamnagrawal@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 31/05/2022 20.35, Gautam Agrawal wrote:
> Add a test to check for overflow conditions in s390x.
> This patch is based on the following patches :
> * https://git.qemu.org/?p=qemu.git;a=commitdiff;h=5a2e67a691501
> * https://git.qemu.org/?p=qemu.git;a=commitdiff;h=fc6e0d0f2db51
> 
> Signed-off-by: Gautam Agrawal <gautamnagrawal@gmail.com>
> ---

Thank you very much, queued to my s390x-next branch now:

  https://gitlab.com/thuth/qemu/-/commits/s390x-next/

  Thomas



