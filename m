Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 328D32D4B75
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 21:19:01 +0100 (CET)
Received: from localhost ([::1]:59956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn5vN-0007IM-QK
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 15:18:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kn5px-0004HW-GU
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 15:13:21 -0500
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:40050)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kn5pn-0006L4-JN
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 15:13:19 -0500
Received: by mail-ot1-x341.google.com with SMTP id j12so2654723ota.7
 for <qemu-devel@nongnu.org>; Wed, 09 Dec 2020 12:13:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=e8PjCwF/fkBvctzYsKsZigRs7c0yUbgHiIHG6Juga9s=;
 b=BIV963S9gDvXeQAOzns5FeH54xHaZsWE2jkhvfcqjhTbpeqeT0estcM/IfKJmSSHH+
 jkh57TwvgmRVvfxB+Qo71cAE0xrZYMHfkKuyI64hd1XQdnL6GMJZlsO2xpbIJrcTcX9V
 vKHcJUdwk3WKtQciMOSuTQh5G++HPfT/Joq8LGH4unQwsOxA44wujOoCBlvODbfuPGzg
 el+3ulvnUXnUhmFx+pSJBMi+fGpeU+1aEjt7cOgXEdndQM3eISMcRGcodf14HUz4jTJo
 bYRVTqY7o9uYWxwgrlTFgr47ReMJfvbUmzJ/WQpWW6Ri+wy8gteEDbtHpTLzD9lngSKX
 RzwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=e8PjCwF/fkBvctzYsKsZigRs7c0yUbgHiIHG6Juga9s=;
 b=thT7ctlfaEY1apRZM9oUXCno3PGM4mWwhp15XokpFEyd678BiIu+hnQ6zatOPoyJb0
 zcdAcUyzrlUhf5PEYPlrYLso8hsvaxbOjaVV5Zz8qMKDNm9XdFWYuCi5QxotUWaVgjdy
 rfQWPhUSJfpu3ZpVbp9l0mI3qgSc/BPKU4865uTSL9Js4yrqquruGCRZNNs/gBsHszth
 I6NBCfeN3bYeCEt0GzbpE6GMAMM2wv9NjH3v6KPhckNu2MUJquAbvopBOXWR2w4SHM5f
 DpwmiIt7Zm2tktkkre7Gw0ni2NeEYgVIUOvk/d7pNwlBBc8tQ6TzxeQerWSCSilefmre
 BYyg==
X-Gm-Message-State: AOAM5312785HBSAH6j7xLs8A1lrHTsfNnEr/MysmYpjIa6dKDsVvlvHq
 U5XkLJ9xeV9RTuuX0kRFYMzCew==
X-Google-Smtp-Source: ABdhPJymjhe79Shp+3MxdinfT87wlVy927PQ3peJTbXAMIVFHAHI6bhArk4K6dMUycTMNOoArAw/Kw==
X-Received: by 2002:a05:6830:1ae4:: with SMTP id
 c4mr2163447otd.295.1607544790091; 
 Wed, 09 Dec 2020 12:13:10 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id l1sm522451ooi.48.2020.12.09.12.13.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Dec 2020 12:13:09 -0800 (PST)
Subject: Re: [PATCH v5 0/2] MTE support for KVM guest
To: Catalin Marinas <catalin.marinas@arm.com>
References: <b975422f-14fd-13b3-c8ca-e8b1a68c0837@arm.com>
 <0d0eb6da6a11f76d10e532c157181985@kernel.org> <20201207163405.GD1526@gaia>
 <874kkx5thq.wl-maz@kernel.org> <20201208172143.GB13960@gaia>
 <7ff14490e253878d0735633b792e1ea9@kernel.org> <20201209124443.GB13566@gaia>
 <ef14a5158fc65c00f6c3c842cfa83b2c@kernel.org> <20201209152741.GC13566@gaia>
 <8c39b104-39c3-7cca-82b9-2e47d7cb9a9a@linaro.org>
 <20201209183920.GI13566@gaia>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <6b9072fb-1232-e9fb-0b97-e69709980f99@linaro.org>
Date: Wed, 9 Dec 2020 14:13:05 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201209183920.GI13566@gaia>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::341;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x341.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Juan Quintela <quintela@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Marc Zyngier <maz@kernel.org>,
 lkml - Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Steven Price <steven.price@arm.com>,
 arm-mail-list <linux-arm-kernel@lists.infradead.org>,
 Haibo Xu <haibo.xu@linaro.org>, Thomas Gleixner <tglx@linutronix.de>,
 Will Deacon <will@kernel.org>, kvmarm <kvmarm@lists.cs.columbia.edu>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Dave Martin <Dave.Martin@arm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/9/20 12:39 PM, Catalin Marinas wrote:
>> I would have thought that the best way is to use TCO, so that we don't have to
>> have dual mappings (and however many MB of extra page tables that might imply).
> 
> The problem appears when the VMM wants to use MTE itself (e.g. linked
> against an MTE-aware glibc), toggling TCO is no longer generic enough,
> especially when it comes to device emulation.

But we do know exactly when we're manipulating guest memory -- we have special
routines for that.  So the special routines gain a toggle of TCO around the
exact guest memory manipulation, not a blanket disable of MTE across large
swaths of QEMU.


r~

