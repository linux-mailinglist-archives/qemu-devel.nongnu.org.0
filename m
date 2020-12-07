Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 500172D0E2A
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 11:39:56 +0100 (CET)
Received: from localhost ([::1]:33406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmDvv-0002Az-EO
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 05:39:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kmDtL-0001Ed-Dt
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 05:37:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:37555)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kmDtG-0007Za-R0
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 05:37:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607337430;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+MUpNM1ZaTlO4T3gwbQyUi+bhaJnWEMg2E4uaX6U69A=;
 b=MCLjHeHGavNg07I8a8SyRx0C8gPQX8fZmiDsXuF3OYMUILrOiG2kH4m5tkJX5OfhCsuEJE
 oo9ZcvDwz+0jYqQocdCUbIlDBJWVpha3IQgRfluVM/gWXIxqoH24meDqzSBSaQbwbjyAym
 1TvAZfKdSVIJvIVf/mYiOml8o9tKpBk=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-368-E-yDZF07PC-HAaCiVP-dAA-1; Mon, 07 Dec 2020 05:37:09 -0500
X-MC-Unique: E-yDZF07PC-HAaCiVP-dAA-1
Received: by mail-wr1-f72.google.com with SMTP id y5so703764wrs.15
 for <qemu-devel@nongnu.org>; Mon, 07 Dec 2020 02:37:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+MUpNM1ZaTlO4T3gwbQyUi+bhaJnWEMg2E4uaX6U69A=;
 b=JurOZ7hLGURqdQ+rn8Io87RNR7bPZVXEQmF5i74pp5qv8dplhbO+41k90r8Jol6XoO
 P91V9IpM76ozarpvhNVCcM+isZhBbNHYMrUJH/XyAKib6X52O8bmFctDxEWEB4iwGfRp
 5ApbXfg/HRiSfPJqeksn3CyXcIMyHbTDQs4tJfXSstu4sSdBs2PVRdroPhQPgmAkKtmr
 zc4+g8w7tb+ZmYr4OltS+41UBOHPx+bJ3JRTAMJDQSCKgaDQu96TrhtkIuFNlN81oCGl
 wqpjAkPNiPNN8TXvAdQVm48YjRykpcaiPNPYji1oMcK31nlMJ7SYT0/b6pizlxZuyJlt
 LAig==
X-Gm-Message-State: AOAM533e4vC7Y6nS4mNFHH2pUvvKd2WGDK+i7xnMYl3y8uRHvhPnHNjP
 vxzI8Q2hKBtpVjPyrMVpTPiE+RvzbLQPzhdgTplbgZ8ajEjrnGxZ+48IoGjnXQQY1N1GY7GNlLJ
 L773U3IW8qPoNCoc=
X-Received: by 2002:a05:600c:2:: with SMTP id
 g2mr17382129wmc.156.1607337426694; 
 Mon, 07 Dec 2020 02:37:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwwRtV73QFCV2ROpZ9fzFZtsHpDjPVdEFc+3zGnA5/nvOZAdgvHLzYUDyvlwzcMdbtuT+HBXg==
X-Received: by 2002:a05:600c:2:: with SMTP id
 g2mr17382089wmc.156.1607337426480; 
 Mon, 07 Dec 2020 02:37:06 -0800 (PST)
Received: from [192.168.1.36] (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id z140sm14292218wmc.30.2020.12.07.02.37.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Dec 2020 02:37:05 -0800 (PST)
Subject: Re: [PATCH 5/8] gitlab-ci: Add KVM s390x cross-build jobs
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20201206185508.3545711-1-philmd@redhat.com>
 <20201206185508.3545711-6-philmd@redhat.com>
 <66d4d0ab-2bb5-1284-b08a-43c6c30f30dc@redhat.com>
 <2352c04c-829e-ea1d-0894-15fc1d06697a@redhat.com>
 <cd5d00b1-999a-fbb3-204e-a759a9e2c3ec@redhat.com>
 <0447129c-e6c9-71f6-1786-b4e8689b8214@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <b0ea4a2f-c79e-9d8f-86a5-eb6f53bf5067@redhat.com>
Date: Mon, 7 Dec 2020 11:37:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <0447129c-e6c9-71f6-1786-b4e8689b8214@redhat.com>
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

On 12/7/20 11:33 AM, Thomas Huth wrote:
> On 07/12/2020 11.26, Philippe Mathieu-Daudé wrote:
>> On 12/7/20 11:00 AM, Philippe Mathieu-Daudé wrote:
>>> On 12/7/20 6:46 AM, Thomas Huth wrote:
>>>> On 06/12/2020 19.55, Philippe Mathieu-Daudé wrote:
>>>>> Cross-build s390x target with only KVM accelerator enabled.
>>>>>
>>>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>>>>> ---
>>>>>  .gitlab-ci.d/crossbuilds-kvm-s390x.yml | 6 ++++++
>>>>>  .gitlab-ci.yml                         | 1 +
>>>>>  MAINTAINERS                            | 1 +
>>>>>  3 files changed, 8 insertions(+)
>>>>>  create mode 100644 .gitlab-ci.d/crossbuilds-kvm-s390x.yml
>>>>>
>>>>> diff --git a/.gitlab-ci.d/crossbuilds-kvm-s390x.yml b/.gitlab-ci.d/crossbuilds-kvm-s390x.yml
>>>>> new file mode 100644
>>>>> index 00000000000..1731af62056
>>>>> --- /dev/null
>>>>> +++ b/.gitlab-ci.d/crossbuilds-kvm-s390x.yml
>>>>> @@ -0,0 +1,6 @@
>>>>> +cross-s390x-kvm:
>>>>> +  extends: .cross_accel_build_job
>>>>> +  variables:
>>>>> +    IMAGE: debian-s390x-cross
>>>>> +    TARGETS: s390x-softmmu
>>>>> +    ACCEL_CONFIGURE_OPTS: --disable-tcg
>>>>> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
>>>>> index 573afceb3c7..a69619d7319 100644
>>>>> --- a/.gitlab-ci.yml
>>>>> +++ b/.gitlab-ci.yml
>>>>> @@ -14,6 +14,7 @@ include:
>>>>>    - local: '/.gitlab-ci.d/crossbuilds.yml'
>>>>>    - local: '/.gitlab-ci.d/crossbuilds-kvm-x86.yml'
>>>>>    - local: '/.gitlab-ci.d/crossbuilds-kvm-arm.yml'
>>>>> +  - local: '/.gitlab-ci.d/crossbuilds-kvm-s390x.yml'
>>>>
>>>> KVM code is already covered by the "cross-s390x-system" job, but an
>>>> additional compilation test with --disable-tcg makes sense here. I'd then
>>>> rather name it "cross-s390x-no-tcg" or so instead of "cross-s390x-kvm".
>>
>> What other accelerators are available on 390?
> 
> It's only TCG and KVM.

Easy, so no-tcg = kvm :)


