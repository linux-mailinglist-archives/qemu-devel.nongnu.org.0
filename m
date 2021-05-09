Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76DB0377616
	for <lists+qemu-devel@lfdr.de>; Sun,  9 May 2021 11:42:18 +0200 (CEST)
Received: from localhost ([::1]:42286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lffx3-0003cE-Gz
	for lists+qemu-devel@lfdr.de; Sun, 09 May 2021 05:42:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lffsp-0004jo-Cd
 for qemu-devel@nongnu.org; Sun, 09 May 2021 05:37:55 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:36626)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lffso-0002F7-1u
 for qemu-devel@nongnu.org; Sun, 09 May 2021 05:37:55 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 l24-20020a7bc4580000b029014ac3b80020so9496443wmi.1
 for <qemu-devel@nongnu.org>; Sun, 09 May 2021 02:37:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=BUSYOgNhlrphzUvfCcBJ//U7rvDOHugZz+QHcwn9SM8=;
 b=BbTErBsUTKg8uORLX8ANHsu7WMw/YxoMx+xB7AD2l9GIH0I3jwZhUiSf8iKiciOMxG
 VZlyWbnwXxlkM1TU6Z/+J+21Et+o2PWS6jeYhaWVplU+AyuveMBcPoy/zcx4KwdqB3Fd
 ZXvaj7XKv+58D5gB7sdokheSFOLXzzmEM/tHuJbdryO6nC2gxt2IkRlPUr9WtKJc0EMg
 YYtprHxBDNOkSMf5aJWSKvyu4IIL+PpiBkCc6SWv/BYpk5lf+HE45p2tL3mx0tORepeW
 eIn4xFoqZnio8VNL1rZS726MA/5Wi8pXsgZR3TAHrpaJ8HFaOdtgbSDBGxcE+oFMTvj4
 RbXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BUSYOgNhlrphzUvfCcBJ//U7rvDOHugZz+QHcwn9SM8=;
 b=QOCo6StsE4hAzZOax8YV5dTw/UPLkcJ+03DnjE/64VueOgOcpOZcQxBhbeO/H+qD10
 zXxH02Y49hhfTpLtCBHXRAMx7RCBSVtpfNu2EVb8GeNb9NCStx2ivqc+1PGs9KbKf14U
 ZPgrsyRLievSMLbxtCyW6loGFaSAkcT9wMHt6rsuhuPVylny5TLRL7W1ClhljZRzM0Tt
 hxt2rvZu2sePuEyDryXySWav+SBO5/CLc5P/nlpxco8gzEJq+AWDzlcb5RsD3MZvzguz
 gCjvOEFLVedsRuu5v+aLFradXmgHPBVUNLvu6Xvcp2SKjktP3BdHIDbb/Qf/dAKo6h3G
 YmzQ==
X-Gm-Message-State: AOAM532r5Hfr1m7lQG/QLcIxqvExOaDz71AYv9cFJhWxM/ObcVm4rYXo
 jkNHhaqLS/tV1/6FGmOUomA=
X-Google-Smtp-Source: ABdhPJxg+X/607LgxvOmEAK55QRJdomLc/Svo+qY8F8908AjeV1BVhWqhfaciMTAK0Nbcu/xfUn1RQ==
X-Received: by 2002:a1c:f402:: with SMTP id z2mr32199980wma.21.1620553072839; 
 Sun, 09 May 2021 02:37:52 -0700 (PDT)
Received: from [192.168.43.238] (45.red-95-127-157.staticip.rima-tde.net.
 [95.127.157.45])
 by smtp.gmail.com with ESMTPSA id q12sm17980739wrx.17.2021.05.09.02.37.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 May 2021 02:37:52 -0700 (PDT)
Subject: Re: [PATCH 18/72] softfloat: Use pointers with unpack_raw
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210508014802.892561-1-richard.henderson@linaro.org>
 <20210508014802.892561-19-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <1fdb84c9-c152-a39d-d491-3488432bdda7@amsat.org>
Date: Sun, 9 May 2021 10:48:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210508014802.892561-19-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: alex.bennee@linaro.org, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/8/21 3:47 AM, Richard Henderson wrote:
> At the same time, rename to unpack_raw64.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  fpu/softfloat.c | 29 +++++++++++++++++++----------
>  1 file changed, 19 insertions(+), 10 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

