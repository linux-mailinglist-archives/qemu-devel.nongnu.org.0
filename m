Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0DF33DF6C4
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 23:16:29 +0200 (CEST)
Received: from localhost ([::1]:55744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mB1m0-00048s-P2
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 17:16:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mB1kQ-0001rb-5j
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 17:14:50 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:44913)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mB1kO-0006s6-P9
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 17:14:49 -0400
Received: by mail-pl1-x636.google.com with SMTP id q2so589480plr.11
 for <qemu-devel@nongnu.org>; Tue, 03 Aug 2021 14:14:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=8SvlClcTkAy9IpxSg+5sEwKByQJDQF3iPJDtz9PMMBs=;
 b=te4h3ZXAOTIu/PNpghKhquDGXfdpWp47hX7XGOivXIrMurSnJO8N+ML9XZxgiH5Hzi
 o1P6MtJWm+rCvSR7EoELCfozdVOxxQm/1sA1l7MMVNhjLDmjfo9LupNMtIaf+tmcYAx4
 S9y2iHHdIZ3qAGZrgFouD3YuQ9UTDR6LAirBLooviSzZjt2pVX/a974FPD9Aumg5ZWyB
 KG9/HEYb0GXjw4WIrJD3sAP3FkkA7t3X5Gd9aBHDet4JNp/aK8Ev+MaLVezrNVX5XBpl
 HX40wUwTZbx8tyYuEF//vk4FjzfkCbQSmU6NBnKxyZqRXpRDsH0+0l2qFnIn/lMtRbS+
 wKbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8SvlClcTkAy9IpxSg+5sEwKByQJDQF3iPJDtz9PMMBs=;
 b=TkVr5j/4fLwyy08gDqSPQ0J4WOhSh945b8YobY9wDJOoTTTnfWoDBwXlMQQrTBpLG0
 3h2jUVuJsIHjonwMdaSE2CMYJgTh1fwZffA/DWvF7k8bFPJ1gN4JNSrVKwkI78DwD1PM
 v6sJqo6jYb0BMfHO9hFf947biI2iqTJzlJFMoFWLrmfJLhcRwUc8+yuO9uT+yYG8M3lv
 iA57FBx0nwrek18K3Zf4OhANgPA6X2vR++r+mEBe9dPzY9CvqzGOMLtQZsx30GQNxo7y
 mTW6Iu8d4ogEhVG3lwETnPwVL+HBFKLTqTiwLDTpamGaMwwfcUrHl9oBJXz0BLgZiIWe
 Su7A==
X-Gm-Message-State: AOAM533+tNGPwl9yuTBPDL37FatzSKIXjJHL1sXPTpMouLVIx2OfsMLf
 ZyO45dGANqv5sp2eW6Ed/mCpbw==
X-Google-Smtp-Source: ABdhPJx+haUJTaRXxFLYsZD5oOGu5b1oHhAcBVy/WQJW3EdxWDdvJoGROGMPHEUqK9umNeCRaQCoXw==
X-Received: by 2002:a63:1e5c:: with SMTP id p28mr697962pgm.3.1628025287135;
 Tue, 03 Aug 2021 14:14:47 -0700 (PDT)
Received: from [192.168.6.169] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id i1sm3988519pjs.31.2021.08.03.14.14.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Aug 2021 14:14:46 -0700 (PDT)
Subject: Re: [PATCH] accel/tcg/user-exec: Fix read-modify-write of code on
 s390 hosts
To: Ilya Leoshkevich <iii@linux.ibm.com>, Riku Voipio <riku.voipio@iki.fi>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20210803195406.149446-1-iii@linux.ibm.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <9812a7a2-89ca-abb8-aeec-d01d6c8b4fcd@linaro.org>
Date: Tue, 3 Aug 2021 11:14:43 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210803195406.149446-1-iii@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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
Cc: Christian Borntraeger <borntraeger@de.ibm.com>, qemu-devel@nongnu.org,
 Andreas Krebbel <krebbel@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/3/21 9:54 AM, Ilya Leoshkevich wrote:
>       /* ??? On linux, the non-rt signal handler has 4 (!) arguments instead
> -       of the normal 2 arguments.  The 3rd argument contains the "int_code"
> -       from the hardware which does in fact contain the is_write value.
> +       of the normal 2 arguments.  The 4th argument contains the "Translation-
> +       Exception Identification for DAT Exceptions" from the hardware (aka
> +       "int_parm_long"), which does in fact contain the is_write value.
>          The rt signal handler, as far as I can tell, does not give this value
> -       at all.  Not that we could get to it from here even if it were.  */
> -    /* ??? This is not even close to complete, since it ignores all
> -       of the read-modify-write instructions.  */
> +       at all.  Not that we could get to it from here even if it were.
> +       So fall back to parsing instructions.  Treat read-modify-write ones as
> +       writes, which is not fully correct, but for tracking self-modifying code
> +       this is better than treating them as reads.  Checking si_addr page flags
> +       might be a viable improvement, albeit a racy one.  */
> +    /* ??? This is not even close to complete.  */

You should have gotten a checkpatch warning here.
Just convert the comment to

   /*
    * this style
    */

>       pinsn = (uint16_t *)pc;
>       switch (pinsn[0] >> 8) {
>       case 0x50: /* ST */
>       case 0x42: /* STC */
>       case 0x40: /* STH */
> +    case 0xba: /* CS */
> +    case 0xbb: /* CDS */
> +    case 0xc8: /* CSST */

CSST is format SSF; you're not checking enough bits to distinguish from LOAD PAIR DISJOINT.

Otherwise, looks good.

r~

