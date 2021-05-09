Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2477377615
	for <lists+qemu-devel@lfdr.de>; Sun,  9 May 2021 11:42:15 +0200 (CEST)
Received: from localhost ([::1]:42242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lffx1-0003aM-1z
	for lists+qemu-devel@lfdr.de; Sun, 09 May 2021 05:42:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lffsn-0004ca-DH
 for qemu-devel@nongnu.org; Sun, 09 May 2021 05:37:53 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:53109)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lffsm-0002DV-5N
 for qemu-devel@nongnu.org; Sun, 09 May 2021 05:37:53 -0400
Received: by mail-wm1-x329.google.com with SMTP id g65so7520680wmg.2
 for <qemu-devel@nongnu.org>; Sun, 09 May 2021 02:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=tvw+KU+Hpaqj3vLq/g2r/3i89KzWWxhdyAd+2wTHo04=;
 b=rcHdp3qb3a8FMAddyNNep/3i55th5VAUltoKNQMjAd0gahZow+//GmBdgZ4ZEguFgn
 tnsODqf1kmqEFgrfHRPoDYaWZRHZgGuEOx1cURd4J3Y8mXygf53h4cWecLepuRPMIr7h
 m7GtuIzvd4g4tvaWNCh8v7i4FljA3+aOf2UqPd8oURnNBAIKXE0iEQ61hSuFv0i5uTAO
 ZZC6uRSlAHWzZ/Fg2A/p+GOxZnLx7amp3poWfmJo8/3wOzob2dW15dtim7YnwUWTpi+d
 IfrCoZ+axrofDtjkQUNDemukDF6VGRLTlTxbqrGBxwdWTGR0BPwGQvHEIZD4kzMJxypk
 J5Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tvw+KU+Hpaqj3vLq/g2r/3i89KzWWxhdyAd+2wTHo04=;
 b=j+VdAP/C/54vvIHwcJrXkKGd5pDDk2TZAyLhL+r1+F2LPERwZ11K9iQQrlueL46FV0
 8gywODsl+Ww/Towh00W3IOUXvda2oyXSvLChxBFMQkdxyjfrWHd7NQ3yeHfjcIb7k+qf
 e57HAQFr//38IkFrAlCDHbdlg7/7dB6pKgnAfgYeb6CQODpmVDWWrtkmpzHdV0/cIl4j
 Txp1PwQy9xwgqudoonnsKiXFQgNLK1CWaU+eiQ+WgadyVDvI0eJc6QXN0u0qzJ7dj6Lo
 MjMLZ3gJwFy9NtVZln0Qm5cidhgDvuyORSCQ1LkVvli4T7UEKHfk64c+lPoftHecTdMu
 NREQ==
X-Gm-Message-State: AOAM532W8nqVuDfIX+casXp+KGfYGcNViHBUaBFdse+FQUKs/sGrHGlz
 /RSu9KfPdwi5Anlvu1V6ubY=
X-Google-Smtp-Source: ABdhPJznT+EgrNpksNR6pgXcCBsGoiCc80xIdHQGqkrJCZegiEFfw9tu7tKkUucl4N4feb+/8gHssw==
X-Received: by 2002:a1c:1bc9:: with SMTP id b192mr31481377wmb.3.1620553070991; 
 Sun, 09 May 2021 02:37:50 -0700 (PDT)
Received: from [192.168.43.238] (45.red-95-127-157.staticip.rima-tde.net.
 [95.127.157.45])
 by smtp.gmail.com with ESMTPSA id l22sm19907968wmq.28.2021.05.09.02.37.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 May 2021 02:37:50 -0700 (PDT)
Subject: Re: [PATCH 16/72] softfloat: Move type-specific pack/unpack routines
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210508014802.892561-1-richard.henderson@linaro.org>
 <20210508014802.892561-17-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <92fb4ba3-87c4-867e-1458-8b55a187b4eb@amsat.org>
Date: Sun, 9 May 2021 10:46:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210508014802.892561-17-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x329.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
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
Cc: alex.bennee@linaro.org, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/8/21 3:47 AM, Richard Henderson wrote:
> In preparation from moving sf_canonicalize.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  fpu/softfloat.c | 109 +++++++++++++++++++++++++-----------------------
>  1 file changed, 56 insertions(+), 53 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

