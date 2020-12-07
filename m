Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32B752D0E00
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 11:29:12 +0100 (CET)
Received: from localhost ([::1]:42306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmDlX-000265-2G
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 05:29:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kmDij-0000iB-K4
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 05:26:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:26444)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kmDid-00046p-Kl
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 05:26:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607336771;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J/MxqDMH4iax6gZAnLZgFNJcpANG56pQVPbXFBf8CsE=;
 b=dWdIv/k+RPbIpCSP6fBE6juwGj6QdjtqjiQ6Uo/dRVMIMPXS7ohf7TZ8AMx6hC6QZ98TeT
 1EDws7etsgSl14iMqhLeNtET5DpSv9bkDWhNXjr8fKnf+jWTf87GWVfXkHCxfHmUUsK5G1
 RQPeAEaAHhpOEVGRVdHCtvs9U0ZCF3Q=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-280-wjXdtLDFMO2t3XzZ7rv5_Q-1; Mon, 07 Dec 2020 05:26:09 -0500
X-MC-Unique: wjXdtLDFMO2t3XzZ7rv5_Q-1
Received: by mail-wr1-f71.google.com with SMTP id r8so2501356wro.22
 for <qemu-devel@nongnu.org>; Mon, 07 Dec 2020 02:26:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=J/MxqDMH4iax6gZAnLZgFNJcpANG56pQVPbXFBf8CsE=;
 b=gToj6GChqLFlpsxGZ3F7yRTLnMTcd/ESmPreCm+9KYpPsFRBbhkEqtIWq4RX3cub5z
 KwMb6vgZ7UJ3ulanCXjA8Du44M2g+Z+ikNKF9G6GWz9FmQ5dg9fSRlcOl/mgpBwPy4Rk
 XMqXu+bu/quhQzyDGMS9NKm2f1g7XA35az78C/Flvsk4PoB7hWXV3VGeWWIYrRUmUpCY
 X3IDL6T5Ic2Gr48SHCL6znX0jLiH4IQIAZv5BaJL6DyVotUBuS3Zs5IKHfUuM+Vy/XgU
 4aH9VcHkDBIUdu3FkyOdWVv+16a3OBBPqokuT3R7maQoxCwGZXOsUQuOVwE2qSTpU7Bp
 ZCIA==
X-Gm-Message-State: AOAM5327t/HLxygozZiNH1740YMCSXBmjR8CEE2JxQtvBiX1PT84/Mw8
 gibmZNQY6qVCYJ+jBgIrdAfzSrrX4hoSX59+qam2NfjmEm21MOL7Ua+JBPoxQG4zXqKsTE7KyBu
 sepwX9ulxfFqpX4A=
X-Received: by 2002:adf:f7c7:: with SMTP id a7mr18479922wrq.347.1607336767455; 
 Mon, 07 Dec 2020 02:26:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwhcAghl9OpXDUnMnlNasl3UZRYONq9ISpQW3iUKTZZ4vH7cH2+LswiXSeNsBKrig5E8lZLoA==
X-Received: by 2002:adf:f7c7:: with SMTP id a7mr18479882wrq.347.1607336767232; 
 Mon, 07 Dec 2020 02:26:07 -0800 (PST)
Received: from [192.168.1.36] (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id n189sm13572019wmf.20.2020.12.07.02.26.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Dec 2020 02:26:06 -0800 (PST)
Subject: Re: [PATCH 5/8] gitlab-ci: Add KVM s390x cross-build jobs
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20201206185508.3545711-1-philmd@redhat.com>
 <20201206185508.3545711-6-philmd@redhat.com>
 <66d4d0ab-2bb5-1284-b08a-43c6c30f30dc@redhat.com>
 <2352c04c-829e-ea1d-0894-15fc1d06697a@redhat.com>
Message-ID: <cd5d00b1-999a-fbb3-204e-a759a9e2c3ec@redhat.com>
Date: Mon, 7 Dec 2020 11:26:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <2352c04c-829e-ea1d-0894-15fc1d06697a@redhat.com>
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
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Stefano Stabellini <sstabellini@kernel.org>, kvm@vger.kernel.org,
 Paul Durrant <paul@xen.org>, Cornelia Huck <cohuck@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 Huacai Chen <chenhc@lemote.com>, Anthony Perard <anthony.perard@citrix.com>,
 xen-devel@lists.xenproject.org, David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Claudio Fontana <cfontana@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/7/20 11:00 AM, Philippe Mathieu-Daudé wrote:
> On 12/7/20 6:46 AM, Thomas Huth wrote:
>> On 06/12/2020 19.55, Philippe Mathieu-Daudé wrote:
>>> Cross-build s390x target with only KVM accelerator enabled.
>>>
>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>>> ---
>>>  .gitlab-ci.d/crossbuilds-kvm-s390x.yml | 6 ++++++
>>>  .gitlab-ci.yml                         | 1 +
>>>  MAINTAINERS                            | 1 +
>>>  3 files changed, 8 insertions(+)
>>>  create mode 100644 .gitlab-ci.d/crossbuilds-kvm-s390x.yml
>>>
>>> diff --git a/.gitlab-ci.d/crossbuilds-kvm-s390x.yml b/.gitlab-ci.d/crossbuilds-kvm-s390x.yml
>>> new file mode 100644
>>> index 00000000000..1731af62056
>>> --- /dev/null
>>> +++ b/.gitlab-ci.d/crossbuilds-kvm-s390x.yml
>>> @@ -0,0 +1,6 @@
>>> +cross-s390x-kvm:
>>> +  extends: .cross_accel_build_job
>>> +  variables:
>>> +    IMAGE: debian-s390x-cross
>>> +    TARGETS: s390x-softmmu
>>> +    ACCEL_CONFIGURE_OPTS: --disable-tcg
>>> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
>>> index 573afceb3c7..a69619d7319 100644
>>> --- a/.gitlab-ci.yml
>>> +++ b/.gitlab-ci.yml
>>> @@ -14,6 +14,7 @@ include:
>>>    - local: '/.gitlab-ci.d/crossbuilds.yml'
>>>    - local: '/.gitlab-ci.d/crossbuilds-kvm-x86.yml'
>>>    - local: '/.gitlab-ci.d/crossbuilds-kvm-arm.yml'
>>> +  - local: '/.gitlab-ci.d/crossbuilds-kvm-s390x.yml'
>>
>> KVM code is already covered by the "cross-s390x-system" job, but an
>> additional compilation test with --disable-tcg makes sense here. I'd then
>> rather name it "cross-s390x-no-tcg" or so instead of "cross-s390x-kvm".

What other accelerators are available on 390?

> 
> As you wish. What I want is to let Gitlab users be able to build the
> equivalent "[s390x] Clang (disable-tcg)" from Travis.
> 
> I keep using GCC toolchain because managing job coverage duplication
> is an unresolved problem.
> 
>>
>> And while you're at it, I'd maybe rather name the new file just
>> crossbuilds-s390x.yml and also move the other s390x related jobs into it?
> 
> OK will do.
> 
> Thanks,
> 
> Phil.
> 


