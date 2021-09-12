Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13633408207
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 00:18:13 +0200 (CEST)
Received: from localhost ([::1]:43836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPXnf-0001uU-OB
	for lists+qemu-devel@lfdr.de; Sun, 12 Sep 2021 18:18:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPXmd-0001G9-21
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 18:17:07 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:36825)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPXmb-0002e2-Ey
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 18:17:06 -0400
Received: by mail-pf1-x436.google.com with SMTP id m26so7066597pff.3
 for <qemu-devel@nongnu.org>; Sun, 12 Sep 2021 15:17:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=XhCmaQMkmisXWKGWNs9jfRMRQSyGUb6gFOzy0UNRmMA=;
 b=o4ds6JoC6Iy0jUj5GkecLPKxtdwBDDbf9PpjNMwKcPe1MrWqtE+DhdmE1g4/SaSfic
 7EZwwWwfUMNFoUbHS/bgl/xyKV5BRAFJAkVlqKWW38kvbufFke5TEkzH8JWb2yi2fKFb
 gFtnngeLMKkVSdYt6e085JYSf9VxNznOmgQFEVTNLCIO47TZHCSYMLeEPrtvF/TVad4+
 SxeDElDu082OP2hUKgER7UddwFuexX5LtYIH856uBnYaGaEOGRZvlpqIbD4+3H4ElVoR
 suu3VAvssw2fqkd6SM/1OB2Z20cfq+x02hy4Ql9jZG6mEYaJSU8UTjetOvSVtCNGU7Yt
 IkgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XhCmaQMkmisXWKGWNs9jfRMRQSyGUb6gFOzy0UNRmMA=;
 b=0POdHTB2K9qRrOAYTvxNrchgthAQuVmqKwrFJSkX6dJ+l9VLxbyslQw44Pafpsw4ES
 ot563Ig+GmpC4Ly07sR4IR1urLbVV5HjEEdvfutpbeDRPHNG892LxeoGkxqSSeS5XAcP
 CpcQskOPUbEfpjNxUgfTZIwSxAYxcbAkfKiuKYK1pB8HgSGg+Br8zq+dzZ/SJYoCHRaC
 OGIDaEEC7AyaCPtrPEBJzoIuXktdocQtjS0Dbr9HLlIFkA6LIKfSb0IbViE5ImmC8GU8
 R1bS0Mf7QkQ8Q767xzhpKgKEBTeEmxGomqghEK93mtP2KqmpudXOFdUitl8IDlrRyU1h
 U8NQ==
X-Gm-Message-State: AOAM530PumX+kIu16QCKw5aca76rnE6PKn7gwPvsLSNZNeaXPUZ+Y2vD
 9QL/CCpNabzS+8N97AVRbXOCtg==
X-Google-Smtp-Source: ABdhPJzDNYaj4c7GVig+MNyB8C5VK1tKJu7jeQ7iUt3gOHQxzeVrzEdXiFJTWpG0d35t13kdTmlpiQ==
X-Received: by 2002:a63:af18:: with SMTP id w24mr8368521pge.471.1631485023111; 
 Sun, 12 Sep 2021 15:17:03 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id z9sm4686681pfn.22.2021.09.12.15.17.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Sep 2021 15:17:02 -0700 (PDT)
Subject: Re: [PATCH v2] accel/tcg/user-exec: Fix read-modify-write of code on
 s390 hosts
To: Ilya Leoshkevich <iii@linux.ibm.com>, Riku Voipio <riku.voipio@iki.fi>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20210803221606.150103-1-iii@linux.ibm.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a881247c-a612-3015-7225-b6516dd741e5@linaro.org>
Date: Sun, 12 Sep 2021 15:17:00 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210803221606.150103-1-iii@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
X-Spam_score_int: -56
X-Spam_score: -5.7
X-Spam_bar: -----
X-Spam_report: (-5.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.584,
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

On 8/3/21 3:16 PM, Ilya Leoshkevich wrote:
> x86_64 dotnet/runtime uses cmpxchg for code patching. When running it
> under s390x qemu-linux user, cpu_signal_handler() does not recognize
> this as a write and does not restore PAGE_WRITE cleared by
> tb_page_add(), incorrectly forwarding the signal to the guest code.
> 
> Signed-off-by: Ilya Leoshkevich<iii@linux.ibm.com>
> ---
> 
> v1:https://lists.nongnu.org/archive/html/qemu-devel/2021-08/msg00464.html
> v1 -> v2: Fix comment style, fix CSST detection (Richard).
> 
>   accel/tcg/user-exec.c | 48 ++++++++++++++++++++++++++++++++++++-------
>   1 file changed, 41 insertions(+), 7 deletions(-)

Queued, thanks.

r~

