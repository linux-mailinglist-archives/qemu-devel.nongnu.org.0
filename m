Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DA634420D7
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 20:28:41 +0100 (CET)
Received: from localhost ([::1]:37908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhcz2-0002tu-8u
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 15:28:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mhc3C-0006Gz-0P
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 14:28:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45706)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mhc2j-0001RK-Ns
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 14:28:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635791305;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=afkIpBHPbWlkQ2IRWsQHdL9hSaZY7W79ShAJ6so7irM=;
 b=f+awjK1XnK/3LnmjSwv5weM9Y0xfV05o8Y0EhHSADdM8TO9NVOOfO2aNGaskFN4q7HKnpY
 Xajw/tJirlT2GiVSoVUQZ086la9BFUpszNrnFg81Yk564xbllfkDgSqxTH/HvKH6d39KXJ
 ERxEDdXVplWzgMbVhUFYq9cJ3l2oGSE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-253-dCtsU8exOECtneJKBWjbKQ-1; Mon, 01 Nov 2021 14:28:24 -0400
X-MC-Unique: dCtsU8exOECtneJKBWjbKQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 z138-20020a1c7e90000000b003319c5f9164so29996wmc.7
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 11:28:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=afkIpBHPbWlkQ2IRWsQHdL9hSaZY7W79ShAJ6so7irM=;
 b=nIHbnTkC8nbgUIYURNJQ/kKvaVtE275RC7Odbbk4K92kC23l5/LhxfWN8j1Zs6AWNA
 l7Ns/1hymdVW0e9JQHyT6COcEb9p2kGxWczVuqlqIcGwmCjJy7jH9cnVrHQBRDfN9jrY
 jgJQROc90/r84QBnse796TkciWgr3b+KL5tyk60asFPRtqTmRyhK2/WLdGLntCjzfCVw
 MqKZeS1P3RycsurXgcA3hhw7njgUpE7WqPr0S7WBV8F1bDvkAC2mlbyFoupCw24TdTcg
 5+DDGflWcy7S++Pky66I7TkTsC2RwUv5X+k2qENwA6xxkMTomYprHpAuvDN925mFBU0s
 1wJQ==
X-Gm-Message-State: AOAM5322zr346PyGN6xuvsX9yI1I4t+0yFMQce2SjUnT7spOPqS4PolV
 80L58tID34I5Y9FFJyQrEMph59vdQuHlj1Two7Jf5lx8FxIg2Hzy/0raPbM93tHYy0Nvn6wL4TV
 XeNMfiBBlNPuuWH0hfMCgaDCI2moqn4d+ZeBWARKo97jtt436sJZtINqTW9XEVAby
X-Received: by 2002:adf:ec90:: with SMTP id z16mr12734436wrn.247.1635791302673; 
 Mon, 01 Nov 2021 11:28:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzCuD4ROV4trni+0CH40xDhl7Bss2uYpEBs1YjR9WQkBQQwv0AFOIZl3ipWFmQXGbiTuuryVA==
X-Received: by 2002:adf:ec90:: with SMTP id z16mr12734410wrn.247.1635791302475; 
 Mon, 01 Nov 2021 11:28:22 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id l2sm619825wmi.1.2021.11.01.11.28.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Nov 2021 11:28:21 -0700 (PDT)
Message-ID: <b00199a5-cf03-e94e-266e-748953ff0d38@redhat.com>
Date: Mon, 1 Nov 2021 19:28:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 0/4] hw/core: Restrict qdev-hotplug to sysemu
To: qemu-devel@nongnu.org
References: <20211028150521.1973821-1-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211028150521.1973821-1-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.734,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.14, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Yanan Wang <wangyanan55@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/28/21 17:05, Philippe Mathieu-Daudé wrote:
> Restrict various hw/core/ files to sysemu,
> add stubs for qdev-hotplug.
> 
> Philippe Mathieu-Daudé (4):
>   hw/core: Restrict sysemu specific files
>   hw/core: Declare meson source set
>   hw/core: Extract hotplug-related functions to qdev-hotplug.c
>   hw/core: Restrict hotplug to system emulation

Series queued to machine-next.


