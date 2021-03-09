Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7031E3321D9
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 10:22:54 +0100 (CET)
Received: from localhost ([::1]:49820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJYZp-0007SH-Gb
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 04:22:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lJYYF-0006l3-IT
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 04:21:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45367)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lJYYD-0000RD-Ir
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 04:21:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615281672;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LcjxwZhX7BxwObbxSiK8mID2wAofrsc7dRBqfqbfsmA=;
 b=f91x/irFNHj4FSUQalZNfr9JXWLbcR+YwDVZPkQkRH1bCYXlOC4EOJBz09a+hRbggcbZOb
 BpFXLUEWPOyzD2ZQz2BcRKX4hgXTSKrQgJa6WHQrkKlZAuURyBf4Or/bVyQZXXb5JghEKB
 3g8LByN+OKYlOLlN4e0Jy5AvMZNAAFM=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-6-gIja-tdiN7ecBrKcFFmnUw-1; Tue, 09 Mar 2021 04:21:07 -0500
X-MC-Unique: gIja-tdiN7ecBrKcFFmnUw-1
Received: by mail-wr1-f72.google.com with SMTP id s10so6155081wre.0
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 01:21:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LcjxwZhX7BxwObbxSiK8mID2wAofrsc7dRBqfqbfsmA=;
 b=EXU7xvsBJ8o9/WWxEIJmdIAEUvOUKCB05FA0BNlerVLt/Snxh6Mp4GRkd8Nb5GLaCn
 ModidoG3QyVs3d+8sWVHEc9pBPlDzE9ZKxE45UovrY/fsaZ/X4PFgXv5Acjd8egtTt8S
 JIYPrpxyR7iRX3VDnHq7sb/eYSnJG58g3m9/XXShaV7iC/bfva02T4leyYyUTjmq4Pd+
 QTWg8ZtZpBxdRBNKNrd2quorkNhPRqn9ZA3oxBAFZcb2Qrd6vfxvfyB0vlv7C38lELZc
 SlktMZhGXhUWYFX8GNNOzp48XqkG2qtp2ZiUQAbEmNewUsdSRZON4TLKecPBe3UIKVSa
 E6kA==
X-Gm-Message-State: AOAM530dA2jT4IG7CUhNrg39D5iAgkVskTMWFUtHrhlsanf52Nni+88Y
 LeT2N7/7Df67FvMgnz5EgHlDrkTqd+P2yxzqi+MFYXpYE5cUkj28jDi0q/cppHW/2dL6zxjgbSk
 iIR7UR2zclJLN92g=
X-Received: by 2002:a1c:e18b:: with SMTP id y133mr2969709wmg.22.1615281666340; 
 Tue, 09 Mar 2021 01:21:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxn+ytWc01Vf69K98PXu8752BSVdvopkiv1csE3OpPhjIKDI6HA6UIl3Nj85hJIEc2Ad6xu8A==
X-Received: by 2002:a1c:e18b:: with SMTP id y133mr2969698wmg.22.1615281666133; 
 Tue, 09 Mar 2021 01:21:06 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id f7sm2948067wmh.39.2021.03.09.01.21.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Mar 2021 01:21:05 -0800 (PST)
Subject: Re: [RFC PATCH v2] meson: Only generate trace files for selected
 targets
To: Claudio Fontana <cfontana@suse.de>, Stefan Hajnoczi
 <stefanha@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
References: <20210224213515.3331631-1-philmd@redhat.com>
 <YEZU4n1IW6lSQwxl@stefanha-x1.localdomain>
 <af8022d6-c729-5033-6efa-6a1ea23ebee7@redhat.com>
 <b9b3c6ac-e7c5-2f64-cc66-5303e6b9a2c4@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <a710f9de-458e-0f40-505d-1e795313a025@redhat.com>
Date: Tue, 9 Mar 2021 10:21:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <b9b3c6ac-e7c5-2f64-cc66-5303e6b9a2c4@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=WINDOWS-1252
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/9/21 9:41 AM, Claudio Fontana wrote:
> On 3/8/21 6:48 PM, Philippe Mathieu-Daudé wrote:
>> On 3/8/21 5:46 PM, Stefan Hajnoczi wrote:
>>> On Wed, Feb 24, 2021 at 10:35:15PM +0100, Philippe Mathieu-Daudé wrote:
>>>> We don't need to generate trace files for targets we
>>>> are not building. Restrict the the ones selected.
>>>>
>>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>>>> ---
>>>>  meson.build | 16 ++++++++--------
>>>>  1 file changed, 8 insertions(+), 8 deletions(-)
>>>>
>>>> diff --git a/meson.build b/meson.build
>>>> index 05a67c20d93..8503aa1b628 100644
>>>> --- a/meson.build
>>>> +++ b/meson.build
>>>> @@ -1826,16 +1826,16 @@
>>>>    trace_events_subdirs += [
>>>>      'accel/tcg',
>>>>      'hw/core',
>>>> -    'target/arm',
>>>> -    'target/hppa',
>>>> -    'target/i386',
>>>>      'target/i386/kvm',
>>>
>>> Please add a comment explaining why an exception is needed here and the
>>> rest of the target directories are handled by the loop below when you
>>> send a non-RFC patch.
>>
>> Better would be a recursive function that adds the directory if
>> necessary. But I'm happy adding a simple comment =)
>>
>>>
>>> That will help people who add sub-directories in the future.
>>
>> Yes. Anyhow I expect this to clash with Claudio's work in progress
>> (which split target/ and add multiple subdirectories).
>>
>>
> 
> np, just the tracedirs should be easy to solve;
> 
> I personally don't see updating a simple list as difficult for the dev; does generating trace files for all require a lot of time?
> 
> In any case, I agree that just recursing all directories in target/ looking for trace.h / traceevents files could be better.
> 
> But how much time do we spare, compared with just generating all?

Well now on slow 32-bit hosts my impression is we spend more time in
meson / generating trace boilerplate files (even if the python code
is trivial, it is invoked many times) rather than compiling C.

trace doesn't use Kconfig to filter, so everything is processed.
Maybe the root problem is 'hw/core' actually, not the 'target/'
directories...

This is more noticeable for the user-only builds, which are the
ones likely to be supported longer on 32-bit hosts (there are
some discussions about keeping maintaining sysemu there).

That said this is user experience feeling and I didn't care to
benchmark it.

Anyhow this doesn't seem to have big impact (yet) so let's
postpone this series.

Thanks,

Phil.


