Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED6D92B6C78
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 19:03:20 +0100 (CET)
Received: from localhost ([::1]:56148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kf5K4-0001i8-0l
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 13:03:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kf5II-0000Y6-Vn
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 13:01:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:34724)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kf5IH-0007TX-7v
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 13:01:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605636088;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EK/uKv8Hx6olyTFCaxG6RU/pw15ya+i5KI3rKKSIldM=;
 b=flMmPWE7su7J837Lt7zhoP2hfq64+Wtp4thhqDo/xbcH/Gt9EY5gA/CrPraDfvADJdaDQL
 PwEf2DyXz7FbTDIzEQXZvksJKxNsEtJGfycWtmOJ+ZrmSMxrDp7HQV/0ZVU//Xg6u4BIzD
 KYbIR3e5w7IJGvQ2JpG/d9lSmXj2hmA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-430-zCJvkzjzPmWJCyJhFXYc6w-1; Tue, 17 Nov 2020 13:01:21 -0500
X-MC-Unique: zCJvkzjzPmWJCyJhFXYc6w-1
Received: by mail-wr1-f69.google.com with SMTP id g5so11867024wrp.5
 for <qemu-devel@nongnu.org>; Tue, 17 Nov 2020 10:01:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=EK/uKv8Hx6olyTFCaxG6RU/pw15ya+i5KI3rKKSIldM=;
 b=ifLtWMdCkkHLZqGD9heICR1ew7ajFGpFcT/orJUHtylc4AMz3LKVpfhKZqs3CBl9gn
 vvjX69Fez5TcL9l/WeAzcmhrptFW8hSJz5bfAzJfbYfaIqBmjarAyUPm+G/UMk3NhtU7
 luezwriL6ImuqLJz9TOEf14HCYawk4J5Z6tlSFzDKsMF5j8rOdJFnRorELU/e4EbsBk0
 2HwsSP/gVSwPf3QHvrEj4jHQ4jCT2ijas4WDWwiCJsEbWzXVitPMEHlQ35x5+s60YXtY
 OlqM7aatXeasP8/kv8dJWTVYxWy5RsZ3dac30CdUOeIraX/8eAtrPfhSg7aHROmhtX6A
 4cCg==
X-Gm-Message-State: AOAM532BJd2NYBAAVoNOPFAWE8Jtcvzay0y1zmOgn8nxVtcQ0JHuLqGx
 3gLfn1gJJClLWMS4pOK94Qjw2QS1ieGY89m9hCq6vw9hYs2bVq7RAIN6/CsuFoQkjhUM5QIXmeD
 iV7F9b/kAaIjL54Y=
X-Received: by 2002:adf:ff8e:: with SMTP id j14mr766265wrr.48.1605636080430;
 Tue, 17 Nov 2020 10:01:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxPZKlgsxpoawx9867S/HhqrRA3wfnKAUU4ndvulPwMZnUmWTi5zeE49aUAVtHwqvm71uTQwg==
X-Received: by 2002:adf:ff8e:: with SMTP id j14mr766250wrr.48.1605636080251;
 Tue, 17 Nov 2020 10:01:20 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id i16sm29305255wru.92.2020.11.17.10.01.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Nov 2020 10:01:19 -0800 (PST)
Subject: Re: Regressions in build process introduced since August
To: Stefano Garzarella <sgarzare@redhat.com>, Stefan Weil <sw@weilnetz.de>
References: <97b04446-ca94-cebd-2d8d-4c2013521208@weilnetz.de>
 <20201117175030.eqz5run2m7qmx5qt@steredhat>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <a6c8de1a-da41-1a4a-8907-790c2467a0b0@redhat.com>
Date: Tue, 17 Nov 2020 19:01:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201117175030.eqz5run2m7qmx5qt@steredhat>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 00:41:22
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
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
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17/11/20 18:50, Stefano Garzarella wrote:
> Running `configure [...] --extra-cflags="-I /xyz"` results in
> compiler flags `-I [...] /xyz`, so the `-I` and `/xyz` are separated
> by other compiler flags which obviously cannot work as expected. I
> could work around that by removing the space and using a pattern like
> `-I/xyz`.
> 
> This regression is not restricted to builds targeting Windows.

I'll take a look at fixing this (in meson).

> meson.build sets a hard name for the Windows installer executable: 
> installer = 'qemu-setup-' + meson.project_version() + '.exe'.
> 
> Previously the installer name could be changed by running `make 
> installer INSTALLER=qemu-setup-something.exe`. This no longer works.
> Is there an alternative solution how the name of the installer
> executable can be set? Or how could I reimplement the lost
> functionality?

No, there's no way to do this apart from patching meson.build.

Thanks,

Paolo


