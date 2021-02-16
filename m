Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFAEB31C6DC
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 08:34:36 +0100 (CET)
Received: from localhost ([::1]:49774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBusV-0002wr-QA
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 02:34:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lBupX-0001mp-Hw
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 02:31:31 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:33689)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lBupW-0002uN-5E
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 02:31:31 -0500
Received: by mail-wm1-x333.google.com with SMTP id a16so5075400wmm.0
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 23:31:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/aU4zPSEhja0fAy2vBMNH6ZuftTBPhRMbBvdUPWrVlk=;
 b=Iee8stE+v9p2MHHrFg7DD5QwqCA56eQ15pH1x+TzvTl5kXaGMzvhw0PT94LBoLIL/x
 1u2TKU9trBmIBSdNp9OnKtUc6oA7Q1g++UnR2EUvLLiI+6nM1hVLpECwaXfFZUTWC+Xl
 6hiz6xwruRiJeu8fe7zgF6Rf4AdxBj5ZL5X0mbnaHxQm90OG2tPW2anDnAPj7idn+BgJ
 GgY0zVgRyRPkLdXFDB4M31fkgPzrtN1aEoMp9/sAaKSwzncfysnX5aOt0V6r8snSz7Ja
 A23hbep09WRIDr+PdmpW5A1FxM0mUxkj9Y3pUY3BaezbvQAERZC9AgfzX9quapUKxEPh
 6MEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/aU4zPSEhja0fAy2vBMNH6ZuftTBPhRMbBvdUPWrVlk=;
 b=CiUWb21p+vLulfzb8fHJrcoKpk1uFPhIXjBN3lg6f5BqIRSJUhHIdDjMdUgAA2zKnA
 pnWSGEGcdE5pFKh0i/ajQcMeGeiNhiUZkYMPJYPtvz5VslwT8l6iLTuhHjvPpm4TEdJg
 +R87jcfAkS3pM/AdqKyr+wp2sA8LVILUgUsFNrCHXuwXv/rYwJQ3eD12NnzGiOVCuDRg
 StRbFqgv6/LgUYGFI6U4B23+QL73IWv0HoxWa/juGw8PD6LDziUlEUbjjIZ5669ozO4H
 rdU3Vu0ClswjivqOOauOmkHucMHpULXH+GsAL6FRmRifCYEXPN7NcoxDPf1MUIgfDvg/
 qViA==
X-Gm-Message-State: AOAM5314FejQRkdeA7saNq5T+eum40aE0XIkus/5B5ILBWdmpvqL6cYN
 FE9mmQYct23yuvezcNId+daPsc1uHUo=
X-Google-Smtp-Source: ABdhPJxTXO+sadWTYSaR/rdV1qk9ZVAXZezRDW3QQ6W7svblJILRMylNZMd48Zhij4790E+NcCzfvA==
X-Received: by 2002:a1c:8041:: with SMTP id b62mr1481276wmd.0.1613460688986;
 Mon, 15 Feb 2021 23:31:28 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id j14sm22296428wru.43.2021.02.15.23.31.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Feb 2021 23:31:28 -0800 (PST)
Subject: Re: [PATCH v2 20/42] esp: remove the buf and buflen parameters from
 get_cmd()
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 pbonzini@redhat.com, fam@euphon.net, laurent@vivier.eu
References: <20210209193018.31339-1-mark.cave-ayland@ilande.co.uk>
 <20210209193018.31339-21-mark.cave-ayland@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <c6ae1b43-b86f-0f0c-cfdb-11983bf5ac0b@amsat.org>
Date: Tue, 16 Feb 2021 08:31:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210209193018.31339-21-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/9/21 8:29 PM, Mark Cave-Ayland wrote:
> Now that all SCSI commands are accumulated in cmdbuf, remove the buf and buflen
> parameters from get_cmd() since these always reference cmdbuf and ESP_CMDBUF_SZ
> respectively.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/scsi/esp.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

