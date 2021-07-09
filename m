Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DF5E3C2641
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 16:49:17 +0200 (CEST)
Received: from localhost ([::1]:34968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1roZ-0004iS-IO
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 10:49:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1rd4-0004MQ-MN
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 10:37:23 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:40801)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1rd2-00004w-7s
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 10:37:22 -0400
Received: by mail-pl1-x629.google.com with SMTP id j3so3188151plx.7
 for <qemu-devel@nongnu.org>; Fri, 09 Jul 2021 07:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=5m7yJZRweocOwSxOEkbeJkSNdIF0o1x9njVWCpMz0vk=;
 b=tKdIWKlNYu6vqMEAL0gFl10Qt5tpaN51rFpTdVZJAAx19rMFiy+OGaKWl/QpVzUMxM
 Z3IDmd6aEAmL4KkiWXWyU/DT6E0NpOpUvTmoDpudYuQqSRMg1tsifL3oB2G4lg+uDB12
 DLLhesoNmFzxF5ckP8/EOLIKYFzo39zyYxsPayjdB9mP5asgteW/o2s3uZYQ1gc7jlzV
 X4yAY+qD2hesuekvYQAaGloBPLT5QmF48JAKbvTz8TdPQ/sXRs4JGNpO37vAtoAyTVEC
 3Mp0aXHoUlvzaGRYuEfdylMGZUyaK3wBjaFi1zJAK6YIl34zoXr5oJQFJ/C7btpEWPak
 j0Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5m7yJZRweocOwSxOEkbeJkSNdIF0o1x9njVWCpMz0vk=;
 b=CEKg5eAfRcFGDvyuWp3RoD+q2dzGeIy7+CgdQN9Ia6Gcxz0TRuHapWBjmQ4qvpJ2bG
 DXMheWjcYJ24s/Xr2rcAa67ibZpR/HqZRa0hjgShzzADnXYa1NTc5fZQFcHrrYCMgkWV
 leRi1GL2oR1/T2Tk9O0XmwaX1+Tb1zvK8/DulxSviatPmgR7cja3TqP+A++B6Rq8gUaN
 bXJaCJGEV/8hbfdGe/kXNknjbsYlTxpkqJtJRATHwh4tFnFah/ES6a63KunWqqOM3HRy
 eFZLcF0Y4b1iMPJlPagS7zbPckOQgaP6bnHRQBoSfcHZ8s5KUZ8HHMJIsCKh6neWqsgz
 l8fQ==
X-Gm-Message-State: AOAM532++eYgPMXL7KlHfKGEObcsmSpY52m+Gl6Tn/kg/gqw2ONBCuOS
 Unz8k87Wowpty5pIfdvVQ4Q/3A==
X-Google-Smtp-Source: ABdhPJwUvP16Pu7+V9cWHjb9PQxuhCtzPNWy5pleRp2B2XugIpBLXOC7PykwvSR6kZEF4lIg5CvKWw==
X-Received: by 2002:a17:90a:43c3:: with SMTP id
 r61mr11508274pjg.11.1625841438615; 
 Fri, 09 Jul 2021 07:37:18 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id 2sm2276835pji.14.2021.07.09.07.37.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Jul 2021 07:37:18 -0700 (PDT)
Subject: Re: [PATCH v2 1/2] linux-user/s390x: signal with SIGFPE on
 compare-and-trap
To: "jonathan.albrecht" <jonathan.albrecht@linux.vnet.ibm.com>
References: <20210707134231.1835-1-jonathan.albrecht@linux.vnet.ibm.com>
 <20210707134231.1835-2-jonathan.albrecht@linux.vnet.ibm.com>
 <8e6af279-6cb8-33af-8bf5-042dcb99f671@linaro.org>
 <bd35b4ccf4d0f972ab454652b4ed2e60@imap.linux.ibm.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <40211134-9406-4270-49ff-a6a4f9e1d22a@linaro.org>
Date: Fri, 9 Jul 2021 07:37:16 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <bd35b4ccf4d0f972ab454652b4ed2e60@imap.linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: ruixin.bao@ibm.com, iii@linux.ibm.com, david@redhat.com, cohuck@redhat.com,
 laurent@vivier.eu, qemu-devel@nongnu.org, borntraeger@de.ibm.com,
 qemu-s390x@nongnu.org, krebbel@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/9/21 7:23 AM, jonathan.albrecht wrote:
>> As a general comment, I think a single switch over DXC would be
>> cleaner for both kernel and qemu.  It seems like giving different
>> si_code for e.g. "0x40 IEEE division by zero" and "0x43 Simulated IEEE
>> division by zero" is actively incorrect.
>>
> I went over the DXC section and I see what you mean about the si_codes
> for simulated IEEE exceptions. I'll plan on handling those the same as
> non-simulated IEEE if no objections.

Only if you plan on submitting a similar patch for the kernel.
Otherwise, qemu would not match the kernel abi.


r~

