Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 361D86336A0
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Nov 2022 09:07:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxOHZ-0007TQ-Ht; Tue, 22 Nov 2022 03:05:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1oxOHH-0007RL-Vy
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 03:05:15 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1oxOHC-0006d4-KV
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 03:05:10 -0500
Received: by mail-pl1-x631.google.com with SMTP id w23so12865777ply.12
 for <qemu-devel@nongnu.org>; Tue, 22 Nov 2022 00:04:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HqewgVy/qpuhSZx+0mHYhNB7kWHABv9jQF9ssbqwrQc=;
 b=ZUV6RTMt1FY8i0UGB9fpn8dIvygOOpGv2p7TjjENoXqYKN002eL1LV9JWHhN2FTfyj
 WSV0/9yMUmbhSLHQuyLufdkB2XzApbFMJc60UWc4WfSkuaHcei94slIjlFbxnBNz5BCR
 2mFx0bMISZcNZ0ywSuilB8iqSptEDgq4iqGB2Wuglq4qYgVF+iamOTUkwQ1BZRb1YgYp
 phTeXEZkPLlwjqQDFMkMCMrA/AzCfA/NeQ3L5FOAqAP2pZuTkNd0yRfqDzvt/ffDROGu
 gJjwqG4VvrQ35ZcVsvj/FDzM6b2rFHreqI5xtiIUlwJ3SkpuAOEunHWgrA3LcuxkDsia
 6GxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HqewgVy/qpuhSZx+0mHYhNB7kWHABv9jQF9ssbqwrQc=;
 b=iD6ZZtv9Ukxdld8v4jUHiPFPhLOCiEEL4DjraxlYLDPFj1eMkNk598Zp92Sq/HMb+W
 +Egk1FjfjwedPyqVeDmoXzWBSKqcOAP84T4GBq2nfj7nwVNx8Sq9eck1ZRZut5Zb3Ozn
 YaSQ+ZZWvYEi2jMpLqHNxdcu8VnYR3nmQ7VciMJ5khy/hYwg7nu7EuMmyKxYRRg5eXO7
 mw6NrI/Llr8VwbJFvNDEPxkkOCqiM2JOTfaZHA4zbtQL/46fNDH1lOKQDjr6/qq9Q/8i
 ArLznqNNfYVz9iStSTlz63DDHeBZESVB2boXybIvUW1CgCEUIy5s9gHOYi0JoNKGCHD8
 Hd3A==
X-Gm-Message-State: ANoB5pnG9YCCv9qhnN8l7zhFfWy4cTXom80y0qduCTsoObG4/lUbr+Yp
 uP+ElCBQdA79dQO9fcbJvQA=
X-Google-Smtp-Source: AA0mqf4CAzMW40LMT13YwLBMf3/eYBUQzUYHzs63ANuVy/6JeV/UP+XCe1StK7z/Wom4Uq4cbI/KVA==
X-Received: by 2002:a17:902:6b89:b0:188:bb79:4892 with SMTP id
 p9-20020a1709026b8900b00188bb794892mr5914186plk.60.1669104290040; 
 Tue, 22 Nov 2022 00:04:50 -0800 (PST)
Received: from ?IPV6:2400:4050:c360:8200:8ae8:3c4:c0da:7419?
 ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 x2-20020a170902b40200b00177e5d83d3esm11227138plr.88.2022.11.22.00.04.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Nov 2022 00:04:49 -0800 (PST)
Message-ID: <6e8844bb-9880-a504-1fc2-f5a43a363241@gmail.com>
Date: Tue, 22 Nov 2022 17:04:45 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: UI layer threading and locking strategy;
 memory_region_snapshot_and_clear_dirty() races
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>,
 BALATON Zoltan <balaton@eik.bme.hu>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
References: <CAFEAcA9tnOCij+OKV8Mpe37g9i5Sd4oYVTA4642SAY9MfCBLLg@mail.gmail.com>
 <CAFEAcA_gDzyucBEq2pQJVmgZkLEP5hhW7k6_LmY7_mO3gEGHhw@mail.gmail.com>
 <b8a21f61-cf25-87c6-694a-c9623a9d9c43@linaro.org>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
In-Reply-To: <b8a21f61-cf25-87c6-694a-c9623a9d9c43@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pl1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi,

On 2022/11/22 7:37, Philippe Mathieu-Daudé wrote:
> Cc'ing more UI/display contributors.
> 
> On 17/11/22 14:05, Peter Maydell wrote:
>> On Tue, 1 Nov 2022 at 14:17, Peter Maydell <peter.maydell@linaro.org> 
>> wrote:
>>>
>>> Hi; I'm trying to find out what the UI layer's threading and
>>> locking strategy is, at least as far as it applies to display
>>> device models.
>>
>> Ping! :-) I'm still looking for information about this,
>> and about what threads call_rcu() callbacks might be run on...

I briefly checked the code, and it looks like rcu has its own thread. 
Search for "thread" in util/rcu.c. Looking at call_rcu_thread() in the 
file will tell what kind of context the callbacks will be ran on.

>>
>> thanks
>> -- PMM
>>
>>> Specifically:
>>>   * is the device's GraphicHwOps::gfx_update method always called
>>>     from one specific thread, or might it be called from any thread?
>>>   * is that method called with any locks guaranteed held? (eg the
>>>     iothread lock)
>>>   * is the caller of the gfx_update method OK if an implementation
>>>     of the method drops the iothread lock temporarily while it is
>>>     executing? (my guess would be "no")
>>>   * for a gfx_update_async = true device, what are the requirements
>>>     on calling graphic_hw_update_done()? Does the caller need to hold
>>>     any particular lock? Does the call need to be done from any
>>>     particular thread?
>>>
>>> The background to this is that I'm looking again at the race
>>> condition involving the memory_region_snapshot_and_clear_dirty()
>>> function, as described here:
>>>   
>>> https://lore.kernel.org/qemu-devel/CAFEAcA9odnPo2LPip295Uztri7JfoVnQbkJ=Wn+k8dQneB_ynQ@mail.gmail.com/T/#u
>>>
>>> Having worked through what is going on, as far as I can see:
>>>   (1) in order to be sure that we have the right data to match
>>>   the snapshotted dirty bitmap state, we must wait for all TCG
>>>   vCPUs to leave their current TB
>>>   (2) a vCPU might block waiting for the iothread lock mid-TB
>>>   (3) therefore we cannot wait for the TCG vCPUs without dropping
>>>   the iothread lock one way or another
>>>   (4) but none of the callers expect that and various things break
>>>
>>> My tentative idea for a fix is a bit of an upheaval:
>>>   * have the display devices set gfx_update_async = true
>>>   * instead of doing everything synchronously in their gfx_update
>>>     method, they do the initial setup and call an 'async' version
>>>     of memory_region_snapshot_and_clear_dirty()
>>>   * that async version of the function will do what it does today,
>>>     but without trying to wait for TCG vCPUs
>>>   * instead the caller arranges (via call_rcu(), probably) a
>>>     callback that will happen once all the TCG CPUs have finished
>>>     executing their current TB
>>>   * that callback does the actual copy-from-guest-ram-to-display
>>>     and then calls graphic_hw_update_done()
>>>
>>> This seems like an awful pain in the neck but I couldn't see
>>> anything better :-(

Converting memory_region_snapshot_and_clear_dirty() asynchronous is 
nice, but also don't forget about reordering things in 
framebuffer_update_display() so that the DisplaySurface reference 
happens after memory_region_snapshot_and_clear_dirty(). Even if you make 
memory_region_snapshot_and_clear_dirty() asynchronous, the bug will 
remain if you keep the stale reference of the DisplaySurface and pass it 
to the asynchronous callback.

Regards,
Akihiko Odaki

>>>
>>> Paolo: what (if any) guarantee does call_rcu() make about
>>> which thread the callback function gets executed on, and what
>>> locks are/are not held when it's called?
>>>
>>> (I haven't looked at the migration code's use of
>>> memory_global_after_dirty_log_sync() but I suspect it's
>>> similarly broken.)
>>>
>>> thanks
>>> -- PMM
>>
>

