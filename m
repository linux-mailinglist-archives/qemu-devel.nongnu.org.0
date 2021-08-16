Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0D243EDC6A
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Aug 2021 19:28:51 +0200 (CEST)
Received: from localhost ([::1]:53386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFgPq-000836-UV
	for lists+qemu-devel@lfdr.de; Mon, 16 Aug 2021 13:28:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mFgP1-0007BH-7g
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 13:27:59 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:42868)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mFgOy-00052Q-MC
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 13:27:58 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 mq2-20020a17090b3802b0290178911d298bso1312486pjb.1
 for <qemu-devel@nongnu.org>; Mon, 16 Aug 2021 10:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ontMa0tOCRsYA6EQA6gKHTb6flRqUYYajy+GePYCesU=;
 b=YdVsgpd746/rNhhgwDHn9P6rlv8uuHrMUhyslIJ3+08bs+z7Qfu0P+UBpmIdadO1mC
 dbSKwRwRknJ0rR8/2UR9b1PKCL/GxUWOJDE1qEnzV3nygmvSlONnYHF3iCi+CFqY7joh
 2PR8f68AnRS9RWxAA3AN+LasJik3XpkxBWccMtGTiA/MZ6LRDx6IqBv5Ervr7jpirok4
 Nces/kAvlhNfTT22pNCxoMV/3mjOc2x/9b/3P9Q11bFOPSQ6Rht2PTK7A1jzSgk6svHs
 kZvlh8koMPeGstJB026weQo5Jf6EKQeP6olIp1mlwQKMQok3RWh+ked9l/spGAJuE25O
 cNEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ontMa0tOCRsYA6EQA6gKHTb6flRqUYYajy+GePYCesU=;
 b=fEjsYc4mgSo3J6zoQD8dbEZUEb/JMc7w9nkxyUg4Fg0BZp5oP6QVhBHRV7F5YXud5r
 /beU++ClC+Qkn4JdobaAkZ91pl9H+JWQBWAyupUGSDsHRcOPLQV0mezg9Q/htFkYrtsE
 629xkz97dOlAdku3sQAAIA4vKnVZc/coPKMueJH7PtiOuIDZ0LL0O7w9fCf5r4sQwxZp
 050b+QF/vYO9USePKd0W1ZULpiIcGXGQiO9NbkXGIm7E8rJOlO/y1JhUR4+7cz975uqN
 p5IYkp/2ntIRJbS8qnIITF6yoTYgfPtzQMcZLSYrAlbouIxtpPNlLIC4uwx/OnFrXmUh
 OSVg==
X-Gm-Message-State: AOAM532L8EVVpkQG/D3+FMjQocD5PywWoaFC0eBeVfkEhytOKssBc2Um
 jaMqHkNOzzFIvruaMd7PyXZq1g==
X-Google-Smtp-Source: ABdhPJxfq0dI7JGQa+qPDvqfGQE0u/L+eZjO5U+Neub7dEpgzX487dVZUBWGOEonMdbdzTXJPEDJPA==
X-Received: by 2002:a17:90a:c244:: with SMTP id d4mr250551pjx.38.1629134875025; 
 Mon, 16 Aug 2021 10:27:55 -0700 (PDT)
Received: from [192.168.3.43] ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id j15sm11960995pfh.194.2021.08.16.10.27.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Aug 2021 10:27:54 -0700 (PDT)
Subject: Re: [PATCH for-6.2 5/7] linux-user: Provide new force_sig_fault()
 function
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210813131809.28655-1-peter.maydell@linaro.org>
 <20210813131809.28655-6-peter.maydell@linaro.org>
 <3e3ec979-4348-c3b7-1210-50dfa66c2b7b@linaro.org>
 <CAFEAcA_QCLKPKx41cknfGRrQ3r8tK1G7HauRM+XEzns8YxEe=A@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <097cd1f3-8922-ae6c-fa65-c694d1ccda69@linaro.org>
Date: Mon, 16 Aug 2021 07:27:51 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_QCLKPKx41cknfGRrQ3r8tK1G7HauRM+XEzns8YxEe=A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -57
X-Spam_score: -5.8
X-Spam_bar: -----
X-Spam_report: (-5.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.71,
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/15/21 11:03 PM, Peter Maydell wrote:
> On Sun, 15 Aug 2021 at 21:10, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> On 8/13/21 3:18 AM, Peter Maydell wrote:
>>> +void force_sig_fault(int sig, int code, abi_ulong addr)
>>
>> Better as abi_ptr?
> 
> I followed the same type used for 'addr' in the target_siginfo_t
> struct definition.

Fair enough.

r~

