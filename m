Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 722CD2EAF8B
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 17:03:16 +0100 (CET)
Received: from localhost ([::1]:53734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwonj-0008Gj-1f
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 11:03:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kwomN-0007cM-07
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 11:01:51 -0500
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:36626)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kwom9-0006yl-M6
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 11:01:50 -0500
Received: by mail-pg1-x532.google.com with SMTP id c132so126195pga.3
 for <qemu-devel@nongnu.org>; Tue, 05 Jan 2021 08:01:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=lc6s3DqRIEA4QMmXD8j9sOU3WhiAN9W30lUiWRK+O0M=;
 b=BZtRFXMHW0x4Jj+Aj07pxUUDR0bSiaDPzGSx6xaY7Udo0CGM43Z35A7ghVBG3j3sbT
 DtLe/rHLZq24g87r48uz+Zgc7Nv9dwm4v3fmSrdMmWkezI77njk7/GzSNSWQctNFItTN
 ovappAuHlfJe+qNPA7wbRmqwT+1DSmBcVV+RnAFkypwGee8sS8vLRLjfmllYuf/BK/B4
 2dNqEAiSvI7o3wVQiZahOpgedGBdOj2VVVA6+nzPMogVRgy1GbzgZkS2dMny06FnzPBi
 iyTkjzq9tm43bF3UYg4p2LYuvnEa4PsGKvEW96tRBtQ8O7XDfUm0ncEnMzmTXQZiIqNb
 x/3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lc6s3DqRIEA4QMmXD8j9sOU3WhiAN9W30lUiWRK+O0M=;
 b=ZumYIaEBJvc2sZNz7vyJvXek0oX5UN/jGmzuM6OxX4mNBwT5H4bQA/E87qfpB3G7C1
 2V6DsVGitXFOrFuihM4hL1bvd7DzNh5A3swBStGZHMAMjIXpbBGCXIVAieAiUybMhfIB
 QvGL7BiTvIC+XiwrAJvQSJlbraVhndULFTHICsnTcNP3RNhn7NYLKSZUgeK+th61LaKD
 ewDLDEj1mya/oalceK2nq1fANgW/iZImp1PeYMT8nQ3B/el3+cauF7rrX+KnmwUFmF0m
 mVj21JeWXw6xK2QJ3Qn1R+GQC9n32zC1HFsYTBZILIY4lNZrdhgnTuwHJuq5KHa1mZwq
 bDEQ==
X-Gm-Message-State: AOAM532VQaUiOfdPPcbPWoYM/x5l98g6uU3Pk0Sk7FbWSEgbpV3StG0r
 voubRLnnUOy0+Uxv18qUXiEPAA==
X-Google-Smtp-Source: ABdhPJwSwkuje4coBcaIzzJJn4fXf609VtWNSU2nCS6qaazkECIKu5CRddVHzn5dfX40hSlrt5zgng==
X-Received: by 2002:aa7:85d2:0:b029:1a2:73fe:5c28 with SMTP id
 z18-20020aa785d20000b02901a273fe5c28mr46966959pfn.40.1609862486112; 
 Tue, 05 Jan 2021 08:01:26 -0800 (PST)
Received: from [10.25.18.45] (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id 8sm99583pfz.93.2021.01.05.08.01.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Jan 2021 08:01:25 -0800 (PST)
Subject: Re: [PATCH v3 04/15] target/mips/mips-defs: Introduce CPU_MIPS64 and
 cpu_type_is_64bit()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>
References: <20210104221154.3127610-1-f4bug@amsat.org>
 <20210104221154.3127610-5-f4bug@amsat.org>
 <aee2c3f4-f4b0-1d1a-2029-3c027d6cd724@linaro.org>
 <f351074a-e63e-f39a-c807-9250deca9c39@amsat.org>
 <d8cdb54c-bfd5-1ade-090a-7ad15974a302@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c82fd319-4cac-f2f8-729b-5edf8b5fd624@linaro.org>
Date: Tue, 5 Jan 2021 06:01:21 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <d8cdb54c-bfd5-1ade-090a-7ad15974a302@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.249,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Paul Burton <paulburton@kernel.org>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/5/21 12:05 AM, Philippe Mathieu-Daudé wrote:
> I'm not sure it is worth the effort, as I plan to check each ISA /
> ASE bit from the CP0_ConfigX bits (similarly target/arm/ does), so
> these definitions should disappear eventually.

Excellent.

> Might I keep your R-b tag for this patch (eventually improving the
> commit description with some of the info added in this mail) and
> keep going?

Yes.


r~

