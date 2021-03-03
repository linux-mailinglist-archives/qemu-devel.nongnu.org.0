Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6EFF32BD1D
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 23:19:49 +0100 (CET)
Received: from localhost ([::1]:42714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHZqO-0005ya-TR
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 17:19:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHZol-0004NV-J7
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 17:18:07 -0500
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:33729)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHZoj-000286-3y
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 17:18:07 -0500
Received: by mail-pl1-x636.google.com with SMTP id c16so5397082ply.0
 for <qemu-devel@nongnu.org>; Wed, 03 Mar 2021 14:18:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Sd1KQrE+7PvLj8DeQlRirIEkM8G2zEYBVS8Kcun2mjU=;
 b=wtlRbNiHy8VA+9nOcytXmidMFpSZZ2PR8xQ+X0sLQobkOwr0Hi0UCXWEwcD7nGvSbC
 iq3N8RS3IiwL5izYaiicesMphwZii+Jd2p8uMSZjA7fGtgFFVKdWwkjTmI8I0nsF34eE
 RKhWhASk671Ll0vgoVDDMwC5t1GV//w9hJZWl+PAWca2XOHpfrhW+TuEv2l7L7UNOT93
 OyuOI3AEEkuCILc20c/j2v1Y1jvnJSGeJPI+M9x0o2DRlQA1ipqqMYNnTnoW1w79pAk7
 KU8uPrb4wjmKc8/7IwsgJFzQt5lS0RvWTGPoPp95lk7dgleRCw4fLWOxXwXatDr2+R2l
 6PIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Sd1KQrE+7PvLj8DeQlRirIEkM8G2zEYBVS8Kcun2mjU=;
 b=m4qMsY0bk0m/A+jUKAPyGBqytN/UmBwRiaWhz4qXAI/GYy9hYx+VenGuvEj5hhjh7u
 CkceQkp/dEwZ5Lo5fbF9V/3bVuH75G3uLO3f8k4MHDLDtanwmtG20+FQEB8rd+ume2bg
 ADSEFtmVZ34Ye9e0dELuKh9y9HQNMv0A+2qwfLFeP8oupCQ7cICRdICMGdVAfiILAaNN
 au/gBgW3rrNZp8a7cuJLS71vOZvHEsFIsMCT/OIEiH3hQtbxzyhKZJbZ60rHkgt2dx6U
 Qun9fod7Iemw/vp/KDqiRCM9OCrHSHCT8IVHrMe5X04AlKsmYrZCM1K4cqWgo9yJAHYf
 Q3NA==
X-Gm-Message-State: AOAM53033x9c65/wDuLMrYVM17l0QC2nAEVb5/jGzzxOU2kUmSYoWOm3
 4mS8fC4WtzORwXkeOmuiAlzsrA==
X-Google-Smtp-Source: ABdhPJzu9VMeod8BFMV6zWo1oxqtazlBfKPZy9VUJWk08OqNc5BxBkvtiYDtHWN+cl4jCl6K7IaIyA==
X-Received: by 2002:a17:90a:8:: with SMTP id 8mr1240847pja.6.1614809883533;
 Wed, 03 Mar 2021 14:18:03 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id h7sm389711pfo.45.2021.03.03.14.18.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Mar 2021 14:18:03 -0800 (PST)
Subject: Re: [PATCH v4 03/28] cpu: Introduce cpu_virtio_is_big_endian()
To: "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20210303214708.1727801-1-f4bug@amsat.org>
 <20210303214708.1727801-4-f4bug@amsat.org>
 <20210303170743-mutt-send-email-mst@kernel.org>
 <20210303171059-mutt-send-email-mst@kernel.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d17a5ae7-2b71-6b53-f7c3-df2406a001f2@linaro.org>
Date: Wed, 3 Mar 2021 14:18:01 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210303171059-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 qemu-devel@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/3/21 2:15 PM, Michael S. Tsirkin wrote:
> On Wed, Mar 03, 2021 at 05:08:36PM -0500, Michael S. Tsirkin wrote:
>> On Wed, Mar 03, 2021 at 10:46:43PM +0100, Philippe Mathieu-Daudé wrote:
>>> Introduce the cpu_virtio_is_big_endian() generic helper to avoid
>>> calling CPUClass internal virtio_is_big_endian() one.
>>>
>>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>
>> Using virtio in the name here probably because virtio wants this?
>> That doesn't sound like a good naming strategy, name should
>> tell us what function does not how it's used.
> 
> On a more concrete proposal, how about using this change
> to rename the virtio_is_big_endian field to guest_is_big_endian(),
> and put the wrapper somewhere in a virtio header instead?

We already one for normal guest endianness.  This one is for when virtio 
specifically differs from that.


r~

