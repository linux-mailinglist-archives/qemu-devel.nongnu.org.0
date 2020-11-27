Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE74B2C6B89
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 19:26:07 +0100 (CET)
Received: from localhost ([::1]:51430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiiRa-0005av-Pp
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 13:26:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kiiQE-0004yz-Bo
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 13:24:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20124)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kiiQ8-0005J8-TY
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 13:24:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606501476;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MZ622bP71Rj2E8/lydcxCKwX9Gi7IyvknCEZpqFabi8=;
 b=e0CSaYDaUlAwtXhzVhCJR6GDKAZPjZwU/oerb0hSrBqQr0ailzxLeOTcUE+Kn0iQYOwa77
 CatqxIoJrRyJ3qJu5h2vkX8ZK+dLYvbuazK73Ob5E/lKW1KXCPAQ9zx8i7lINKLK/x4v4Y
 7JTuxitv2ArTzlJCsMp2anxu5zwVVcI=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-403-GBeJmwbWMKKPflYZSCE_Fg-1; Fri, 27 Nov 2020 13:24:34 -0500
X-MC-Unique: GBeJmwbWMKKPflYZSCE_Fg-1
Received: by mail-wr1-f69.google.com with SMTP id b5so3786054wrp.3
 for <qemu-devel@nongnu.org>; Fri, 27 Nov 2020 10:24:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MZ622bP71Rj2E8/lydcxCKwX9Gi7IyvknCEZpqFabi8=;
 b=t7qzrAWtELc/idqyk37cQZHV+47wqlanqGL5z80PQFZrFvStuLRmRGI3Kchl5jDjD9
 d9OLJBnXvyb91C+cEHJQxMNrSsssHmpvSBfAQp1i13gSzRfR53YOGiJhG9VjrgPjtDLK
 tQGmV1vfZodF9xF5ekdVZs7RT/lj+WbB18tfUuorqU6v+Y0C4Gyk6Ws8lirw4GIsR/bV
 5UnKIK4UAgeN4s6cgvxb8aCgKpMtINFPRRKtRWrpq89pboMlTaWiAJCeOoR+q+uJpeNk
 IeWDSqyUkBV60anb/QDRdrJ8PpZo7aupLyWHM8V0bBVfK//yG5OCoCPLi7pqL17fAGeA
 U7mQ==
X-Gm-Message-State: AOAM532TIWuSJaZ2EfcyPWFpI8FkLDbQxlclRUeUUvYbhidIcuUtkXCO
 amMv+yltkxOnemoapAId6R4ZloAkFsP1HrkSRsNFIoJFsFmckyGed7XP/spJdCtV7qVAS4FeaDP
 /lRazhceDldk+gbc=
X-Received: by 2002:a1c:ba56:: with SMTP id k83mr3914808wmf.128.1606501472976; 
 Fri, 27 Nov 2020 10:24:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwsQvqzC5PEmiJTFYTiQo66+GZhqww/W/8PJb+r6pnq0cQbu0wQcT5Mih6HED76Q1MT3G37UA==
X-Received: by 2002:a1c:ba56:: with SMTP id k83mr3914777wmf.128.1606501472657; 
 Fri, 27 Nov 2020 10:24:32 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id d13sm17924002wrb.39.2020.11.27.10.24.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Nov 2020 10:24:31 -0800 (PST)
Subject: Re: [PATCH] gitlab-CI: Test 32-bit builds with the fedora-i386-cross
 container
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
References: <20201127181025.472458-1-thuth@redhat.com>
 <00693af0-4d49-8e8a-65d8-64c0ad34c756@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <1f5f8aa9-8525-adb3-04ef-d002f16b1dbe@redhat.com>
Date: Fri, 27 Nov 2020 19:24:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <00693af0-4d49-8e8a-65d8-64c0ad34c756@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: alex.williamson@redhat.com, "Daniel P. Berrange" <berrange@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 27/11/20 19:15, Thomas Huth wrote:
> On 27/11/2020 19.10, Thomas Huth wrote:
>> After adding some missing packages, it's possible to check 32-bit
>> builds and tests with the fedora-i386-cross container in the gitlab-CI,
>> too.
>>
>> While we're at it, update it to Fedora 31. Unfortunately the gcc
>> from the later versions emits some very dubious format-truncation
>> warnings, so Fedora 32 and 33 are currently unsuitable for this job.
>>
>> I also had to remove the gnutls-devel package since linking then
>> failed due to its dependency libtasn1 not being recognized (even
>> if I explicitely installed it into the container).
> 
> In case anybody is interested, the failure can be seen here:
> 
>   https://gitlab.com/huth/qemu/-/jobs/876977206#L4799
> 
> ... which is very strange, since in line 259, meson claimed to have found
> libtasn1 ... anybody got an idea what's going wrong here?

You didn't install libtasn1-devel.i686.  So it looks like pkg-config 
could find an (x86_64) tasn1.pc was found, but neither of 
/usr/lib/libtasn1.{a,so} exists.

In general this points out an issue with the setup, in that pkg-config 
falls back to /usr/lib64/pkg-config.  Looking at the man page, it seems 
like you have to specify PKG_CONFIG_LIBDIR instead of PKG_CONFIG_PATH.

Paolo


