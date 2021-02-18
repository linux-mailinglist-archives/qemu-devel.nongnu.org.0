Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5072031F0F8
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 21:28:44 +0100 (CET)
Received: from localhost ([::1]:41066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCpuk-00088C-19
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 15:28:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lCpsU-0006fb-2y
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 15:26:22 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:52281)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lCpsS-0004zd-5W
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 15:26:21 -0500
Received: by mail-wm1-x32b.google.com with SMTP id l17so4852925wmq.2
 for <qemu-devel@nongnu.org>; Thu, 18 Feb 2021 12:26:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=TNMh8xbL80Zvz4uPip7RW8e4qfiX+Tww5UCxEcPJvrI=;
 b=L56SSIhQvgtYhW3qzWrez/LSW9qFHIz+LDL6aHjg60yFe4oRDFHSnFftQKPrxiRteM
 36NtTLkiuXby/J7ul0NQz29jPZD/QoM7hA7kqbu65PVHdSlIJjFGa8fui9nI7HOgI5nx
 CfW3crRQDknEccpBMAPjmakhnrGTlJ2Jh1E7hK7tMNGLkhCg7N1vPXfrzhW1AE5pEMfl
 elFteyxJIYTItm5tfFVlz/10xHW+24vyRDDydRFoGLA7FMSWNICnGM1Yg6NEPnMbMGAd
 ndjCm7Qxfm/WaAPFZkbFuKAhk/tUTOt0MkWp+NQ2P2k4kMK4+fectTtkiylbusdEDSxo
 fMyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TNMh8xbL80Zvz4uPip7RW8e4qfiX+Tww5UCxEcPJvrI=;
 b=aZreLEqL0JNSArYT16CrTi/lD1plOwPSggqvLg3aFy/2k2JWkY8zeMYOM/UHEDzm50
 8xZ6MRKoqZe9zWzG5tjKMaiLWB/I6szF8PcDQy+Ah722BrZgG5XA7D6Pf9+CO8yMBCSt
 kgwVdHoWNmsp3Z5diOEJhvi7Ub7+ThkUc2UDRSVR4N977YeqARDa8GHYhndF7HXxCOhO
 8pJI28BhGbJTnHwZmrKPwT2lUMoTgjfE4w0PiL4trr4Vhgk1yMMGNPZJaPQ1y+1VNz4t
 2bMrrOjMsZG9T9y2BEB9L1bj17G9nsZ3BLE+Tz7B5BhgQiGAmFizxrFDYlAu1CX3lkK2
 XOyw==
X-Gm-Message-State: AOAM533h1mNW2UOuhpDayadaIHuxejIPP7xwLWKi+XwYxDw6DVTkjYkZ
 43cMD5Y0pp63jX6sWFRRpEpLGEqFgrk=
X-Google-Smtp-Source: ABdhPJwDk9kUp6Sawe6+4ZvXPtyrw71DsEuPDJWj7nm7KcnoUhKqwQp9CvKWtuafDPyWeKTKb2LehQ==
X-Received: by 2002:a1c:c906:: with SMTP id f6mr5024205wmb.128.1613679977757; 
 Thu, 18 Feb 2021 12:26:17 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id k15sm5755776wrn.0.2021.02.18.12.26.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Feb 2021 12:26:17 -0800 (PST)
Subject: Re: [PATCH v2] Correct CRIS TCG register lifetime management
To: =?UTF-8?Q?Stefan_Sandstr=c3=b6m?= <Stefan.Sandstrom@axis.com>
References: <20210218184302.34984-1-stefans@axis.com>
 <2fe233c0-dfa8-763d-b122-fdef8145ea06@amsat.org>
 <1BD4E981-C339-495D-ABC1-74B0112CBC3E@axis.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <e8099123-2640-69b6-45ab-070f6c04b960@amsat.org>
Date: Thu, 18 Feb 2021 21:26:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <1BD4E981-C339-495D-ABC1-74B0112CBC3E@axis.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/18/21 9:10 PM, Stefan Sandström wrote:
>> On 18 Feb 2021, at 20:59, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>
>> ﻿Hi Stefan,
>>
>>> On 2/18/21 7:43 PM, Stefan Sandström wrote:
>>> From: Stefan Sandstrom <stefans@axis.com>
>>>
>>> Add and fix deallocation of temporary TCG registers in CRIS code
>>> generation.
>>
>> What did you run to figure this out?
> 
> Hi Philippe,
> 
> We were looking at the code in search for an issue that showed up when switching to a new version of GCC. 
> It looked like QEMU executed the CRIS code wrong, so we took a look at the code. The problem turned out to be outside QEMU. These potential issues were spotted in the process.

Good to know. Do you mind sharing your GCC tests, so we can have more
CRIS testing?

Regards,

Phil.

