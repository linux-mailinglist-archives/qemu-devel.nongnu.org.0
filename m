Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FD313AE650
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 11:43:56 +0200 (CEST)
Received: from localhost ([::1]:57448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvGTD-00060n-Ju
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 05:43:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lvGSK-0005Lo-S7
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 05:43:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60577)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lvGSJ-0004hz-4U
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 05:43:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624268578;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Gajfhv5w3kMP7+fufDmH56ZgS4pcubNmIc/aq3xeLCA=;
 b=dSHX5QMyUsNpcJu2Ttcty5M4MkeWunQ7YsZwGPsM/LN9XVflyQQXMCH0tIIBqQcA5POGZg
 TXYTmhAvNeTJVAw7PR9hTB68LvVAAvSTrj/QQaLrBlClalYUbZfHIv/j+PnEEubonhQMcK
 rGb8S8KvZ89hNs+26KSgwKUGQgVXpqw=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-299-dj3mPQhhO22AbVYUXeTFeg-1; Mon, 21 Jun 2021 05:42:55 -0400
X-MC-Unique: dj3mPQhhO22AbVYUXeTFeg-1
Received: by mail-wr1-f72.google.com with SMTP id
 v8-20020a5d43c80000b029011a94e052f2so1766059wrr.2
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 02:42:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Gajfhv5w3kMP7+fufDmH56ZgS4pcubNmIc/aq3xeLCA=;
 b=nhqCa1oED+GBrI+p2+u2tluRC9gtxRWrySi4vDjlwxOLHh9m+8ZJfJvrzdCiWlqUbW
 p6pePVyaTFzcPjOlIJduQS/huYoUeyDZ9PveBK6pHdSlLrDxRL2i7EYCedAleZcWpYYY
 rcDzekQRh+BNDzWubwF5rSjbOMo77ZQ/a12soCLMVBpyJv/qXs3fDi3n6rmrKcPw9gIw
 XFYTSYEDSo3yklhRMyJC2S0lagh47fGrmEdWiUyvcGet7e6jzP+EsNMx0/CK1Mp94PBJ
 PvPkAd13CXZROfFVZYYwg7z2OkD0rnvll3JP15tBCpPcRU0TOz4aGsifsqpJ088RLRYN
 Ysag==
X-Gm-Message-State: AOAM5305YHXDtaacNH5Otcq0pwjNdiU7mcXl7Q58gsEQUrtaKe4gsLrf
 aG0MheVcw9h16PW8mqWGiXHPtkS0ZBqsjUI5A95vLzBAhYh2K9eUDEccK4eRjlYGfjjU/O7ZQQa
 2lsguoCXwspmydB0=
X-Received: by 2002:a05:600c:4788:: with SMTP id
 k8mr11370158wmo.35.1624268574903; 
 Mon, 21 Jun 2021 02:42:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzycSqVNqhHDHhYKHIa9xsj8EXYEdEjf0fGHV+W+uTKK+HSOzknJS3Uo2z5ULlJ4CWU7DS9hw==
X-Received: by 2002:a05:600c:4788:: with SMTP id
 k8mr11370136wmo.35.1624268574736; 
 Mon, 21 Jun 2021 02:42:54 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id w9sm11396258wru.3.2021.06.21.02.42.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Jun 2021 02:42:54 -0700 (PDT)
Subject: Re: [PATCH] x86: add SEV hashing to fw_cfg for kernel/initrd/cmdline
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
To: Thomas Huth <thuth@redhat.com>, Dov Murik <dovmurik@linux.ibm.com>,
 James Bottomley <jejb@linux.ibm.com>, Connor Kuehl <ckuehl@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20210525065931.1628554-1-dovmurik@linux.ibm.com>
 <20210615152033.czhsaz44yxtc5ext@habkost.net>
 <1cff8347-ee38-a0a8-f089-36b28a40b828@redhat.com>
 <06b28ac7-19ed-edd8-a555-2858e976d964@linux.ibm.com>
 <649abfe3-e799-3535-c56a-ad55ca5df947@redhat.com>
 <29a0541d-64f2-1c55-ccf2-776d41f09c95@redhat.com>
 <081fe816-da9d-2df3-de46-34d3235eee40@redhat.com>
Message-ID: <62144060-00b6-a622-7f62-a2f3f2edeecc@redhat.com>
Date: Mon, 21 Jun 2021 11:42:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <081fe816-da9d-2df3-de46-34d3235eee40@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.299,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: Tom Lendacky <thomas.lendacky@amd.com>, Ashish Kalra <ashish.kalra@amd.com>,
 Brijesh Singh <brijesh.singh@amd.com>, Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Tobin Feldman-Fitzthum <tobin@ibm.com>, qemu-devel@nongnu.org,
 Hubertus Franke <frankeh@us.ibm.com>, Jim Cadden <jcadden@ibm.com>,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>, Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/21/21 11:15 AM, Philippe Mathieu-Daudé wrote:
> On 6/21/21 10:44 AM, Thomas Huth wrote:
>> On 17/06/2021 17.48, Philippe Mathieu-Daudé wrote:
>> [...]
>>> This works, but I'd rather use:
>>>
>>>    if (sev_enabled()) {
>>>        sev_kernel_loader_calc_cmdline_hash(&sev_loader_context,
>>>                                            kernel_cmdline);
>>>    }
>>>
>>> And have sev_enabled() defined as:
>>>
>>> #ifdef CONFIG_SEV
>>> bool sev_enabled(void);
>>> #else
>>> #define sev_enabled() false
>>> #endif
>>>
>>> So the compiler could elide the statement if SEV is disabled,
>>> and stub is not necessary.
>>>
>>> But that means we'd need to add "#include CONFIG_DEVICES" in
>>> a sysemu/ header, which looks like an anti-pattern.
>>>
>>> Thomas / Paolo, what do you think?
>>
>> I'd only do that if you are very, very sure that the header file is 
>> only included from target-specific files. Otherwise this will of course
>> cause more trouble than benefit.

Back to Paolo, I think the problem is we started to use target-specific
features in Kconfig, which was designed for devices (not
target-specific). We have the same problem (another thread) with the
semihosting architectural feature.

> Hmm it could be clearer to rearrange the target-specific sysemu/
> headers. For this example, eventually sysemu/i386/sev.h?
> 
> Phil.
> 


