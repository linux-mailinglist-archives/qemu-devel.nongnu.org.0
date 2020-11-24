Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 300CF2C2C28
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Nov 2020 17:00:51 +0100 (CET)
Received: from localhost ([::1]:40010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khakK-0000V0-VF
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 11:00:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1khaio-0008OV-Rz
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 10:59:16 -0500
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:44885)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1khaim-0005vx-K3
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 10:59:14 -0500
Received: by mail-pg1-x52d.google.com with SMTP id t3so4000472pgi.11
 for <qemu-devel@nongnu.org>; Tue, 24 Nov 2020 07:59:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=lxi44TZdwba9nT4EIWS2meQ9SPRGyrhK2LDrOtyAJrU=;
 b=Y2dG1+oD9Yuy8GrCk6reWYsupCD6hidAHUzghujoEyBcO7b5b1GfU1sK+fLcKqroSH
 uE2DFIHhSRiGOI1nLO+RK0G+yoqhiXyw41ouwyW6isV6MqMzGxYhqN1uFGlQTt2n6jpf
 rBT1/EfEKG28vBqDpDRDqNClvKpkeC/3tG1JC/AVMMAauBCAdZPx1JON3B7l2pDEsDTk
 Cwd2WRDt+JvM0vfTqQEQhx3q1rXV9nTaT0f4J5aXYB9wXhjB3LMX2fHeFKf2/8nPBAH7
 OSHw+vzCR0/GlLCfJ3HSsFn1Mtt12m7zGC+lod8Fv1yEjQjoyBrzLirXXGgTVq5HWBZU
 ERaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lxi44TZdwba9nT4EIWS2meQ9SPRGyrhK2LDrOtyAJrU=;
 b=rr1/fnJlcpCLv54wjHfxOpqdPZswxgZPuYJGSsuz/CONtKwUg5QaEcPd+BamLSQe2/
 sUty06xZNbp3BNNO3aRzwBFSm/ntjxg1gWSs9/fwfUtrlfvpv5qjZP2Zu4JNRp14N27H
 Rv4IKu2t/+bPNyk/tEFuJe6XhqPo+vPf1tgR3HWNgGfdDufVw6QFxtw8G9Kzwoc68quo
 kL5DZ0CEJQsd+v05DEAIERfcAOJAx2xYqZy3Ek6dMKEbhofDwCu3FcCoHJfFlZGOdUZi
 Q6+ptQyhTpSQ5cD62mkBPiySnDmt8p3g4pIOl+azctN21J5eYeNds6fK7LtXWzbEKVv6
 hh/g==
X-Gm-Message-State: AOAM532BG/ZYLwt8EoZE4xgqFi15sbBmeZgdjl9ZyThranqN1CURmopc
 GhDiWWpbfm9pP+zrkAcAzjvNxQ==
X-Google-Smtp-Source: ABdhPJyE+pBG6ULrO6+LBDF7gNkaukvBRy0hYdFpQ3ji6QFlGHM2V5D7QqTMlN0R9SAw65l2eF/XbA==
X-Received: by 2002:a63:3346:: with SMTP id z67mr4172606pgz.111.1606233550178; 
 Tue, 24 Nov 2020 07:59:10 -0800 (PST)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id o89sm3763398pjo.47.2020.11.24.07.59.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Nov 2020 07:59:09 -0800 (PST)
Subject: Re: [PATCH-for-5.2?] target/mips/translate: Check R6 reserved
 encoding for Load Linked Word
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20201124134557.569388-1-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5bcade19-de8c-8521-f77c-599e3c9d40a0@linaro.org>
Date: Tue, 24 Nov 2020 07:59:06 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201124134557.569388-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Mateja Marjanovic <mateja.marjanovic@rt-rk.com>,
 "Maciej W . Rozycki" <macro@linux-mips.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/24/20 5:45 AM, Philippe Mathieu-Daudé wrote:
> Release 6 recoded the 'Load Linked Word' using SPECIAL3 opcode,
> this opcode (0b110000) is now reserved.
> 
> Ref: A.2 Instruction Bit Encoding Tables:
> 
>   "6Rm instructions signal a Reserved Instruction exception
>    when executed by a Release 6 implementation."
> 
> The check was added in commit 4368b29a26e ("target-mips: move
> LL and SC instructions") but got lost during latter refactor
> in commit d9224450208 ("target-mips: Tighten ISA level checks").

I think git blame is confused here -- d9224450208 isn't the one that broke
things.  The patch has:


+    case OPC_LL: /* Load and stores */
+        check_insn(ctx, ISA_MIPS2);
+        /* Fallthrough */
+    case OPC_LWL:
     case OPC_LWR:
-    case OPC_LL:
         check_insn_opc_removed(ctx, ISA_MIPS32R6);
+         /* Fallthrough */


Whereever it happened, it's broken now, so
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

