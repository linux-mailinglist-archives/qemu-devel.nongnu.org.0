Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71E1E30FBED
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 19:51:14 +0100 (CET)
Received: from localhost ([::1]:50066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7jij-0002KF-F4
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 13:51:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l7ikh-0005YN-AS
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 12:49:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28526)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l7ikc-00023E-H3
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 12:49:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612460945;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bCD5ziV9x5FgBNQRCkoxto3bFQMwi01yOUrKNWsjQTI=;
 b=Q+aZZjFyO57PSPTAdUHSKyvylnufwul7g6CoxBTSWpeNR0bWxdi2SkJivm9PLsAJZVd8i/
 pf1v3fcZxHe/U6FCJs8dHAZ4zBSKc0W7bmgl1Cjd9dNsD/rtLviO6DahDNLMkb1p0GEZmF
 axUpi8WnDmDEQ91dugLvl2myVZluStw=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-26-ZYzO0_mDNjSfltd0BxW-Sg-1; Thu, 04 Feb 2021 12:49:00 -0500
X-MC-Unique: ZYzO0_mDNjSfltd0BxW-Sg-1
Received: by mail-ej1-f70.google.com with SMTP id dc21so3188537ejb.19
 for <qemu-devel@nongnu.org>; Thu, 04 Feb 2021 09:48:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bCD5ziV9x5FgBNQRCkoxto3bFQMwi01yOUrKNWsjQTI=;
 b=UFzCFwu9YxSVgvie11drGrCht+buyo3u3AfI4tp4syfaLoBKWQYAEP8CdJFg6nIJHN
 1LAZ2dolZq7JB3dhknWBHagOsELMChSVHcxHY3nkrNOjtSxtdrBugNIP/Fk8bq2oDgGB
 fZd9Y3V2JJu+ArlZEZZ28zk/Zionb/m/I2vuTUx2ZNzd++N5HWospEfcSgLRtb48xu4l
 mUrh+F29LxQHBxF6EyQ/6CSY8WSslqSYlrZw4uRe1JO2F3R+ZLz0cY6UbDbUbrWOHjFG
 NZ3BFgeL5JiPhVW1wVrSLj/amLhALn5hk24wTuMzG/aYEA+ewojS/0+WCWrnZz2vudiV
 rTpA==
X-Gm-Message-State: AOAM531p+dvSL78P05UTTOkxRn/94JTZ5KedwYRddD6TDxOArCjIC8fw
 gYGxZ1cTDqWOiENYX3SqJwTwOts9NobbMn26UE372rKSvVNrCleMZKbpRwMKvK0fmgOXAnISztM
 adM8vVq5+I29QXyeGOIu19my5sm421T7X0Jl7OOk0PMCdjoELmIl4ILJgRqyHNrjkndk=
X-Received: by 2002:a50:acc1:: with SMTP id x59mr110711edc.43.1612460938281;
 Thu, 04 Feb 2021 09:48:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxqpFK6130QKG91Tx1xHlMHngCQHnip9urNSsRRZllkuJGuWQEnD2lADCUDV27qRkXdx6G2eg==
X-Received: by 2002:a50:acc1:: with SMTP id x59mr110695edc.43.1612460937963;
 Thu, 04 Feb 2021 09:48:57 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id a15sm1266656edv.95.2021.02.04.09.48.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Feb 2021 09:48:56 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>,
 Programmingkid <programmingkidx@gmail.com>
References: <20210202134410.9274-1-programmingkidx@gmail.com>
 <2cdac45d-6a4d-dca1-4f32-2fc6b549f8d5@redhat.com>
 <158A523E-8E81-4E56-BE52-460034476E9B@gmail.com>
 <CAFEAcA8mnac53=TO3HUXyzELD5D1R_7+FAi14kYs2Rk-MCdAfg@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] Set icon for QEMU binary on Mac OS
Message-ID: <750166a5-d458-2d85-60ed-bf5ca4df14b5@redhat.com>
Date: Thu, 4 Feb 2021 18:48:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8mnac53=TO3HUXyzELD5D1R_7+FAi14kYs2Rk-MCdAfg@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.182, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 04/02/21 16:42, Peter Maydell wrote:
> On Thu, 4 Feb 2021 at 15:39, Programmingkid <programmingkidx@gmail.com> wrote:
>>
>>
>>
>>> On Feb 4, 2021, at 3:54 AM, Paolo Bonzini <pbonzini@redhat.com> wrote:
>>>
>>> On 02/02/21 14:44, John Arbuckle wrote:
>>>> Before switching the build system over to Meson, an icon was
>>>> added to the QEMU binary on Mac OS. This patch adds back that
>>>> feature.
>>>> Signed-off-by: John Arbuckle <programmingkidx@gmail.com>
>>>> ---
>>>>   meson.build | 20 ++++++++++++++++++++
>>>>   1 file changed, 20 insertions(+)
>>>> diff --git a/meson.build b/meson.build
>>>> index f00b7754fd..7f534f4e75 100644
>>>> --- a/meson.build
>>>> +++ b/meson.build
>>>> @@ -2183,6 +2183,26 @@ foreach target : target_dirs
>>>>                  link_args: link_args,
>>>>                  gui_app: exe['gui'])
>>>>   +# set QEMU's icon on Mac OS
>>>> +if targetos == 'darwin'
>>>> +    newiconpart1 = custom_target('Icon for ' + exe_name + ' - part 1',
>>>> +          depends : emulator,
>>>> +          input : emulator,
>>>> +          output : 'new icon for ' + exe_name + ' - 1',
>>>> +          command : ['Rez', '-append',
>>>> +           meson.source_root() + '/pc-bios/qemu.rsrc', '-o',
>>>> +           meson.current_build_dir() / exe['name']],
>>>> +          build_by_default : true)
>>>> +
>>>> +    custom_target('Icon for ' + exe_name + ' - part 2',
>>>> +          depends : newiconpart1,
>>>> +          input : emulator,
>>>> +          output : 'new icon for ' + exe_name + ' - 2',
>>>> +          command : ['SetFile', '-a', 'C',
>>>> +           meson.current_build_dir() / exe['name']],
>>>> +          build_by_default : true)
>>>> +endif
>>>> +
>>>>       if exe_sign
>>>>         emulators += {exe['name'] : custom_target(exe['name'],
>>>>                      install: true,
>>>
>>> Maybe you can do it on install, using add_install_script instead?
> 
> Why would we want to only do it on install? A QEMU which
> you run from the build tree ought to still have its icon,
> surely ?

Mostly because edit-in-place commands are not very well suited to a 
"make" workflow, while they're common at install time (e.g. strip).

But since we already have scripts/entitlement.sh, and it's only Apple 
that like in-place build steps it is even better to combine all the 
in-place adjustment to the executable in scripts/entitlement.sh.  For 
example if no entitlements are needed, you pass an empty third argument 
and scripts/entitlement.sh (now scripts/postprocess-darwin-executable.sh 
or something like that?) can do Rez+SetFile but not codesign.  The 
existing "if exe_sign" becomes an "if targetos == 'darwin'".

Paolo


