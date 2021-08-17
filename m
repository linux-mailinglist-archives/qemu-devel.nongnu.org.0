Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 508003EEF1B
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Aug 2021 17:24:44 +0200 (CEST)
Received: from localhost ([::1]:58964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mG0xG-0006Ux-Tv
	for lists+qemu-devel@lfdr.de; Tue, 17 Aug 2021 11:24:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mG0w0-0005Lq-4e
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 11:23:24 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:51979)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mG0vy-0001pP-JF
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 11:23:23 -0400
Received: by mail-pj1-x1035.google.com with SMTP id oa17so32598396pjb.1
 for <qemu-devel@nongnu.org>; Tue, 17 Aug 2021 08:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Ga43Y9loZCQ00QZuLW1nMLQPKMl4n0r45aTNEZdXlcE=;
 b=gg033vuaGn0S7MiEc4QExRzWarBW8nCP+dAe2WuJEmR6WLmzVnNusJQMnjGoYooRiH
 oo90uxVwM1eK1CT1K9Dc807yK4DS/zgyZmsDm7kppDLxOZcucHkAQo6G9GjT69XQV3SR
 VOedsqUXl626keu9wg3dL2Bav928NXXGkjfNo/+CM9zTg8JC9AIIrP7e6n6BVBiqp1ll
 +Zw9KqZWq4qSzQ122hHY89tHWqwOVpEo5REaaL1ngUcUDoQDadUrhRxxg5Su8ZYUBVgj
 HXx4C3mdQjMr9uwMivRccPkTu1SAeFWpFAxyFsJdC7rm9YgRa5c2tOae+UL76xevY+af
 iObw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Ga43Y9loZCQ00QZuLW1nMLQPKMl4n0r45aTNEZdXlcE=;
 b=GiXUiRIZEWVb4KN4/7ygXjFPO5o5qvW17+zW9OHSnnmd8+8sEeijVQQ7l3JzQVD90+
 qvACHQvnmqU2uWvw4X0g96GBqiPvhpsCCzzCQD4bZPdctWBtN8RL+zLJyf8WmKJ6tLsd
 pM305aOs6BIWcV8xrM0ZbAONKtQVLgKdFqTS3l19M2OHX1R6tK+ZwJleZZMuHaFh3l1Y
 B+xdDb8KEYuAPpAJ8aQLuKAXfdodEQ8h2icqlOdcutGPi21rkU23pKA+Y+MDk5DB4wxL
 8MMdrwpySYAeA2opPBzDglgx6CFsPRFWgmXKx1GCsb5mZo5V0/NeuIMeeiAjZ6OxTd/b
 xrjw==
X-Gm-Message-State: AOAM531UlcwCUJU/6jhl7WQHh3RyLjBSnoqZhGBT22EncoLXl5syVWI9
 tpqpDtQS/7Xk1oVblZIfmZ4KY+pungMVgw==
X-Google-Smtp-Source: ABdhPJyKtu7Ai6HG6K3jf8qFi3RmzsSHiZVseOywy0FrL+a4vlXCGlSWLf+I0VUy4zPFIydMvU7epw==
X-Received: by 2002:a63:a4d:: with SMTP id z13mr3929931pgk.445.1629213800941; 
 Tue, 17 Aug 2021 08:23:20 -0700 (PDT)
Received: from [192.168.3.43] ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id k197sm3222077pfd.190.2021.08.17.08.23.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Aug 2021 08:23:20 -0700 (PDT)
Subject: Re: [PATCH v4 1/3] target-arm: Add support for Fujitsu A64FX
To: Andrew Jones <drjones@redhat.com>,
 "ishii.shuuichir@fujitsu.com" <ishii.shuuichir@fujitsu.com>
References: <20210812060440.1330348-1-ishii.shuuichir@fujitsu.com>
 <20210812060440.1330348-2-ishii.shuuichir@fujitsu.com>
 <20210812091650.i5np3szvdoelu2cx@gator.home>
 <20210812092517.mwcfhksoe4cgy3cl@gator.home>
 <TYCPR01MB6160B0A6E08CAE7CB2C6D8F0E9FE9@TYCPR01MB6160.jpnprd01.prod.outlook.com>
 <20210817115635.d2wxvnvis5kupegh@gator.home>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <667f9384-cd28-8e4d-ebd1-4ed4b651676a@linaro.org>
Date: Tue, 17 Aug 2021 05:23:17 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210817115635.d2wxvnvis5kupegh@gator.home>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.961,
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
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/17/21 1:56 AM, Andrew Jones wrote:
> I guess it's fine. You could easily create a new cpu_arm_set_sve_vq()
> which would forbid changing the properties if you wanted to, but then
> we need to answer Peter's question in order to see if there's a
> precedent for that type of property.

I don't see the point in read-only properties.  If the user wants to set non-standard 
values on the command-line, let them.  What is most important is getting the correct 
default from '-cpu a64fx'.


r~

