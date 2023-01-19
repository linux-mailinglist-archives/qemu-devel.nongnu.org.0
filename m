Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C9E0673E91
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 17:21:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIXfA-0000XX-A0; Thu, 19 Jan 2023 11:21:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pIXf8-0000Wx-Ly
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 11:21:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pIXf6-0003ac-TF
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 11:21:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674145272;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9ZXYzA6wBI+c4e59ClvxpxHDlqC/SdFCNH11BP6R9RY=;
 b=gJXiVfLtoe1q3peSxqvLMUVV0dfWJM86R0yaNDG99QBL5YPHEuaaIVwvthN82DLXcvFlta
 2FsVNzcFAdRTAtj2EdcT0YNVgDStT2Lu543hc70exmyJygClILn9ZDALe34UkcyWDlaWYf
 0OnJi2gMZLqMzwAoaphnPTgueO48Uok=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-534-sidAs1NrMA2ibPL3-PKITg-1; Thu, 19 Jan 2023 11:21:10 -0500
X-MC-Unique: sidAs1NrMA2ibPL3-PKITg-1
Received: by mail-qk1-f200.google.com with SMTP id
 k5-20020a05620a414500b00708ef47754eso1548672qko.13
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 08:21:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9ZXYzA6wBI+c4e59ClvxpxHDlqC/SdFCNH11BP6R9RY=;
 b=Sv0upKEuWTIghecCaJtVuU1lnmto7RBPWsC/8U0OdRHKdZ82dkYgW7vZxSjUJIubXC
 IjZ/xN8BCxZ62VYsbOMy899JyHM4TSzmDwmbYcC9Cc9WhHYwvCxcFqqFlxjemsMkspte
 isqpi6qlSuCD6+oU5oaEY5rV9hl/vkabSqzjUgqgWkbnFB5p2Up13J6U1ved9NF/srBF
 hdrJpuUuIOOz2nz/4R8floAbJIx0BKjbvnEhKbXxvIzFcA2g0OyAO/vAxEpd6ayXaJFk
 4SyP0fHi/nZapjm/LBhzLMhPzbzMs2yS6CvLA07RaOLs6fd1HPXcuaYBKOkRpkuT3wOK
 30lA==
X-Gm-Message-State: AFqh2kqP885UImwLv7/uiuGdaoRf+R/f5l+ZwcyvAyHhfbh06aijIHag
 BiSUQLCLzIU/vv/GAePIB+xqvRptmk38aC9CNVQMdt68J8gVGxMFLWNBq0vMoefyBdxajlpA8iU
 t5QhPSN7iahFuP6M=
X-Received: by 2002:ac8:4f16:0:b0:3b6:2bbd:1785 with SMTP id
 b22-20020ac84f16000000b003b62bbd1785mr16794845qte.45.1674145270260; 
 Thu, 19 Jan 2023 08:21:10 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvHHXrHdmvPYqK7cGf9QGk30ieoEhkG0LVEIR4Fk8Uy1iMcAptL9cPxnO+Me6n9cuVC8Dih6Q==
X-Received: by 2002:ac8:4f16:0:b0:3b6:2bbd:1785 with SMTP id
 b22-20020ac84f16000000b003b62bbd1785mr16794822qte.45.1674145270048; 
 Thu, 19 Jan 2023 08:21:10 -0800 (PST)
Received: from [192.168.8.105] (tmo-099-5.customers.d1-online.com.
 [80.187.99.5]) by smtp.gmail.com with ESMTPSA id
 v1-20020a05620a0f0100b006faf76e7c9asm24615927qkl.115.2023.01.19.08.21.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Jan 2023 08:21:09 -0800 (PST)
Message-ID: <baecc481-627b-2f36-4b5f-828a2a0097ee@redhat.com>
Date: Thu, 19 Jan 2023 17:21:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [RFC PATCH 6/8] tests/qtest/libqtest: Allow checking for HVF
 accelerator
Content-Language: en-US
From: Thomas Huth <thuth@redhat.com>
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
 Fabiano Rosas <farosas@suse.de>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org
References: <20230119100537.5114-1-philmd@linaro.org>
 <20230119100537.5114-7-philmd@linaro.org>
 <fc7802c3-afd7-2cd0-438e-7b75f4789879@redhat.com>
In-Reply-To: <fc7802c3-afd7-2cd0-438e-7b75f4789879@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.094, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 19/01/2023 12.24, Thomas Huth wrote:
> On 19/01/2023 11.05, Philippe Mathieu-Daudé wrote:
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>> RFC: CONFIG_HVF is poisoned.
>>
>> We could pass host config definitions to qtest using:
>>
>>    diff --git a/meson.build b/meson.build
>>    @@ -2547,6 +2547,7 @@ foreach target : target_dirs
>>
>>       accel_kconfig = []
>>       foreach sym: accelerators
>>    +    config_host_data.set(sym + '_QTEST', '')
>>         if sym == 'CONFIG_TCG' or target in accelerator_targets.get(sym, [])
>>           config_target += { sym: 'y' }
>>           config_all += { sym: 'y' }
>>
>> Then test for CONFIG_HVF_QTEST ...
> 
> I don't think that would really work well. The qtests are build once for all 
> targets, and HVF is only available in the target that matches the host 
> architecture. It's poisoned on purpose.
> 
> The TCG accelerator is special, since we have it in either none or in all 
> targets, that's why we can use CONFIG_TCG there.
> 
> The kvm part is also rather a hack... we should maybe rather additionally 
> use the "query-kvm" QAPI command to check whether it is really available...?

Scratch that ... I forgot that you already have to run with "-accel kvm" to 
see whether the accelerator is working with "query-kvm" ... so that would 
not work here for probing whether "-accel kvm" should be used or not ;-)

  Thomas


