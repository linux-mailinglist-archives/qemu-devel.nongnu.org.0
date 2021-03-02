Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6024329666
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 07:25:09 +0100 (CET)
Received: from localhost ([::1]:33830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGySt-0006Il-GS
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 01:25:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGyRS-0005dr-J5
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 01:23:35 -0500
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:42751)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGyRP-0002DE-Fh
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 01:23:34 -0500
Received: by mail-pl1-x630.google.com with SMTP id s16so11410848plr.9
 for <qemu-devel@nongnu.org>; Mon, 01 Mar 2021 22:23:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=xYObWK35Riz57R3nqx2T5UvOcWaHf2MLzhFlOwNtlEw=;
 b=F+3f7gBYLjESFSKcTkc9WnKdLQCjpjjR9RE5F902lMK2J2ulXqg0K3d4c1BKrzeuB0
 XqVJEiKzVLwNwvNJQ24mcmhgv9WywGlj/i0kgHWpeInxsacienuhxxomItBoTJYCy8d/
 ZsOTcBQ4vSkph/xhc8EfUkngwlGXd6Sh7nguMLIetJp5SXxNkVctSnzJmo2Uhn9DX2ej
 cV91AP5C4GTNAVJAEPC79N3vcU5+82z32XNI1yqDlUnN8HYBro2FLS0oB0UFRye7YWoz
 ZgDKY8D4Zuv1qZlrKUg9sQtDKFkq+14/qaEAxx7qYu4M9Y2LKVlDd9hf9SYcSzcAD9La
 6Ywg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xYObWK35Riz57R3nqx2T5UvOcWaHf2MLzhFlOwNtlEw=;
 b=QTPvFbn0TcFO+mTkBG/kzip+jGq0xwsKHhZFhPBtD0ONz/5LeyIl0a3Et7KZW3HiZn
 pTjXQAFxss5WkjxViTy0ZS6RS6YnehbLhoZakT6BeMJRR1uTUbp3HStmIR/tSZiAasor
 0y0VHY3ZD0F70UEfQMCmU3p5Dqq1GEDEy48BJnQoWJNlnX7g7/wamDh7yG2+714vAwl9
 elitqq8Y4/eO1sHVar0TeNoEYQdq7l1gGDcggWoL+tx0fJazhYkyJ5cadvuzbilWLAy5
 9JdHF2Hw61HCxo4QAfv1A8TVyi60uurD7yCtrUwCuKNT0yjko22eygJ8GaXp6O4ZUyJg
 +Cwg==
X-Gm-Message-State: AOAM532XDz4aA6Ok+bUo+HMxR+IXrLh+81q8l4KPtM4Qq0eUq5otSDdg
 5+kBb9emQrNyXA0JisvrGMdDFv1M46Qfhg==
X-Google-Smtp-Source: ABdhPJyhC//j/REEIVU1lrrWUTEC4ayIcfYZj8X4ndgFnuinFJXoAfcDdn6U1qzrENrQ9RPVVHKz/g==
X-Received: by 2002:a17:902:988d:b029:e3:76d8:6952 with SMTP id
 s13-20020a170902988db02900e376d86952mr2131059plp.30.1614666209417; 
 Mon, 01 Mar 2021 22:23:29 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id c10sm20093505pfj.28.2021.03.01.22.23.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Mar 2021 22:23:29 -0800 (PST)
Subject: Re: [RFC v2 19/24] target/arm: move aarch64_sync_32_to_64 (and vv) to
 cpu code
To: Claudio Fontana <cfontana@suse.de>
References: <20210301164936.19446-1-cfontana@suse.de>
 <20210301164936.19446-20-cfontana@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3c8622f8-cf47-2819-c351-8051c2725155@linaro.org>
Date: Mon, 1 Mar 2021 22:23:27 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210301164936.19446-20-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/1/21 8:49 AM, Claudio Fontana wrote:
> and arm_phys_excp_target_el since it is tied up inside the
> same #ifdef block.
> 
> aarch64_sync_32_to_64 and aarch64_sync_64_to_32 are
> mixed in with the tcg helpers, but they shouldn't, as they
> are needed for kvm too, in the sysemu case.

Really?  Now that *is* surprising.  Again, please document.  Because I surely 
cannot believe this to be used by kvm.


r~

