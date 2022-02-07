Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B70054AB843
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 11:07:07 +0100 (CET)
Received: from localhost ([::1]:47288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nH0vK-0007z0-IO
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 05:07:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nGzjp-0004O2-PU
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 03:51:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57622)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nGzjo-000245-7L
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 03:51:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644223866;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fo4bp7LSg0FI5RutP3gD7ilyaX6iDu3gKyEnCHBI6x8=;
 b=T3xXZ0exUXKWiT8We1BkVb1Aeew52C8DTDmAKikPZn3M0NUJzlYQWJsq24A6FN9LId2BW4
 6fqvSLmKFWIv/hP6SlrivG9Kvm/Ajg9KTaoc37roVUQkKx+TQ0Rpn67AhbcU4WqRMUKxHo
 HKeYp3ZHDu7i+ijgSojg7XGFXS6lNpg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-379-JrbHIXmUNgi20o4fR2Lkbg-1; Mon, 07 Feb 2022 03:51:04 -0500
X-MC-Unique: JrbHIXmUNgi20o4fR2Lkbg-1
Received: by mail-wm1-f72.google.com with SMTP id
 f7-20020a1cc907000000b0034b63f314ccso5344281wmb.6
 for <qemu-devel@nongnu.org>; Mon, 07 Feb 2022 00:51:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=fo4bp7LSg0FI5RutP3gD7ilyaX6iDu3gKyEnCHBI6x8=;
 b=NnKJ0mm1JS4w5UXQXyxP+lHWHxQ8qYdRSiiSOul0Th56olr0Z6ZoLLo97GNJh9C3MM
 Uhc385QV9X7NQbD4f97esA0BdnCayYb7hKbPqjp1tkbjJ6NWQfONKh9xTTkwz79NaYjx
 aC+YNLgxLwOTGGJQOIwaZ9OezoOH2uQzc9sBWFcuLyC3foBtMIFrDGmrhh8YklmgfaB6
 GGWf9RiXYTF2/V9U7j0u4JdaPNNoH7a7XGo9tljBGaTHHccgLoEWmmD0fntXVQY1nPmn
 BxY1T8yN4omWumlq3FR/t3tF4t2S1UjZWZIBHolMIKDKozWzfQY8R3V3gJLscyDjcpz+
 ljPw==
X-Gm-Message-State: AOAM533gkENw21NlEje2znEV7skmSGlJR1JibLlM3mH4fV+49A1fvpw/
 KySRzir0JVF7UiA3VHVgRM4R32kUImgMC2KJg0yZM3wbBJhmDzG2SK5Be34Ml3WzSqIfxUOPj0Q
 yhJJcjPIvo1lbg7U=
X-Received: by 2002:a5d:4b83:: with SMTP id b3mr4260024wrt.311.1644223863257; 
 Mon, 07 Feb 2022 00:51:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyTOkSg5a2fkSdBoX1uJEbKTzYjITVHbR5nvDi+lJtQ35ZsoiXBNfN40nM7/mdzCWDBtlAclA==
X-Received: by 2002:a5d:4b83:: with SMTP id b3mr4260017wrt.311.1644223863077; 
 Mon, 07 Feb 2022 00:51:03 -0800 (PST)
Received: from [192.168.8.100] (tmo-096-196.customers.d1-online.com.
 [80.187.96.196])
 by smtp.gmail.com with ESMTPSA id g22sm3102305wmh.7.2022.02.07.00.51.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Feb 2022 00:51:02 -0800 (PST)
Message-ID: <2b8db685-ef24-cfd7-6942-526152cbe166@redhat.com>
Date: Mon, 7 Feb 2022 09:51:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PULL 31/31] linux-user: Remove the deprecated ppc64abi32 target
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 peter.maydell@linaro.org
References: <20220112112722.3641051-1-alex.bennee@linaro.org>
 <20220112112722.3641051-32-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220112112722.3641051-32-alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: Beraldo Leal <bleal@redhat.com>,
 "reviewer:Incompatible changes" <libvir-list@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-devel@nongnu.org,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/01/2022 12.27, Alex Bennée wrote:
> From: Thomas Huth <thuth@redhat.com>
> 
> It's likely broken, and nobody cared for picking it up again
> during the deprecation phase, so let's remove this now.
> 
> Since this is the last entry in deprecated_targets_list, remove
> the related code in the configure script, too.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>

  Hi Alex!

What happened to this patch here? Seems like it got lost in v2 of the pull 
request?

  Thomas



