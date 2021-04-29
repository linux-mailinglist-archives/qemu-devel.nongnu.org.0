Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BCBA36ED45
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 17:18:47 +0200 (CEST)
Received: from localhost ([::1]:45780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lc8RB-0007sj-TF
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 11:18:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lc8ON-00072s-IL
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 11:15:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35612)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lc8OK-0007rf-Kc
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 11:15:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619709347;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yWpYqOP8M/byLYaSt5vf0TcEwP2jkO1hy+10aaoWSWI=;
 b=Gwu02iZo1K/P7hRV3IniL80MhDoVozuUf+vIEx4eXRXXnZ74+fnOWZsBTW128D9jPgG6H3
 HZ08xvkkz8k6aFK87oQ/VwdaZtopcp1UH0gSXX7GeVSLNXTiYrjZJ2fVF2mX0vNUzYvvqg
 +HLMB5ueFVjcIt0nMn+ip9G4eGqCRMY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-91-zfRvmht1NEqGEWsy4dkDSg-1; Thu, 29 Apr 2021 11:15:44 -0400
X-MC-Unique: zfRvmht1NEqGEWsy4dkDSg-1
Received: by mail-wm1-f70.google.com with SMTP id
 v2-20020a7bcb420000b0290146b609814dso261286wmj.0
 for <qemu-devel@nongnu.org>; Thu, 29 Apr 2021 08:15:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yWpYqOP8M/byLYaSt5vf0TcEwP2jkO1hy+10aaoWSWI=;
 b=RDaq/MPPg1tzotexeZ9UYWjEPSpiLNNiWVh+clIIb0pDf9OZYHdz1o/ENPIG29p1up
 kbze8LNvrp9Am6/SOFm9l+mvlcCpYSUAyZ3eomaEDLdHvrr+++ZB43iELuyS1oVxo3uN
 CPi+ymKZytZRQWjmcf65rGQweWPcdOT81nCgoiLD04f4eyT7gcGSw7gRq+z046PLja2V
 tMQ9Ufn/4CjyCVZj05NceHEjnltBQLPZ2GBqQ8uddoymmbjj4PIi0uMr/+9CmI8a568V
 j4YzL9QjDIXH22RjZlwwp5OcqFv/khP26Pj+9RVbB2bu6d3F2vccro+04B85ApGnni6F
 FldA==
X-Gm-Message-State: AOAM531ECbDYY86Eys+oIYbbdrkVgRZc5xulzYvQYLRQu5yrvIkCnR+p
 jFE4qBWxHc+Jum3rP+b/CS5NfNPUPWzrWFd0H5ARDpze/QPziH80sqxRq43w63kUDgFgoc/81dK
 tL4vplq0CQo0nt7E=
X-Received: by 2002:adf:b307:: with SMTP id j7mr271259wrd.351.1619709342992;
 Thu, 29 Apr 2021 08:15:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzMgfZCyiu3kGGv41unMeLnTgj3JEEgSdNTO5Vo7LJzQBA7RnTESw8zmoBShQt644FP2LnYow==
X-Received: by 2002:adf:b307:: with SMTP id j7mr271224wrd.351.1619709342792;
 Thu, 29 Apr 2021 08:15:42 -0700 (PDT)
Received: from [192.168.1.19] (anancy-651-1-208-144.w109-217.abo.wanadoo.fr.
 [109.217.237.144])
 by smtp.gmail.com with ESMTPSA id q4sm4966578wrs.21.2021.04.29.08.15.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Apr 2021 08:15:42 -0700 (PDT)
Subject: Re: [PATCH v2 1/2] meson: Select 'have_system' when virtiofsd is
 enabled
To: Connor Kuehl <ckuehl@redhat.com>, qemu-devel@nongnu.org,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
References: <20210429083346.61030-1-philmd@redhat.com>
 <20210429083346.61030-2-philmd@redhat.com>
 <4823bd07-2b96-5503-7959-853fc61372ef@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <2656ae7e-248d-90e3-a1ae-b13a78226ad0@redhat.com>
Date: Thu, 29 Apr 2021 17:15:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <4823bd07-2b96-5503-7959-853fc61372ef@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Mahmoud Mandour <ma.mandourr@gmail.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/29/21 3:50 PM, Connor Kuehl wrote:
> On 4/29/21 3:33 AM, Philippe Mathieu-Daudé wrote:
>> When not explicitly select a sysemu target and building virtiofsd,
>> the seccomp/cap-ng libraries are not resolved, leading to this error:
>>
>>   $ configure --target-list=i386-linux-user --disable-tools --enable-virtiofsd
>>   tools/meson.build:12:6: ERROR: Problem encountered: virtiofsd requires libcap-ng-devel and seccomp-devel
>>
>> Fix by enabling sysemu (have_system) when virtiofsd is built.
>>
>> Reported-by: Mahmoud Mandour <ma.mandourr@gmail.com>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>  meson.build | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/meson.build b/meson.build
>> index c6f4b0cf5e8..f858935ad95 100644
>> --- a/meson.build
>> +++ b/meson.build
>> @@ -51,6 +51,8 @@
>>    have_system = have_system or target.endswith('-softmmu')
>>  endforeach
>>  have_tools = 'CONFIG_TOOLS' in config_host
>> +# virtiofsd depends on sysemu
>> +have_system = have_system or not get_option('virtiofsd').disabled()
> 
> I don't think we should satisfy virtiofsd dependencies transiently by
> depending on system emulation targets.
> 
> It's my understanding (and I'm happy to be corrected on this) that the
> virtiofsd binary is orthogonal to system emulation tools. Consider a
> situation in which someone wants to develop virtiofsd but doesn't want
> to wait for the rest of QEMU to build and instead use their own
> qemu-system-x86_64 installed by their distro.

This is what I understood in your previous thread with Mahmoud.

Peter questioned this orthogonality in v1, asking why virtiofsd is
in the QEMU repository then...

> Connor
> 
>>  have_block = have_system or have_tools
>>  
>>  python = import('python').find_installation()
>>
> 


