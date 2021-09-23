Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 159C2415CFC
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 13:44:40 +0200 (CEST)
Received: from localhost ([::1]:38618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTN9a-0002rQ-Lk
	for lists+qemu-devel@lfdr.de; Thu, 23 Sep 2021 07:44:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mTN5t-0001nO-32
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 07:40:50 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:37599)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mTN5r-0006YR-69
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 07:40:48 -0400
Received: by mail-wr1-x436.google.com with SMTP id t8so16353862wrq.4
 for <qemu-devel@nongnu.org>; Thu, 23 Sep 2021 04:40:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=1tRyC4xj69pF8P0DcEwBTF/cCmmQ1WXOLn8J9OAcepE=;
 b=h7VeZyoq6q4qf4a7QtaBS/VvJACL1JqUpsR3J1XKZue0Wf0Rd/ogK6HyuU8H8wUD/b
 BLOpQe7WW1qVQpNIt+PxyGAUblWawC/jhoAs9rK04+4Ys/Gei2uEc4z1BuETFKGAsUkm
 wxp8bxBG3tuyzqjW+pN9C2Y/HNSs8J+o1Uhg7ON0OSMN9u6PiM2Z9aYHe2Ot2JSn2O0U
 FaaxTKc/sj02TGWkjXcLZyKCnF7S8+I+Ed3TJBhZGfRest/sd25UOB848qHs9T9rkRPG
 9ACgcDDdSCME2nG4eEllvI3PQAqwCFTWoTw8ksrWJUrNx0H9RZcVqDT3ODSQD/u42DNQ
 IU6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1tRyC4xj69pF8P0DcEwBTF/cCmmQ1WXOLn8J9OAcepE=;
 b=NpKM4/UyB1SyLa1FPcYwKF0EOzjGg5kxbyni7AGVg3o8UQthMgAc2RlFmSnzFP+Ixg
 1IHkbOD9cQqSkpR6fwL5pVW9FWmSk8roH1Y8JLTlHcZUuHQUM31B2uhJ5WMG7aF6/RlI
 /y1AWoM7gED2x76YuF2ikCPDK+wL8v9e/ReCHVZO+vShFzBhFe+vsH5IsbfX9/DC5vvJ
 AUdw0wVDk60g4eCKhBgO2Xnq7Jiq/4d3NnfHYsulczeX9T5M1Rs3ki3H4pRyNwn7R5IR
 8Ve94G0WH7ai2lll8kyKs8xdgVUUb/ZLkhCArTn+3U9MLcqPLRPcfTBBDEecyWYJLkeG
 UvpA==
X-Gm-Message-State: AOAM530RkLj9YXPP127Tp6Z7V5kVk0HWEwkTVeMRu6VVcE/V9W27/m8Y
 JBzpqgkMkYeEBY27CxlxeJAsllK2+7g=
X-Google-Smtp-Source: ABdhPJzlmiwrVFnO25LPW0vp+FZ/9v4aXWWANr6LxyBD5PLTZDGxLDctZzJ/gH4Oy1fbGkyB0TPdsA==
X-Received: by 2002:a5d:59ae:: with SMTP id p14mr4657221wrr.278.1632397244238; 
 Thu, 23 Sep 2021 04:40:44 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id k17sm10852185wmj.0.2021.09.23.04.40.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Sep 2021 04:40:43 -0700 (PDT)
Subject: Re: [PATCH] tests: qtest: bios-tables-test depends on the unpacked
 edk2 ROMs
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210923081555.3648310-1-pbonzini@redhat.com>
 <YUw5Pglv2lcS2Nz6@redhat.com>
 <aac1894b-e515-cbc7-5b51-aaddc6fc3de4@amsat.org>
 <02853d4e-a708-5141-f38b-0dd48329f305@redhat.com>
 <CAFEAcA--6NfnjuY46LbTmpQ6as+uaxQ0aaMwAOUJ4CHaR4xnsg@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <47fe32de-e796-bea9-b295-064fdcfeed24@redhat.com>
Date: Thu, 23 Sep 2021 13:40:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA--6NfnjuY46LbTmpQ6as+uaxQ0aaMwAOUJ4CHaR4xnsg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23/09/21 12:44, Peter Maydell wrote:
> On Thu, 23 Sept 2021 at 11:32, Paolo Bonzini <pbonzini@redhat.com> wrote:
>>
>> On 23/09/21 12:00, Philippe Mathieu-Daudé wrote:
>>> See also "blobs: Only install required (system emulation) files":
>>> https://lore.kernel.org/qemu-devel/20210323155132.238193-1-f4bug@amsat.org/
>>
>> Nice and makes a lot of sense.  Regarding "there is probably a nicer way
>> to do this with Meson", I would do without all the variables and do
>> something like
>>
>> foreach target : target_dirs
>>     if target in ['...']
>>       blobs_ss.add('...')
>>     elif target in ['...']
>>       blobs_ss.add('...')
>>     endif
>> endforeach
>>
>> directly in pc-bios/meson.build.
> 
> Is it possible also to have meson handle the "symlink the blob from
> the source dir to the build dir" which currently configure is doing ?

Yes, though I would have to check the details on how to do that best 
(for example whether to keep them at configure time or move them to make).

By the way, I think a lot of the DIRS in configure are not needed 
anymore; meson would create them anyway and they're not needed by the 
LINKS loop below.

> That would mean we could avoid having effectively two lists of blobs.
> (Somebody would need to cross-check that all the blobs the wildcards in
> configure are linking in are listed in the meson list.) I guess
> the question is whether other parts of the build system assume those
> links already exist (ie they don't explicitly declare a dependency
> on the existence of the blob and would need to change to do so).

Yeah, that's also why in my patch I didn't bother adding the roms 
dependency to bios-tables-test only.  It's less prone to failure if 
they're just built before any qtest is run.

Paolo

