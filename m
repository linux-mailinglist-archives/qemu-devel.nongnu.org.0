Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3554F36E81F
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 11:42:48 +0200 (CEST)
Received: from localhost ([::1]:50726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lc3C3-00060F-Ad
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 05:42:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lc3Ad-0005X5-MO
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 05:41:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43512)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lc3AU-0000Li-RY
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 05:41:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619689269;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Gd7T+NTg3ibJHJWqFhb/4RRAg87ghEqc0r7n/8HkKXk=;
 b=Yo5FqVG0xiwb4TNLZ8/fww48QsvmWnMzNXwwS+MFVGeEydWGWsbJmI/nja1wBrFPlbEUPk
 MjolmwM3y5ysnunq63a7MiYUAQNswGlbqzH7UJicHdIWO4eE4oDNurv5aUEzSei84SFFSE
 DGQRmcHPUxGKA/v0oF7QGt/+mIjdSMY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-115-ph2eefTMPyeND2Q59Gx5Zg-1; Thu, 29 Apr 2021 05:41:08 -0400
X-MC-Unique: ph2eefTMPyeND2Q59Gx5Zg-1
Received: by mail-wm1-f72.google.com with SMTP id
 j128-20020a1c55860000b02901384b712094so5843465wmb.2
 for <qemu-devel@nongnu.org>; Thu, 29 Apr 2021 02:41:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Gd7T+NTg3ibJHJWqFhb/4RRAg87ghEqc0r7n/8HkKXk=;
 b=EBqy3QSxjbBjAe+O8oIF3Tpeks5vWS1N5Gm85OtSReJ5UZfBU2spLZKMEuLAflyf4t
 1G6RrRTK9lbQamnr+MiIx8a13we3LrPoi6mUVff1sk+4oH8LyjQp8aQC1c4Q8dyx75VL
 Sv9cqCgiGQszk4QNhqW9UaUYALkN2uDAANmyOyJ+93zn4E0mXryfweisq70aMy/a4z8w
 IxlKtrxsoVMiM+5dOYZW92kppKJUrBJc+ytav7Z7eC72DIc/me0hz7GU/ge6LKUrCMoP
 7zKe1CAdzb+dcjgO5jdEgwqY/DVHsgOb0766zTRVkWY+mhi7bsxM4kaDtoHsZtvwcIoP
 7eEA==
X-Gm-Message-State: AOAM533zfOWgNyTIkAE4Fcb8GS0HHkxFFj2sXt09r8I1a1DCVuaaoS0o
 3Os9kU78r+87fhuFmZSMYDyBuf2nx3i3QUDRec9ZzJDOeUBOnlOn2b7DjcQcjsIi7k3gTfzHO7W
 j3/EO9bmpX2zQqWM=
X-Received: by 2002:a5d:6c6e:: with SMTP id r14mr41845279wrz.403.1619689265795; 
 Thu, 29 Apr 2021 02:41:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw7AVqZ2vHIr8def0gM74759pABqzCqjHpybWM69BHbkdfSUNaXCOhGyJDpZLzPafKK/vwHWg==
X-Received: by 2002:a5d:6c6e:: with SMTP id r14mr41845243wrz.403.1619689265557; 
 Thu, 29 Apr 2021 02:41:05 -0700 (PDT)
Received: from [192.168.1.19] (anancy-651-1-208-144.w109-217.abo.wanadoo.fr.
 [109.217.237.144])
 by smtp.gmail.com with ESMTPSA id f25sm4354505wrd.67.2021.04.29.02.41.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Apr 2021 02:41:05 -0700 (PDT)
Subject: Re: [PATCH v2 2/2] gitlab-ci: Add a job to build virtiofsd standalone
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20210429083346.61030-1-philmd@redhat.com>
 <20210429083346.61030-3-philmd@redhat.com> <YIpxy4jSazVrYFJ9@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <ec32c324-5c6b-efb2-3dc9-16f2b2d5f588@redhat.com>
Date: Thu, 29 Apr 2021 11:41:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YIpxy4jSazVrYFJ9@redhat.com>
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
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/29/21 10:43 AM, Daniel P. Berrangé wrote:
> On Thu, Apr 29, 2021 at 10:33:46AM +0200, Philippe Mathieu-Daudé wrote:
>> Add a job which builds virtiofsd without any emulation or tool.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>> https://gitlab.com/philmd/qemu/-/jobs/1222007991
>> Duration: 7 minutes 48 seconds
>> ---
>>  .gitlab-ci.yml | 13 +++++++++++++
>>  1 file changed, 13 insertions(+)
>>
>> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
>> index 52d65d6c04f..ba3c7ade6ca 100644
>> --- a/.gitlab-ci.yml
>> +++ b/.gitlab-ci.yml
>> @@ -800,6 +800,19 @@ build-libvhost-user:
>>      - meson
>>      - ninja
>>  
>> +build-virtiofsd-fedora:
>> +  <<: *native_build_job_definition
>> +  needs:
>> +    job: amd64-fedora-container
>> +  variables:
>> +    IMAGE: fedora
>> +    CONFIGURE_ARGS: --enable-virtiofsd
>> +        --disable-system --disable-user --disable-tools --disable-docs
>> +  artifacts:
>> +    expire_in: 2 days
>> +    paths:
>> +      - build/tools/virtiofsd/virtiofsd
> 
> I'm not convinced that this job is justiable given our need to keep
> the total CI pipeline size constrained. The precedent this sets is
> that we need to test every configure args combination for each binary
> we build. That is not scalable as a pattern. Neither this virtiofsd
> arg scenario, nor others is going to be commonly used by downstream
> consumers of QEMU, so the payoff from having this job is also small.

I'm not sure "our current pipelines is too busy because we don't have
a clear idea what is tested and what is duplicated" justifies no more
tests can be added, but it is a effective way to have the current set
cleaned.

Anyhow, if mainstream isn't interested by this configuration, it could
be added to the virtio-fs/qemu fork. Alternatively mainstream with:

  only:
    variables:
      - $CI_PROJECT_NAMESPACE == 'virtio-fs'


