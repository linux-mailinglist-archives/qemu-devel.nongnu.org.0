Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39A88338942
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 10:52:35 +0100 (CET)
Received: from localhost ([::1]:33032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKeTC-0007lq-9I
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 04:52:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lKeRP-0006YU-9S
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 04:50:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51304)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lKeRN-0004eT-SW
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 04:50:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615542641;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8+QQ3L72ZvCDp5QYavE+Fdl92Bga421vHIaktO+mpV8=;
 b=A+32f02heLGRHZ0ux76YeEPTVqrJxtF9hxO6vmNSdvkGNMviFx043B1r1MVwOY0irqNqPj
 vkmCeib8buRPIsAp84G04Jaxh1i5YmKn8IQ4pBglQp8O8gB7oFJk1ktxxxr0MQ7nvLuw2M
 6mzagWDqiRMbsv3h613+8ntz+Plh0+c=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-307-Dshn2SP6OV2Bx5aIqKXGBA-1; Fri, 12 Mar 2021 04:50:38 -0500
X-MC-Unique: Dshn2SP6OV2Bx5aIqKXGBA-1
Received: by mail-wm1-f71.google.com with SMTP id s192so5131095wme.6
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 01:50:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8+QQ3L72ZvCDp5QYavE+Fdl92Bga421vHIaktO+mpV8=;
 b=Yi4MswE60PYT81UuOV8/21jcCtX7pIx0LgbsSVzsriev/s28+bwB4sxhZvlXKnTWfE
 gj4qlPeUwzQnlQGYmqT0cH9bs15VToddN8h88+8FWclsSvUMly3mAvB1+z1WRr7Q9lZ5
 d47WqyOmz6vzdUns9K6BdkOehusjxnT63SPrh1VB6FWZIerlrb0IdXRugL4GcFiZVSHZ
 zHFnBiAM87thykSfDJCZ58hdWMwyM44/PY7qc6lMgetPybRIdL4PDsBcjhGwPHwezgEx
 YkGogGnrGMzdZpWbK5FiFJxk3YORcOWJhmV3YEM0O7kFYSYTw0w8Mg03GU6dquDMcw5x
 JdCA==
X-Gm-Message-State: AOAM533NjwQSS9AT8u5xzb4tCMeWagnFN18rkPxioug5jdIlil2iGfV7
 NXGthQLlwt2BXy6W1zsKx/R+7SK8Ly9X3PHJa9wpCov6YKTZEd35Y5SLuaLqMVXVWP1T8Oxh1yB
 8okKt16dMuaSs6VE=
X-Received: by 2002:a05:6000:11c1:: with SMTP id
 i1mr13049482wrx.215.1615542637152; 
 Fri, 12 Mar 2021 01:50:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzsAtIb08goh+r7P5YdJA9urs2HJMSYWZc8sCd3K+RkLIm2AugE0DgbEH+XK7G0ck3sCKSOpA==
X-Received: by 2002:a05:6000:11c1:: with SMTP id
 i1mr13049451wrx.215.1615542636920; 
 Fri, 12 Mar 2021 01:50:36 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:63a7:c72e:ea0e:6045?
 ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id i10sm6773084wrs.11.2021.03.12.01.50.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Mar 2021 01:50:36 -0800 (PST)
Subject: Re: [PATCH 4/6] qtest/arm-cpu-features: Check KVM availability at
 runtime
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Claudio Fontana <cfontana@suse.de>,
 Thomas Huth <thuth@redhat.com>
References: <20210311231202.1536040-1-philmd@redhat.com>
 <20210311231202.1536040-5-philmd@redhat.com>
 <4c8f9841-1fda-db4f-57fd-bf764f3a0962@redhat.com>
 <414c6e5f-2a7b-1c4d-46b7-53aadf592dfc@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <7bdd024e-a561-9a48-a0e7-c007f6ca60d8@redhat.com>
Date: Fri, 12 Mar 2021 10:50:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <414c6e5f-2a7b-1c4d-46b7-53aadf592dfc@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Andrew Jones <drjones@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/03/21 10:32, Philippe Mathieu-Daudé wrote:
> On 3/12/21 10:05 AM, Paolo Bonzini wrote:
>> On 12/03/21 00:12, Philippe Mathieu-Daudé wrote:
>>> -#define MACHINE_KVM "-machine virt,gic-version=max -accel kvm -accel
>>> tcg "
>>> +#define MACHINE_KVM "-machine virt,gic-version=max -accel kvm "
>>
>> Wouldn't qtest_init simply fail here if KVM is not available?
> 
> I guess my previous approach was what you suggested.
> The previous patch (bios-tables-test) is a better example:

Ah no, qtest_init adds "-accel qtest" automatically.  So this patch is fine.

An alternative is to first probe accelerators using "-machine none" and 
then skip the tests *before* the call to qtest_init.

Paolo

>    g_autofree char *args = NULL;
> 
>    args = test_acpi_create_args(data, params, use_uefi);
>    data->qts = qtest_init_for_accel(args, "tcg");
>    if (data->tcg_only && !data->qts) {
>       g_test_skip("TCG not available, skipping test");
>       return;
>    } else {
>       // check data->qts or the following will abort
>    }
> 
> Having qtest_init_for_accel() calling qtest_quit(),
> but this makes the tests logic more complex IMO...
> 
> Is that what you have in mind?
> 


