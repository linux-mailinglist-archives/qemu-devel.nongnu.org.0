Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F41531F9DC
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 14:23:46 +0100 (CET)
Received: from localhost ([::1]:48026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD5l3-0002uU-46
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 08:23:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lD5bt-0004My-Bf
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 08:14:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:41845)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lD5bm-0006UU-IK
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 08:14:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613740449;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iL0TRwwq5Zov8HiEjlzDZ2bJbaVb3wIoGavbJS5to/k=;
 b=eGFFqVuMtk8o4I0lQCDgG+Ia+bdU1nCGKBTJLLewCJmN2KgFUr8/gUcaTgvmBDX1Mc3Wq8
 SoE2CodiGZ2pxz3a6RLPSMwMAqgbi6yZcTvrHWqhN04P6rSSvQHh/KPNHL/uP3q8Km8dwT
 loP15qyYmSCxM9RXK8gqVdbXCXUpI2s=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-406-HlVIOOANOhKEQo7nICf0hQ-1; Fri, 19 Feb 2021 08:14:08 -0500
X-MC-Unique: HlVIOOANOhKEQo7nICf0hQ-1
Received: by mail-wr1-f69.google.com with SMTP id e12so2415020wrw.14
 for <qemu-devel@nongnu.org>; Fri, 19 Feb 2021 05:14:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=iL0TRwwq5Zov8HiEjlzDZ2bJbaVb3wIoGavbJS5to/k=;
 b=RA0d4nWf7ef8U1872fRKp8pRAg8B6gLfycv3PI/SCiwsFKATV974PiRwXZiPsw1f7r
 Q1UaIxRInwNxCb/ZcY8TiqRcu7qd2LqKf1TRHQUbhTJALGJfEhQ0U7nOX6gPB67oZFgV
 Knmk/wT6o4jNvLm6+0u2eJWfQFavnbel7WADH3cDrCX7M05pVB7j4kX6s8RcZ6Z87sZc
 GEQv/2YLc2DsDxDPAvPZQq4TrbmV19rQYka0dqaVSPm6dUL8x30BCo8Z1qMr206GumAK
 WNKX7fp0Hm08cKQzK/4rIgCy7s6VqQlWhs0/AD7XYecU+it4jvHpyVjMLbTQRudBjQkk
 PvxA==
X-Gm-Message-State: AOAM531petJE5gPI7VvjenKyzWywpgDyjZnp7EAi28mmulf6rKRiR2Dm
 hjXI5R7Og0JVO1E3IIg7HrK2vWJ611a9XN8ul0jwDZsMa8j3LFDClTJ/VzOkGH4ybVSFbiJnE+A
 HbXdzlCeer8GwY+kTm0MIhDn+w8WChKtrzYfmIBQNhnt7ZMQc+6cMkc8WobfpeTBd
X-Received: by 2002:a7b:c776:: with SMTP id x22mr7002485wmk.58.1613740446858; 
 Fri, 19 Feb 2021 05:14:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyuTJZcIhFi/rKzvpV825vMZLYrttAWiWfM6059CrVd3YbeDwcH7IKJJva6tlPzbobmmfUM7w==
X-Received: by 2002:a7b:c776:: with SMTP id x22mr7002467wmk.58.1613740446714; 
 Fri, 19 Feb 2021 05:14:06 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id m3sm11614556wmb.19.2021.02.19.05.14.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Feb 2021 05:14:06 -0800 (PST)
Subject: Re: meson, NEED_CPU_H, CONFIG_TCG and tests/
To: Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>
References: <eb7d8eca-13ef-07cf-41b4-d7276399fff1@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <008512eb-9b60-9d1f-4599-ad712574da80@redhat.com>
Date: Fri, 19 Feb 2021 14:14:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <eb7d8eca-13ef-07cf-41b4-d7276399fff1@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/19/21 2:04 PM, Claudio Fontana wrote:
> Hi Paolo,
> 
> currently we have use of CONFIG_TCG in tests/,
> 
> but is that variable available at all in there?
> 
> I have to adapt some qemu/tests/qtest/* to work also without tcg for ARM,
> 
> but I think I am not seeing CONFIG_TCG filtering through, and I wonder whether all the checks in there are actually "wrong".

Checking for ./configure definitions in tests is probably wrong,
it should be done via binary introspection (ask the binary if it
has the feature enabled).


