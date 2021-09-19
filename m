Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6C0E410D9E
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 00:35:35 +0200 (CEST)
Received: from localhost ([::1]:41790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mS5PK-00079K-Hr
	for lists+qemu-devel@lfdr.de; Sun, 19 Sep 2021 18:35:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mS5O1-0006IW-RH
 for qemu-devel@nongnu.org; Sun, 19 Sep 2021 18:34:13 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:42636)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mS5O0-0007Sn-Bj
 for qemu-devel@nongnu.org; Sun, 19 Sep 2021 18:34:13 -0400
Received: by mail-pf1-x42b.google.com with SMTP id q23so12368972pfs.9
 for <qemu-devel@nongnu.org>; Sun, 19 Sep 2021 15:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=JjY/JjLJDJC/f2MYyieAToInvQGl9JzrnLCtUa1oBAA=;
 b=A+yUj8so78600iuDGrYEclUwDwjBKw8QTA5WkVOn4qiGTZk73bJwkE1RpTt3GU8Gj5
 8F0bMBitbuW2Fv7/VUN36NU1eAZ8mo4PWAypl7m/AT+OXSAiL80JECE/d5k+VWqU+c4m
 iZuDLI23/rzup8sdfLCHON75zHm4qJh+82YMPrl5v4JhL7H3Okx94ZiRf8MZCUmTtyXV
 GACDNeQerxhCD6oLl3erCaiTMe1XMmNgeyPn17WCDGjsa4C5KFslheSd/p8/p9vK7Iaf
 MCIeewjci7mb1YME36IRWSkVzXumGgwFuX0UFZvgcm3gu1JBkhrLGchZFzZO0ItU3iX4
 9ZkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JjY/JjLJDJC/f2MYyieAToInvQGl9JzrnLCtUa1oBAA=;
 b=IPLvkWEGv6yJuAItcmz/o+SveTiWuwUb3cJvgcy7XyYjp7bEzGkPFK+GDWCOWunCPF
 XptErGFdi9nNyT5s4MOdoHnhbKvCsA0Cz4RbEvcQTNESZWTaTXoPEmEFLAwgcXrRLsiB
 580gTdpe0GVYl3iuu6rsvnWGOOZs8SukVLnv2JicWmdFyJ3dqRcv9gkIyg2OOp8cjLzp
 Qp7pYC8REIOEQSVDQiEVdSz5gQTBXjE/yKykmBC7DfIcaGcRk1nJVzZOXKAZ306jfWQ0
 tbie+QBzF31jip80yIAMB7QVCtQiXjHjY/xZmcnKCOkVRwocwmXIzkrxAOUCGOotyld4
 y2Xw==
X-Gm-Message-State: AOAM533gOnRYjrY3lQNRKRXcEX/nGLQIp9Q9UtXmsLr3qFVPNR8CfuJL
 V+1XKzmCi2IzhT+GmHGv3JWpSA==
X-Google-Smtp-Source: ABdhPJyLE0BfvoQo2yO9w8U3bTXmnpc1Oq+TREouq51kDSsL8go7A+2rI947xpA9YBuK3QGCwpJvvQ==
X-Received: by 2002:a63:741b:: with SMTP id p27mr20886130pgc.140.1632090850723; 
 Sun, 19 Sep 2021 15:34:10 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id l142sm5271094pfd.87.2021.09.19.15.34.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 19 Sep 2021 15:34:10 -0700 (PDT)
Subject: Re: [PATCH v2 6/8] target/arm: Assert thumb pc is aligned
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210821195958.41312-1-richard.henderson@linaro.org>
 <20210821195958.41312-7-richard.henderson@linaro.org>
 <feb3dea5-99d4-05c6-ca38-5f7dbc31d08e@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <84cebf48-f2bc-93e4-468f-2dff88726362@linaro.org>
Date: Sun, 19 Sep 2021 15:34:08 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <feb3dea5-99d4-05c6-ca38-5f7dbc31d08e@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/21/21 1:46 PM, Philippe Mathieu-Daudé wrote:
>> +    /* Misaligned thumb PC is architecturally impossible. */
>> +    assert((dc->base.pc_next & 1) == 0);
> 
> What about using tcg_debug_assert() instead?

I don't think we want to let this one compile out.


r~

