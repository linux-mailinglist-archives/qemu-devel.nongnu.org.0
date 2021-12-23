Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A93E447E92D
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Dec 2021 22:44:26 +0100 (CET)
Received: from localhost ([::1]:53146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0Vsv-0003Se-Qe
	for lists+qemu-devel@lfdr.de; Thu, 23 Dec 2021 16:44:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n0Vqf-00023C-4H
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 16:42:05 -0500
Received: from [2607:f8b0:4864:20::1032] (port=50789
 helo=mail-pj1-x1032.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n0Vqd-0004XE-GH
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 16:42:04 -0500
Received: by mail-pj1-x1032.google.com with SMTP id gj24so6070245pjb.0
 for <qemu-devel@nongnu.org>; Thu, 23 Dec 2021 13:42:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=6awBJ8WridAfkxz1vibEo29H2kLHZ9a8nyZfUZexNzI=;
 b=bViW5xOo8ALymKjt3exeUlu+F4Ul8WgRRm6eTt5tD3Qw9WAehfw24C2uU5DumsuuE5
 NTSNZjEMZusjWQgTBpgbXIODFv5LFZL2FE+DdiAT7EQZhJMQbM/+Nm760ev2wfJ79yWA
 Ozv8/VTcuO9lVH6kMAkpTflXj3GZAASpoQTUTqaq6cryrA4g8hXrEHINuW6H6ATLPwpZ
 4/lmzhWiNnDd6TYi4Iijii3uAQs23BEAluJTF8xdePiQ25V8Sb0hvWtpQ0nd3uk7kMO5
 9gz1M7Lylj0F4mzFEM/Pp2c9CmaYLp2LGCv/w+LqjMpn2kg4ACQPsimzZpcvQiWa9HLl
 9jnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6awBJ8WridAfkxz1vibEo29H2kLHZ9a8nyZfUZexNzI=;
 b=Gkg0CsZVC4lP/sCIR/YpTzHZD69ClKxvxsVuojBAX1joL/YPq/x6Swx8tpDvJzMiqW
 aB2IqPYYi/UO7RkoAddRH/QF2SjT46Xq+2smAv4a2eIkPco3n3gO6896/+Fw2KJbPHlt
 sVA1P+3Q75bFuiZFKj/fzrCvbiGwnlz/kQKzMkkbOb3F9bOMD8i3RBPwudl8znfwB9/k
 W1sEx+e/1AKwIL1bXCtECr+wOMExhUrUwYteQK6qGFRzfkiREj+5RlTClb5ODpSAss7f
 37/vEmu0R4rv42gV0fvM37564Zi+9+xGOdY99aono2bZVSbNO8kU47DtArjPdKntLUj+
 miIQ==
X-Gm-Message-State: AOAM533Tcqqu65d2J1ERmT01alX7nSZ9HIQaO6KnKCVTyNq5o+52dxMj
 QoJgTKCLKvt47KR05hR6Ucm5Ew==
X-Google-Smtp-Source: ABdhPJzwT6BH+f1BDGIV8kQWlugezoL7+ULfawlKLh+D0b8gvjUi54Xsu2FPUDXwQcxOEtDgEq2mdg==
X-Received: by 2002:a17:902:eaca:b0:148:c78e:3064 with SMTP id
 p10-20020a170902eaca00b00148c78e3064mr3845757pld.53.1640295722129; 
 Thu, 23 Dec 2021 13:42:02 -0800 (PST)
Received: from [192.168.4.112] ([156.19.246.20])
 by smtp.gmail.com with ESMTPSA id my5sm7093861pjb.5.2021.12.23.13.41.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Dec 2021 13:42:01 -0800 (PST)
Subject: Re: [PATCH 5/8] ppc/ppc405: Rework ppc_40x_timers_init() to use a
 PowerPCCPU
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
References: <20211222064025.1541490-1-clg@kaod.org>
 <20211222064025.1541490-6-clg@kaod.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <551a132b-fec5-f0f6-7d87-21c30bce86e0@linaro.org>
Date: Thu, 23 Dec 2021 13:41:37 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211222064025.1541490-6-clg@kaod.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1032
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.264,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, Greg Kurz <groug@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/21/21 10:40 PM, Cédric Le Goater wrote:
> This is a small cleanup to ease reading.
> 
> Signed-off-by: Cédric Le Goater<clg@kaod.org>
> ---
>   hw/ppc/ppc.c | 42 +++++++++++++++++++-----------------------
>   1 file changed, 19 insertions(+), 23 deletions(-)

You should mention dropping the comparison vs null as impossible as a result of g_malloc0.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

