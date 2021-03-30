Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB61934ED17
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Mar 2021 18:04:07 +0200 (CEST)
Received: from localhost ([::1]:44958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRGqc-0002Sq-HO
	for lists+qemu-devel@lfdr.de; Tue, 30 Mar 2021 12:04:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lRGlF-00087n-D5
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 11:58:33 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:40868)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lRGlC-0003gY-UZ
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 11:58:32 -0400
Received: by mail-pf1-x434.google.com with SMTP id a12so3562316pfc.7
 for <qemu-devel@nongnu.org>; Tue, 30 Mar 2021 08:58:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=26pvKoQoPaRF8A8JzpEuZ0m/yizTZmGa4Xg7y6WkoRA=;
 b=rOwkxzBpWk0lDTVYomIqTeJdHNT02j4JJzVg7Ofs3dNlfkY7LZS6egRgYkI+sFd2mf
 BKtpuGyp4TEzBdYo1b7ySxjXvEAcLHTeXtVrDE6ELidvIL0myScha2N93xms/rJsveHp
 M8eMCzExHEpurtUa04p8lygF3dbALUqJ5S3vaHmdt5BJLANah3CF89qvfoc8H30Ehd52
 fa5rDLfObG7AqXc5F0IYqFmVZTfsPc3l/H60Hb7ozVgPfQHlp7WyNI8L3YdlY2HJRnAe
 p/cexxYwFeYxxSYVqUPV2nXsm1ixTdQGNtXmjeFlTZW40qELniJaWKqmAuBcBdpGyNtP
 RqDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=26pvKoQoPaRF8A8JzpEuZ0m/yizTZmGa4Xg7y6WkoRA=;
 b=rATeZiat2UEwv9FrcLLOQ2/lIXjDJIAWtaxzwt3paPuauGx+trVOaKLqFgNHba6rkv
 34m1rJ+7vMc2OiZ91TfvSr6bRza5FBpH/3kBAeYkRTZY99EEgie3/AfT5OI46uZOUTot
 bPt5r8i5VnMsaKTBDFHel+KvZVIvJf6m4V7U+9b3ScgYHC03l35W2gFZLQRoHum7c4wi
 6E4KWwddlsexgDPnCSHl0eTdYnqbqMxV+iwg+8Q01bq/h828u4GTKFmNYmt5MhqixMqf
 cbD2W7ZqJNsx82dOvIkMQgLYVsUYoSmNXG7u6JbGqE2oHAQgLE9c2QqRLlhyB966o6Jv
 /29Q==
X-Gm-Message-State: AOAM533wFsvr/rZYqdgNLORZtlymK4sPMyr9Vbab9AS6FxmiPhJne433
 UAZjrTNN5Ut2KXvVgTpR7vtQ0g==
X-Google-Smtp-Source: ABdhPJyn7xTDBj9yFCnps8K14Dv19iOSHV25fSpea03WK3vPTZGoMn6JIoKxmXAE9SMIIVRKxSPARQ==
X-Received: by 2002:a05:6a00:78c:b029:1f5:d587:1701 with SMTP id
 g12-20020a056a00078cb02901f5d5871701mr30664823pfu.59.1617119908850; 
 Tue, 30 Mar 2021 08:58:28 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id p25sm21024465pfe.100.2021.03.30.08.58.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Mar 2021 08:58:28 -0700 (PDT)
Subject: Re: [PATCH v1 6/6] tests/i386/test-i386: try and correct constrain 16
 bit call (WIP)
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210329110303.15235-1-alex.bennee@linaro.org>
 <20210329110303.15235-7-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a71640f7-a864-1214-52d7-e6dab4677dd8@linaro.org>
Date: Tue, 30 Mar 2021 08:58:26 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210329110303.15235-7-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/29/21 5:03 AM, Alex Bennée wrote:
> Newer compilers complain about non-matching constraints:
> 
>    test-i386.c:1393:5: error: asm operand 2 probably doesn’t match constraints [-Werror]
>     1393 |     asm volatile ("lcall %1, %2"
>          |     ^~~

The problem is that the newer compiler is defaulting to -fpie, so &code16_func1 
is not a constant.

Need to add -fno-pie to compile this.  Which of course adds the confusion of 
old compilers that don't support that.  We have CFLAGS_NOPIE in configure, but 
that doesn't directly help cross-compile.


r~

