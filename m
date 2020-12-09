Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FAC82D4523
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 16:10:41 +0100 (CET)
Received: from localhost ([::1]:48424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn172-0003FD-N4
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 10:10:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kn12z-00017U-JV
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 10:06:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:23529)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kn12x-0001Sc-SG
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 10:06:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607526387;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cMXzNhxU8DshPYOzcQqD5LW4o6ZktIrGWtgq9rC2Gxw=;
 b=ik19Vihw54KbFY2ykwT8ly8P2sF+TkXMBc2f56m43axp80UwN6sfx92PdDPcd8blj7j/JB
 D+uxn0TLIY+wg/gp55xLL30J2DpCQMTt5sTKQtvBQuVQyEa1OCmjuhtencXy8GmDMNsVaU
 R6MOhIvJbwOBNMVBeR++0Naz606ycGg=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-470-cnbOJMzTPGW_gVZ_I9-ICA-1; Wed, 09 Dec 2020 10:06:25 -0500
X-MC-Unique: cnbOJMzTPGW_gVZ_I9-ICA-1
Received: by mail-wr1-f71.google.com with SMTP id q18so762870wrc.20
 for <qemu-devel@nongnu.org>; Wed, 09 Dec 2020 07:06:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cMXzNhxU8DshPYOzcQqD5LW4o6ZktIrGWtgq9rC2Gxw=;
 b=BudjNbT92oaFCBoP9zSLlCdJk4rJPq3Oy37KVUH4cvlPFOZz1dAXywMrPEX4K72mil
 1RvtCcMxyfBDX98umtURGxhaQlaoNSQXqK8Dvp6B0UlgVCKGC29BouvJjecM6vkzWf1E
 s7fBBPcMqpROHW4X9bjVmGm4u4C6ERBfNV52MByrRaKHevYxS1u7YZ4s5NCvWFvNHt71
 g1hBmdtU2Mfg6bsUutP4Wm+uQ+/s2weNYTNDu6V6hfk7IlTz/Lf8uhmee5VjWw409w+D
 lAQTXkbKkrSOhVWZUFXAVG9HDD+eyqDMiw198XWorjDKGB12k2AkHP+FCDsOeYR38Bpg
 Iz3g==
X-Gm-Message-State: AOAM530sX1eZZHNIULr2ZQsotCNrE4K9HvTZ0A81SgAa/CEhCfbGBmua
 NyZ0JFhIJfm2XE8U6IuZ+cCX/7UFXJJW9H4nGXsfhVYGj7XUeeBPRbvR8jCsx5clhnkzidq9dBM
 bZXbMwzsGqWNctdY=
X-Received: by 2002:a5d:6749:: with SMTP id l9mr3230820wrw.395.1607526383535; 
 Wed, 09 Dec 2020 07:06:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwig2NiwucMH7di6Vxck+DXz0s0wecdF71UqaaG5RTC6tcvJcjrnRKsQNEbGX8bWkZfmS0z5Q==
X-Received: by 2002:a5d:6749:: with SMTP id l9mr3230779wrw.395.1607526383259; 
 Wed, 09 Dec 2020 07:06:23 -0800 (PST)
Received: from [192.168.1.36] (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id a18sm4096753wrr.20.2020.12.09.07.06.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Dec 2020 07:06:22 -0800 (PST)
Subject: Re: [RFC v9 18/32] cpu: Move synchronize_from_tb() to tcg_ops
To: Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Wenchao Wang <wenchao.wang@intel.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>
References: <20201208194839.31305-1-cfontana@suse.de>
 <20201208194839.31305-19-cfontana@suse.de>
 <d027f556-9588-ece3-8f45-50f1afc2e096@redhat.com>
 <37148d19-cf6f-2555-c5d4-b0926c77ac48@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <4f38f7c8-fc47-77c5-87fb-7ba8099bf453@redhat.com>
Date: Wed, 9 Dec 2020 16:06:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <37148d19-cf6f-2555-c5d4-b0926c77ac48@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Paul Durrant <paul@xen.org>, Jason Wang <jasowang@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, Dario Faggioli <dfaggioli@suse.com>,
 "Emilio G . Cota" <cota@braap.org>, haxm-team@intel.com,
 Cameron Esfahani <dirty@apple.com>, Anthony Perard <anthony.perard@citrix.com>,
 Bruce Rogers <brogers@suse.com>, Olaf Hering <ohering@suse.de>,
 Colin Xu <colin.xu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/9/20 3:33 PM, Claudio Fontana wrote:
> Hi Philippe,
> 
> On 12/9/20 10:27 AM, Philippe Mathieu-Daudé wrote:
>> On 12/8/20 8:48 PM, Claudio Fontana wrote:
>>> From: Eduardo Habkost <ehabkost@redhat.com>
>>>
>>> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
>>> [claudio: wrapped in CONFIG_TCG]
>>> Signed-off-by: Claudio Fontana <cfontana@suse.de>
>>> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>>> ---
>> ...
>>> diff --git a/include/hw/core/tcg-cpu-ops.h b/include/hw/core/tcg-cpu-ops.h
>>> index 4475ef0996..109291ac52 100644
>>> --- a/include/hw/core/tcg-cpu-ops.h
>>> +++ b/include/hw/core/tcg-cpu-ops.h
>>> @@ -10,9 +10,6 @@
>>>  #ifndef TCG_CPU_OPS_H
>>>  #define TCG_CPU_OPS_H
>>
>> Missing for TranslationBlock:
>>
>>   #include "hw/core/cpu.h"
> 
> 
> this file though is only included from hw/core/cpu.h itself under CONFIG_TCG..

1/ we never know how it will be included, includes should
   be self-contained IMO.

2/ my editor isn't that smart and can't figure out the types.


