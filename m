Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 763A7495FB4
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 14:22:12 +0100 (CET)
Received: from localhost ([::1]:41798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAtrm-0001vi-4E
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 08:22:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nAtHL-0004Iq-Pr
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 07:44:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21789)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nAtHE-0003ZW-IS
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 07:44:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642768899;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hFpNleXr0FopXUJb7/osiPv4R+qxHHj0k5Uqnne3qBw=;
 b=h2sSliy3ygbE+fYcJZgoZ5FW1uv6CBAn2MnV3dDCDKm94Ni+74bwuiZfXgW860qQ9pIqL3
 OT3vUSGTb0TrBoyhQqS1kazTdvpASlj2k8NjaZupgE6umIPr8BFNi7mSr0qUSeSJoT+SLC
 4pcbQJX86Wjm1wITrhLF4Xjs3n01XX0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-600-JvWpL3a6OceBZkAawH0i4A-1; Fri, 21 Jan 2022 07:41:36 -0500
X-MC-Unique: JvWpL3a6OceBZkAawH0i4A-1
Received: by mail-wm1-f72.google.com with SMTP id
 s190-20020a1ca9c7000000b00347c6c39d9aso6222744wme.5
 for <qemu-devel@nongnu.org>; Fri, 21 Jan 2022 04:41:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=hFpNleXr0FopXUJb7/osiPv4R+qxHHj0k5Uqnne3qBw=;
 b=u9cAC7/c+ipt6vZkcyThhGRSFB2RMgB23Pp5+hlU2974YuC6lKr0cpLt3tQ6iQgIG6
 owqHttKE39usYujIeyYC6ii4GelOdkqyaqpLX4W6zFJ3iBQCzZygenWVKmxfmhvxcYP7
 L/oFzow6Bj1aKrpiqWSVGD6o9bFIjo7dz1OxaCebTLl2/iyKg/BCeIH+Le5yoHkMkjBe
 QeA4Z1IaHDOJmM5wcPmvUz5jaqvroZdfLvvpPtSoKEsR59x4P4FqCrtHroPsHo0/gzk4
 fiNh4bRhVrX4IRiZRwurMRs6pPiO5+QlxhDUAHA89338x7P1jRO3o/OPrAzL9qQC1uDi
 f/Dw==
X-Gm-Message-State: AOAM5324FXOqLbxtTlRNUtE/jos8CiOHDO5F/Y9GNvlZlj7A1waLmKqD
 +NYip+Q/lV9FkB0BKobfP4mLqT3wBWIQybHAiKpFvBjG+tifNvfoM+PCQwap2dOFWzbXU63qmY9
 37p+DsW7TNuseqAo=
X-Received: by 2002:adf:e199:: with SMTP id az25mr3577512wrb.72.1642768895261; 
 Fri, 21 Jan 2022 04:41:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwkl+An27Zg7UH/Ro/2CnQK3Ns7vmTJ2F2HBig7W//cc2nvVCIJl6Ybf/a7KHv5JFYsEppcoA==
X-Received: by 2002:adf:e199:: with SMTP id az25mr3577489wrb.72.1642768895050; 
 Fri, 21 Jan 2022 04:41:35 -0800 (PST)
Received: from [10.33.192.183] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id p17sm5169492wrf.112.2022.01.21.04.41.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Jan 2022 04:41:34 -0800 (PST)
Message-ID: <40cf6bd8-6d0a-055c-ba30-18169f33d4c6@redhat.com>
Date: Fri, 21 Jan 2022 13:41:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: "make check-acceptance" takes way too long
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
References: <CAFEAcA9cMZoj18gq7Ksv5PRoU1wRmXvW_e9UE73C_MEB7wTroQ@mail.gmail.com>
 <CAFEAcA9_d5jw5-HOrZA6dsG1vMqxzqmrfHA7Jo0KsDcaEXmB_Q@mail.gmail.com>
 <6c90ca3d-eaec-d7e8-5941-4deb83b58fd0@redhat.com>
 <87zgnp4b32.fsf@dusky.pond.sub.org>
 <CAFEAcA_kxrCgyxWPFLw6VZ-rKx-res0C8L2BWRvfB81cR+keLg@mail.gmail.com>
 <875yqd6zib.fsf@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <875yqd6zib.fsf@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21/01/2022 13.23, Alex Bennée wrote:
> 
> Peter Maydell <peter.maydell@linaro.org> writes:
> 
>> On Fri, 21 Jan 2022 at 10:50, Markus Armbruster <armbru@redhat.com> wrote:
>>> No objection, but it's no replacement for looking into why these tests
>>> are so slow.
>>>
>>> The #1 reason for things being slow is not giving a damn :)
>>
>> See previous messages in the thread -- the test starts a
>> full-fat guest OS including UEFI boot, and it takes forever to
>> get to the login prompt because systemd is starting everything
>> including the kitchen sink.
> 
> There has to be a half-way house between booting a kernel until it fails
> to find a rootfs and running a full Ubuntu distro. Maybe just asking
> systemd to reach "rescue.target" would be enough to show the disks are
> up and userspace works.

In case it helps: We're already doing that in 
tests/avocado/machine_s390_ccw_virtio.py : For the Debian kernel, booting 
with BOOT_DEBUG=3 worked out pretty well, and for the Fedora kernel 
"rd.rescue" did the job. Also unpacking the Fedora ramdisk on the host 
proved to be quite faster than letting the guest unpacking the ramdisk on 
its own.

  Thomas


