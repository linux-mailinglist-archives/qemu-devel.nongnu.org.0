Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF0E840CF2E
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 00:03:42 +0200 (CEST)
Received: from localhost ([::1]:46534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQd0H-0004py-EA
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 18:03:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mQcxL-0003oL-PV
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 18:00:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46297)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mQcxH-0006Nu-Ob
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 18:00:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631743233;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5N159ydqpTDc7qSw9zZDaUjAlu5hiBEeV5oeM1WZxc4=;
 b=igKqUX/Eoc3e9nNeraP+PbY6vea2nJaeFF78FcdDiURq/RMujtb4UFseGq0JAVO0gveJnR
 0Evmm5B8zzJZBU56bW0lXoORl1lYkxBxnyRbuftEpdzkV3EszNVN7Alj7QLSpJ8PHc54iT
 Y4VJPcTFXzzx2dktcHC4KVx+jQgbv2I=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-563-o7d4d0C2NHSLitIODOAiGw-1; Wed, 15 Sep 2021 18:00:31 -0400
X-MC-Unique: o7d4d0C2NHSLitIODOAiGw-1
Received: by mail-ed1-f72.google.com with SMTP id
 y17-20020a50e611000000b003d051004603so3073658edm.8
 for <qemu-devel@nongnu.org>; Wed, 15 Sep 2021 15:00:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5N159ydqpTDc7qSw9zZDaUjAlu5hiBEeV5oeM1WZxc4=;
 b=Ksb3jsxBkXOheTiDupnYprrp5AxM2DuV+cFthPDSIsysrjB0pcPbUKxJ+0W61xE32e
 GEcf+9qyQXcqgED/2xYuDb9RLF8NnW8v1kplvcMwyUgeWLXpZiPsVrE3IdzR9j9wUoKY
 TjX4j2KHi6KiPXFy+lSOcA9neldYzXRkEROMe+nFzxZcARhJvjr/E0SoojOQEQ9jaGiP
 9OcCBkFNDx9wXLSGxQ93YVOjpwEGR5MCWxC5BrWNzUV6U766jZ45lKNuw4CbICL46T+V
 z7+s78UQ+Vo21DR1nWdErkdh4o1N2x2SkndmLgXKfgYYbyxibO3SfXiNKbYibeT7YuQh
 PGVA==
X-Gm-Message-State: AOAM530g/l7/+HxeFOv8eaTtmyahf1bffLpp77gdpQSZ6fxTB/43IV43
 GacwwC9VxEcVbt5/A+NqeCfKS6N3hCTYyn6GE0OxW2OIQEHGvDOW42Z3uqkzwFnt1w94NPnVEhm
 eoafN+NvYdxwD16qgOBXKgHS5495hkSBh5QCmJp50+rDYhHdkNPRnFiSOkgaGs+71mvA=
X-Received: by 2002:aa7:d0cf:: with SMTP id u15mr2466328edo.43.1631743230378; 
 Wed, 15 Sep 2021 15:00:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx2BoI6mIhdJZ8fdcBT8XiQibZftrx+JxNVZij5eNUQYxPkZffa1lSB0Xa1e7iKbRJzZBVm2Q==
X-Received: by 2002:aa7:d0cf:: with SMTP id u15mr2466298edo.43.1631743230065; 
 Wed, 15 Sep 2021 15:00:30 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id g9sm538911edk.54.2021.09.15.15.00.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Sep 2021 15:00:29 -0700 (PDT)
Subject: Re: [PULL 0/4] Update meson version
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210915164329.13815-1-pbonzini@redhat.com>
 <CAFEAcA_6kdWX37d+Ak6nQVywE6f_4sGYvQZ2_H3+9ONzi7HJeA@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <79f8bd2f-3bda-b88b-1103-87623b2039c6@redhat.com>
Date: Thu, 16 Sep 2021 00:00:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_6kdWX37d+Ak6nQVywE6f_4sGYvQZ2_H3+9ONzi7HJeA@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.698, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 15/09/21 19:34, Peter Maydell wrote:
>> Paolo Bonzini (4):
>>        meson: bump submodule to 0.58.2
>>        meson: switch minimum meson version to 0.58.2
>>        hexagon: use env keyword argument to pass PYTHONPATH
>>        target/xtensa: list cores in a text file
> Was this intended to be a pull request ? AFAICT patch 4 at least
> has not been seen before on the list for review.

It was intended to be a pull request; but it was not intended to include 
previously unsubmitted patches of course.

I have removed patch 4 from the tag.

Paolo


