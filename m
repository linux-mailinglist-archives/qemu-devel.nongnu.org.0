Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD74E66A300
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 20:30:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGPk8-0000bL-M1; Fri, 13 Jan 2023 14:29:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuchuangxclwt@bytedance.com>)
 id 1pGPk6-0000b8-Gv
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 14:29:34 -0500
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xuchuangxclwt@bytedance.com>)
 id 1pGPk3-0008Ec-Td
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 14:29:34 -0500
Received: by mail-pl1-x635.google.com with SMTP id w3so24425252ply.3
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 11:29:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=13kLveJQGsIIPxfAl39Gqivupi4uuCYLvPTv+8bNnjc=;
 b=7H5kuaL6fM8SxN7/btWmFpU+0fXvv3fh1ezyadjRbx/vBNU6dU/SsPuoCL42RCZsgY
 rm1i4wqS4UXn4OLdaJCf/n41sDDZtZ3LoIP9Dgxgpqnv3LVW4cltP5xElsZI8xtu6hhp
 dzYz7lT91Uq2mnI9ZyJfkFI0u4BbLhA1SucYrnUhdjftu6Op6GccgfFUVuiWUyuVMWaj
 XH/LEUvtueBJU66wEcxWYUgk/N0HF4b9vX6WsXSUtulZQI32ac+oslEdf2pukWM885L3
 ngIDpB+GmWgLkEO/lqYG66cGkzTcNd2Z/P920GkfPcYVYpm0ybcdkxP47tbOjiXJAWpD
 dMzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=13kLveJQGsIIPxfAl39Gqivupi4uuCYLvPTv+8bNnjc=;
 b=2njZPWvxU6TzJv45Re3hQcqLRU26yl6ckkqAVlTfiRAq/Do2w/DZJHfrX84inoSerp
 9RjMUGEB0WwLYGCR1DZ13t6JpCWgd/R81EiHx/xAHVnKpwfTlotUYebr0/kBqlekuk/e
 v+ycKtr08x12CpBT2l5aOBzbsPC6JLYjY+4ndREE74HU3hVH5iIO6dR91jRpZnNIL/Kn
 Fu3zXykIJaJpVWCcKUaIJ/5uYO/PRF3djYPxCPmg324tKDQS60iZQTB94E8rdi1W0sNO
 wTpy5N4oS75+i4wQl0Xx3SUx+GLqm2DWeR2ubFPIYlGZxtsgsxOMCvPh4sAf1mV1h2zi
 OlFA==
X-Gm-Message-State: AFqh2krYSW+9XV6YIzB8rOWANkgtLgt4XoJUplNPC6c/yEvm+Qcx3jjS
 uoFUf1hLn4hF7Oim/EY2HnpyCg==
X-Google-Smtp-Source: AMrXdXvO3nEOGcrDg1uc0/1bjbFuR51SfFLhacUyM2fahPmYuesUIkMGwPDgJgqKxaFeYiu6lQcAUw==
X-Received: by 2002:a17:903:2341:b0:192:fd1e:a968 with SMTP id
 c1-20020a170903234100b00192fd1ea968mr46084779plh.46.1673638164718; 
 Fri, 13 Jan 2023 11:29:24 -0800 (PST)
Received: from [10.255.74.31] ([139.177.225.246])
 by smtp.gmail.com with ESMTPSA id
 b6-20020a170902650600b00192d4ba98eesm14493529plk.167.2023.01.13.11.29.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Jan 2023 11:29:24 -0800 (PST)
Message-ID: <c248906b-aa0a-e666-5acd-bcacb6b198d9@bytedance.com>
Date: Sat, 14 Jan 2023 03:29:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [RFC v4 2/3] memory: add depth assert in address_space_to_flatview
To: Peter Xu <peterx@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 David Gilbert <dgilbert@redhat.com>, "Quintela, Juan" <quintela@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 zhouyibo@bytedance.com
References: <20221223142307.1614945-1-xuchuangxclwt@bytedance.com>
 <20221223142307.1614945-3-xuchuangxclwt@bytedance.com>
 <05c4cb9e-0f41-c60f-6a68-cf5050ad7a02@redhat.com> <Y6XPRD4fSucgWZfT@x1n>
 <CABgObfa=i=9CZRFyX_EXBOSW===iDhcZoDO8Ju64F-tHUAXdRA@mail.gmail.com>
 <Y7RpPwGd0WvrENlz@x1n>
 <CALophuvJ2g7D9idGHfQEK3Co7o06ab38ZK3CCGZX0tDdQX_+Tg@mail.gmail.com>
 <Y716CoJeHKZ6nP1x@x1n> <ad0c804b-5ba3-511b-2516-64172565c20b@bytedance.com>
 <Y8Ajr3ef5oRJ9+Qx@x1n>
From: Chuang Xu <xuchuangxclwt@bytedance.com>
In-Reply-To: <Y8Ajr3ef5oRJ9+Qx@x1n>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=xuchuangxclwt@bytedance.com; helo=mail-pl1-x635.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FROM_LOCAL_NOVOWEL=0.5, HK_RANDOM_ENVFROM=0.001,
 HK_RANDOM_FROM=0.999, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Hi, Peter,

On 2023/1/12 下午11:13, Peter Xu wrote:
> We wanted to capture outliers when you apply the follow up patch to vm load
> procedure.
>
> That will make depth>0 for the whole process of vm load during migration,
> and we wanted to make sure it's safe, hence this patch, right?
>
>> In my perspective, both BQL and RCU can ensure that the flatview will not be
>> released when the worker thread accesses the flatview, because before the rcu
>> thread releases the flatview, it will make sure itself holding BQL and the
>> worker thread not holding RCU. So, whether the depth is 0 or not, as long as
>> BQL or RCU is held, the worker thread will not access the obsolete flatview
>> (IIUC 'obsolete' means that flatview is released).
>>
>>> To summarize, the original check didn't consider BQL, and if to consider
>>> BQL I think it should be something like:
>>>
>>>     /* Guarantees valid access to the flatview, either lock works */
>>>     assert(BQL_HELD() || RCU_HELD());
>>>
>>>     /*
>>>      * Guarantees any BQL holder is not reading obsolete flatview (e.g. when
>>>      * during vm load)
>>>      */
>>>     if (BQL_HELD())
>>>         assert(depth==0);
>>>
>>> IIUC it can be merged into:
>>>
>>>     assert((BQL_HELD() && depth==0) || RCU_HELD());
>> IMHO assert(BQL_HELD() || RCU_HELD()) is enough..
> Yes, but IMHO this will guarantee safe use of flatview only if _before_
> your follow up patch.
>
> Before that patch, the depth==0 should always stand (when BQL_HELD()
> stands) I think.
>
> After that patch, since depth will be increased at the entry of vm load
> there's risk that we can overlook code that will be referencing flatview
> during vm load and that can reference an obsolete flatview.  Since the
> whole process of qemu_loadvm_state_main() will have BQL held we won't hit
> the assertion if only to check "BQL_HELD() || RCU_HELD()" because BQL_HELD
> always satisfies.
>
>> Or you think that once a mr transaction is in progress, the old flatview has
>> been obsolete? If we regard flatview as obsolete when a mr transaction is in
>> progress, How can RCU ensure that flatview is not obsolete?
> AFAIU RCU cannot guarantee that.  So IIUC any RCU lock user need to be able
> to tolerant obsolete flatviews being referenced and it should not harm the
> system.  If it needs the latest update, it should take care of that
> separately.
>
> For example, the virtio code we're looking at in this series uses RCU lock
> to build address space cache for the device vrings which is based on the
> current flatview of mem.  It's safe to reference obsolete flatview in this
> case (it means the flatview can be during an update when virtio is
> establishing the address space cache), IMHO that's fine because the address
> space cache will be updated again in virtio_memory_listener_commit() so
> it'll be consistent at last.  The intermediate phase of inconsistency
> should be fine in this case just like any DMA happens during a memory
> hotplug.
>
> For this specific patch, IMHO the core is to check depth>0 reference, and
> we need RCU_HELD to mask out where the obsolete references are fine.
>
> Thanks,

Thanks a lot for your patience!

I ignored the preconditions for this discussion, so that I asked a stupid question..

Now I'm in favor of checking “(BQL_HELD() && depth==0) || RCU_HELD()” in v5.
And what does Paolo thinks of Peter's solution?

Thanks again!


