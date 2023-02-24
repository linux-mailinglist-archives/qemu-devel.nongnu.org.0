Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25E816A1785
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 08:53:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVSrs-0005Gu-4t; Fri, 24 Feb 2023 02:51:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pVSrp-0005GE-75
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 02:51:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pVSrn-0002hZ-D8
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 02:51:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677225102;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lDmOnh+7X3egziTUft0QahfDnLPawUenNeIpG1ugR48=;
 b=g19xXd0wusvQCyMVvIyIR3RU8tGHOUgZWvyxgwduMci1uEJCL+d54GKQoC0vA+eMUc0b5c
 dQ4at7DsDBbuHMCE8jmVJeHhmFkuNP1JKmFdRtvqkI8toPoSwu1ohRsyPhhL+z2RJMYYzG
 dYwDkMGPy5y7zIPuj7ZoA8hiP+sEVqY=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-546-bV1qWIh8MAG5O93YYVNTuw-1; Fri, 24 Feb 2023 02:51:40 -0500
X-MC-Unique: bV1qWIh8MAG5O93YYVNTuw-1
Received: by mail-wm1-f71.google.com with SMTP id
 m31-20020a05600c3b1f00b003e9de8c95easo2650053wms.2
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 23:51:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lDmOnh+7X3egziTUft0QahfDnLPawUenNeIpG1ugR48=;
 b=PwUv45br+np2QwHlaHfww1LnxBvaQSYodR9kDVxK2SXrDRJyigJbZOawGM5nleeh+D
 GxdJ2CFI1qJopihtB3euMOsw+i2zL54cnNRLbglTGBzt+L9zhXub1fomyzqKRkY+sjmr
 t9TCwQxXIW2gh1gHjYHMEYvSeFdEoIfNbwPLi1hvwY7goYP4FWQnegyVAIDe4hCJ4sI5
 X/YaGn8gRUstPnvXGkADLdgMwsNvz7yhjrSHqq6x4hfpELtGfq3/n2CLG1ZQ7wTAjGul
 jquj8tuRxZ+7w3bJCgunrxrKMnOU5N2rSGsBEFCDo/EvGt4IkR+kaLdtQqvrkkXvF72E
 O38A==
X-Gm-Message-State: AO0yUKUa8YnxxvXu1h6filRZZ0L5+6WzQ1GMXCzpPNrX7jf0hl2FbBcG
 8RWQBVHrAFJNKGvwL8MO6z/JhwV3dtkdHVujszIfCbROWcF7t7ID8iw39fVEqQhrkBQ1qmc3a04
 yxLfZaHoNh3E2mHE=
X-Received: by 2002:a05:600c:5117:b0:3dc:405b:99bf with SMTP id
 o23-20020a05600c511700b003dc405b99bfmr11441988wms.15.1677225099456; 
 Thu, 23 Feb 2023 23:51:39 -0800 (PST)
X-Google-Smtp-Source: AK7set9P9SuaWXutQbQMEHzK/2nG74VLb7sRLYjsxRN1QmmYqeeEjiYNfP14Glv5BSHqP/iicdRt9A==
X-Received: by 2002:a05:600c:5117:b0:3dc:405b:99bf with SMTP id
 o23-20020a05600c511700b003dc405b99bfmr11441976wms.15.1677225099154; 
 Thu, 23 Feb 2023 23:51:39 -0800 (PST)
Received: from [192.168.8.100] (tmo-115-119.customers.d1-online.com.
 [80.187.115.119]) by smtp.gmail.com with ESMTPSA id
 ja18-20020a05600c557200b003eb0d6f48f3sm1221199wmb.27.2023.02.23.23.51.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Feb 2023 23:51:38 -0800 (PST)
Message-ID: <3a15d5d6-39ff-e199-589e-e8bc3c5370a2@redhat.com>
Date: Fri, 24 Feb 2023 08:51:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v5 4/5] dump: Introduce win_dump_available()
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Janosch Frank <frankja@linux.ibm.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20230224073850.84913-1-philmd@linaro.org>
 <20230224073850.84913-5-philmd@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230224073850.84913-5-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.09, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 24/02/2023 08.38, Philippe Mathieu-Daudé wrote:
> Remove a pair of TARGET_X86_64 #ifdef'ry by introducing
> the win_dump_available() method. Doing so we can build
> win_dump.c on any target, and simplify the meson rule.

Nit: The commit description is a little bit misleading now since you 
introduce the #ifdef in win_dump.c instead. Maybe rather something like:

To make dump.c less target dependent, move the TARGET_X86_64 #ifdef'ry from 
dump.c to win_dump.c (and introduce a win_dump_available() method there). By 
doing so we can build win_dump.c on any target, and simplify the meson rule.

Anyway, you can keep my Reviewed-by here.

  Thomas


