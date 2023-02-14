Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BEAF696888
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 16:56:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRxeu-0001jE-2U; Tue, 14 Feb 2023 10:55:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pRxes-0001iV-9S
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 10:55:54 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pRxeq-00055Z-ON
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 10:55:54 -0500
Received: by mail-wr1-x435.google.com with SMTP id a2so16156122wrd.6
 for <qemu-devel@nongnu.org>; Tue, 14 Feb 2023 07:55:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:from:to:cc:subject:date:message-id:reply-to;
 bh=QrcZBfES18ID7jZXjshyTlNSzcEuxcXdotEEcXF/MbY=;
 b=LaaNvR0r3trUyVZ5QgZoYLRAeeCUQigy+S1BYzu2MDQLWT9lNiPdjHUTPKyW3m23LZ
 bNL28KxDkkMp1OHZu1X++Y6JSHRp8feae4fQ8w8rCFZ2e/CMLRZATkHSnbGrJCdfL/Y1
 Ug1ksLxPyAG8gB2WmbyCYmtk0xqZNV1PjlI3BEHgamDeXn7OkDn8BEBYagdAhy+hwuWC
 9OOsjjS+WAAh20B92aJLAET1t3OC3K2n9mTJ4R8ropxCYacrJJLXzpZmkAEu0ZjXcTgD
 L9iOTKdjdjFnGumYov41PMtYyMtQQoxZecsgZR1g77fM3LO6xAYbu/raCOXYvltVxeCp
 TASg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QrcZBfES18ID7jZXjshyTlNSzcEuxcXdotEEcXF/MbY=;
 b=K8uxud+8fuQjleSJveQOzCUIndNu6do0MNj6CrlYEBxWMlo2ORaAkIoV4V1JqhlH0N
 6G7GuXIR1ftEzO9nh784LrLCpumukFl2uPPQOE5uHfNTigrLemCQPmf+/qZC62RoOtW6
 K1OUMzCpG0ExFR2AKSTOfMBb4kZRWZoKOhzhn2dGiwPkdWDxlWzPd0Ypys1l3GI5DpGB
 WSGvcguPTfWlvUVd+7Xo/Juvyri36g7mGYd+ecP1+8UVvlVRixRYCD3Q0CARuJduttmu
 1hCjT4U0eWP/IgMicLLvOIhLNlNVkKqAOcSSU4ci0UeuwJmsZQ0BNMSHbTjVnz+zHtQc
 zYjw==
X-Gm-Message-State: AO0yUKXpoJjCESEjD9ev/Uwafihxozf5WuxjT+rpJao/InjYKc7GAaki
 QzB5ly0khGeCwOKyXDnH4JM=
X-Google-Smtp-Source: AK7set8HO1avoOyXJY1B4MGAl7XN7QCWu/M7/82r+HLNuyBWzVDGs/3z9v6IOObkS3DSbBYoiy/FsQ==
X-Received: by 2002:adf:df89:0:b0:2c5:41e2:8bb9 with SMTP id
 z9-20020adfdf89000000b002c541e28bb9mr2415989wrl.57.1676390151261; 
 Tue, 14 Feb 2023 07:55:51 -0800 (PST)
Received: from [10.95.154.108] (54-240-197-224.amazon.com. [54.240.197.224])
 by smtp.gmail.com with ESMTPSA id
 d12-20020adfe84c000000b002c3f03d8851sm1601133wrn.16.2023.02.14.07.55.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Feb 2023 07:55:50 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <c4f52b9c-8f7e-ccf3-1640-69b9a74fa1b3@xen.org>
Date: Tue, 14 Feb 2023 15:55:49 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v10 51/59] hw/xen: Add xen_xenstore device for xenstore
 emulation
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Claudio Fontana <cfontana@suse.de>, Julien Grall <julien@xen.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, armbru@redhat.com
References: <20230201143148.1744093-1-dwmw2@infradead.org>
 <20230201143148.1744093-52-dwmw2@infradead.org>
Organization: Xen Project
In-Reply-To: <20230201143148.1744093-52-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=xadimgnik@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.35, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: paul@xen.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 01/02/2023 14:31, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> Just the basic shell, with the event channel hookup. It only dumps the
> buffer for now; a real ring implmentation will come in a subsequent patch.
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   hw/i386/kvm/meson.build    |   1 +
>   hw/i386/kvm/xen_evtchn.c   |   1 +
>   hw/i386/kvm/xen_xenstore.c | 248 +++++++++++++++++++++++++++++++++++++
>   hw/i386/kvm/xen_xenstore.h |  20 +++
>   hw/i386/pc.c               |   2 +
>   target/i386/kvm/xen-emu.c  |  12 ++
>   6 files changed, 284 insertions(+)
>   create mode 100644 hw/i386/kvm/xen_xenstore.c
>   create mode 100644 hw/i386/kvm/xen_xenstore.h
> 

Reviewed-by: Paul Durrant <paul@xen.org>


