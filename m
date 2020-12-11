Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCCBE2D7C75
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 18:08:57 +0100 (CET)
Received: from localhost ([::1]:52366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knlua-0002HD-Jl
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 12:08:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1knliR-0002bJ-K7
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 11:56:23 -0500
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:37587)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1knliQ-0005cg-3R
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 11:56:23 -0500
Received: by mail-ot1-x342.google.com with SMTP id o11so8802044ote.4
 for <qemu-devel@nongnu.org>; Fri, 11 Dec 2020 08:56:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=NHfs29Qd7nNfxZIyYSmDitxIc+0HjQ4TjdS7ZHnFOwk=;
 b=GurTdXNCvxFHPb9vQgIXoTmrZCbCb+SjiZRLN7OJZxZQMypuhRP7vEEulinO+dtubo
 RmnTJNHndq00iHNrE51+m/U+evgT8iP4ZwfOMnu9/Xz5C5ZQQr6NEQ5/ar2TsY8ZwtEj
 4WM1enLwyiZsnAHpKagFIuPQ0cb0hJMfBa/AfQfT6EobpRAKjIEGr2LQfBL43qEx96yI
 FamlsvxRs2B32awqbTRm5pB6ptnalNw5dgT7/Qcmp3hsjKI/BE0bd0PfTEDldD6fOBiY
 XLwnw1Srr97VWI6XvN1zlKwnDWubOhRo4W/psd84FNtRyH9jXqcVK35UL2BFJbLLoRpi
 nfiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NHfs29Qd7nNfxZIyYSmDitxIc+0HjQ4TjdS7ZHnFOwk=;
 b=TDMohb0KafL4esfvL/eruDPXuobOSy9sX3z7TBf1avX8DX4Ce58VtByY7sRjDmJttb
 eTZxFNKJvv/3Nsb+bxvAGQJn56JUCZQ+cS0DlHT82Ga9opuX5P6YCiUyRCa4UNbdsIPi
 WUWJzwa50SnYfIEGRgHLejBNXbI50S0CKkeTiefxzPq1W+WRSw9HBH7WbksEjgQmB8F8
 RebSoXdc3QlANgVszlTCG+BIgvCCtFlP9JO5tw7Yz7tYOq7/XykvFl3QEt5a8FznHH62
 8/3q8f5q1ZNu5licAPgvI/j5WPwp4lStHp4acK1DR88K3mGIt8TiW1JGiWwfpsCm4dWw
 759Q==
X-Gm-Message-State: AOAM530bgv4lVmrXD+nTu4fbIKXD3gLR7rjRpxqJOGrlc92Rcw2qbLFO
 GruHFLf1LCU1sZWUIBN2ZQAzMA==
X-Google-Smtp-Source: ABdhPJwJKf3BfTaSINbm00MDJwrqQsi3+TyMSCADfSItvV8+hjSdgKdEOIPpNpM3pS5CqKkGbKtA9w==
X-Received: by 2002:a05:6830:1210:: with SMTP id
 r16mr338804otp.343.1607705780040; 
 Fri, 11 Dec 2020 08:56:20 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id 5sm782408ota.62.2020.12.11.08.56.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Dec 2020 08:56:19 -0800 (PST)
Subject: Re: [PATCH v11 16/25] target/riscv: remove CONFIG_TCG, as it is
 always TCG
To: Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Wenchao Wang <wenchao.wang@intel.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
References: <20201211083143.14350-1-cfontana@suse.de>
 <20201211083143.14350-17-cfontana@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <479af498-6027-79bf-940f-207f0c3fca15@linaro.org>
Date: Fri, 11 Dec 2020 10:56:16 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201211083143.14350-17-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::342;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x342.google.com
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
 Jason Wang <jasowang@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>,
 Dario Faggioli <dfaggioli@suse.com>, Cameron Esfahani <dirty@apple.com>,
 haxm-team@intel.com, Colin Xu <colin.xu@intel.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bruce Rogers <brogers@suse.com>,
 Olaf Hering <ohering@suse.de>, "Emilio G . Cota" <cota@braap.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/11/20 2:31 AM, Claudio Fontana wrote:
> for now only TCG is allowed as an accelerator for riscv,
> so remove the CONFIG_TCG use.
> 
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/cpu.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Aren't there patches on the list to add kvm support for riscv?


r~

