Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C175A60D8D1
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 03:27:54 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onVBK-00085e-LJ; Tue, 25 Oct 2022 21:26:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1onVBI-0007wy-Hb
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 21:26:08 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1onVBE-0001ms-99
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 21:26:08 -0400
Received: by mail-pl1-x636.google.com with SMTP id c2so4398239plz.11
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 18:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=sSalD0NBKk6LLOQs/1HV5ztLv06SbZj3dx3tz7LHekM=;
 b=OLIK49z73Exb8SvuZubX+jMMlnZR9Q2MoytlTyilpB0BRlMGHF9d/nYNZEOBAcaXsc
 TPzzZuZroYl4SCZ+kr6OijCzPObc4j7rBvTgnHykX2A3Jfz4RYvsY2di9vwjEZjBoKbD
 jpOXGkW0jMmmNV1oMr2rfCWk1g1CyP6vy6pZU5dZDxZ2ac56WoDgdgfr70inI/+9CmFv
 2sWogJJldkRnX01govpaqLyb9of4216eaP2Qstf8hmNS0Xzkj4vN/nHKz+p6aerx32I/
 tLxtuPDcmxqquIn9J2Lb5cxHysc+8e+dcmF/SF5voX9RbFU0kZTexTGn8YnukhDwUyjt
 EAnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sSalD0NBKk6LLOQs/1HV5ztLv06SbZj3dx3tz7LHekM=;
 b=DqVjrwRK1FtUDjwtd5Ii+bBnBFaxg8wEi1M+lwjJder8hl+PTp1Dr1nMwiwbAKTMnk
 3FzOpnZhajxdU6RcoS9V9LL7g+SWxJm4x+W5bIfKninwyMlht7xki99+z1s57fSgRw6/
 TkX8eFOUJ808nHJ6cFg7enCuBLnsjcMqI1TFpBQxlU+KhG+YArrlsfoeypwDwYVaaxxt
 XPDSfPSiXITgfvLATjw4CqZD1V6KDWJbzLRsX/TM5trgUvlZqwteA3QvK+W2XpXlTHR7
 vlgWU5gwC46YAPYwPOQhpmdAfdmrVs0A20X4pnP6M6jT6zNurxL5jT77T6JSbCjvYb6W
 tx+A==
X-Gm-Message-State: ACrzQf0yNe3XP6PWu5qxRMIQpffQiZcfeQr+L6QI6cOqzi9s/E7wkph3
 SYgO8x76GkgkG1Qocse1wQYnEg==
X-Google-Smtp-Source: AMsMyM5H7Z/oYXCTamdmFD2sTitfXOmehZwmOKxTuojmFRgaFZtYK/feA03J0ItSsbs+yxKwzTNl/Q==
X-Received: by 2002:a17:90b:1d03:b0:212:cd82:aa0c with SMTP id
 on3-20020a17090b1d0300b00212cd82aa0cmr1279375pjb.214.1666747562276; 
 Tue, 25 Oct 2022 18:26:02 -0700 (PDT)
Received: from [172.31.50.139] ([103.100.225.182])
 by smtp.gmail.com with ESMTPSA id
 t7-20020a1709027fc700b001869b988d93sm1767543plb.187.2022.10.25.18.25.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Oct 2022 18:26:01 -0700 (PDT)
Message-ID: <8a44ba6a-4d90-05c0-e943-cce72358d137@linaro.org>
Date: Wed, 26 Oct 2022 11:25:54 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v5 04/18] tests/qtest: migration-test: Avoid using
 hardcoded /tmp
Content-Language: en-US
To: Bin Meng <bmeng.cn@gmail.com>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?=
 <marcandre.lureau@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
References: <20221006151927.2079583-1-bmeng.cn@gmail.com>
 <20221006151927.2079583-5-bmeng.cn@gmail.com>
 <19172ac9-519c-2a32-9336-7d92aaea05f8@linaro.org>
 <CAEUhbmWYdYL6v3V_3jPAvW8RTCmWxYFK9jiVk1A89oz=+kkbdA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAEUhbmWYdYL6v3V_3jPAvW8RTCmWxYFK9jiVk1A89oz=+kkbdA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 10/26/22 10:44, Bin Meng wrote:
>> ../src/tests/qtest/migration-test.c: In function ‘main’:
>> ../src/tests/qtest/migration-test.c:2484:49: error: ‘%s’ directive argument is null
>> [-Werror=format-overflow=]
>>    2484 |         g_test_message("g_dir_make_tmp on path (%s): %s", tmpfs,
>>         |                                                 ^~
>>
>> The compiler correctly notices that tmpfs was tested and found to be null, but tried to
>> print it anyway.
>>
> 
> Patch [1] already queued in qemu-trivial
> 
> [1] http://patchwork.ozlabs.org/project/qemu-devel/patch/20221017132023.2228641-1-bmeng.cn@gmail.com/

Oh, excellent, thanks.

r~


