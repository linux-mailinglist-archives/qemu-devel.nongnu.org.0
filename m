Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EDD1660A39
	for <lists+qemu-devel@lfdr.de>; Sat,  7 Jan 2023 00:24:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDw3j-0004Xr-6z; Fri, 06 Jan 2023 18:23:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pDw3i-0004Xc-1J
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 18:23:34 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pDw3g-0004pa-BB
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 18:23:33 -0500
Received: by mail-pj1-x102e.google.com with SMTP id q64so2985630pjq.4
 for <qemu-devel@nongnu.org>; Fri, 06 Jan 2023 15:23:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DoSHqWjHbRXTVf5zK+apI6mQXk2SvTkj2uKqHPRYOX0=;
 b=orilThrzLkW0B4EeIJ07idgS0zhBb5LgFfFNnBHnzIB/WadN7x3MjAHvT+NoH9yEFO
 qMDyND3iMxc7ZkcBn5s/eqpSrJX1WzyWI4NneAmqud0g4tCbXJGQyhpP4JAY9a/+w6DM
 1ywkvlLmrsYbjHeuz7P7FENEK135uu5pme9FOea1M6ZD7bFE0PD6Oks72sFeW64Ld0sG
 V13+AKKrYU5ef7sqs/ZCPlfadHIdRGWo1qwyQgQrf3OH0fGivC2gq3FudqaDFD6r3itV
 cfiL78vNIugUS1H7/E1r+ppz1TpxNT/fBUoc10qcLnX9a4RZMz7Y2JAgGFGalpfHjCV9
 k/Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DoSHqWjHbRXTVf5zK+apI6mQXk2SvTkj2uKqHPRYOX0=;
 b=v7Kft/Ftp/PS0Stt2GFbqRfjeLEJDZulksS/p/RuLyWbqCGyj9DSLUThrgVSbZ6t/i
 jJZa8q9nH9sbqAr7cg30aZf/TvZQdyTkbMqm0/6JxwbcrQsQmSWtou5jZgrfTxo92nI0
 SsiRWH9lJwQzyJv5ckCiJWM+9q2/P1qbIJMKWuKCEadMc2LH8vb0AN7tDUqbfNt77Vdu
 CeLwcSFk0LbyXdIOx03HHkCaukT5xZ6G6zSYus19qFo0g1cipyfWGN30RudV/n7KbDt/
 V0+ljRsFOi00LmHzq+ti3bzx8sUexqL+6ySynfx4hs+x/bVRpEsGFj7oYv/2fWSwDF0K
 l46g==
X-Gm-Message-State: AFqh2krlcjpMmJsIlJrfTlcY+OsC1m7irekevkq9Be+Nyx354MKO6Hf2
 SDdyJOI1PbHpc7lidKnrAROaKw==
X-Google-Smtp-Source: AMrXdXtWrwO6zHb8yfFZOaFb/SXW+Dl12mCR4paN4soKjCGiByHK+yuYBB92EuOOlkSPWdwWq32vKw==
X-Received: by 2002:a17:902:a50c:b0:192:6c8a:6b81 with SMTP id
 s12-20020a170902a50c00b001926c8a6b81mr45538222plq.31.1673047410976; 
 Fri, 06 Jan 2023 15:23:30 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:9d81:5b04:51d7:acae?
 ([2602:47:d48c:8101:9d81:5b04:51d7:acae])
 by smtp.gmail.com with ESMTPSA id
 q11-20020a170902eb8b00b00189c93ce5easm1423472plg.166.2023.01.06.15.23.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Jan 2023 15:23:30 -0800 (PST)
Message-ID: <b701c93c-e1b6-488d-0444-18eb586de3ca@linaro.org>
Date: Fri, 6 Jan 2023 15:23:28 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 18/21] gdbstub: don't use target_ulong while handling
 registers
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20230105164320.2164095-1-alex.bennee@linaro.org>
 <20230105164320.2164095-19-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230105164320.2164095-19-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.939,
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

On 1/5/23 08:43, Alex Bennée wrote:
> This is a hangover from the original code. addr is misleading as it is
> only a really a register id. While len will never exceed
> MAX_PACKET_LENGTH I've used size_t as that is what strlen returns.

What has strlen got to do with it?  I think it would be better to match gdb_write_register 
result (int) and reg_size (int).

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

