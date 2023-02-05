Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1AC668B128
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Feb 2023 19:08:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOjQD-0004Fk-3j; Sun, 05 Feb 2023 13:07:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pOjQB-0004FZ-0p
 for qemu-devel@nongnu.org; Sun, 05 Feb 2023 13:07:23 -0500
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pOjQ9-0004Dp-DA
 for qemu-devel@nongnu.org; Sun, 05 Feb 2023 13:07:22 -0500
Received: by mail-pg1-x541.google.com with SMTP id v3so6783505pgh.4
 for <qemu-devel@nongnu.org>; Sun, 05 Feb 2023 10:07:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FeE0CedtbKWtbs3dYYwvgjdlxh3RkymX/XocrJQnz/w=;
 b=Ru8ePWpu4Ocxsv0D6VkcndftnCupvIgmcOHIsqZIN4kMQWUjbTejE1FKyM8alaUTBv
 OVYLjsro6wJffpXvfZWvBklhu04AdZUWZOEfCxAFNaPhCoIOYL330n/BgF1EveVfnMtc
 xUHzIWBUdlseuDVwH/ccBlr3MsKIC7kbSRC/M3RV6KtbtB34UtfBlQ0hKGtZv9JWAMbR
 WuSER8neEGtwBiKI83OcLsblL8B7gE9ODrugARMxDGIbko7Axh1NOdUoj+QxjnZPI+bl
 U+pOQfxKlOz+QoQTADpw+16amm4hGtWoXkdSbpmog8faFbymw+9gsLp9arSCn15FrS7b
 KllQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FeE0CedtbKWtbs3dYYwvgjdlxh3RkymX/XocrJQnz/w=;
 b=vw6EEZmbsvFu678pCpb8fU8kMh5MyFUhmeP6I6Zv+nBmXayuSN+2KSCdaN+4o9QVt3
 ONayMrvEA7pNINyMgqvLTfO0Ew0nkE+nrUwRmO51y7S+WCyOnVj/m38UDxvGIpvAOhZE
 TKsi/tpnGqK5rESyllM6bTqw+QZatgNz+HLLSvQwL5do5rCTEZX2CDGPy8p86ElwIL6s
 BBoqrF27qiT9TzMNT6Wuxd5MdV24To6bvZ8i2gP4IQJe49sL7ZMnFToxOW9aqyEvUHAi
 Y6JuZnqiuI9P8XMR+h6h4BHBLLb2mPShxkIiamMeEcL7ifAF4Oc2deBWN/xm9GiMoq/U
 U/Qg==
X-Gm-Message-State: AO0yUKVta3H5Gtif+CNwGML48zNqeW7PoR5sorA/6p/3rxclFuGVJRWh
 DLb9KMeYRMcH+E0q4Iwi8GM46Q==
X-Google-Smtp-Source: AK7set+G7eoJgjuBmPnRz57do0XJ8IquFRepN+1Fe5UzAAOD5clWwcZ5V3DmJvfvuf4/rLV3/2ixKw==
X-Received: by 2002:a05:6a00:170d:b0:593:282d:3d27 with SMTP id
 h13-20020a056a00170d00b00593282d3d27mr21048835pfc.2.1675620439076; 
 Sun, 05 Feb 2023 10:07:19 -0800 (PST)
Received: from [172.20.101.2] (rrcs-74-87-59-235.west.biz.rr.com.
 [74.87.59.235]) by smtp.gmail.com with ESMTPSA id
 y2-20020a626402000000b0058a7bacd31fsm5428048pfb.32.2023.02.05.10.07.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 05 Feb 2023 10:07:18 -0800 (PST)
Message-ID: <410c3da9-9be5-a715-7b7a-48bd67355c9c@linaro.org>
Date: Sun, 5 Feb 2023 08:07:15 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: pixman_blt on aarch64
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, pixman@lists.freedesktop.org
Cc: qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>
References: <4b519268-f8e8-6542-9d1b-34054879eec0@eik.bme.hu>
 <a7866129-9f7a-02d6-1e58-bf05e1bf89e4@eik.bme.hu>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <a7866129-9f7a-02d6-1e58-bf05e1bf89e4@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::541;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x541.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.149,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 2/4/23 06:57, BALATON Zoltan wrote:
> This has just bounced, I hoped to still be able to post after moderation but now I'm 
> resending it after subscribing to the pixman list. Meanwhile I've found this ticket as 
> well: https://gitlab.freedesktop.org/pixman/pixman/-/merge_requests/71
> See the rest of the message below. Looks like this is being worked on but I'm not sure how 
> far is it from getting resolved. Any info on that?

Please try this:

https://gitlab.freedesktop.org/rth7680/pixman/-/tree/general

It provides a pure C version for ultimate fallback.
Unfortunately, there are no test cases for this, nor documentation.


r~

