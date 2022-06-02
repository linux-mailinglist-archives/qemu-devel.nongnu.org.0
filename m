Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6069B53BCAD
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jun 2022 18:43:42 +0200 (CEST)
Received: from localhost ([::1]:42884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwnvB-0005Oy-Gm
	for lists+qemu-devel@lfdr.de; Thu, 02 Jun 2022 12:43:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwntU-0004EY-2z
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 12:41:56 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:44776)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwntS-0008M5-CO
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 12:41:55 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 gc3-20020a17090b310300b001e33092c737so5283672pjb.3
 for <qemu-devel@nongnu.org>; Thu, 02 Jun 2022 09:41:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language
 :from:to:references:in-reply-to:content-transfer-encoding;
 bh=EzqV4fv74+30cpOk/7AsSvGe0o13UoFI8OwMS3EIy1g=;
 b=oDtq6HTaGWykMKTVXmWfT93TFcq0TqNv+rv5PFq84yOr5ihfQJFRoTTz+oqev/1Mdl
 Dt6lRfeFjh6DjpuPvtfCU9GRpT3mCxhdkbImhe8MYix6P3C9+BXv/jS126vjph9z+TJp
 11UqUjZS1ZSoyZfoYdxZGkTee748pcfe4LPPTmSKF3pvOkl0QMcnUFYLp0VhF+YxH3Mb
 m0EDQIZ+9tl9r+5UwjdkoQKwlH4+wl2F3fmKkOYYmmbhBs7JkrHo6gJQ9i6NmTQfMaE8
 TTS6Ionx6gua4vyWxL4ckyl4UiuHRZAt5MvADsWRfSxji85ObTSfMAdJjLs021c4EJVx
 qlPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:references:in-reply-to
 :content-transfer-encoding;
 bh=EzqV4fv74+30cpOk/7AsSvGe0o13UoFI8OwMS3EIy1g=;
 b=cQM4LMRK+EFIuSAjdfReR1kwGhmTKOn+ftMCj9uiYn2b+iTjIiaEcBvJdb3SDakDz9
 WB7q6joS3ad54kqBB15w1TYDAoPb6EdzXvyHk1UAJYQhgq7ydgYcTAwnlqi115MYY9gd
 9nFH4SrAQPCuJeCQj6USKeS/VDTCflWZBETU4b8HzM9zSywXlmd5VjXbvumEkgNExPuh
 nBe8efDQPQ7F3p5m2EMfmO1ZyWOvUSbkrD5TlrBvfIHIxchSZYasxKnLLwgDeg1StSpt
 QzOl56MOYDlGKhQCP9aybB0M5mKDEicb3sv6907aanhl/ibYaC3ppT9OeR1QXFvOozPo
 9FAg==
X-Gm-Message-State: AOAM5320GEbnSH1+EOVOFWbr0AFjOo2qXBH9ditVBnKHY84k5fkroyjU
 EHHeMijoWIPaGuIi1ALaZcP1nXpFDCDq7A==
X-Google-Smtp-Source: ABdhPJxIHPH5TdaBLfYop8eFpCh5i1Z1dZbW4hjYuPGZbKlvKW7cGFLWgjKUB9jpe/+nDU6vfdxUZg==
X-Received: by 2002:a17:902:cf4c:b0:161:e3aa:2708 with SMTP id
 e12-20020a170902cf4c00b00161e3aa2708mr5681646plg.127.1654188112708; 
 Thu, 02 Jun 2022 09:41:52 -0700 (PDT)
Received: from ?IPV6:2607:fb90:80cd:3d17:bb90:8dda:8cb2:7569?
 ([2607:fb90:80cd:3d17:bb90:8dda:8cb2:7569])
 by smtp.gmail.com with ESMTPSA id
 k14-20020aa7998e000000b0050dc7628137sm3892246pfh.17.2022.06.02.09.41.51
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Jun 2022 09:41:52 -0700 (PDT)
Message-ID: <5d93033a-6bdf-290f-9a8a-cc80e013154b@linaro.org>
Date: Thu, 2 Jun 2022 09:41:49 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PULL 0/3] tcg patch queue
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
References: <20220602151312.477967-1-richard.henderson@linaro.org>
In-Reply-To: <20220602151312.477967-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/2/22 08:13, Richard Henderson wrote:
> The following changes since commit 1e62a82574fc28e64deca589a23cf55ada2e1a7d:
> 
>    Merge tag 'm68k-for-7.1-pull-request' of https://github.com/vivier/qemu-m68k into staging (2022-06-02 06:30:24 -0700)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/rth7680/qemu.git tags/pull-tcg-20220602
> 
> for you to fetch changes up to 94bcc91b2e95e02ec57ed18d5a5e7cb75aa19a50:
> 
>    tcg/aarch64: Fix illegal insn from out-of-range shli (2022-06-02 08:09:46 -0700)
> 
> ----------------------------------------------------------------
> Add tcg_gen_mov_ptr.
> Fix tcg/i386 encoding of avx512 vpsraq.
> Fix tcg/aarch64 handling of out-of-range shli.

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/7.1 as appropriate.


r~



> 
> ----------------------------------------------------------------
> Richard Henderson (3):
>        tcg: Add tcg_gen_mov_ptr
>        tcg/i386: Fix encoding of OPC_VPSRAQ for INDEX_op_sars_vec
>        tcg/aarch64: Fix illegal insn from out-of-range shli
> 
>   include/tcg/tcg-op.h         | 5 +++++
>   tcg/aarch64/tcg-target.c.inc | 2 +-
>   tcg/i386/tcg-target.c.inc    | 2 +-
>   3 files changed, 7 insertions(+), 2 deletions(-)


