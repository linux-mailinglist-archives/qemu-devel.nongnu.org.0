Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0931314174
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 22:16:01 +0100 (CET)
Received: from localhost ([::1]:42026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9Dt2-00027B-JS
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 16:16:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l9AOu-0005cc-3b
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 12:32:40 -0500
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:42359)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l9AOr-0003dh-Dh
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 12:32:39 -0500
Received: by mail-pl1-x62d.google.com with SMTP id s15so8182911plr.9
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 09:32:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=dVZM1CEKI0Yr27syAVOhG4nel2XpNRY8DCyJDIXFwBM=;
 b=ZaGxCU2Q3Rncg7XMYmRZUXgWdIXfjqQsJ8A7A2dcddxtabwzhQl8fiGxHr2+ibu0LE
 95v3sGLOeL9qTO2CoROEp4RZWksN+Q9+nc9uUPE6i4lpby57hbhVsn6PCr8nu/XHlulD
 htvQqJxrZWrCPsxmR3T4jkOO62l++oVOOtrMQ8aECYq5t8O2PyLwTc4A5LOI1nktyNR3
 +1kbJ9UpWr3hyNo3z1fuDoeSZJsb7PkKFWCQH/LpQmaTZtJ5s77CRNjdsfVFmgZsBccF
 35oIkxwLRo07AcRRSopGET3MMlxhJDg9blnLj1u0gWYBh/o+R1G5HzUr6V2PctKOSiMk
 SCIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dVZM1CEKI0Yr27syAVOhG4nel2XpNRY8DCyJDIXFwBM=;
 b=cHXr32dZBgqxXWJ9olMHR1NB+um3q3lBve2f58+sL9rrZ4GJumW2P8TrmMXtvJ+Ygp
 RtvyOMSPgq53LE6Li3sBrr1KgQK1amwpB59woDpitxFl8SyBwfm+ydLx2pUGHSWjhEkA
 lKbhUwmq9hcpl7lF6EACZXDqjhAhb85tAQRPU2+NEhOsDGE6k5icjbhL+W/3VJ+lZeKs
 eW01jcDJAkw18KajG2hc1E9eFzn8hylDSNwcQFedGlvzce7zwVA5sONmNKHgeajlmOpR
 06Uj9YagSVanzsldQYXU3lEVSY11zIBTNUbOx/8mFiCo3Z0G/JjEd3GebSwwdieVPZqT
 ig/A==
X-Gm-Message-State: AOAM532fKJzwjRliYPB2+m1o81frN+uKFJ6Ug5HW6UqXmRFOt83N7uyO
 QFcYhOdyIn41HO9wKqQP3MUMeQ==
X-Google-Smtp-Source: ABdhPJyr5YBcbBwgnRE1I/DUYBuoNX1z7KXCp/9hWeFZUvNBO9mdZuXlWCREIMxdeiwls5N88dkRTQ==
X-Received: by 2002:a17:90a:bf10:: with SMTP id
 c16mr17700023pjs.101.1612805553771; 
 Mon, 08 Feb 2021 09:32:33 -0800 (PST)
Received: from [192.168.1.11] (174-21-150-71.tukw.qwest.net. [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id
 ep14sm2955014pjb.53.2021.02.08.09.32.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Feb 2021 09:32:32 -0800 (PST)
Subject: Re: [PATCH v5 19/31] linux-user: Handle tags in lock_user/unlock_user
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210203190010.759771-1-richard.henderson@linaro.org>
 <20210203190010.759771-20-richard.henderson@linaro.org>
 <CAFEAcA9e7XhcLma7tz6hfn6fbukZXbKt1yw-DEemV6vQ=SxQow@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3c1b4785-4c19-5b71-fa8a-68a71d8309aa@linaro.org>
Date: Mon, 8 Feb 2021 09:32:30 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9e7XhcLma7tz6hfn6fbukZXbKt1yw-DEemV6vQ=SxQow@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.265,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/8/21 5:57 AM, Peter Maydell wrote:
>>  void unlock_user(void *host_ptr, abi_ulong guest_addr, size_t len);
....
>> -    if (len > 0) {
>> -        memcpy(g2h_untagged(guest_addr), host_ptr, len);
>> +    if (len != 0) {
>> +        memcpy(host_ptr_conv, host_ptr, len);
>>      }
> 
> Why the change from checking >0 to checking !=0 ? I'd rather not
> have to go through and audit all the callsites to confirm none
> of them pass a "length-or-negative-errno" value here...

The comparison change should have happened with the type change to unsigned in
the previous patch.


r~

