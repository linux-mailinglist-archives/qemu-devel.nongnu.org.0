Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9EB23A1B8D
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 19:11:33 +0200 (CEST)
Received: from localhost ([::1]:60466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lr1jo-0000ZU-Tm
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 13:11:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lr1hu-0007bb-IX
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 13:09:34 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:42581)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lr1ht-000233-10
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 13:09:34 -0400
Received: by mail-pg1-x534.google.com with SMTP id i34so13588046pgl.9
 for <qemu-devel@nongnu.org>; Wed, 09 Jun 2021 10:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=qDvA89B5kPlQWacV7NDu1Zp0msJjeFgFm4PDbPoGIKY=;
 b=pADAAFfkeMvQbDv3P7yr8xolUFfbIDHeQU74UJZ7MY3BUeORAkR501Czr1nFtDlB8d
 Rv3nlDgI/ouWc/UloYRKwM1ixiHFy3xXWBOqzVkcuQ5hsrNBneeSEkDxCRRHNkMDk6Pl
 vIztfI6csJHRFEXwM6J/c3nST2IpWzLWMPm5VblMnAtpv/TlxttNfP39GAKDcgg/OPdy
 k3MccB0JGFL0dAjzrpgC9x4d204sHG/8x2BTO5Q/PKHgKxf7KKoJGIKAbHIuzLZPN5xC
 hkkuG9kkNKu398lxj4zqrNe0aAY+SjwqKFgXhGeKpBm5L9a0ZDiF3LCdwN5VsDajwUNU
 KxKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qDvA89B5kPlQWacV7NDu1Zp0msJjeFgFm4PDbPoGIKY=;
 b=H91MVWHuqZz5E493JgF16z201302i1hKspI4m8vQC/qPj4gOj0C0ktVM2m5mhDRr4G
 z8KYwapt7uVVxnRs4plNPrBGYMVJqCuDVyqoz2S5czx2wJJF8k+5NEv6fGVxZyHO2ruS
 L8As9ixn1ECtSYEp4vo6IHbqQPL0FN+TCRRR2Z/AEFyIh5TXsq6gmNNlaExvNsUhxj0B
 usdeq78G0/EWeD0q4TQtncEyev3kJoUzw9qwOBOj9RUF3OQxMxX5D+6gdpjdoqYOqpNI
 nmIy0f5mm62sl+cauDvlEJN1KCaVk2360n9TtY6nLgXCC4pIJlcpWHiiGKaI5MNX0JNo
 jPLg==
X-Gm-Message-State: AOAM530cNi6Pv1bwqHBlyOKrhSr98HCdlwaO0X/U81Orts2xspl9CGEs
 C8+TxnH8hLGRM6IzFJhFgmujujbJ4dRgnA==
X-Google-Smtp-Source: ABdhPJxo8uY0xlVR2yPTIM5nMq7gj7ugCbdvJxU3GLhktpck4nmNdZen05EyvAl5ZZ+8wTGYS/iYjQ==
X-Received: by 2002:a63:4915:: with SMTP id w21mr655644pga.363.1623258571612; 
 Wed, 09 Jun 2021 10:09:31 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 r5sm5656886pjd.2.2021.06.09.10.09.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Jun 2021 10:09:31 -0700 (PDT)
Subject: Re: [PATCH 11/55] target/arm: Implement MVE VLDR/VSTR (non-widening
 forms)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210607165821.9892-1-peter.maydell@linaro.org>
 <20210607165821.9892-12-peter.maydell@linaro.org>
 <fef05b3a-eb23-fea7-0230-a69207b48e11@linaro.org>
 <CAFEAcA_xEh2h8ZV4-mianY8wcz=TKdvdmFr+e4gikAUtW_THGQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <7f4f43cf-2a9b-d08a-90f5-46f4f307b5f5@linaro.org>
Date: Wed, 9 Jun 2021 10:09:29 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_xEh2h8ZV4-mianY8wcz=TKdvdmFr+e4gikAUtW_THGQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/9/21 3:01 AM, Peter Maydell wrote:
>> Is the spec forward looking to more than 7 Q registers?
>> It's tempting to just drop the D:Qd from the decode...
> 
> I don't know, but looking at the decode it certainly seems
> like the door is being left open to Q8..Q15. Other signs of
> this include the existence of the VFPSmallRegisterBank()
> function and the way that VLLDM and VLSTM have T2 encodings
> whose only difference from the T1 encodings is that you can
> specify registers up to D31. Decoding D:Qd and then doing the
> range check seemed more in line with the spirit of this...

I agree.  We should leave the decode in place.

Do you think it's worthwhile adding a single hook for the register range check 
now?  E.g.

   if (!mve_check_qreg_bank(s, a->qd | a->qn | a->qm)) {
       return false;
   }

static bool mve_check_qreg_bank(DisasContext *s, int qmask)
{
     /*
      * See VFPSmallRegisterBank, always true for armv8.1-m.
      * So only Q0...Q7 are supported.
      */
     return qmask < 8;
}

And, as needed, another one for dregs.


r~

