Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73D4F699D02
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 20:30:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSjww-0005Sr-HT; Thu, 16 Feb 2023 14:29:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSjwt-0005SU-Is
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 14:29:43 -0500
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSjwr-0002E2-Vr
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 14:29:43 -0500
Received: by mail-qt1-x82b.google.com with SMTP id w3so3334262qts.7
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 11:29:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=02+dfZFy16j70CUHYtv0vIt606qvo2Iryd1IL+SIjIQ=;
 b=fQdnuGcY/LQC6lvZXKDiKwEqK3iS4Rvzqa1b9BdxyWgHrDLJ7b8JM9lxDcP3F79Ae4
 ckedSZtL4/YePKsl0sau6g5bRWpee5CjG7VbOAOE1rvNX8zRBX1S5zmhqYEUP+2lO/mj
 DqaxkHeMERKsknug8ff6Zj90+sHal8PJiyhab9CNTbPjf6xP5iVuSMBjci5UXd/JqRnK
 vuCpSFaIzworOK3a/wtZFjXPXgDrqITIBkfMjV2SBQtMbYSiTJcW/4cKr5DFcqIpj/sb
 kUujOxlzpv1Z/ZHlVdMgiwFSSYL20Zw8/DBxClESJCNwWp2O8KRgQMQXOpafKHX/yNgH
 paHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=02+dfZFy16j70CUHYtv0vIt606qvo2Iryd1IL+SIjIQ=;
 b=Xx2MYVidYPfAqpks8nWrLv0fQF1QyQHqFw+/8fAj5UshbpWnVDBHEUFvUdnJDf1JWO
 SeCzWbSrZLF8zWYc7jYiU4wNGHuROD9pDd/fpOODl2qOe4uDAH1cH++XV5uBKzkOSgNQ
 mmZg4tdDeiWGAMSl85sNDd55nbgifHeZ+0XMF/JPY1whKaugIZ741N8jSWKwh/E2qNH/
 BhtnmKJwyKkVExVG15yTxQd7CuGhZ2WfFQ0ipmx2E1Xs41LC63AkelJXbmacPn52T25I
 ueT+gYQd9xJuBVfxgjWrTKee5yXmE91PBvGOtSPTG6raeMSla+aIlEp9gufaMH7eWliy
 5bWQ==
X-Gm-Message-State: AO0yUKWsNVrnUU056V3WFkro3YTYtPryrWtyYAWmUE/AHVrO5tCw4SqD
 wq/KfIkqH64CO2AF2m6/QirkvxsMX0Rgv/2K
X-Google-Smtp-Source: AK7set9GbKqrMaZeW2uz79h7Ws/C4QuHgQjbs+TQq+FKBCDGIzm6Uxgk1waJOpsghZ2qkQgnfB4s2Q==
X-Received: by 2002:a05:622a:20d:b0:3b1:c538:7026 with SMTP id
 b13-20020a05622a020d00b003b1c5387026mr11378641qtx.42.1676575780889; 
 Thu, 16 Feb 2023 11:29:40 -0800 (PST)
Received: from ?IPV6:2607:fb90:8f62:8652:bed9:812b:5b9e:e49a?
 ([2607:fb90:8f62:8652:bed9:812b:5b9e:e49a])
 by smtp.gmail.com with ESMTPSA id
 e129-20020a378287000000b0073ba2c98c07sm710778qkd.123.2023.02.16.11.29.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Feb 2023 11:29:40 -0800 (PST)
Message-ID: <c2011213-8c8b-95c0-9565-47eaf7d33688@linaro.org>
Date: Thu, 16 Feb 2023 09:29:36 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: Runnig solaris binary(32 bit) on linux(64 bit)
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 ginu samuel <samuel.ginu2010@gmail.com>
Cc: qemu-devel@nongnu.org
References: <CAPWd1mzg0rWgpf_D+NC+yAosx8oJnA+tR=NpsuFNtWP-j25=pQ@mail.gmail.com>
 <CAFEAcA8dH+DDPHWg6xRmT=3oCu1rwyb1gbyVCXFTSDSzBrGg-w@mail.gmail.com>
 <4ea862746a066107573650d04f4eee6992e0ede9.camel@infradead.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <4ea862746a066107573650d04f4eee6992e0ede9.camel@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82b;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82b.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.351,
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

On 2/16/23 09:02, David Woodhouse wrote:
> It wouldn't be beyond the wit of man to extend qemu-user to support the
> similar personality variations for SCO/Solaris/etc. using that as a
> guide.

Not beyond wit but perhaps beyond patience.

It would certainly be possible to emulate the "easy middle" of one POSIX guest on a 
different POSIX host.  But the dusty corners are going to get in the way, where we 
currently rely on guest and host having identical semantics, and pass the system call 
through to the host.

It's a big job.


r~

