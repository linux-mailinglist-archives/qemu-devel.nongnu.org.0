Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8F5A2E85E8
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Jan 2021 00:20:10 +0100 (CET)
Received: from localhost ([::1]:53096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kvTiL-0004Wr-QW
	for lists+qemu-devel@lfdr.de; Fri, 01 Jan 2021 18:20:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kvTes-0001j4-3Q
 for qemu-devel@nongnu.org; Fri, 01 Jan 2021 18:16:35 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:35917)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kvTeo-0003Fh-49
 for qemu-devel@nongnu.org; Fri, 01 Jan 2021 18:16:33 -0500
Received: by mail-wm1-x336.google.com with SMTP id y23so10488953wmi.1
 for <qemu-devel@nongnu.org>; Fri, 01 Jan 2021 15:16:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=tfAEfnQ3aVtxsx2f5Rh0p0abcR4mhZoCzuE3e5pjgWc=;
 b=X2YFFW9SCxzHFYQnHXjPS9cajzx/QWHJcDYooMXPazYcd0THSIxHOqXEsek8gbHlyt
 rSwHa78pyQCyePffxJaA5VNdF+Tyicd6uRhGi/Fvaitr0Y7ET8yZzJ+s++12D7MkM4k2
 SCoOOQ2gIUA2uFmuKvqvixR7WkVHRSXHQz0fWElmZEfNxZZ3cW3g2lq9YsKNoNbhU4Wr
 PkOuogXf0wwlrBJgkgVQM6qU2u3eS2aGrAStlsJZK/X0xX4W8ggvPJl4iuBLq9MvzoRO
 kgPNMAHAURsSII+xB39Bb1isyN+mUuyR136Sn1nOB1t2WcyKBzkHW9BdJy2dvd2ov4e6
 c2VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:from:to:cc:references:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tfAEfnQ3aVtxsx2f5Rh0p0abcR4mhZoCzuE3e5pjgWc=;
 b=fMAOk2yirwrHzj5nFHx41rtBgme6TbCj8VAvmUgH60V72Q4WEL027CcmREfcjzsN/5
 MwY1DwRc/SKxbjri1fTtNePuGxwwhSqDgCAoaT0+5xEuAU6hg7CzO9I/BvWR5KvxaOCi
 pZpByb1onsJmsPbXS4n2Ta/16isByaP3jv+U2JMZbObuyOOJbBljV3x5xrSNg+WF0Y3H
 eWrd4nnFnpOEFTNbSMrSlFF3Dq36mUl7Titu5YEHdteIA9BMaIX2mcMXQ0F/v1Aow1Mc
 etvIsoYq757e/vOxtGWxY8XB4wubBuB8UcJN/eySelJ6z0uhTIaBinx4KbKZoFxZTOUr
 0VSQ==
X-Gm-Message-State: AOAM532SFJmH4SeyQ5L7bFpM7/CB3e0DfqqLBTwdfrhpZ2G4o1U4IKkk
 XkzFtJtQ+3xszD0KDRSwj+lWoDwalLs=
X-Google-Smtp-Source: ABdhPJykEcWxBD4Fj9PaJPjoV10C0JS4sm4iB8WlCGoLo77ziv3HJWr8YRuKZmdxXMYN+OClZxmrrQ==
X-Received: by 2002:a05:600c:2306:: with SMTP id
 6mr17402236wmo.53.1609542988616; 
 Fri, 01 Jan 2021 15:16:28 -0800 (PST)
Received: from [192.168.1.34] (239.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.239])
 by smtp.gmail.com with ESMTPSA id o83sm18732799wme.21.2021.01.01.15.16.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Jan 2021 15:16:27 -0800 (PST)
Subject: Re: [PATCH v2 3/8] hw/mips: Use address translation helper to handle
 ENVP_ADDR
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-devel@nongnu.org
References: <20201215064200.28751-1-jiaxun.yang@flygoat.com>
 <20201215064200.28751-4-jiaxun.yang@flygoat.com>
 <d5103933-5ecf-6284-48b0-c143071425ce@amsat.org>
Message-ID: <04abcfa4-2070-e15a-d24b-6780ac1f2046@amsat.org>
Date: Sat, 2 Jan 2021 00:16:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <d5103933-5ecf-6284-48b0-c143071425ce@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x336.google.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-2.749,
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
Cc: chenhuacai@kernel.org, paulburton@kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/1/21 9:38 PM, Philippe Mathieu-Daudé wrote:
> On 12/15/20 7:41 AM, Jiaxun Yang wrote:
>> It will signed extend vaddr properly.
>>
>> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>> ---
>>  hw/mips/fuloong2e.c | 24 +++++++++---------
>>  hw/mips/malta.c     | 62 ++++++++++++++++++++++-----------------------
>>  2 files changed, 43 insertions(+), 43 deletions(-)
> 
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


