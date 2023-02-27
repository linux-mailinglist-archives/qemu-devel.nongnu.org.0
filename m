Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 515616A412F
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 12:51:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWc2A-0007en-Ii; Mon, 27 Feb 2023 06:51:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWc27-0007al-7j
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 06:51:07 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWc25-0008MO-Es
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 06:51:06 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 d41-20020a05600c4c2900b003e9e066550fso3639925wmp.4
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 03:51:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xGDPD46J+liiMWD4K48yRklDFGhlsS8ebt66AtpQhXw=;
 b=pPVYY2PaklxqNeFS/Z0ZqzdqsxUL5ePhTGyDsd+gJzo+5bIIOE1aITBQnG6228aZCy
 FlLqeApYl4ylgowNp4bv51BInch1Qto+vaLI+iFry7GtQkuUHM0oUDWdhDuJoqCvIGRw
 7xU4LySuZ9z1jbhMYfw9bt4w/ySyTiQ177wQXGJ5Aq+Z0wJTaNPzVjVc3ItO5R4L244X
 ZPS/mzTBW44SIYtzyZCFG/k9lgO5CvJzbb32Yg26YXpkkTO8nsdt66Zl37n79tXAEHGV
 qaSdkNkFIsFiQYicfTIUhpSsZtYgMkkRzbd3KRWVMH0Gww/PMKOsDjx9j841REKT71Nx
 KjEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xGDPD46J+liiMWD4K48yRklDFGhlsS8ebt66AtpQhXw=;
 b=L2EqFw/qzUZ9C5fOBl3s8Dj/KJx5iyK/herhltE8eON08K8zZ3H+58iUAjPDkRlAi/
 +ljtjj8IvQxydwQY8pvUjNPurA2XzXgC1s0r654IKlPxu0/C9gyKvJErUDG2Ww7ltZ8x
 ztON/37ovvwiJuMCpOK1DC6SXFN7T3m2824GNINkf5eKW1kD07Sh5uSkA41V5/cZniJi
 qgxC4ng2AU/+daWBwbEJPsN0hfMlIn2HlyyUBdJWQpshOEeMD4DkP9MTSiROA+tERRCZ
 E3+DR4Ky2JfaPat8qecL6AxpriYI+lFktfq3eu2K8otLGNF/3ppA2l/LE0TvEJlRPsJy
 LXPA==
X-Gm-Message-State: AO0yUKXVvr3YqsM6o4eXrp0XBOQ//ParKv+EAIzBKoncY5tDDTRuTcAo
 hLJEe5TgdaWI1H3xZdE2KTPCkw==
X-Google-Smtp-Source: AK7set885dv86MFDGAFKcIOZSMAgdudqZvP/EKh7wHMOVfZ/Zw0DKwbbJ4O1eF7lX2RNY1Z6Zl8qXw==
X-Received: by 2002:a05:600c:3b1e:b0:3ea:e5fc:a5a4 with SMTP id
 m30-20020a05600c3b1e00b003eae5fca5a4mr9887608wms.1.1677498663846; 
 Mon, 27 Feb 2023 03:51:03 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 i5-20020a5d5585000000b002c569acab1esm6911157wrv.73.2023.02.27.03.51.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Feb 2023 03:51:03 -0800 (PST)
Message-ID: <8f99c17b-217a-a8af-76e9-b55f9f0a58b3@linaro.org>
Date: Mon, 27 Feb 2023 12:51:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 01/12] hw/i386/ich9: Rename Q35_MASK to ICH9_MASK
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Eduardo Habkost <eduardo@habkost.net>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, Thomas Huth <thuth@redhat.com>
References: <20230213173033.98762-1-shentey@gmail.com>
 <20230213173033.98762-2-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230213173033.98762-2-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.089,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 13/2/23 18:30, Bernhard Beschow wrote:
> The Q35_MASK macro is already defined by TYPE_Q35_HOST_DEVICE, so let
> TYPE_ICH9_LPC_DEVICE have its own one to prevent potential name clash.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> ---
>   include/hw/i386/ich9.h | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


