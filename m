Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C7B6407A70
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Sep 2021 23:07:48 +0200 (CEST)
Received: from localhost ([::1]:42360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPADy-0004iK-MB
	for lists+qemu-devel@lfdr.de; Sat, 11 Sep 2021 17:07:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mPAD5-00041u-3c
 for qemu-devel@nongnu.org; Sat, 11 Sep 2021 17:06:51 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:38632)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mPAD3-0002pq-Nc
 for qemu-devel@nongnu.org; Sat, 11 Sep 2021 17:06:50 -0400
Received: by mail-wr1-x433.google.com with SMTP id u16so8083486wrn.5
 for <qemu-devel@nongnu.org>; Sat, 11 Sep 2021 14:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=FAnfaJ0rsOF/YtCNjBVi4vWBqw0AfXDWVGB9FWhmGX8=;
 b=BtnznFKW/lSP7o+dzMU+KpmbJjGZ12WJAbIKOz7HwF889C2pAeKZEut/HdJVXjbE9s
 SbgGY1fUCx5jdiXymU04SRXS9saHg/GAOucLpTMTkb8qqePdzX/O9ps1fP5f+zXbTee3
 DR/LtAn7WZcGAd9OQAWTSZ1I4cNbtwW+cKqpW5t3rHYKvj7h0JNbYXhV9r1YfOH7oZDg
 scq6lRJjw/2cYjuH+H/h3qq2f+uvCf/6KSg3Xqhe1eSiU6unpGOe+zjOYybX/LY+GgC3
 M2fWEIRdNfHKv5udYyE++aTiZcXVBY3p6urhxVyv47iqP9bjO0R1VaMkJ2oKUSYD2Itr
 SGEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FAnfaJ0rsOF/YtCNjBVi4vWBqw0AfXDWVGB9FWhmGX8=;
 b=5vEA/f3gAJVzRndAObBiFQmpZNkJEGt95b7hmYhs2JoFedcvYVCfBkw2w3nsvNbpKx
 px1tUZBOBO2C0t65g8Js+hrjwCOxAFWjccqijsGjJVqbPKq1x2DKmcsdE2rClA3nsE9C
 UwakZErGOrzFPGp+wl/1Tmv7ZmN8gW/KT6znPj9TX0LLXSqYC7hlyKmxqcSU314NLP66
 qMWvDcndogdECH2r9ba+G69Ry2XhD1pflTtQjrsOT3eE0gMgchkIYLX5ixYQ+tB+0+HO
 aJI4pSif+IH8VGr55cad7afzq+2fJteDc6CflBrxkWushn3oHRB3OesLoxItvRrrkDy+
 SfBw==
X-Gm-Message-State: AOAM531d59b4R7hBuOZ70ccu10Oe83Cn8q6QMpPIMGZU/owlmvPk4Jri
 65QhTs98T94A8tRPz95KRLA=
X-Google-Smtp-Source: ABdhPJzRTmEyR6h/Fhhr4OVPTmhMv0m9aixb9EuJzq25np5xApGN3b9sFiprJ3B7qujk6BChkwdsOg==
X-Received: by 2002:adf:f80e:: with SMTP id s14mr4600316wrp.435.1631394407391; 
 Sat, 11 Sep 2021 14:06:47 -0700 (PDT)
Received: from [192.168.1.36] (21.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id j19sm2385583wmi.44.2021.09.11.14.06.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 11 Sep 2021 14:06:46 -0700 (PDT)
Subject: Re: tcg: pointer size warning on x32 arch
To: Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
References: <f5bd1db5-1bf1-e32f-3eff-aa8f0c7e8a1e@msgid.tls.msk.ru>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <6b1c1c7f-0e0b-fd49-2ef8-1ab7c8b7a3e5@amsat.org>
Date: Sat, 11 Sep 2021 23:06:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <f5bd1db5-1bf1-e32f-3eff-aa8f0c7e8a1e@msgid.tls.msk.ru>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/11/21 7:50 PM, Michael Tokarev wrote:
> Hi.
> 
> The following warning is reported by the C compiler when compiling
> tcg code on x32 architecture:
> 
> In file included from ../../tcg/tcg.c:429:
> tcg/i386/tcg-target.c.inc: In function ‘tcg_out_movi_int’:
> tcg/i386/tcg-target.c.inc:959:30: warning: cast to pointer from integer
> of different size [-Wint-to-pointer-cast]
>   959 |     diff = tcg_pcrel_diff(s, (const void *)arg) - 7;

Likely fixed by:

---
diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index 98d924b91a8..0895f5670a1 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -956,7 +956,7 @@ static void tcg_out_movi_int(TCGContext *s, TCGType
type,
     }

     /* Try a 7 byte pc-relative lea before the 10 byte movq.  */
-    diff = tcg_pcrel_diff(s, (const void *)arg) - 7;
+    diff = tcg_pcrel_diff(s, (const void *)(uintptr_t)arg) - 7;
     if (diff == (int32_t)diff) {
         tcg_out_opc(s, OPC_LEA | P_REXW, ret, 0, 0);
         tcg_out8(s, (LOWREGMASK(ret) << 3) | 5);
---

