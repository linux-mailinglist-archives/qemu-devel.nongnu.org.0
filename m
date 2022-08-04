Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4FA458A2BA
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 23:18:40 +0200 (CEST)
Received: from localhost ([::1]:39360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJiEp-0002EU-9g
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 17:18:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1oJiCe-0000d4-LO
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 17:16:25 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:33326)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1oJiCc-0002PC-U9
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 17:16:24 -0400
Received: by mail-ej1-x630.google.com with SMTP id uj29so1641760ejc.0
 for <qemu-devel@nongnu.org>; Thu, 04 Aug 2022 14:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=dCSu4/lYRv7VaSJkiN1pzUH00HcrjvBSiuvJQwr3e3k=;
 b=QWXQYUDnP7yNRJR8DYblCJYtxJT2iacuyIPTvhbxG2fNMULZI2+UkbJwx2k33L7Nhx
 cXHU4XPjap2qTKK/9TvIkxDG3bm+IyS/gYeEa+2HIQGiPeEmHKlQ7Q6damYXnzL0okZA
 Z5tGMD0nxzee2bwh2VX4UypEMnZacwTHei+FGkDMHdH06qKByI750Uw98E0LyBLYe202
 PtDbOc+vIVDbQSNM9UPCBevaycFeFiERyxVrpBBw7Di+umGhnhNr/rhNnTnFKWVQs0oR
 a3GRaWT+3WyBPim5cdCR9agQIwBKlKllfzoZb+sfRC5AqbmXzTch+J/q/Y0ALbUjcgP5
 2eIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=dCSu4/lYRv7VaSJkiN1pzUH00HcrjvBSiuvJQwr3e3k=;
 b=QFseGRmLhGD77xFGOSmIoP+RENE2uRXprnEBlNZLh3Gj8eyp4Xo1xWWAd7EySe/5Nk
 6VRJHVzH2YDMQGByB7gKbynFbSh2gf8Lb8dzssZFBU5gaoVKk6qZ2BAnzvnHDjl2HqVa
 ql5cj8MdTt1lRrkotJzq41euLMse1PKAuGeTUehVXfcOUVyzEUyQZSeTl0E8Iy3ZHZ6u
 fVxdAro3BNBNe7N+8at+p2ktswmugLHAF3E9FGQ93KXEytH6UmfmSiF9W8j+2xZP9q1A
 5AyD/ci8kzrvHDZ2cycTOyiXq4Z+oEaXp7S2ckxKKXqtveegJWC08fPwpvLruW8f5Px2
 UPOw==
X-Gm-Message-State: ACgBeo3S0H1kSqYaKfhQsIASA+jgMmvUu8tL7jpWVoXF/vrDmBvKrrdS
 qwwheKud7eK30EGIN/1AHuE=
X-Google-Smtp-Source: AA6agR4Vb1jk9mNsCXgo3SMCZ+NNqOgmxN5Iraed0J8d+wUdixx8a6oSxeNypeqdQHVy/BHUvWfTng==
X-Received: by 2002:a17:907:7214:b0:72b:8720:487f with SMTP id
 dr20-20020a170907721400b0072b8720487fmr2798509ejc.640.1659647780539; 
 Thu, 04 Aug 2022 14:16:20 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:1c09:f536:3de6:228c?
 ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.googlemail.com with ESMTPSA id
 d4-20020a056402000400b0043b7917b1a4sm1151991edu.43.2022.08.04.14.16.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Aug 2022 14:16:19 -0700 (PDT)
Message-ID: <c44341cb-dbd8-8a45-8fed-c787b2d59375@redhat.com>
Date: Thu, 4 Aug 2022 23:16:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] pc: add property for Linux setup_data seed
Content-Language: en-US
To: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, "Michael S . Tsirkin" <mst@redhat.com>
References: <20220804131320.395015-1-pbonzini@redhat.com>
 <YuvHu3NW592rGFXz@zx2c4.com> <YuvKGrUsSAzQEzfL@redhat.com>
 <YuvYKq5pXZlCCP6O@zx2c4.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <YuvYKq5pXZlCCP6O@zx2c4.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x630.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/4/22 16:31, Jason A. Donenfeld wrote:
> I'm still not really keen on adding a knob for this. I understand ARM
> has a knob for it for different reasons (better named "dtb-randomness").
> If this knob thing is to live on here, maybe it should have
> "-randomness" in the name also.

Ok, I just reused your variable name but linuxboot-randomness is fine by 
me too.

>>> Rather, let's fix the bug. The code as-is -- going back to the 2016 DTB
>>> addition -- is problematic and needs to be fixed. So let's fix that.
>>> Trying to cover up the problem with a default-off knob just ensures this
>>> stuff will never be made to work right.
>>
>> It isn't covering up the problem, just providing a workaround
>> option, should another bug be discovered after release. We
>> still need to fix current discussed problems of course.
> 
> Thanks for the explanation. I don't like adding a knob. But if it's on
> by default for the default machine type, then that's a compromise I
> could accept.

Yes, in fact this allows enabling the seed even for older machine types 
if everything goes fine.  And if it doesn't, we only need a one-line 
patch to revert the feature, like Michael said.  So it's a good thing to 
have either way.

The patch was extracted out of my version from last month, but I didn't 
--amend the changes needed to make it compile (doh).  I incorporated 
yours instead and I'll send v2.

Paolo

