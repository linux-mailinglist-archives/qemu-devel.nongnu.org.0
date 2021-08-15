Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 597703ECACD
	for <lists+qemu-devel@lfdr.de>; Sun, 15 Aug 2021 22:11:54 +0200 (CEST)
Received: from localhost ([::1]:52456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFMU5-0005xB-BF
	for lists+qemu-devel@lfdr.de; Sun, 15 Aug 2021 16:11:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mFMT3-000514-RO
 for qemu-devel@nongnu.org; Sun, 15 Aug 2021 16:10:50 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:42655)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mFMT0-0000e0-TG
 for qemu-devel@nongnu.org; Sun, 15 Aug 2021 16:10:49 -0400
Received: by mail-pl1-x634.google.com with SMTP id w6so11506680plg.9
 for <qemu-devel@nongnu.org>; Sun, 15 Aug 2021 13:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=JWN7zTRIb1hUbgR4sprm1u2JIJshB6Ty3thoqIe7JvM=;
 b=gM0Cmet1gBvFNTsHmfQgUF83URsZd9BX5D8hfYZxYjZveDmTU8yNx5CkPREPI8vhSF
 YhhrHID6vAXrFOvFn3gIYgl2MELqqKz+YKNFKULXOUCqWjW0n+kYgjkZiQn2cpq7epwu
 9mJIlOq00/Fn3DxxgyBXaYuJh5UN/SpasH4K7jrLCVSatZqZD1j3NkQdFpaBId1whqNt
 KjuRTeVnP8prnAcPqCvqeRQY0ptjjbuOxn+fICAEUZM/csU4S5kQgN5uPv5dDhZMS7VW
 IOz4rMpBp2PEEy65kbix42JjyZS3jnr3Ge4YdFItt22bSyIBwUmH9kHLhDaeT5Nuc92k
 FNvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JWN7zTRIb1hUbgR4sprm1u2JIJshB6Ty3thoqIe7JvM=;
 b=Y4mp8qM4d/itVNnBEl+FLuDY5JeTzzWHEC9ogYRapVCPaJiFEOvsWg3RclRyADKzL9
 eq3S6aAKKx7EWdK2Pv8E5ly+ck2cohRmm16PiazTWxpadwC3jss8M8UMdfQbwzE0F6Kp
 GORyeIcSr7FuFk+96wO7mydHSlWF2KTIvPhx4GgVbT0daQjz7yXKq9Qke8d4QldOo+Oy
 HH6P+WyfnVJJvdYM+abF6FdX9In2D3wl3/vxiyTuILr8C3xN+6xK2a/QlAWCEs0zuIV9
 EuBvf3QSuTUxo6jh7Qr6lebVYQVg9LWuXImDhtGlV6USTsbD5GEaUjHR72ZKPsrRs5/V
 faZw==
X-Gm-Message-State: AOAM532S+Z3k8FabP5qco3uBIx4kedj1UEjRnmtCsm6D0ozQRkwafwVQ
 dXqUzwcb3a/E8ZSgewXW0IGnXQ==
X-Google-Smtp-Source: ABdhPJyQV/xuIlH/v8q1+k5ZgQD7CEBVQ4w7Nqi0183SZZKRYwiVBZfb86muO0Pe5zfls+5fp05EaA==
X-Received: by 2002:a17:902:c402:b0:12d:b2fe:f0f1 with SMTP id
 k2-20020a170902c40200b0012db2fef0f1mr4678994plk.9.1629058245313; 
 Sun, 15 Aug 2021 13:10:45 -0700 (PDT)
Received: from [192.168.3.43] ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id y13sm7186689pjn.34.2021.08.15.13.10.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 15 Aug 2021 13:10:45 -0700 (PDT)
Subject: Re: [PATCH for-6.2 5/7] linux-user: Provide new force_sig_fault()
 function
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210813131809.28655-1-peter.maydell@linaro.org>
 <20210813131809.28655-6-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3e3ec979-4348-c3b7-1210-50dfa66c2b7b@linaro.org>
Date: Sun, 15 Aug 2021 10:10:42 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210813131809.28655-6-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.147,
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
Cc: Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/13/21 3:18 AM, Peter Maydell wrote:
> +void force_sig_fault(int sig, int code, abi_ulong addr)

Better as abi_ptr?

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

