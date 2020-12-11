Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE5062D7D7F
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 18:59:28 +0100 (CET)
Received: from localhost ([::1]:50182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knmhT-0005Lb-Ps
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 12:59:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1knmTd-0007JS-5W
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 12:45:14 -0500
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:41501)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1knmTZ-0006rv-Kf
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 12:45:08 -0500
Received: by mail-ot1-x341.google.com with SMTP id x13so8955976oto.8
 for <qemu-devel@nongnu.org>; Fri, 11 Dec 2020 09:45:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=1Ckgl0ODLGVKf7uJcnm7LRxtMpkJq9580RATMalb/3s=;
 b=EKGEnYyttrk4BE0zlw5yjEJeW7TofMTfQNmHDMEgvMZZVNu0buoZ/3HD4goM69oRAQ
 msZEy9pF3CFy6rTmUXvqGZKfqw7GVDUCRR8rr7TevjaH2t8Ow/FYillz2jaAh0O2hvoT
 4v02u/vCZQeutPx8jWa5G6vMTAD/me6iPGeM7nFckpxwcnFJ5I2da6VYk6TG2BcFZlHY
 nBDuNm7uuvGi4MoAHhxwVH3hx8urmrPDXJ1wmNvBO4/s5lYQE/mt4vhNu+BGc+PBdgBn
 Vfnp2/T3Xi2hYcV6ULU1hyfngZek1dsyicRh8V7rufwiTuT9K+xMlzMaQXEwTdqXyiLK
 W1qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1Ckgl0ODLGVKf7uJcnm7LRxtMpkJq9580RATMalb/3s=;
 b=hhm+MMcJ7bu8rc9D0nxnszYmyO/EmjrtvfYqQfFAsIxcBDTHAK1RbneG+degiQXE3K
 dbOcFYvLgzQ2HRhzO4ICMz5Dpj+R2+OQ7OOPkpcSOQGzqgw7bkFHfsZW4VqM0u6cdt7w
 sWr2fdkITkSlNMAr0xlC+1QxXALuAT+YLZY0SwVk6biauQtP55rLzZCbbbt/Oy0zvnKm
 3u0MufHi7qK8Byx8b1PPC2exXmlkf1FDb0nKhis/n/6J5SIr+KLbXVdtzE3HlN2Mj7vD
 50kBSUFKmU20zPZuDm5cWNT7PZKrPSUL8ZfTk++FWVOW3X0KAoCeSzeSNAkqH/GTX/QE
 17pQ==
X-Gm-Message-State: AOAM531c4Zp69687loIA36MGWTomd28LOFuEAk8WYuSLAARmCk3A05JT
 NmHi/ESK0ueWebeACQKLpdX/Pw==
X-Google-Smtp-Source: ABdhPJzQCSYQSq9q2jsqd6Bq30AD6kmL5M7/kYFsdMeM+UGMbZSFjXg+ZLThumCB4rXsYHkIMLWTFA==
X-Received: by 2002:a9d:7c82:: with SMTP id q2mr10504866otn.205.1607708703925; 
 Fri, 11 Dec 2020 09:45:03 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id t24sm1938249oou.4.2020.12.11.09.45.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Dec 2020 09:45:02 -0800 (PST)
Subject: Re: [PATCH v11 22/25] target/arm: do not use cc->do_interrupt for KVM
 directly
To: Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Wenchao Wang <wenchao.wang@intel.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
References: <20201211083143.14350-1-cfontana@suse.de>
 <20201211083143.14350-23-cfontana@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e800f6a4-666d-fb91-fa68-2f9fd080c914@linaro.org>
Date: Fri, 11 Dec 2020 11:44:58 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201211083143.14350-23-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Jason Wang <jasowang@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>,
 Dario Faggioli <dfaggioli@suse.com>, Cameron Esfahani <dirty@apple.com>,
 haxm-team@intel.com, Colin Xu <colin.xu@intel.com>,
 Anthony Perard <anthony.perard@citrix.com>, Bruce Rogers <brogers@suse.com>,
 Olaf Hering <ohering@suse.de>, "Emilio G . Cota" <cota@braap.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/11/20 2:31 AM, Claudio Fontana wrote:
> cc->do_interrupt is in theory a TCG callback used in accel/tcg only,
> to prepare the emulated architecture to take an interrupt as defined
> in the hardware specifications,
> 
> but in reality the _do_interrupt style of functions in targets are
> also occasionally reused by KVM to prepare the architecture state in a
> similar way where userspace code has identified that it needs to
> deliver an exception to the guest.
> 
> In the case of ARM, that includes:
> 
> 1) the vcpu thread got a SIGBUS indicating a memory error,
>    and we need to deliver a Synchronous External Abort to the guest to
>    let it know about the error.
> 2) the kernel told us about a debug exception (breakpoint, watchpoint)
>    but it is not for one of QEMU's own gdbstub breakpoints/watchpoints
>    so it must be a breakpoint the guest itself has set up, therefore
>    we need to deliver it to the guest.
> 
> So in order to reuse code, the same arm_do_interrupt function is used.
> This is all fine, but we need to avoid calling it using the callback
> registered in CPUClass, since that one is now TCG-only.
> 
> Fortunately this is easily solved by replacing calls to
> CPUClass::do_interrupt() with explicit calls to arm_do_interrupt().
> 
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  target/arm/helper.c | 4 ++++
>  target/arm/kvm64.c  | 6 ++----
>  2 files changed, 6 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


