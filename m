Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21E4630FBBA
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 19:42:58 +0100 (CET)
Received: from localhost ([::1]:55470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7jah-0006tq-Cy
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 13:42:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7iiC-0002Qv-4O
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 12:46:37 -0500
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:41593)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7ii8-0000o8-DZ
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 12:46:35 -0500
Received: by mail-pg1-x52a.google.com with SMTP id i7so2614146pgc.8
 for <qemu-devel@nongnu.org>; Thu, 04 Feb 2021 09:46:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Y/Z1kSm76MLRMzMr9Zi8L6ipZ9s4Q4Z2Vn1nnhljNXg=;
 b=h0gCkKkH0BiQ87buVfqbZ0tAlx0PnsduySIB1XK6w/3x6PeTL72+wHFy0ktd54DdfH
 dwMNgQLQ/OT8nWd7PUqM97IGbBU1xSUOkLbNE8CMcbvYC1zOptwYfrXPMzevWaHgWh58
 8x5dyZAqSIEOf4V24pwDqdDPIzHf3QttiOjpm7QRtwMjiZ1uEmD0BCF8uD54qhDSenFu
 /ghBe3fr2avBniOD2E4fQmoYpW5ftW0z/BePQroHx6rQtysT0yilX2pcAb2riOwHnh1G
 CzAkzKld7LOKKywt38Ou4M+IkIv+7rml+hmegCHHPFGJMIsDrflsKTqZBV34j64m3xHO
 Ic1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Y/Z1kSm76MLRMzMr9Zi8L6ipZ9s4Q4Z2Vn1nnhljNXg=;
 b=NLcFlKXegaNW6DdCx43U+JPfstmgg2FlGguXOR4d3C3EPp4yX5x3mpMocddFHYJ0JY
 KskbX15i8jsmW87g82kyElS+5R7c6xNgOeuPmZHY94V0dRr0q8zO35TkXc+o5J9+BODl
 C4oBDUhssVtsI+yMeGiV437PSwFCfRGXbRjTP9J+fQWVhQJQ6C59fUrm65zrwnIPz1r5
 H47L52xwskuP5mXcqZ7TInmfs7SSiMZhXx6nM8p4/AX/u/EWPLI+sxaS2hq6Lc2A2DgA
 +NuTCJ1rGx9+D5CYbHqLKSRjCwlD2pWScDt4PsZa5cQRhgSybFSYZV+cVSSga/P/ucgt
 rCdw==
X-Gm-Message-State: AOAM531ymT00E94eYq1UA8yx0OBNZaisM+PI2pInQQFZndiDgmUS5ApF
 4CgB59dGuLoizokJpY8T1A/eg+4jTJb3/wfr
X-Google-Smtp-Source: ABdhPJzdoTlnhKsmbdHyJKGNxPLFxiyYptne/+L78iKa+USPb2TICpecU7EDZh0h5qLcdO2GzgyovA==
X-Received: by 2002:aa7:9585:0:b029:1c5:10ce:ba7f with SMTP id
 z5-20020aa795850000b02901c510ceba7fmr550287pfj.79.1612460790330; 
 Thu, 04 Feb 2021 09:46:30 -0800 (PST)
Received: from [192.168.3.43] (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id g17sm7373931pgg.78.2021.02.04.09.46.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Feb 2021 09:46:29 -0800 (PST)
Subject: Re: [PATCH v2 04/93] tcg: Manage splitwx in tc_ptr_to_region_tree by
 hand
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210204014509.882821-1-richard.henderson@linaro.org>
 <20210204014509.882821-5-richard.henderson@linaro.org>
 <87tuqrq3hh.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <82078884-4213-158e-9e1e-7d9b6b026536@linaro.org>
Date: Thu, 4 Feb 2021 07:46:26 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <87tuqrq3hh.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.182,
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
Cc: sw@weilnetz.de, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/4/21 5:01 AM, Alex Bennée wrote:
> 
> Richard Henderson <richard.henderson@linaro.org> writes:
> 
>> The use in tcg_tb_lookup is given a random pc that comes from the pc
>> of a signal handler.  Do not assert that the pointer is already within
>> the code gen buffer at all, much less the writable mirror of it.
> 
> Surely we are asserting that - or at least you can find a rt entry for
> the pointer passed (which we always expect to work)?

What?  No.  The pointer could be anything at all, depending on any other bug
within qemu.


r~

