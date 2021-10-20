Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A759434BCE
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 15:07:32 +0200 (CEST)
Received: from localhost ([::1]:56294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdBJa-0001u9-T4
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 09:07:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mdBET-0007JB-F0
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 09:02:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38476)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mdBEO-0002RF-2X
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 09:02:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634734924;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UdnLekge+Tlk8zswJQagBB+tImfydaqEw6Br932jXcA=;
 b=R1p2UXFJaeVssc6QiZARD0n0WOqjvIYP+ISI4NvlsNhsUW+19mq/W5B+PdD3zLxmW5U1jv
 EyP31KxCZKMzWQp+y/AUFTzKPJ1p1YSe8N9lVY7O8C/deeG+OosP4JXf/MmipKlxDE2QQ6
 N7IogkU7g2cWxCBgn+sn7LNB/0Kg40w=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-426-sKu5TK4JNB2eF4DOxFgAGQ-1; Wed, 20 Oct 2021 09:02:03 -0400
X-MC-Unique: sKu5TK4JNB2eF4DOxFgAGQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 128-20020a1c0486000000b0030dcd45476aso4177134wme.0
 for <qemu-devel@nongnu.org>; Wed, 20 Oct 2021 06:02:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=UdnLekge+Tlk8zswJQagBB+tImfydaqEw6Br932jXcA=;
 b=ZWJW3er0knA8Zd7ZXnIn1qSF2l6TkwdMXCy25bYZUmEZoXpp2aDnaO4j5b6+e5+RCw
 c7Bx3YEDdsB9gmPvv7oldDpSENJVQCSbD+UfIWVQ+762n5nA/NGftBO0jXGfpcD5LkGG
 msk3UeDKOWuQx63ryKhZIyqBksN59XPRZy56JW+xt2jkYV8Wd9jp4Qs4qpX621pjPSxs
 lsFJp7Ha1zu0bF8qiL4WWL86Ea+RGya69aFRJ9pSWLlNX+zdFj8OmdPQB6pPqmTwk20d
 2BOWeHIg8AQcsRprVfmREgcz48AE+6o8RV8pp6dLYhI/nJ9h2e7nhT6slPK9FnfIBPg5
 gI5Q==
X-Gm-Message-State: AOAM532KMH0mKzbOpbbOconTkriunFLQj+NCz9EI2NuPromjrVHDBvZ8
 TZ5vBzAjPBC6NmbRnbVfijjnqQAfnSjkOizhmr6yUIbKHfkZXXqcxH0ZtxleTVqka9jivITB1Q2
 +zD9MO1igQcl9keA=
X-Received: by 2002:adf:a48e:: with SMTP id g14mr52185827wrb.11.1634734921367; 
 Wed, 20 Oct 2021 06:02:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxJEyzj9BBz5RvBxpsx0N5y0dtORfXVBikXHq0ZyUqRsHKjRrFslJh17qQdgCr8KNiZjhLFLA==
X-Received: by 2002:adf:a48e:: with SMTP id g14mr52185779wrb.11.1634734920979; 
 Wed, 20 Oct 2021 06:02:00 -0700 (PDT)
Received: from [192.168.1.36] (33.red-81-36-146.dynamicip.rima-tde.net.
 [81.36.146.33])
 by smtp.gmail.com with ESMTPSA id g3sm2257371wri.45.2021.10.20.06.01.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Oct 2021 06:02:00 -0700 (PDT)
Message-ID: <f2922591-0335-b319-a3df-4b0a95b4e5fb@redhat.com>
Date: Wed, 20 Oct 2021 15:01:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v2 2/6] hw/riscv: opentitan: Use MachineState::ram and
 MachineClass::default_ram_id
To: Bin Meng <bmeng.cn@gmail.com>, Alistair Francis
 <alistair.francis@wdc.com>, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20211020014112.7336-1-bmeng.cn@gmail.com>
 <20211020014112.7336-3-bmeng.cn@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211020014112.7336-3-bmeng.cn@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.267,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/20/21 03:41, Bin Meng wrote:
> Using memory_region_init_ram(), which can't possibly handle vhost-user,
> and can't work as expected with '-numa node,memdev' options.
> 
> Use MachineState::ram instead of manually initializing RAM memory
> region, as well as by providing MachineClass::default_ram_id to
> opt in to memdev scheme.
> 
> While at it add check for user supplied RAM size and error out if it
> mismatches board expected value.
> 
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
> 
> ---
> 
> Changes in v2:
> - add RAM size check
> - assign mc->default_ram_size
> 
>  hw/riscv/opentitan.c | 16 ++++++++++++----
>  1 file changed, 12 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


