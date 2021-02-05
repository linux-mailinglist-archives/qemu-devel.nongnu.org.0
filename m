Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8162E310FA9
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 19:15:05 +0100 (CET)
Received: from localhost ([::1]:53614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l85dI-0005M1-G1
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 13:15:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l84UC-0007eS-EF
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 12:01:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60393)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l84Tq-0004LQ-6f
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 12:01:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612544472;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xV82k8KKKXA8w0rYfAJbnlIy5zH9i8EkRooF0TNBo8c=;
 b=AHojEd4VfuerACqgvj4+uFDdkrZknfqo7jKc5Zj6mfdjFcGrpxTQTsx4czQun5x+dvXy6C
 1ytZ9b0/vq4bP9rD7UgilAjxI9Q588StmdTSwMrctgrcub2bvhYPf6JzkHi7M8ZjByAiUI
 DQz5I+0QFVGHW1Rd1APgBjdVF/rWVa0=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-395-3qBR9SSgMpeRc1Qn9tyg7A-1; Fri, 05 Feb 2021 12:01:10 -0500
X-MC-Unique: 3qBR9SSgMpeRc1Qn9tyg7A-1
Received: by mail-ej1-f71.google.com with SMTP id q11so7089913ejd.0
 for <qemu-devel@nongnu.org>; Fri, 05 Feb 2021 09:01:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xV82k8KKKXA8w0rYfAJbnlIy5zH9i8EkRooF0TNBo8c=;
 b=XseY7w/fLDYK0BlYy4nUG1lbXc6xW4EQ+f5M0FLatja+x1i4SASuhhObAUuhyupD/b
 7HsZgrXIlufBO+oD5Rk92gTtesH44/zHzWv4DIUx9uS2hcrt/TON9Q3zN38CY5cLih71
 xf9nByOK9E/MhIrVsO6qIhc1T9nUT3YwZpB5iEsDm/oMw9ZTMDgBRFH3nVZ+DocxP/Jj
 3c91y928hfuHdIKvjiL32iACTOH9Kw3MJvzon2hwHIigcoD/3MDtN81CkfhnKQuRoGeg
 liOuaoFM9Z0/LNdqkBT/bQIA1estfceTPaKfC5namX1C22c8ybdIW42yPIvc3XS9cLrZ
 q0Yw==
X-Gm-Message-State: AOAM531fxQ67nn6DIOOg6TaMJsle0J0lWh1FN53lGAes7XLouFwEBB6B
 ZeHXnfxCLydlNk3vs93RwA5/udwVvRIkYvpuC0u2bl10z1ymxjiQ+g9wnjJJhkGM4vALaYOi/na
 rAGjhEV/8LkTTaZs=
X-Received: by 2002:a05:6402:1383:: with SMTP id
 b3mr4240725edv.131.1612544469629; 
 Fri, 05 Feb 2021 09:01:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwYUrdHbnfBWkH1ZxFAo9APe8uO9rNgp+1WgCbcT6gDdSlsFjNXZRIOCZM0n71XCnbZD6//+g==
X-Received: by 2002:a05:6402:1383:: with SMTP id
 b3mr4240698edv.131.1612544469442; 
 Fri, 05 Feb 2021 09:01:09 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id f6sm100695edm.15.2021.02.05.09.01.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Feb 2021 09:01:08 -0800 (PST)
Subject: Re: [PATCH] tests/acceptance: Re-enable the microblaze test
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
References: <20210128152815.585478-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <38c34c5a-2659-de07-ab01-564bf1ef6cff@redhat.com>
Date: Fri, 5 Feb 2021 18:01:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210128152815.585478-1-thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.352,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.33, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/28/21 4:28 PM, Thomas Huth wrote:
> The microblaze kernel sometimes gets stuck during boot (ca. 1 out of 200
> times), so we disabled the corresponding acceptance tests some months
> ago. However, it's likely better to check that the kernel is still
> starting than to not testing it at all anymore. Move the test to
> a separate file, enable it again and check for an earlier console
> message that should always appear.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  MAINTAINERS                            |  1 +
>  tests/acceptance/boot_linux_console.py |  9 -------
>  tests/acceptance/machine_microblaze.py | 35 ++++++++++++++++++++++++++
>  3 files changed, 36 insertions(+), 9 deletions(-)
>  create mode 100644 tests/acceptance/machine_microblaze.py

Thanks, applied to my acceptance-testing tree.


