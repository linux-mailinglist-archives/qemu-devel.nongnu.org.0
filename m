Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AB9064A363
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 15:31:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4jpx-0000u5-DM; Mon, 12 Dec 2022 09:31:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p4jpu-0000r7-Mp
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 09:31:18 -0500
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p4jpt-0000kg-4L
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 09:31:18 -0500
Received: by mail-oi1-x230.google.com with SMTP id c129so11400433oia.0
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 06:31:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=TooInRFNPUnJXPrRT0XlcEsCnVocukj/48ur3E6pUBI=;
 b=ohrO/j0oSzbKgNZMp/kaqfc0ExrvZCQ/GVsPKFIHc/2QVODheN6+oBB5TZfQEgNt6J
 md0VsoVYjkWgf6neZYmnHXzihNvHWgl8/A2K86rJyV5P8kgOWodXfP5b4lA/UWv3i+Ep
 TcXTJO5JEKyqkAXeyqVPAkbJ0B3HDC1V6YOTl1DXiCdAJTG/tRL05FAbEveUVWdrWxPg
 rWrPjnfwIGQsNYOyBtdJFHle7OeMjlIqwjnGJeDGXuBEqZQ/ZLDFi+lEMVm+koJVMg2S
 v2cWTdZwq4u78yff49vj4fhDDeYYKEcYv0MQ3IP5IFJkX+fnRgdd39oHaVBAVYiZjS7z
 VHag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TooInRFNPUnJXPrRT0XlcEsCnVocukj/48ur3E6pUBI=;
 b=P79OgymUSk1JKBd/gPUKW/XR7Mt26pcFwgNKAZuFDlz26m5hlOgb5FamZHwmdVnSJz
 eA9o363a8I7sjDeA1VvWQxW2l/LZeCFxXHXTyzov+9GXMy1yeAZjhDexsYm+V14n2Poa
 u9KSGIBlzksZDFPU2dVgdInY/BIAb1mKAB1Ky3rthFXR0LK8sGRensIGR5NFqqrm3vfB
 7fATRmeUXwyjlZrxjXAz1KrQLxzvnWp9HDBhbosidprL7f4zCwoifqnsUWPwy1MSIYtf
 038PdJoFxUysUZSyBppm7kzHLX6X6J317yzd0vbh/njlK3F82rEg+4UH9tnWfOZw7EtJ
 iq+w==
X-Gm-Message-State: ANoB5pmuYo9CVP5T20JRJbQ7qF9RZSrQrRQ7YJGeGvaaqKSttpjC+bNA
 YovQdg0owgBi9JJKTumAIJ+WjQ==
X-Google-Smtp-Source: AA0mqf4SnTbszZYzrbyk1imaD23pvVxZteLWmc2ZE9msAEe1bKDuXYsX9abw46q0ASsR6uB70wdsSg==
X-Received: by 2002:a05:6808:1a14:b0:355:1deb:107a with SMTP id
 bk20-20020a0568081a1400b003551deb107amr9462157oib.4.1670855475785; 
 Mon, 12 Dec 2022 06:31:15 -0800 (PST)
Received: from ?IPV6:2806:102e:18:2efc:20f0:1d0e:8e1f:fff0?
 ([2806:102e:18:2efc:20f0:1d0e:8e1f:fff0])
 by smtp.gmail.com with ESMTPSA id
 j12-20020aca654c000000b0034d9042758fsm3543313oiw.24.2022.12.12.06.31.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Dec 2022 06:31:15 -0800 (PST)
Message-ID: <aa38c4dc-4d61-3733-bbd4-26d5d3ec4596@linaro.org>
Date: Mon, 12 Dec 2022 08:31:12 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH-for-8.0 v2 06/11] hw/mips/malta: Use bootloader generator
 API for nanoMIPS CPUs (1/5)
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Dragan Mladjenovic <Dragan.Mladjenovic@syrmia.com>,
 Milica Lazarevic <milica.lazarevic@syrmia.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Djordje Todorovic <djordje.todorovic@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Bernhard Beschow <shentey@gmail.com>
References: <20221211204533.85359-1-philmd@linaro.org>
 <20221211204533.85359-7-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221211204533.85359-7-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::230;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x230.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 12/11/22 14:45, Philippe Mathieu-Daudé wrote:
> Similarly to how commit 0c8427baf0 ("hw/mips/malta: Use bootloader
> helper to set BAR registers") converted write_bootloader(), convert
> the equivalent write_bootloader_nanomips(), allowing us to modify
> the bootloader code more easily in the future.
> 
> Part 1/5: Convert PCI0 MEM1 BAR setup
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

