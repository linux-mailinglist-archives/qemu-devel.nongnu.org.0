Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3881F2B9DA3
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 23:28:39 +0100 (CET)
Received: from localhost ([::1]:45564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfsPu-0004Aq-1r
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 17:28:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kfsOP-00035U-CY
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 17:27:05 -0500
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:34690)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kfsOJ-000650-R6
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 17:27:05 -0500
Received: by mail-pl1-x62f.google.com with SMTP id l11so3775964plt.1
 for <qemu-devel@nongnu.org>; Thu, 19 Nov 2020 14:26:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=+h80lgtTsW6rMfDFW/agJyMzJwmXtErIFTTufiRB92Y=;
 b=MdLIPA3LTPR9tnodIO0jW4IPCnoRvzNAOBrr9RI7tGz2YL5okJqAbvrl9Ut/s9lSgW
 DToq0mIfULPpNWSFBSJhZ5QrnNLkZZ+sLnc0pZhhuzlDhdCQURoTKR29bpg0KnQAvt1D
 eRQrw5zQMmqdabVUfaj3BD/bhmvcQ5JPLq1Ql4uZOL4HvQhb+2yolMHlnMh2jxXNaESy
 hR53mmNsQzGTS/rDJUGP9iyYo1BKRTiXIyC0G5OMynZ7y8IbRGX/HqUy8ElXhTJBg0YI
 m94OJdFiw9E8xIOhoAkwcQYHgVq0rxN3L13uv2Dwx67NxqONm5z6/x675DKVJWLChCtl
 cONw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+h80lgtTsW6rMfDFW/agJyMzJwmXtErIFTTufiRB92Y=;
 b=A1+BZV9Ni8vE+p26q2LvilvUg89j9eyEwxtWLIZllhB6kVC97lmc3yzdXQOW57Fmc1
 AloxLQ50xu1w9gzXQe+37qNmG+/C2BYN+475Q1bopSFy37vDBaVpwAbGMMq2RnaGATAJ
 UOHTUq9MWK5+8cpAhgQfgIZogAwwgEc0jOSVOgNTfUC2wVzWmg1wCuUHzO+R0G6UCKSk
 z96nRnbHhqURfbVwePUWTcPbNrKHplmUS8k/6Qa/DEOrBBosz2v5TkqKhjbOwR1EHc+f
 y6to3lgMzxGNGn4bjXpRdy08OcNFcucHyPniZS5lv9vKoMgwCPvp7h8iy9b7NGacyf84
 pfiA==
X-Gm-Message-State: AOAM532t1+x0stewlbXe8RnHfnyOAOHkb6KUDaR2ECneRWMqV8Sy8xel
 MStB23oRfsmKWuamRivqB9de0Q==
X-Google-Smtp-Source: ABdhPJzY7M4AS45yNbNRLsX7Fl/b530IoHtU2jVrRkRJ9ph5lsDVEMfx3+8QUwaYw7lp09xcFlrfFA==
X-Received: by 2002:a17:902:9a0c:b029:d6:c6a3:66f with SMTP id
 v12-20020a1709029a0cb02900d6c6a3066fmr10390992plp.52.1605824817537; 
 Thu, 19 Nov 2020 14:26:57 -0800 (PST)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id x61sm818850pjj.4.2020.11.19.14.26.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Nov 2020 14:26:56 -0800 (PST)
Subject: Re: [RFC 00/15] support subsets of bitmanip extension
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20201118083044.13992-1-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2546c25f-e60d-7fa4-9106-2de1ab619daf@linaro.org>
Date: Thu, 19 Nov 2020 14:26:54 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201118083044.13992-1-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/18/20 12:29 AM, frank.chang@sifive.com wrote:
> This patchset implements RISC-V B-extension latest draft version
> (2020.10.26) Zbb, Zbs and Zba subset instructions.

With some additional instructions from Zbp, it seems.  Although the document
isn't completely coherent, with various instructions being present in multiple
subsets, and some instructions w/ strike-out.

The B extension requires more than these three, but I suppose turning it on
with just these 3 subsets during development is ok.


r~

