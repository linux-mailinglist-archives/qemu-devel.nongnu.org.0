Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B599F4976F4
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jan 2022 02:52:52 +0100 (CET)
Received: from localhost ([::1]:57702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nBoXL-0001EX-Kw
	for lists+qemu-devel@lfdr.de; Sun, 23 Jan 2022 20:52:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nBoUL-0000HD-GR
 for qemu-devel@nongnu.org; Sun, 23 Jan 2022 20:49:45 -0500
Received: from [2607:f8b0:4864:20::535] (port=41615
 helo=mail-pg1-x535.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nBoUF-0004Ew-EC
 for qemu-devel@nongnu.org; Sun, 23 Jan 2022 20:49:45 -0500
Received: by mail-pg1-x535.google.com with SMTP id f8so13814313pgf.8
 for <qemu-devel@nongnu.org>; Sun, 23 Jan 2022 17:49:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=IKHXKw31J9co7dwg29raiD0p06n9wb17Z9ThbSog6TI=;
 b=crk/uIBdacj/5vVTn39GsCmEgTTd2rXmF2zVv+w0VDfOBRpO6wjcVbGHRBHAGnw+kp
 /TZYu1qODTxEkNyVEcpZmr0BUWR+FWpIsCTiEEvl0frfkOtM+2XPFX3/K7WFHHc6Yyyl
 MieiSht0cLuWEKO5yBgdlQ9jDYxlxho+o4+Bgt9pbpEf9jtmr2qox3kiBfVOxzdTXvVD
 KiDVym8xU3S04JprIpFXqdC2rgnzSOwAeyYGL0BMh7GEfMgBvy6cgRPPlKPq1Htyup+7
 D53bGxI6/2EhxU21RNkDIJSwEakQA4HsqRg2FZp7RHjX4e8Clfihjh+fT7ybjH6BhyqA
 RMNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=IKHXKw31J9co7dwg29raiD0p06n9wb17Z9ThbSog6TI=;
 b=OoWEZaQbDXDtwHL82HZEpt1t4L0hlH3OugGXARi6jwbhmU5wsFTM9VwpBvzq6A1Lod
 4+0/cu9cGKv40WvZ4MPU9llMjRkX/XfulhtucvThANmfnfe9c/sYDQH8jotv82XY/cPh
 a3dbdFTvR2E37f/x0mcIU+CkH1nWTvFU3BMQe4NGhzGX+csCj5fEBK5ECkD0TWkM92Fw
 cbHVPv6JmU6vyRJJPN8jMUhgcU6QlbpuosY+3KzScr8AqqXhy2mvWf4deUw3ytmm5TtQ
 XZ08qxjThcvGjJXpfnxeHn6mEEScsIwFJsXTJta5dcsEqFDJ3hWVyS2Tfn7GbeQ+vgxH
 ed2w==
X-Gm-Message-State: AOAM530+cpFQ57up5CzkiM1MspOL1qr6mtIVYwMamT3eRCVBdI2XE5ma
 7nS6ujnhwyvarFizNUhq5CU4Vg==
X-Google-Smtp-Source: ABdhPJx3lFiy+/IUEcsJ+kfR/ElJ/Ow/hKyNH4d8d+iciNm5BKUh9ahY0udCpW3dHOyega9qgx1kFw==
X-Received: by 2002:a63:8a42:: with SMTP id y63mr10330472pgd.251.1642988978075; 
 Sun, 23 Jan 2022 17:49:38 -0800 (PST)
Received: from [192.168.15.44] (alanje.lnk.telstra.net. [120.151.179.201])
 by smtp.gmail.com with ESMTPSA id nu7sm12587961pjb.30.2022.01.23.17.49.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 23 Jan 2022 17:49:37 -0800 (PST)
Subject: Re: [PATCH 12/30] bsd-user/host/i386/host-signal.h: Implement
 host_signal_*
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20220109161923.85683-1-imp@bsdimp.com>
 <20220109161923.85683-13-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <01432954-04e6-02d1-a6e3-69f2c0e54434@linaro.org>
Date: Mon, 24 Jan 2022 12:49:33 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220109161923.85683-13-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::535
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Kyle Evans <kevans@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/10/22 3:19 AM, Warner Losh wrote:
> Implement host_signal_pc, host_signal_set_pc and host_signal_write for
> i386.
> 
> Signed-off-by: Kyle Evans<kevans@freebsd.org>
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/host/i386/host-signal.h | 37 ++++++++++++++++++++++++++++++++
>   1 file changed, 37 insertions(+)
>   create mode 100644 bsd-user/host/i386/host-signal.h

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

