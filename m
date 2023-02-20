Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1087669CF38
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 15:20:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU71r-0004OY-R4; Mon, 20 Feb 2023 09:20:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pU71p-0004OH-Mg
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 09:20:29 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pU71o-00057H-7Q
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 09:20:29 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 l2-20020a05600c1d0200b003e1f6dff952so1196865wms.1
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 06:20:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:from:to:cc:subject:date:message-id:reply-to;
 bh=x/1GhGQHt+kVkDU6z8JhqdiAsl1hYh9jMiXcEtELqJ0=;
 b=IpLO5WwwtlCxLWjnhQPpH/cIKNXb797lq6Sll41wA69dd5OZokCEVRkTyuziG6ZBux
 rdDPU3Q3w4kFrVO1EUWZtCxgKfwsAXJA8nxal8i1yhyusPw4fMdQOjHyuIICJjwZmaOx
 xQgFvM+GzFl/4Uv45qnL6T96I30gyNR6MwnqgeGkg3N7PE5sR2mtTSKjg/KGkITgYz5v
 hDLxyBBfDe5tLVmizveoNAUIgk62e3TS4esdR7lRSXe88xOYS9hA9SuC2hkhcr0s1p0x
 EHftH/5iqlgcULvpRRmZbGhEE/13IJphFOt3phUNx162wTidPXTtmfiuQlw71JHxSmVF
 /mWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=x/1GhGQHt+kVkDU6z8JhqdiAsl1hYh9jMiXcEtELqJ0=;
 b=4up2N+h1MaZk70izr9mKeE3BOJJIEc2IQ2uP+s+d+yOZLBMY7pgM8d0hamhD8iJofA
 fjMUFfsk9Pe219E0l2UEusW2T82BehdmZen7o3z2bsNh6ZYbW2YEoS0hqTfSDgEudGil
 9c+UKJIav1KinT+pY5rde1TpE2L6sao/UM+M3xTbYEFzY4wYH0eyum0zOwP/YqByHtR3
 kcK+6EQG0D638FANmXb6xzewMfmdzv14+r/5C97N/Kv+2mLX5oRFY7cY+9IdYs6O8jHB
 zc8vnEHI2e7EaJVulgwMwits2vNfAFL+E7eNLXXIxTyy4voJJ0CZnx3K8aCvT9+zaCKM
 2QLA==
X-Gm-Message-State: AO0yUKWd0pS6zf4ZYVb6Fovx3sR31oaMDPORUSQj+7/xbqFXwHUpMyWY
 K1zPOv/jJXrkgm32ge5aWXQ=
X-Google-Smtp-Source: AK7set8+iE9Q8hYceUR5cIohLwqW8sQp3f+5QXkS10PN5U1taYQ746zHid5m7gNziVyzg6ewj9L2WQ==
X-Received: by 2002:a05:600c:1615:b0:3e5:16a1:f470 with SMTP id
 m21-20020a05600c161500b003e516a1f470mr1596315wmn.21.1676902826553; 
 Mon, 20 Feb 2023 06:20:26 -0800 (PST)
Received: from [10.85.37.29] (54-240-197-224.amazon.com. [54.240.197.224])
 by smtp.gmail.com with ESMTPSA id
 c6-20020a05600c0ac600b003dc434b39c7sm1365799wmr.0.2023.02.20.06.20.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Feb 2023 06:20:26 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <efe11a2b-59a0-200e-d144-59dc703b7d05@xen.org>
Date: Mon, 20 Feb 2023 14:20:24 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v11 44/59] hw/xen: Support mapping grant frames
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
References: <20230216062444.2129371-1-dwmw2@infradead.org>
 <20230216062444.2129371-45-dwmw2@infradead.org>
Organization: Xen Project
In-Reply-To: <20230216062444.2129371-45-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=xadimgnik@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.09, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 16/02/2023 06:24, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   hw/i386/kvm/xen_gnttab.c  | 73 ++++++++++++++++++++++++++++++++++++++-
>   hw/i386/kvm/xen_overlay.c |  2 +-
>   hw/i386/kvm/xen_overlay.h |  2 ++
>   3 files changed, 75 insertions(+), 2 deletions(-)
> 

Reviewed-by: Paul Durrant <paul@xen.org>


