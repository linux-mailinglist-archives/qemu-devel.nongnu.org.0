Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C68226DC0A5
	for <lists+qemu-devel@lfdr.de>; Sun,  9 Apr 2023 18:28:19 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1plXtB-0007Rs-8O; Sun, 09 Apr 2023 12:27:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1plXt8-0007Ra-GE
 for qemu-devel@nongnu.org; Sun, 09 Apr 2023 12:27:34 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1plXt6-0006Cc-NT
 for qemu-devel@nongnu.org; Sun, 09 Apr 2023 12:27:34 -0400
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-6354dce93d2so263226b3a.0
 for <qemu-devel@nongnu.org>; Sun, 09 Apr 2023 09:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681057651;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bWio9yybJbmL3UAuPrlxFZT9v6imFS1CqHG2sJIEakk=;
 b=gLBw7iEKCL8aC/dSird8qrWxK5KI7lC3Djaj7CQem6ynLrG02GMGX09qwXuMvRsNg7
 RWlMYosBGpxsvEXSYmyHBvEusGNwVSOPObWE2lJlNt5oL/31cuEwKGQsJ1IERAb6jiFB
 hHe27lVhXBiL3XakdNv9TlpwMW4MtozjIkOj0IxL3NV907ljGg8ZJ5VAfojHZcsH/SZ2
 /mcBAzimuSsvctksembbe+JkJK9qV8jC+4FrWbyKRFEAX3iXsjXXE4w/FIPKyRRU5Dd+
 MELhiJdR0xoZu1JHB473DlqZik/Kq7N+5iOSUfgjZ1aDSjyHOLDBYgBzsUU8un6shTKq
 6dyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681057651;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bWio9yybJbmL3UAuPrlxFZT9v6imFS1CqHG2sJIEakk=;
 b=YGZBcQdowRBJ0rIff6tKN465ax8kQ1BI2JlYWr5fR5QkDTmEhib1FFsTMkxxZA2EwB
 GbMuJ+mHF+4txjigivAYk9bBpxMx7qzk7A1+GCruagr1XOD/I6+vLDgg6fcUDX1YIlD3
 4U6q7aXHICzt2iYJhx8iRL42rdcpsLPRYgJW9FmQ6O4pttFAkH7OPmbjb22Yue2Syn0i
 P+33Xk441BOYmdJiQjyUXCT0IpwY2sqVFKNxAefKPOYsugaSaTzRxoBDOSW8VHYIknCZ
 xu5/r32HV0CB50hmEAFMiQSN204P0EQbL5fyZlyzvZI+1ncRYGlXwI41nOHj1DfhBa6s
 XqpQ==
X-Gm-Message-State: AAQBX9evXWuUIwcA+FvRTCTaF48R24Uj5SU+ZPFt4H/TnawllR11EEEf
 yvH1sKKDTjO7s2t+oW0oSVwEHw==
X-Google-Smtp-Source: AKy350avWtVQmLvWhdLtJZ1z23+2Jd80WQLLJ3/4c9UeZc/2nL2RQUwhp8o346Ados0mNlDqWo19nQ==
X-Received: by 2002:a62:1bd4:0:b0:632:34ef:7669 with SMTP id
 b203-20020a621bd4000000b0063234ef7669mr5832109pfb.7.1681057650571; 
 Sun, 09 Apr 2023 09:27:30 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:d714:12f0:3102:b5ae?
 ([2602:ae:1541:f901:d714:12f0:3102:b5ae])
 by smtp.gmail.com with ESMTPSA id
 i13-20020aa78d8d000000b0062bada5db75sm6505226pfr.172.2023.04.09.09.27.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 Apr 2023 09:27:30 -0700 (PDT)
Message-ID: <056da0a5-5437-0cac-a2a0-c992386bf4c2@linaro.org>
Date: Sun, 9 Apr 2023 09:27:28 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: qemu-user: avoid allocations to convert stuff when not necessary
Content-Language: en-US
To: Michael Tokarev <mjt@tls.msk.ru>, QEMU Developers <qemu-devel@nongnu.org>
Cc: Laurent Vivier <laurent@vivier.eu>
References: <cd93a0e0-6047-c511-9b96-35bf4e0adce0@msgid.tls.msk.ru>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <cd93a0e0-6047-c511-9b96-35bf4e0adce0@msgid.tls.msk.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.888,
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

On 4/9/23 01:52, Michael Tokarev wrote:
> Hi!
> 
> In the qemu-user case, we allocate various structures and arrays
> for conversion of data between host and guest byte orders and sizes.
> But it is actually not necessary to do such allocation when the
> *size* is the same, and only byte order is different, because the
> conversion can be done in-place.  Does it make any sense to avoid'
> allocations in such cases?

Alignment can also change.  This is especially visible with m68k guest, where even 'int' 
is 2-byte aligned.

So, no.  It's best to just allocate and convert always.


r~

