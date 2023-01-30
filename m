Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7F65681FBB
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 00:34:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMdf5-0002sR-PN; Mon, 30 Jan 2023 18:34:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pMdej-0002pH-Dm
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 18:33:51 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pMdeh-0000Mx-Im
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 18:33:45 -0500
Received: by mail-pj1-x1035.google.com with SMTP id
 cl23-20020a17090af69700b0022c745bfdc3so6112242pjb.3
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 15:33:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BiH+4Y6Q6Cu7JauWYdn1m9XG71Ic68uDkEFXwFxSltI=;
 b=ObaIAvLrqDeTxBmGuqyMRvPxbiYkPTVFbsNgXe3RRs1/ZPxT1c+NrXS3KranBWTGsK
 Tst8+EN6xO6F+2hlBceqSsBT7QqwsXEI69HWTl921bEdx7PaJNGNeqjAW95ju62Cb+m6
 u03cwsXNDYvVmySdBBLkm4tnnK4pKx8O7s9iK2r+exEl8OaFiyjo8BVrjnE9EYLzVU3W
 dOgyqSxcttZuLcWvq5L55cL4jTlZIHVfJ8dP9BwNpPZcRYnFNUpYSHGZjz1vtPo1bE1N
 l1m3kaItHHEsP53MSJYGAJ0WatByhrIWe9JaRnPpqopOC6JiRAW1TuExPdf0tQhCc1KW
 Umsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BiH+4Y6Q6Cu7JauWYdn1m9XG71Ic68uDkEFXwFxSltI=;
 b=QGce3icPkV+0U3lHcc9IshZpTc3K+YpYSZ77A4p0qNbWm0vjIP0YN9VC4k2pVPc3dC
 Kw7hY2TbbXyE7Au6y5ojjOpXmV7gaDDqH9vjUc9jEqMbp4uYUaaRW5JWoB/Yt662LqLx
 YUbVol+lI3Tyx3yFxdUhr5G66/lyRaIFlT2xF2Mu0/XnQdjai3tGTJn8dnFgIiVCsGMw
 pWUuU0+9jFxDfkGyeJf9ro3lmS2fl7A30bX1IvbbSM3bF/pIOQQk81Wvi72b1h1W5m7i
 22Vc5tAivjrs34cFSj+EvHZNsmplPTNkGuaKVzS8yzb4ALoAmjxAd8b08KkGtP9fT5Xe
 KZ9Q==
X-Gm-Message-State: AO0yUKUrog70JjsrpcAEeWHiYfBa6pNzveKzpNBT7d9lL30GryiIqZqM
 u6vQAongi+Ou8GWpR4gN2CTAtQ==
X-Google-Smtp-Source: AK7set9G3fxwZy3au9Zzhr2lpRwpmVGnYNa/yTZRFA9++5mzkVUpNGXXcjPgos+1GwCP3ItkFu4GfQ==
X-Received: by 2002:a17:90a:7e82:b0:22c:8ba1:bd73 with SMTP id
 j2-20020a17090a7e8200b0022c8ba1bd73mr7654148pjl.18.1675121621475; 
 Mon, 30 Jan 2023 15:33:41 -0800 (PST)
Received: from [192.168.50.50] (rrcs-173-197-98-118.west.biz.rr.com.
 [173.197.98.118]) by smtp.gmail.com with ESMTPSA id
 q21-20020a637515000000b004b1fef0bf16sm7329352pgc.73.2023.01.30.15.33.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Jan 2023 15:33:40 -0800 (PST)
Message-ID: <8a802013-1bdf-8b56-d74c-0e3ee1c203ae@linaro.org>
Date: Mon, 30 Jan 2023 13:33:36 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH] docs/about/deprecated: Deprecate 32-bit host systems
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, libvir-list@redhat.com,
 Paolo Bonzini <pbonzini@redhat.com>, Reinoud Zandijk <reinoud@netbsd.org>,
 Ryo ONODERA <ryoon@netbsd.org>, Brad Smith <brad@comstyle.com>,
 Stefan Weil <sw@weilnetz.de>, Michael Tokarev <mjt@tls.msk.ru>
References: <20230130114428.1297295-1-thuth@redhat.com>
 <CAFEAcA89Onb9Dg4zJXQ0Ys-0kJ2-hz5KYRPXMCE7PWDDxVzDyQ@mail.gmail.com>
 <Y9exrDWT2NUoinu1@redhat.com>
 <9c529b2a-14bd-fd50-c0d9-87f2253ee0bb@linaro.org>
 <51e135e0-0c94-43d6-c408-1a9d556e9e42@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <51e135e0-0c94-43d6-c408-1a9d556e9e42@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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

On 1/30/23 13:14, Philippe Mathieu-Daudé wrote:
> On 30/1/23 20:19, Richard Henderson wrote:
> 
>> But I do question whether we need to support 64-bit guests on 32-bit hosts at all.
>> Retaining 32-bit on 32-bit allows arm32 to emulate i686, which I suspect, but have no 
>> proof, is the limit of what users actually want.
> 
> I presume you implicitly restrict that to user emulation, right?

No, there's no specific reason to eliminate e.g. qemu-system-i386. or any other 32-bit 
guest.  Though quite often such hardware doesn't really have enough ram to do a good job, 
that's not a technical argument against.


> WRT i686, if your example is "i686 useremu on non-x86 embedde router"
> then any 32-bit host is potentially interested, not only arm32.

arm32 was merely an example -- the other 32-bit hosts are i686, mips, ppc.  But we don't 
have many of them.

> I remember being able to run armhf binaries on armel hosts (and vice
> versa) was useful 7 years ago.

Fair enough.

> Today I have no clue, we could poll the community and some 
> distributions.

Sure.


r~

