Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DCB564B844
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Dec 2022 16:20:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p574H-0003py-Fw; Tue, 13 Dec 2022 10:19:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p574C-0003ov-8I
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 10:19:36 -0500
Received: from mail-oa1-x2d.google.com ([2001:4860:4864:20::2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p574A-0005oV-QN
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 10:19:36 -0500
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-1443a16b71cso12887213fac.13
 for <qemu-devel@nongnu.org>; Tue, 13 Dec 2022 07:19:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9DzXnTPjqNIhF7CLffTxZJwKOTKKRsPzuuABYBsX5to=;
 b=FXjpisMQyOH24icyJ5dobIFLtj4aezvo38G1KI3oSi4pCjRaQX1uxwhq4dHI+tNwBq
 5vJLEqxOveMflTfmLXBB8NXfFAjE5WqeP20WiYlrpgPLQJCZCf9ZQVjfCyCh0RSbF1TH
 PU8kcdQktQf5yX5ginmxoFUpdw4XFLaOTT0C4jpqjq6qnxJJdM8ScvyOQcKblVaOu+NE
 /H/97NWq/oRtLKNJXHuS262gb61qzZ+9075EZpsjXbn7TxouROGFiOt3aXiW2pdpbwxT
 VaDJj3Tg3pSY1x5qbjDuIgp0IYfGUScN/dasBijuzuK23A55gj3EPL32oZRfHeJigK2V
 eR8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9DzXnTPjqNIhF7CLffTxZJwKOTKKRsPzuuABYBsX5to=;
 b=2WFx+SHVlUYiO693QHwSwhhJZWk9BDb05Os8486AFvPDueIoLNLYyZL827Fn1Fa7lS
 gA+ePYnkDrhgrWnVXLYCfhZDWG90Hs1p6t4hKVwTCOVJi/5bkRgQ+bevy7Z3mWoFMoB+
 RKuqbB87ZHspeDowgjsvaBtMM1ynXvbwj9BLfz/siImi1dujhQKRd3NoBE6O5ns6gSC9
 31BF/+GAAKRgEUXrROhOJF2YtQCMbrLroHNQGNjzvzgGTUNOcdCaUeZJk0q86RyVBrC8
 Jh+lRYrd8JjkTuqKVUknzpuK9MEf55FOwV8FDKjJ5cniUgfRJznHSMR1lyFDMHwSR3mP
 dpWA==
X-Gm-Message-State: ANoB5pkA/ceoSj6a54++G2wXoaSRNjZ7zc/I6GbQcORp2uLziEu0Neeo
 UKMFdeV02OpwzpDwsjjVLPvQ7w==
X-Google-Smtp-Source: AA0mqf6PfS3aoWjp8yrLFZLR3tS735dYHKMi65UqVQRxqJ5gQDG9Y30k1J2UVThBi6LriEDkAXR3Tw==
X-Received: by 2002:a05:6870:f204:b0:137:3ada:723b with SMTP id
 t4-20020a056870f20400b001373ada723bmr10922488oao.40.1670944773540; 
 Tue, 13 Dec 2022 07:19:33 -0800 (PST)
Received: from ?IPV6:2806:102e:18:2efc:c63:85ed:4256:8ad0?
 ([2806:102e:18:2efc:c63:85ed:4256:8ad0])
 by smtp.gmail.com with ESMTPSA id
 p39-20020a056870832700b0011dca1bd2cdsm1591854oae.0.2022.12.13.07.19.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Dec 2022 07:19:32 -0800 (PST)
Message-ID: <fd0f2f01-fb36-0db1-3b95-8388b6f5457d@linaro.org>
Date: Tue, 13 Dec 2022 09:19:29 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2] target/sh4: Fix TB_FLAG_UNALIGN
To: Guenter Roeck <linux@roeck-us.net>
Cc: qemu-devel@nongnu.org, ysato@users.sourceforge.jp, balaton@eik.bme.hu
References: <20220901101509.145758-1-richard.henderson@linaro.org>
 <20221210152744.GA2275483@roeck-us.net>
 <20221212011345.GA2235238@roeck-us.net>
 <375e840f-a823-b1e8-3d3c-3b1b4298188e@linaro.org>
 <20221213045501.GA2456699@roeck-us.net>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221213045501.GA2456699@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::2d;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x2d.google.com
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

On 12/12/22 22:55, Guenter Roeck wrote:
> Do you plan to send a formal patch, or do you want me to do it ?

I can send a patch.


r~


