Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A1AE2CF581
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Dec 2020 21:21:04 +0100 (CET)
Received: from localhost ([::1]:59758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1klHZd-0007oR-UI
	for lists+qemu-devel@lfdr.de; Fri, 04 Dec 2020 15:21:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1klEnH-0000fA-HK
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 12:23:02 -0500
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:33732)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1klEmo-0001De-DY
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 12:22:43 -0500
Received: by mail-ot1-x343.google.com with SMTP id b18so5917016ots.0
 for <qemu-devel@nongnu.org>; Fri, 04 Dec 2020 09:19:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=s/K/Z1mU174+bqILLTQa5GQtSbllWYCoyDJq8pLRWUs=;
 b=mmXBGzKPxVKZBz6+V+ztZUYe22UlZo+cKJWbcol8wKgU+vrICSzzfxb1D8ithAMckd
 n7W2JK2GzntOhFEoEmA+q4rCrpsNoNiIVXt1Oow42dZ/B6zrXb5dKo1wyGBPJ4qV9iNC
 PjLLXIAxlkc0J9BACu18lI83xRz7L858iYgxeisD3RtCbp/guCwC1D71oyjoJw22mrhx
 /T/BaY9yl0NcO8hYR9h3aZErk3vsoAYszrVXMpPdFTSBey9fnQiG3E3q7uTwfs8dq6PU
 xYmMjeiwTQP8YaCj9n4BNCkr1TKUYW/VUYQ7wdwLDSe/uy0f9eqytjXodS9u2vOQ5aIU
 7hTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=s/K/Z1mU174+bqILLTQa5GQtSbllWYCoyDJq8pLRWUs=;
 b=lYv8iiKX01YZI8q689a9QYrePFQFJWuJ9G2IdLFER7wYlREp/nOdHUCWNXuvdiIx2/
 ML3PqkVQf5c0K8edfFp+x/mVpoBNHq2IR3KHBWDI9WL9hPqaF66TIAEm3GCcOelJneLk
 Z4OlXO7EMcbU8ayIol3K/J1Az4jqZcAgLYa59/JoWdrzBmxWxpZIJWNFSZXeuvnuxykv
 E8V5OQmukFqHNdpNXybWUrPPkdxlbkzqcfXN+DjZuRZjHIybOYhCpGUSkS6tuqmeV1wI
 WjA4JcmSgIt+lpNSMOBH+Gt30HbfuAticZbm3zoDM9oe2kaybMmpqtIEcuIlvQY/BLxu
 iuNA==
X-Gm-Message-State: AOAM532f6kjpm+33zDnnaj1KKw9riu8Jm3ErdEpGVwFBetWxnoOmWiSL
 1bcMYdzCa11ezHyOhjIgfHC5NCcq9XEZ4KG1
X-Google-Smtp-Source: ABdhPJy8jHi956LTYxapRjhjvfcFUICeFKrtbEDUKfTdYkuX+/gTpCCIEdWfxJNxdp8n+XwoeXvYIw==
X-Received: by 2002:a9d:7d92:: with SMTP id j18mr4203985otn.17.1607099339170; 
 Fri, 04 Dec 2020 08:28:59 -0800 (PST)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id k20sm734786oig.35.2020.12.04.08.28.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Dec 2020 08:28:58 -0800 (PST)
Subject: Re: [PATCH 6/9] target/mips: Alias MSA vector registers on FPU scalar
 registers
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20201202184415.1434484-1-f4bug@amsat.org>
 <20201202184415.1434484-7-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ac68e51c-650a-55df-c050-c22a1df355b5@linaro.org>
Date: Fri, 4 Dec 2020 10:28:55 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201202184415.1434484-7-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::343;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x343.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, kvm@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>, Huacai Chen <chenhc@lemote.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/2/20 12:44 PM, Philippe Mathieu-Daudé wrote:
> Commits 863f264d10f ("add msa_reset(), global msa register") and
> cb269f273fd ("fix multiple TCG registers covering same data")
> removed the FPU scalar registers and replaced them by aliases to
> the MSA vector registers.
> While this might be the case for CPU implementing MSA, this makes
> QEMU code incoherent for CPU not implementing it. It is simpler
> to inverse the logic and alias the MSA vector registers on the
> FPU scalar ones.

How does it make things incoherent?  I'm missing how the logic has actually
changed, as opposed to an order of assignments.


r~

