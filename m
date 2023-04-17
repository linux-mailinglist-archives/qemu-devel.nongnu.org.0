Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43FDC6E410A
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Apr 2023 09:31:35 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1poJJj-0003Y8-1C; Mon, 17 Apr 2023 03:30:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <morbidrsa@gmail.com>)
 id 1poJJg-0003Xm-ML
 for qemu-devel@nongnu.org; Mon, 17 Apr 2023 03:30:24 -0400
Received: from mail-wm1-f49.google.com ([209.85.128.49])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <morbidrsa@gmail.com>)
 id 1poJJe-0008BX-VM
 for qemu-devel@nongnu.org; Mon, 17 Apr 2023 03:30:24 -0400
Received: by mail-wm1-f49.google.com with SMTP id
 eo6-20020a05600c82c600b003ee5157346cso14958852wmb.1
 for <qemu-devel@nongnu.org>; Mon, 17 Apr 2023 00:30:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681716621; x=1684308621;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=YyhdsNP5feGIdL0Y56dxJ/6Gfkx/rDaX9Nej/jQqKdI=;
 b=kjPTbGbKqQF3OL/qUlsPG2Lz7vTRw+VVJmyDQ0Yf9Giqo7wiT87fcC+lhsxyF4uSyj
 BMWOqnIz74yIr8Ovr+ShHgILdJOYrIfNOy7ib9wC0T26iGudNUpUqSMaPelCPosjCh6v
 eC5pGOO1IumPAchmV678U3U+zyZqw5etjPRhxRWsFVrFG7tnIJ7O7Bd2H5N0M9cDXuhC
 Fj3a8J5OYYYeBqctQ7ZmTBvzlDZpC927fNcNGaTcq/x2gaBNtCD55rUzbNIbaA2tRN1r
 kOTTzstf/b+usiIJmC1jqQBamumESehUFdLFs9TVB4wghLXznswgdpWjZyW2RFrpb80m
 2LnA==
X-Gm-Message-State: AAQBX9cIA3y/amqNMo0AtZDd8FnTxjPo46SL/HyGG6nMaFxZBPbUHk3a
 LGzqCFP4jxTdqdSBXULHR+g=
X-Google-Smtp-Source: AKy350awD5nX757KNmeJTXR4oCM9eGNBqpiZzCimmRsFzSGisxIkVuMM+WjIwTYA0yS58beAL3d7PA==
X-Received: by 2002:a05:600c:20b:b0:3f1:72dc:8bae with SMTP id
 11-20020a05600c020b00b003f172dc8baemr2575929wmi.21.1681716621022; 
 Mon, 17 Apr 2023 00:30:21 -0700 (PDT)
Received: from ?IPV6:2001:a62:147d:c501:d19f:8e18:b2cb:95ec?
 ([2001:a62:147d:c501:d19f:8e18:b2cb:95ec])
 by smtp.gmail.com with ESMTPSA id
 p8-20020a7bcc88000000b003f04f0c5a6fsm11088617wma.26.2023.04.17.00.30.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Apr 2023 00:30:19 -0700 (PDT)
Message-ID: <0bc87d37-49ef-c5e6-823b-c1d922fc4900@kernel.org>
Date: Mon, 17 Apr 2023 09:30:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: [PATCH v3 4/4] wdt_z069: Add support for MEN 16z069 Watchdog
To: Alistair Francis <alistair23@gmail.com>
Cc: qemu-devel@nongnu.org, Alistair Francis <alistair@alistair23.me>,
 Javier Rodriguez <josejavier.rodriguez@duagon.com>,
 =?UTF-8?Q?Jorge_Sanjuan_Garc=c3=ada?= <Jorge.SanjuanGarcia@duagon.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Dmitry Fomichev <dmitry.fomichev@wdc.com>
References: <20230410174910.4806-1-jth@kernel.org>
 <20230410174910.4806-5-jth@kernel.org>
 <CAKmqyKOJoTsq04G-nJB81v9u_K4JmXAPa49O3GqWiFPTtaEfPg@mail.gmail.com>
From: Johannes Thumshirn <jth@kernel.org>
In-Reply-To: <CAKmqyKOJoTsq04G-nJB81v9u_K4JmXAPa49O3GqWiFPTtaEfPg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.128.49; envelope-from=morbidrsa@gmail.com;
 helo=mail-wm1-f49.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.976,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 17.04.23 07:04, Alistair Francis wrote:
>> +
>> +/* #define Z069_DEBUG 1 */
>> +
>> +#ifdef Z069_DEBUG
>> +#define z069_debug(fmt, ...)                                        \
>> +    fprintf(stderr, "wdt_z069: %s: "fmt, __func__, ##__VA_ARGS__)
>> +#else
>> +#define z069_debug(fmt, ...)
>> +#endif
> Same comment from the previous versions about using traces instead of
> macro prints

Of cause, you're right. I'm stupid, sorry.

     Johannes

