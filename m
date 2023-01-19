Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80B106737E2
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 13:06:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pITfv-0008J7-2u; Thu, 19 Jan 2023 07:05:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pITfi-0008DF-Ku
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 07:05:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pITfg-00027e-O0
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 07:05:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674129931;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GmCX5NcC07P1BZWenNXSfm8mm+n2k/ScOELyBh1IG6A=;
 b=HpFRVTacH0oheKqr5kmwMwYZfjRpnJnwVSVMuCuolwGriEykiLYvb+lNqfnk5XSFZCj5fq
 lZvZj62b3jHmQ5Ux4xf/EoNX/m9ZFqgu6yuCWHwbnqJWSodyqXdPUmAH0r+oXI11xQqmlp
 PqPdZjjKM5vchXe/M25d2y6KJPu/s8I=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-173-cvD6FyViPNqsjLDPIfH7aQ-1; Thu, 19 Jan 2023 07:05:30 -0500
X-MC-Unique: cvD6FyViPNqsjLDPIfH7aQ-1
Received: by mail-qv1-f69.google.com with SMTP id
 df6-20020a056214080600b00534fe2ad5a3so890170qvb.11
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 04:05:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GmCX5NcC07P1BZWenNXSfm8mm+n2k/ScOELyBh1IG6A=;
 b=EUd8wl8fT8x8CCDc7R3K/sH/NdmywlJsEMebCJ/n8VKxr5MXBtJEkou046afe6X7Uu
 w/gbAQBEOX+mQOL/XhFzz6dJRshmvajTuqRbImkH1w7APwY1EUOPWIUOiYEjqi+vSfy+
 912T0cG53MENwrB/dL48P9yAB/W+UERzb2Cnyas8VeR65cP52NJK2MB8FmZjTfKM9GxG
 YSSnxORsFyvjzfvSNTRgKD+fPTQL9rcCUf1hNM7cvYQyw2DvkJ02F53P/aXz8ONwvUW4
 IYh/90JZfJHriUKjDUiog6XEUyNOrlMc6TJ7jynFggq3nQuDGGBPuLqiSkv07TyVgYp3
 +eeg==
X-Gm-Message-State: AFqh2kpdShX2EK4ZB4SEn6vSCBtVdNk62XacXPsAeoUQ3Y+RYYKR1Gsi
 v70j7PkH6BwYsK/35KiHWE+8oP9GirhDGsa9rMlW3ynVBOFcq4UvTPCDuDF2a/eo0pZVTIGj28l
 yYwQ41XqlkgofEhc=
X-Received: by 2002:a05:622a:1b1e:b0:3ab:a047:58ee with SMTP id
 bb30-20020a05622a1b1e00b003aba04758eemr13720044qtb.25.1674129929692; 
 Thu, 19 Jan 2023 04:05:29 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuk9j/JTqbf8gSZuv75rPAyqkuAFIL/8KZLsdgj8/5zX9v9HhYxgB9V767i1z8Ytyj4noQIDw==
X-Received: by 2002:a05:622a:1b1e:b0:3ab:a047:58ee with SMTP id
 bb30-20020a05622a1b1e00b003aba04758eemr13720023qtb.25.1674129929386; 
 Thu, 19 Jan 2023 04:05:29 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-178-207.web.vodafone.de.
 [109.43.178.207]) by smtp.gmail.com with ESMTPSA id
 t39-20020a05622a182700b003b63b20314esm4199189qtc.57.2023.01.19.04.05.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Jan 2023 04:05:28 -0800 (PST)
Message-ID: <147a979d-2d16-4ad3-4330-3e8187f88a2e@redhat.com>
Date: Thu, 19 Jan 2023 13:05:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [RFC PATCH 6/8] tests/qtest/libqtest: Allow checking for HVF
 accelerator
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
 Fabiano Rosas <farosas@suse.de>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Igor Mammedov <imammedo@redhat.com>
References: <20230119100537.5114-1-philmd@linaro.org>
 <20230119100537.5114-7-philmd@linaro.org>
 <fc7802c3-afd7-2cd0-438e-7b75f4789879@redhat.com>
 <b61a6249-3b84-e0cf-6220-029086c72254@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <b61a6249-3b84-e0cf-6220-029086c72254@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.094, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 19/01/2023 12.30, Philippe Mathieu-Daudé wrote:
> On 19/1/23 12:24, Thomas Huth wrote:
>> On 19/01/2023 11.05, Philippe Mathieu-Daudé wrote:
>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>> ---
>>> RFC: CONFIG_HVF is poisoned.
>>>
>>> We could pass host config definitions to qtest using:
>>>
>>>    diff --git a/meson.build b/meson.build
>>>    @@ -2547,6 +2547,7 @@ foreach target : target_dirs
>>>
>>>       accel_kconfig = []
>>>       foreach sym: accelerators
>>>    +    config_host_data.set(sym + '_QTEST', '')
>>>         if sym == 'CONFIG_TCG' or target in accelerator_targets.get(sym, [])
>>>           config_target += { sym: 'y' }
>>>           config_all += { sym: 'y' }
>>>
>>> Then test for CONFIG_HVF_QTEST ...
>>
>> I don't think that would really work well. The qtests are build once for 
>> all targets, and HVF is only available in the target that matches the host 
>> architecture. It's poisoned on purpose.
>>
>> The TCG accelerator is special, since we have it in either none or in all 
>> targets, that's why we can use CONFIG_TCG there.
>>
>> The kvm part is also rather a hack... we should maybe rather additionally 
>> use the "query-kvm" QAPI command to check whether it is really available...?
>>
>> To fix this properly for HVF, I think you'd need a way to query the 
>> available accelerators via QMP, too... Hmmm, weren't there some patches 
>> for something like that in the past ... can't remember right now ...
> 
> https://lore.kernel.org/qemu-devel/20210505125806.1263441-3-philmd@redhat.com/ 
> :(

Ah, right, and we ended up with the competing patch from Igor since we could 
not quite settle on the QAPI extensions?

Hmm, what happens if you execute "query-qmp-schema" on a HVF-enabled host 
these days? Is there a "hvf"-related entry somewhere in the response?

  Thomas


