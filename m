Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0DAB4728F5
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 11:17:23 +0100 (CET)
Received: from localhost ([::1]:60660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwiOZ-0003Lg-4T
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 05:17:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mwiMx-0002UA-Qh
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 05:15:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39946)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mwiMv-0004Yz-IR
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 05:15:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639390540;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kwgD069oFE/tjguetRN32UVG6Shdm9KiaY2Cl6xgz14=;
 b=WZ5To1OvzfTaDJWa2NI5XGBbzeQOGwPJuzGB30KZSy7TWFDi2KxbkO/vQRXtKhNWl/XW+D
 BMcKYfSL7dRf6svQSwGkqWnRf3ta/6KAOrZW5ldRaUiJ5xaT6dacv47pe0Xo2IBHwn0riP
 v68fEU16y05xmeke7eXiU9eN09aMg50=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-492-rLX603JFPHGbWwAoDu8Ktg-1; Mon, 13 Dec 2021 05:15:39 -0500
X-MC-Unique: rLX603JFPHGbWwAoDu8Ktg-1
Received: by mail-wm1-f71.google.com with SMTP id
 145-20020a1c0197000000b0032efc3eb9bcso11407673wmb.0
 for <qemu-devel@nongnu.org>; Mon, 13 Dec 2021 02:15:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=kwgD069oFE/tjguetRN32UVG6Shdm9KiaY2Cl6xgz14=;
 b=NtRyE8utaKI1L536hDp08wKekUJy1EKAaX/lidhLezhO3BkmZ+hY7YVRvThm5WvHmH
 R7I7AN6h5VDP15Z/vJFqW8xr0lpuLqvxBJMs/Pp3ojEVwZzy+0J9Tr+l5cO8v1U0k3YA
 8xdRP7e1uTJgjXH6rVWfUoxX6DLtHqddcoHJ9SDcr3gznzktlw3+xkkWwdHi+et+6pt+
 9KD7Osdqt6hlXa1PRQ48ZumfbjraIr6q8W3DqMJJn5oy/opPc5YFJIZC9EQjvZ56vfgy
 UxR2kH+BH5iyqgSkscfYEqJkYD343ZNpNwXLSMV7YIYBuMeCfYuzDwy8qOx6RF4xK7KR
 vAkg==
X-Gm-Message-State: AOAM533WIN84hJm348e+hSuaPHeUQCHgtZH9NQz/gMsUTaaNlOnjked9
 X/usQPvB9VYq2iq4/QLRutOD4b/hoRidEgP/sovZO2eU4Un544ueDLXZ93ii6midbtTHalrQtgP
 ii3eryFocZR3jnO8=
X-Received: by 2002:adf:d082:: with SMTP id y2mr31498453wrh.214.1639390537943; 
 Mon, 13 Dec 2021 02:15:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJweV0ezzlrS/AOFRXvqnBJP0xSgmalGM6EkeYXrbz6fNxziqevQcaSj9SseR2mgYCNG3uKijA==
X-Received: by 2002:adf:d082:: with SMTP id y2mr31498438wrh.214.1639390537806; 
 Mon, 13 Dec 2021 02:15:37 -0800 (PST)
Received: from [10.33.192.183] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id g16sm7929038wmq.20.2021.12.13.02.15.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Dec 2021 02:15:37 -0800 (PST)
Message-ID: <40b21d90-36ef-1b0a-a68e-32be46de4ac7@redhat.com>
Date: Mon, 13 Dec 2021 11:15:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v2 4/4] hw/mips/jazz: Inline vga_mmio_init() and remove it
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20211206224528.563588-1-f4bug@amsat.org>
 <20211206224528.563588-5-f4bug@amsat.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20211206224528.563588-5-f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -75
X-Spam_score: -7.6
X-Spam_bar: -------
X-Spam_report: (-7.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.713,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-4.093, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 06/12/2021 23.45, Philippe Mathieu-Daudé wrote:
> vga_mmio_init() is used only one time and not very helpful,
> inline and remove it.
> 
> Reviewed-by: BALATON Zoltan <balaton@eik.bme.hu>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   include/hw/display/vga.h |  5 -----
>   hw/display/vga-mmio.c    | 19 -------------------
>   hw/mips/jazz.c           |  9 ++++++++-
>   3 files changed, 8 insertions(+), 25 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>


