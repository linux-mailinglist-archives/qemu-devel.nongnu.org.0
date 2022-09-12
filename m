Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A7EE5B591E
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Sep 2022 13:18:14 +0200 (CEST)
Received: from localhost ([::1]:60650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oXhS9-0005Zl-2s
	for lists+qemu-devel@lfdr.de; Mon, 12 Sep 2022 07:18:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oXhJU-0007Pv-Bz
 for qemu-devel@nongnu.org; Mon, 12 Sep 2022 07:09:16 -0400
Received: from mail-oa1-x2c.google.com ([2001:4860:4864:20::2c]:38786)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oXhJS-0006qK-Hy
 for qemu-devel@nongnu.org; Mon, 12 Sep 2022 07:09:15 -0400
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-1278624b7c4so22393978fac.5
 for <qemu-devel@nongnu.org>; Mon, 12 Sep 2022 04:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=QEziVV6s7sTu/83USHoml8LCYGSSGmnLQNJgkqnL/ww=;
 b=jEPVbc90LuVVvLQD042jsZPwMnb4lnKSFw30qWeFeolIN371BBDHkH1x7z8xPdh/bu
 OLlJQYfYo7xQ7B96wMqfQP4rArplyICSUaWDnkn/7zGSPZLlaXufLi3cMZQ8pWl5ejhH
 vHERhwTbNS/D6/kqRPCOKVD5ikY3kChvb1RIP8mu68W3QffrU+yabPcrCrI7TwM0xH2u
 JdnfX+uBlDthtSFWur5puMWRoGuGnVKO6Ed+y/Kr5agFiuRrmBNl2u0WKC40SuvTmNpG
 giAOnnhYvya28NeqiTQ2nnq/Op1HA3Km4lZM53GqZRudQ1x7fKoJGWEQ22j/jjGXQkeZ
 wYYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=QEziVV6s7sTu/83USHoml8LCYGSSGmnLQNJgkqnL/ww=;
 b=qt/572s2FrLdGU1SC6974CI3rWRKA/xYZz8PcE7v3ApRlgF8Z8UxiWqKDaVPMZK/Bj
 dCiDdLy2DxHLQF9XGV53VvqJV9oKD7thlNJy432Vi+sQv15+mfFCn5vWj7NuEXVCE1YL
 QGVXzdrdP7OwztuB+BlUeFsaDtX/i9JvQzrWNLUd94BhOkXh2u2+YfBpXZ6/l6fxSMFE
 xmrdcLNRxw2Twl33cxXlh2K0Wu7NAsY8Q2mvL2KaPzF4plkabIaIJJE59GstDjQtbzbg
 pECEaVYa276ZdWkDRDQNQAT/6sv/ZYZYIMZs+YND3ET06FYbiIhu1g+07KqAQo/HXPUG
 VR2g==
X-Gm-Message-State: ACgBeo2nye5i8Nedeaskx3RDgn9YkLCulx6cgE6GBobdzFfzDfhbxMFr
 mEUBAANAjaxkwIB4hSpKL6+zSQzo2HoWuerK
X-Google-Smtp-Source: AA6agR4rfCiVQLXwX34lvaqT2KlpiO/6Bd2vxGIjrVLhAKDtOPU1hvb1Szo7x++3xiEmoTuOHow6dw==
X-Received: by 2002:a05:6870:8907:b0:12b:78e9:6574 with SMTP id
 i7-20020a056870890700b0012b78e96574mr2896502oao.57.1662980953241; 
 Mon, 12 Sep 2022 04:09:13 -0700 (PDT)
Received: from [192.168.44.231] ([172.102.14.47])
 by smtp.gmail.com with ESMTPSA id
 t16-20020a9d66d0000000b0061c9ab1032dsm4403348otm.18.2022.09.12.04.09.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Sep 2022 04:09:12 -0700 (PDT)
Message-ID: <7168e260-aef2-2f32-4b20-e7bb2ad120bf@linaro.org>
Date: Mon, 12 Sep 2022 12:09:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 14/37] target/i386: Prepare ops_sse_header.h for 256 bit
 AVX
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: Paul Brook <paul@nowt.org>
References: <20220911230418.340941-1-pbonzini@redhat.com>
 <20220911230418.340941-15-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220911230418.340941-15-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::2c;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x2c.google.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.153,
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

On 9/12/22 00:03, Paolo Bonzini wrote:
> From: Paul Brook<paul@nowt.org>
> 
> Adjust all #ifdefs to match the ones in ops_sse.h.
> 
> Signed-off-by: Paul Brook<paul@nowt.org>
> Message-Id:<20220424220204.2493824-23-paul@nowt.org>
> Signed-off-by: Paolo Bonzini<pbonzini@redhat.com>
> ---
>   target/i386/ops_sse_header.h | 114 +++++++++++++++++++++++------------
>   1 file changed, 75 insertions(+), 39 deletions(-)

Acked-by: Richard Henderson <richard.henderson@linaro.org>


r~

