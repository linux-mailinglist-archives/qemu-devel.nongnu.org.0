Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D51F338C8BC
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 15:53:27 +0200 (CEST)
Received: from localhost ([::1]:44432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lk5ag-0002Cv-Np
	for lists+qemu-devel@lfdr.de; Fri, 21 May 2021 09:53:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lk5ZL-0001Ah-G6
 for qemu-devel@nongnu.org; Fri, 21 May 2021 09:52:03 -0400
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831]:38904)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lk5ZJ-0008Af-Pd
 for qemu-devel@nongnu.org; Fri, 21 May 2021 09:52:03 -0400
Received: by mail-qt1-x831.google.com with SMTP id h21so15300883qtu.5
 for <qemu-devel@nongnu.org>; Fri, 21 May 2021 06:52:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=niIts7V6ZrkwA/ukGFK8no9U4eLMSVqzfsUzEPTgpFI=;
 b=qNSef9h1Ujb8ssu+qPQI6u0GuTiOEPIFvLDafB1fzSVt1jaHZbmkwMFvkZM86DKdVK
 kMEcCOO7rVp/SQGD/dXJE6gwj/tSMAbBg5i/C5+9+HKstZkYYAtHpWTF5DzSatTIrsvv
 xt6u/2HBSTtGalGOoo5QFDO1XXdyFftHkrF0G3Mm1UQhoD1IPmR+KjZMrnOZvQjipREo
 T1dZPOmMg2Tqapji4C43SwktGSHrDEy3is0nbq0dYxnE6xRAHdg5M4hZUQBkx0adBdw1
 RyAE06ppUTxzmwY4S8RbRiisrN9t4ImooCNoznowmM6ekYN2L6z7Pd0li+SJakMcqXUB
 Yw0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=niIts7V6ZrkwA/ukGFK8no9U4eLMSVqzfsUzEPTgpFI=;
 b=Kn4D+MY9ABr0x2NIazlhxNUfZ6NxRPoo7F+j/mp6/PPUwHwibMOPSxKozYqHR2inBL
 IZLG5m78NK0zRobefTk0A0rPTDt3vzF1a/isYbuxpsrnEetLP/qn80KAI6QnJBzyXvAf
 d944Pkx4upKeEwEwKHpY/EULFYdX6ndTGbyY4L/HhGRg99WPh0pqKui1P0sPaJpFsFns
 zxhgwyrUZEt8bcDJhxf2nvfiMes9ZbHzRSrE/rlGiMitDupROBkMuykJeOpg70nEprEB
 xDwYQ1cXsDBRJGJIBPXt2TjXNQwEd5mfkcMWGgeJnoTBScdx9FHUKMGit603NDerdY/I
 1YlA==
X-Gm-Message-State: AOAM530CZlwnBEhiUNAhH7O558Zxt8EW9SkcEPFTSSoHAub4GCU0uHwT
 Ko8Gn4yA2xJ5NGKzse/o4boq5JO3FUW7XCGp
X-Google-Smtp-Source: ABdhPJyBcHlc5spCwpLpB7tOWwjKycBRYRhANIvFVsy+E59ie12+NXKrWaoCtlhC9oroI7pYhCs26g==
X-Received: by 2002:ac8:514f:: with SMTP id h15mr11244418qtn.122.1621605120134; 
 Fri, 21 May 2021 06:52:00 -0700 (PDT)
Received: from [172.16.23.44] ([45.235.253.15])
 by smtp.gmail.com with ESMTPSA id w5sm4805893qkf.14.2021.05.21.06.51.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 May 2021 06:51:59 -0700 (PDT)
Subject: Re: [PATCH 1/4] target/m68k: introduce is_singlestepping() function
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 laurent@vivier.eu
References: <20210519142917.16693-1-mark.cave-ayland@ilande.co.uk>
 <20210519142917.16693-2-mark.cave-ayland@ilande.co.uk>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d0f59bc2-50a8-428e-93b8-5df0d2bf2b67@linaro.org>
Date: Fri, 21 May 2021 08:51:54 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210519142917.16693-2-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::831;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x831.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/19/21 9:29 AM, Mark Cave-Ayland wrote:
> The m68k translator currently checks the DisasContextBase singlestep_enabled
> boolean directly to determine whether to single-step execution. Soon
> single-stepping may also be triggered by setting the appropriate bits in the
> SR register so centralise the check into a single is_singlestepping()
> function.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

