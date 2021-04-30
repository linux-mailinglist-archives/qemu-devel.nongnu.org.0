Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE86F36F69C
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 09:47:26 +0200 (CEST)
Received: from localhost ([::1]:54144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcNry-0008LP-10
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 03:47:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lcNqO-0007qR-Eb
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 03:45:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39016)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lcNqM-0002qP-Qy
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 03:45:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619768745;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EXeKct3iYHgge/nnA64fCRSSOPPdyaCNLJW05W7iDSU=;
 b=g3szI4tvWC34ARsMjTR+Lv7m8zee+iXC2cYFSfy/xSkIoposVCB+HJmPZ/VcFBEvpeCSpJ
 x8Wrv3f477GquLPxMii/l+jy9O2UauX4kpgept+m2fLR6+kAwU3T1CRpzOz6MOeAcDicLD
 dOqdaqklwZtITLGeVV9Zazr0dF4Zero=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-194-K51zKiXVORaDA1cs71Nv9g-1; Fri, 30 Apr 2021 03:45:38 -0400
X-MC-Unique: K51zKiXVORaDA1cs71Nv9g-1
Received: by mail-ed1-f72.google.com with SMTP id
 v5-20020a0564023485b029037ff13253bcso29875311edc.3
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 00:45:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=EXeKct3iYHgge/nnA64fCRSSOPPdyaCNLJW05W7iDSU=;
 b=lpegNUOEHkqVVAKO5D9G4kxu2pyDjyOhH0R7l1aCcJb7jYw1rGSZPl4O2HB90xlJ4o
 dexPlekd5KomsDbjojXTlk8O5BRAQc8XYy7n4miVr5RI5UIFpnx60yUN94pLBnf+NXuO
 Fscp2gcOMX8fi3+v52VTPp00Q3W2xpgxxD+pbW3Ax477VAYIAxv5EqJQQBBWa0WKrbkk
 tYyzT6l3sKgwOC0tBOW+Fko6/mtkVhd4SnZtmCRXtyybz5IiF7LcL3TxVjbIXZe9ehRi
 L8MT444g2NQ58ISNStIxAlhiNtbwVQElNSKXdQqWg8pk1eUDtK3ysPVBtPEXyBV8gUKz
 QVag==
X-Gm-Message-State: AOAM532QccxWM1zNWGx52X2tAhUGcCPu/j5EOI5x11a7R2QpvcC+gwU3
 /nWV1UZToMD+Jgbg+PG9pvJClwMMhKtl/3F1ISDV4AUtQGlii3+EYIGW1x1AGIeZnVr4ih2pXE2
 k8/5WMMGWSKwyHbI=
X-Received: by 2002:a17:906:1c83:: with SMTP id
 g3mr2818892ejh.93.1619768737244; 
 Fri, 30 Apr 2021 00:45:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw+vt2uMXan7D9IP/ES4r6sdvYu/LeHCMuIA3DC6hbqrWD8GkvASlLpc1aaQEc1CiQUvwhX1A==
X-Received: by 2002:a17:906:1c83:: with SMTP id
 g3mr2818858ejh.93.1619768736939; 
 Fri, 30 Apr 2021 00:45:36 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id p2sm1401110ejo.108.2021.04.30.00.45.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Apr 2021 00:45:36 -0700 (PDT)
Subject: Re: [PATCH v2 1/2] meson: Select 'have_system' when virtiofsd is
 enabled
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
References: <20210429083346.61030-1-philmd@redhat.com>
 <20210429083346.61030-2-philmd@redhat.com>
 <CAFEAcA-ROOwxAg5oF3hK=Qh-mBcyp3d=sb4pNuxG1ZBNLruEig@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <743ac449-06c1-1e0e-3e9f-5e367c593a47@redhat.com>
Date: Fri, 30 Apr 2021 09:45:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-ROOwxAg5oF3hK=Qh-mBcyp3d=sb4pNuxG1ZBNLruEig@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
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
Cc: Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 29/04/21 10:44, Peter Maydell wrote:
> On Thu, 29 Apr 2021 at 09:33, Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
>>
>> When not explicitly select a sysemu target and building virtiofsd,
>> the seccomp/cap-ng libraries are not resolved, leading to this error:
>>
>>    $ configure --target-list=i386-linux-user --disable-tools --enable-virtiofsd
>>    tools/meson.build:12:6: ERROR: Problem encountered: virtiofsd requires libcap-ng-devel and seccomp-devel
>>
>> Fix by enabling sysemu (have_system) when virtiofsd is built.
>>
>> Reported-by: Mahmoud Mandour <ma.mandourr@gmail.com>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>   meson.build | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/meson.build b/meson.build
>> index c6f4b0cf5e8..f858935ad95 100644
>> --- a/meson.build
>> +++ b/meson.build
>> @@ -51,6 +51,8 @@
>>     have_system = have_system or target.endswith('-softmmu')
>>   endforeach
>>   have_tools = 'CONFIG_TOOLS' in config_host
>> +# virtiofsd depends on sysemu
>> +have_system = have_system or not get_option('virtiofsd').disabled()
> 
> This looks odd. The natural assumption is that "have_system" ought to mean
> "we are building a system emulator", not "we are building a system emulator
> or virtiofsd".

I agree this is a bit jarring.

If virtiofsd requires libcap-ng-devel and seccomp-devel, those tests 
only should use

   have_system or not get_option('virtiofsd').disabled()

instead of just have_system.  (The reason why we have those complicated 
expressions is to avoid getting warnings on static builds, for libraries 
that are only available as shared libraries.  There are plans to make it 
look a bit nicer in upstream Meson which the maintainers have already 
accepted; however, I haven't been able to contribute much to it lately).

Thanks,

Paolo


