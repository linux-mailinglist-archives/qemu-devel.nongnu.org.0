Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C692D33056C
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 01:39:54 +0100 (CET)
Received: from localhost ([::1]:51006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJ3w9-0003c0-S8
	for lists+qemu-devel@lfdr.de; Sun, 07 Mar 2021 19:39:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lJ3tl-0003Bm-Tk
 for qemu-devel@nongnu.org; Sun, 07 Mar 2021 19:37:25 -0500
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:42413)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lJ3tj-0000ee-3t
 for qemu-devel@nongnu.org; Sun, 07 Mar 2021 19:37:25 -0500
Received: by mail-pf1-x42f.google.com with SMTP id w18so5986708pfu.9
 for <qemu-devel@nongnu.org>; Sun, 07 Mar 2021 16:37:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=TITAh6awL0LASkK6XSz6wGb6nbLsua8c36XSflSMx4M=;
 b=HPs5spv/EImfFUY0QihWBQPbyDUsTg09Uv8+fAh48a1eL9fBbkWI+1r2cLWAhp1RIc
 0ggnQk00nSXl/eHgY90VCA/s0aDnSNLUqKweG2bxECkGRAPrSC2tA4fTpyMBnXql/u+M
 GqY0GYIEd45ij1sHSqKhUCgLsvdbFOnDGKY25JzFYbjmWp7yjrMzfgKFQej3rSMQa10l
 VNIShAua8DmHvYoXt0PQI8Y0sVRhhSQrQMlmQ34s6sNHTF+CuS0kn8mGMPqu/+P/XEug
 K3v1rTng9aAmmKt/nrHmZusanbHK2/awHqLYTP4jKZRuk2/aejtjSJv8nEjjzYKg2T8u
 xqaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TITAh6awL0LASkK6XSz6wGb6nbLsua8c36XSflSMx4M=;
 b=U64Ksp9SnW4GVOGMw/eKsNtg/jZ1vArmgntnWIxhlceJC5YZMBThpG0fqUD5spIr9M
 oYRiNIAQKD6H6xzRc7u4/QDWMU0oNFW/lifV7AVUEzRXL3gP82BoD44YrDHKYE3zklLU
 o48gUSRNrD/dJoRNaMBKbBiUGxtd90JEHmntcYNOHiIUY8I0e2xbw8kZPEdHBO15hr6l
 8ogIPo/PP7cRD0wVx53kxn3pxJU7SZyDOBZfIw2mhfjekIi0FgnLyuz2GyUQext/1qi9
 K9gm6qxmlofWCIw8ONo3kgz7EFAhoWnRZuMVGHQ98BT9G0vLC2fht03hLip0EzJARUh8
 lKYA==
X-Gm-Message-State: AOAM5337LX4XkA1H6i2xN2mUZBYY04EFnwUy5G6IuFKHnUFL7nRYrsu4
 PixYQCI/3FWDrvJfB5CxIwUIPQ==
X-Google-Smtp-Source: ABdhPJyTxAqP64tHSig2QCZridrZxXnCwKYr0E51sOBIQuv3sQrBrVvU2W1A8cdmiCBEFiqZWaT0dQ==
X-Received: by 2002:a05:6a00:2353:b029:1ba:d824:f1dc with SMTP id
 j19-20020a056a002353b02901bad824f1dcmr18698957pfj.9.1615163840999; 
 Sun, 07 Mar 2021 16:37:20 -0800 (PST)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id g6sm8492195pfi.15.2021.03.07.16.37.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 07 Mar 2021 16:37:20 -0800 (PST)
Subject: Re: [PATCH v2] target/m68k: implement rtr instruction
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <20210307182210.473111-1-laurent@vivier.eu>
 <f83aa053-76d8-5076-9f93-63eb4e489f18@linaro.org>
 <8fb7faeb-f805-4ce8-d202-8613f3ea2aed@vivier.eu>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <6d297cb8-33b9-b83d-5dea-8b4c7d64044b@linaro.org>
Date: Sun, 7 Mar 2021 16:37:18 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <8fb7faeb-f805-4ce8-d202-8613f3ea2aed@vivier.eu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/7/21 11:08 AM, Laurent Vivier wrote:
>> Both loads should happen (and thus exceptions recognized) before any other state writeback.
> 
> Something like that?
> 
>      ccr = gen_load(s, OS_WORD, QREG_SP, 0, IS_USER(s));
>      tcg_gen_addi_i32(QREG_SP, QREG_SP, 2);
>      tmp = gen_load(s, OS_LONG, QREG_SP, 0, IS_USER(s));
>      tcg_gen_addi_i32(QREG_SP, QREG_SP, 4);

Can't change SP before final load either.

   addr = tcg_temp_new_i32();
   tcg_gen_addi_i32(addr, QREG_SP, 2);
   tmp = gen_load(s, OS_LONG, addr, 0, IS_USER(s));
   tcg_gen_addi_i32(QREG_SP, addr, 4);
   tcg_temp_free_i32(addr);


r~

