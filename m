Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 709AD42024F
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Oct 2021 17:37:02 +0200 (CEST)
Received: from localhost ([::1]:45532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mX3Xx-0003mR-FF
	for lists+qemu-devel@lfdr.de; Sun, 03 Oct 2021 11:37:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mX3T0-0000Dv-8W
 for qemu-devel@nongnu.org; Sun, 03 Oct 2021 11:31:54 -0400
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b]:33346)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mX3Sx-0002Gy-4I
 for qemu-devel@nongnu.org; Sun, 03 Oct 2021 11:31:53 -0400
Received: by mail-qt1-x82b.google.com with SMTP id x9so3570595qtv.0
 for <qemu-devel@nongnu.org>; Sun, 03 Oct 2021 08:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=A34h7wNh9rDEtE/VLE9I1nPKGmxjDrQhB8Lyl93mbGo=;
 b=zEBffOekOsz7StXqxM4HqjeTAGGmxcLdoUVL25nDt13qcJqmKl/AYk9dwvKImui7B7
 dPjAfU7G9hI5CIz8kVR7tCoS2iYms648fZLwWrV3rSVABdIqK5DG36c95mOVZubaYZiv
 ckW4ZJ6bRJAe9BIvxXqWPV4APy+xnzB39Ckh9/wWMYkk3n2WV9y65/hjgYgp4SjnvleJ
 iaNn0Gz16BI0cu9fDThLSxe0mSG4HO3IiYCWl6Es9ugPs6IsfG2A/z7gCoIU6m7uD/hV
 JPJBAaKVTMgwFxSopuJhDB8ByCyTMnu0iQScm/VDSOPy+sbQfwZFK4fEKph0QJ6E896g
 +IfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=A34h7wNh9rDEtE/VLE9I1nPKGmxjDrQhB8Lyl93mbGo=;
 b=RMb6mdMss0YD/DOQR2FNvZOP4NpoE0tnxFCdQGN/nCmY6sZAtSfkNbwt+6a2yCaPqj
 zSReE7sb4nLUHazdHBRXdXrstrRUhewLz0FByhCTfclNWlcmDQGTllAnvm5G7dXYfYpI
 XIL8oMSWPUDDXgrzLwOmRSfKZwaJtjnAmGjhfC8skRR7OuA2IbyAm0Jn4IYB9rV/EiWf
 hYOGj2UTOtOOaYJgMow2MAM/BZUsX2hhkbaG0BOPF9WA0NnehmHyKO4nR1ch9W0W9Cnv
 HGdvDg125ivy2BKJxizh9dIn56bADXvtMlJcrn+pg4sDOF3CFl/HHKr9FWwYjcYozeX5
 QZcQ==
X-Gm-Message-State: AOAM53215ELauRr68NkpmPqKoS2z4qR1WiUQV0MLenAsnn8GF9kkPeP+
 ULMng1OzkB87Q51QDwcM22DqKw==
X-Google-Smtp-Source: ABdhPJyjkN6VMsATGHUHtOhyEYH2pBUogH2sYKPAjpiyz8Hm+28i+UvLyRV0TK6pvo///L5SFseSLA==
X-Received: by 2002:ac8:1e06:: with SMTP id n6mr9008929qtl.280.1633275109468; 
 Sun, 03 Oct 2021 08:31:49 -0700 (PDT)
Received: from [192.168.3.43] (c-67-174-166-185.hsd1.ga.comcast.net.
 [67.174.166.185])
 by smtp.gmail.com with ESMTPSA id a3sm7883903qta.48.2021.10.03.08.31.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Oct 2021 08:31:48 -0700 (PDT)
Subject: Re: [PATCH] target/s390x: Optimize save_link_info() using extract()
 TCG opcode
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20211003142922.3678039-1-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5e484c8f-23be-9162-7fcc-97528e25b830@linaro.org>
Date: Sun, 3 Oct 2021 11:31:47 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211003142922.3678039-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82b;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82b.google.com
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
Cc: qemu-s390x@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
 Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/3/21 10:29 AM, Philippe Mathieu-Daudé wrote:
> -    tcg_gen_shri_i64(t, psw_mask, 16);
> -    tcg_gen_andi_i64(t, t, 0x0f000000);
> +    tcg_gen_extract_i64(t, psw_mask, 40, 4);

No, the result should not be at bit 0, but bit 24.


r~

