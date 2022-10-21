Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72AC760715A
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 09:45:25 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olmia-0002F7-6Z
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 03:45:24 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olmYx-0000UR-Ff
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 03:35:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olmYd-0000El-2x
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 03:35:14 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olmYb-0008LB-Bx
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 03:35:06 -0400
Received: by mail-pj1-x1034.google.com with SMTP id pb15so1689478pjb.5
 for <qemu-devel@nongnu.org>; Fri, 21 Oct 2022 00:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fVnW4+prgGs1u+QsCM56geiB9FugmlaoXkqywN91fFs=;
 b=PiJtvUMu6S0dg4bBlq12T47NtmmEjOg8/yD0Iv0lJbdR3SdyRPAz9X5Mhu04rXzmRo
 cc6ww4BiZhEBXizqzV77Jas39LxKVmp3Ks4PX5ZFx18UDap9IimYEI0NohbE6P3s8/B0
 CHthJf3Fva8QQvlCy9p8rmrq7zVm6oNxBYDMxPhkiodF1pt5rLNgZeNJqxeBQmW64Vzl
 0GNb6DRcAOYjlBK3AcszMOsrOP2QC4aHl1OMVL7cvYynvj/vHWeCLJP26KGmmQlHFl0N
 VvWhuYAlA9yHb1WPyUOPeowb84CPhQz8XsdSBOxgKOyMVy2oQH+QJwjXtQvpGJg3GLVx
 mN4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fVnW4+prgGs1u+QsCM56geiB9FugmlaoXkqywN91fFs=;
 b=Ct89tP5+wNFLy6m/WA0tTKcqR9LpDnq+YGGIDY5E/5WS9T0hCJ4IXmWutm5N8QprJZ
 auZMazmdWSUsz82DCLaNi7IB6UGLvL08tOG5w1nav1mCbsOeu8vyAXoePASYhCTp3k9e
 kmHUvO9OIDZXq/UYoyQMLtFfk5w9l/e725m2Ehw75a6RZ1MIsP9V/QjI/hlX8UiEyY5u
 Q6XKXlFjgoJTu55QTMxHUlZeGnBc8gcsEw+9mD4EOgnUMUwGvmRsrvOSIois/bhVcMd6
 Rumc58oq7sFXNJC67dNXZYTRnXFlCtpPg+2RsUW63bm/ITz3K9b8uL4Ubj1MaQDtaBXQ
 bdDg==
X-Gm-Message-State: ACrzQf0Vbpm4G7H7FcIDpq7tLjLlJYH/jU0XivnxqVZYai5wnjQ5BcI0
 69uEkHusI0GFYEuaHyuspT+Zsg==
X-Google-Smtp-Source: AMsMyM420VTT06kD9ITuw7JKWL5OdkicFCB+z1ERlWrwYSoBcl/fEv7p9gqxpsZQXsfgALcAq9Nf2w==
X-Received: by 2002:a17:90b:3805:b0:20d:4e77:371f with SMTP id
 mq5-20020a17090b380500b0020d4e77371fmr20760386pjb.170.1666337703861; 
 Fri, 21 Oct 2022 00:35:03 -0700 (PDT)
Received: from [192.168.1.107] ([149.135.10.35])
 by smtp.gmail.com with ESMTPSA id
 z28-20020aa7949c000000b0052d4b0d0c74sm14512705pfk.70.2022.10.21.00.35.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Oct 2022 00:35:03 -0700 (PDT)
Message-ID: <1d8bb48c-cc19-a8d5-8517-d854a1405e2c@linaro.org>
Date: Fri, 21 Oct 2022 17:31:16 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v8 0/2] Fix LoongArch extioi coreisr accessing
Content-Language: en-US
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
Cc: gaosong@loongson.cn, maobibo@loongson.cn, f4bug@amsat.org,
 philmd@linaro.org
References: <20221021015307.2570844-1-yangxiaojuan@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221021015307.2570844-1-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 10/21/22 11:53, Xiaojuan Yang wrote:
> When cpu read or write extioi COREISR reg, it should access
> the reg belonged to itself, so the cpu index of 's->coreisr'
> is current cpu number. Using MemTxAttrs' requester_id to get
> the cpu index.
> 
> Changes for v8:
> 1. Move the iocsr_helper changes to the second patch.
> 2. Change the argument of GET_MEMTXATTRS() macro to env.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

