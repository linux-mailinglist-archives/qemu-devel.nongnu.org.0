Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB5B9400A78
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Sep 2021 11:46:59 +0200 (CEST)
Received: from localhost ([::1]:43802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMSGJ-0005se-03
	for lists+qemu-devel@lfdr.de; Sat, 04 Sep 2021 05:46:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMSEo-0004Dc-8x
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 05:45:27 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:44737)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMSEl-00025x-Vf
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 05:45:26 -0400
Received: by mail-wr1-x435.google.com with SMTP id d6so1457580wrc.11
 for <qemu-devel@nongnu.org>; Sat, 04 Sep 2021 02:45:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=q2o87UtM5jD/uBhuqR6VpL68dRwcycdg94bvq9ekm3I=;
 b=iq5pqLOfc/5AkV8UU6zjd6zNSv6+aa24Lb2kcQKpmx98R2CHZQl6l8D8ZgqXZ4IU3P
 rPQ7sKlbnuNqsYIpnkY1XQvuZ4oeFlJ4u6jHDHGAMYizKTH/YRDqPLcmfOeDkA0KoiBJ
 liKVEplz9eqgK+mVPVQWiWoZQY2/pYNgozVJ0BAS+i2ew74j3xJgBNpIHIPPnANs6crr
 U6Nu/7tYDRGi/zNmECW07mi8t++n6EZcJagU0z5DmoDSOGTiIUtTSrtEDRMULBh64aJn
 YTgk6KCuLzAe0aPCMbflG0cm3sB9AZuBQ9JynFslGb7nTxkkFkGvR4WbkiQddAMW6+SF
 EL0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=q2o87UtM5jD/uBhuqR6VpL68dRwcycdg94bvq9ekm3I=;
 b=LwaBVE9X2LJfvBsN0w/1QfclOFUcsM4AUQEI3RbDVjMh+MzNIE/NUSHzzIQn+KXahO
 fHG5PAjCqD8/Qj/RIVQ6RZCW5TOFeOdcYaKKalgwyasrynHR+AIa2NfjJ9Yk9HBp63dz
 JgHOyosFvFJtv2EnFLv2fXv+cjtDjwfmhTWGndgvgQEjurpHVN1bQK19uMMsjavw5r0L
 3XsT4y3smJFGl/8o1gZaNw25rOC5ooKeLMPbZXpFaSDAWU2IGPrIbYu8opx4LQSV/MOf
 WrE+GeArGx7jrs4ONxhgtgCbrQSt6uA5/i/BDA+HVtpSTQYpQ8jh6Cqvjvf8lh96KMCU
 50kQ==
X-Gm-Message-State: AOAM531rxoAuN3ediUs5M+8MXHf9Gpe1x/w5u6JyhIOBgZmD5A5VhfVp
 EV6Io4oL6B6Go0ZNlTYMIg0bdg==
X-Google-Smtp-Source: ABdhPJwFoW5Ym/DtuE16dkkwDB7n7F2jBgsSvEZtqf91jZiPt4A+doTUjoBi/gexTXuzJtl3OxhhbQ==
X-Received: by 2002:adf:9f51:: with SMTP id f17mr3191494wrg.301.1630748722662; 
 Sat, 04 Sep 2021 02:45:22 -0700 (PDT)
Received: from [192.168.8.107] (246.red-2-142-218.dynamicip.rima-tde.net.
 [2.142.218.246])
 by smtp.gmail.com with ESMTPSA id b4sm1722818wrp.33.2021.09.04.02.45.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 04 Sep 2021 02:45:22 -0700 (PDT)
Subject: Re: [PATCH v4 03/21] target/loongarch: Add main translation routines
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <1630586467-22463-1-git-send-email-gaosong@loongson.cn>
 <1630586467-22463-4-git-send-email-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <7002891b-8d82-af4f-e62f-293b7fc8ea6a@linaro.org>
Date: Sat, 4 Sep 2021 11:45:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <1630586467-22463-4-git-send-email-gaosong@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.888,
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
Cc: peter.maydell@linaro.org, yangxiaojuan@loongson.cn, david@redhat.com,
 bin.meng@windriver.com, mark.cave-ayland@ilande.co.uk,
 aleksandar.rikalo@syrmia.com, jcmvbkbc@gmail.com, tsimpson@quicinc.com,
 alistair.francis@wdc.com, edgar.iglesias@gmail.com, chenhuacai@gmail.com,
 philmd@redhat.com, atar4qemu@gmail.com, thuth@redhat.com, ehabkost@redhat.com,
 groug@kaod.org, maobibo@loongson.cn, mrolnik@gmail.com, shorne@gmail.com,
 alex.bennee@linaro.org, david@gibson.dropbear.id.au,
 kbastian@mail.uni-paderborn.de, crwulff@gmail.com, laurent@vivier.eu,
 palmer@dabbelt.com, pbonzini@redhat.com, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/2/21 2:40 PM, Song Gao wrote:
> +static inline bool use_goto_tb(DisasContext *ctx, target_ulong dest)
> +{
> +    return true;
> +}

This is unused.  Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

