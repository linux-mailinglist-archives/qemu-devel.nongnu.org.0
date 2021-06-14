Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB7223A694D
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 16:49:52 +0200 (CEST)
Received: from localhost ([::1]:37382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsnuR-0004aQ-Ui
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 10:49:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lsnse-0002Fb-GA
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 10:48:00 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:34625)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lsnsY-0005z9-Bh
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 10:48:00 -0400
Received: by mail-pl1-x632.google.com with SMTP id h1so6696860plt.1
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 07:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Hx3B4WogqIICcMgUpByuMGzo1MIgV9JV+gu10w6RiGo=;
 b=MJEo8nf8CdzpblyJFe9EIoHxu7SZKxDPfFJB8KOBhb4aYk7/uYGOQ3jKuQVEnqs7lZ
 s9O0r7si6y2PshdP/TSml3j4KdF8Hjq/Z1FZE8UTB0IaVcCHvRrIKQHGzj3RwGd90nJM
 ziYUFqVPqnnD4h3EN2hok/bEbuckka5PihYv9JYxQ/vF10ECbBG3diYs+40IhpitIk1k
 HUce75zEa50sdWxNjic+0f+gSUmokARECaB6Aef8OzK6LgMDLtISwcwRIu8abqs3/AeP
 wNpmeBXzAAme+SgLu5WkOhzcz+q1CgrcyLGvuymmHZt8TeT8+JpOIOgx9V/PU+/ThM3v
 7x9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Hx3B4WogqIICcMgUpByuMGzo1MIgV9JV+gu10w6RiGo=;
 b=eDnCDOlNcJ0EZEAoQ6Z6UQwiE0p/1OaXfZpn5PUFaWXrRe/vZH7zMNnnlrh1vuTNnt
 h3besCXqtuPr5qz0w/PwWZxg50tH9TOKQL8DfDYBdS6PsglbClwqMYmMAStHjFgr5jVc
 FIqL6+TzfOTGHZmKPLoVEB9kvMaIogcC6GPN/uQyoMgsLhLr/tSIUy6LbRz6kR7EqETs
 MHucOGq1gFYdorUaGPwB3Xqt9vkqIQhfAJuA87rwJxHj4165KoiPYvHxxgdfHVgqa2oY
 e3nX+LudsL4BHNyojVS23CkPB/uYdQzNtHqioHx3YscUg86nN2Ef0s7RkiyPyfzRRcsJ
 rg+A==
X-Gm-Message-State: AOAM531sIkhciNmg0eAmI/NrAqyg5sHjwtzm2dTxqZyaJZT6ETuOyqNw
 4Y3aeQJEci21BZuEU9+AgEg8JA==
X-Google-Smtp-Source: ABdhPJw6b0OLCs1zRGJKoj1OUxKX2pcLMxKidKDqilf9ik75bptYV8N7eiYjmSyz76IacaL6DTdX0g==
X-Received: by 2002:a17:902:7244:b029:f5:2ffd:37f9 with SMTP id
 c4-20020a1709027244b02900f52ffd37f9mr17155325pll.26.1623682068497; 
 Mon, 14 Jun 2021 07:47:48 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 h6sm12795617pfk.40.2021.06.14.07.47.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Jun 2021 07:47:48 -0700 (PDT)
Subject: Re: [PATCH 6/8] include/qemu/lockable: Use _Generic instead of
 QEMU_GENERIC
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20210611233347.653129-1-richard.henderson@linaro.org>
 <20210611233347.653129-7-richard.henderson@linaro.org>
 <7a2d107e-40f0-f1aa-fb38-f1c4f7a9186b@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <35b0ac31-9f7a-cd0d-cd28-2306ad0f9790@linaro.org>
Date: Mon, 14 Jun 2021 07:47:46 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <7a2d107e-40f0-f1aa-fb38-f1c4f7a9186b@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.489,
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
Cc: thuth@redhat.com, ehabkost@redhat.com,
 Richard Henderson <richard.henderson@liaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/14/21 4:14 AM, Paolo Bonzini wrote:
> On 12/06/21 01:33, Richard Henderson wrote:
>> -                 unknown_lock_type))
>> +/* Auxiliary macros to simplify QEMU_MAKE_LOCABLE.  */
>> +#define QEMU_LOCK_FUNC(x) ((QemuLockUnlockFunc *)      \
>> +    _Generic((x), QemuMutex *: qemu_mutex_lock,        \
>> +                  QemuRecMutex *: qemu_rec_mutex_lock, \
>> +                  CoMutex *: qemu_co_mutex_lock,       \
>> +                  QemuSpin *: qemu_spin_lock))
>> +
>> +#define QEMU_UNLOCK_FUNC(x) ((QemuLockUnlockFunc *)      \
>> +    _Generic((x), QemuMutex *: qemu_mutex_unlock,        \
>> +                  QemuRecMutex *: qemu_rec_mutex_unlock, \
>> +                  CoMutex *: qemu_co_mutex_unlock,       \
>> +                  QemuSpin *: qemu_spin_unlock))
> 
> These are not needed anymore, are they?
> 
> Otherwise I agree that it's both more and less complicated.  The duplication between 
> QEMU_MAKE_LOCKABLE_NONNULL and QEMU_MAKE_LOCKABLE is tolerable.

Yep, I didn't notice that they were only used by MAKE_LOCKABLE.

r~


