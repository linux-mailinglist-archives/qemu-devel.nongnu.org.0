Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4CC769FDC3
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 22:36:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUwll-0006Oj-7J; Wed, 22 Feb 2023 16:35:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUwlY-0006Mm-9u
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 16:35:09 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUwlL-0004tD-Ou
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 16:35:05 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 m14-20020a7bce0e000000b003e00c739ce4so6359303wmc.5
 for <qemu-devel@nongnu.org>; Wed, 22 Feb 2023 13:34:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DroHQHAdsQkleUlFykS8a3nBxmF7hcBNflBrwropWrM=;
 b=EvjBk6zvKQlPuM5flWDxCBm9aZrVXgtB56CXl3E5CFB9rJSchuIACz7HOSfmBrWH+P
 e2vVOCYe2LoqzGVegPy5fyHpunJnKGuo4HZ1NudxJZebK2LMsuKG0UvFpfYZ/E1wSkqh
 4nXj9YESc8nvrHpG1vjWkA7g1vokeqQk5/IqTpliwQPN+RKncttwoOFRA18y8FLYHOuz
 rKIwYwnUbJ3pt7mh6KprhW2YzzY5LuAnmICQNQFjqoMp6MDs2S80nSmOpJqGYuKP0Lru
 t9cULxdYghoMYnUmKKiC4rad0KVt56J+bvJvGPNihZmEtUC2NsMXd0Ta0C12bo+nD2P+
 gHDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DroHQHAdsQkleUlFykS8a3nBxmF7hcBNflBrwropWrM=;
 b=p2sC8kTapSNBgMM9gKFyuW8LM1VST8DyaU0+3CiJOgLkKKI4hAqb+4APouQIySN95z
 g22PdiVbVG0QOPnJjJBY7VqZwE0xjJ5F78PR9RVNDJmpYqq/jNnmla2HRxh+K/YqCu8g
 J4yV8Ex3jmaTFnJ80bU9NwdrJtPWtI+3BWB1wAiIJPRvkIIEVwEstPCseH5Yjio8xM4t
 o1F7gT9wVzd3oNxq+PQId9cZOZWNObNWhJEN5PLlUG+Q2NAXF/gXoKYwngG6WN/j+Lva
 VMlrh27POiFBEYQ4UeREPE+Gmze7n2DExS6K+heq+K1Q9cF+4PCk17Lq0sLzf1JyQbo7
 fi6Q==
X-Gm-Message-State: AO0yUKV4anx8PDrBQ3aX21SzSIwKBkrIz6/2KQvaYMa+qwGY77iK50PX
 S2i6qqVElEqdDmaWbeH+bE1DvaUev2tCbmca
X-Google-Smtp-Source: AK7set/nL6GNX8pzGlxr8UYxySMJAdNbiZE5u9lZ56NBkyBWBSVt3613cr8WzFAy/osWXGe7qWuWMg==
X-Received: by 2002:a05:600c:43d4:b0:3dc:58a2:3900 with SMTP id
 f20-20020a05600c43d400b003dc58a23900mr641757wmn.29.1677101692547; 
 Wed, 22 Feb 2023 13:34:52 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 j29-20020a05600c1c1d00b003e204fdb160sm3380088wms.3.2023.02.22.13.34.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Feb 2023 13:34:52 -0800 (PST)
Message-ID: <00dd2e23-7b5c-272f-b8ea-f0d1677d18da@linaro.org>
Date: Wed, 22 Feb 2023 22:34:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 0/3] hw/acpi/cpu_hotplug: Convert 'Object *device' ->
 'DeviceState *parent'
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: Ani Sinha <ani@anisinha.ca>, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20230203163021.35754-1-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230203163021.35754-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.102,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On 3/2/23 17:30, Philippe Mathieu-Daudé wrote:
> To ease code review, rename ACPI CPU hotplug variables
> to more meaningful names.
> 
> Since hotplug parent can't be any QOM object, and must be
> a QDev, convert AcpiCpuHotplug::device from Object* to
> DeviceState*.
> 
> Philippe Mathieu-Daudé (3):
>    hw/acpi/cpu_hotplug: Rename gpe_cpu -> gpe
>    hw/acpi/cpu_hotplug: Rename 'parent' MemoryRegion as 'container'
>    hw/acpi/cpu_hotplug: Convert 'Object *device' -> 'DeviceState *parent'

ping

