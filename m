Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D3D56EADA7
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 17:00:53 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppsFU-0007gS-EX; Fri, 21 Apr 2023 11:00:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ppsFN-0007eS-H5
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 11:00:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ppsFL-0007fN-0E
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 11:00:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682089221;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6gCuqahjHcRqLRfmClAcpq2puGif5QpPWvDeidLRxDc=;
 b=azqwmDqYlsx3HtP/PMiT2+pzJTCKgKp/WEWwmnyJgX/T1Ppsk4/MQvz7FZND46C9Xo+ZOj
 WXoGIA3B/fbLZWK4qbC564X8lbDD6W93coHcBynSwv5auwyX9rF7GXtVmHcmeZ2m+CpXWb
 ouUfwqo2Ck3pfFTF3FewM5EpM3dTR2M=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-364-APq9-iaGP4-BACuxX2PUdQ-1; Fri, 21 Apr 2023 11:00:20 -0400
X-MC-Unique: APq9-iaGP4-BACuxX2PUdQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-3f065208a64so11289985e9.3
 for <qemu-devel@nongnu.org>; Fri, 21 Apr 2023 08:00:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682089218; x=1684681218;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6gCuqahjHcRqLRfmClAcpq2puGif5QpPWvDeidLRxDc=;
 b=JmEpTV4JWWh56QDTmjcSRPmIwsbhPdv/XPVwHRYIhbNFuE99vnENsTs5mNpjudxGSj
 bwokjsifz/XMKPJoCG8x0sq8pgBS6zhDenUoOEMHIcnQ46fHacBww1gKT33291UlBTrK
 UpSacyrc+35HvaJyRRsXTSlMy4p74lVn5sGX2UUo/zY+kzl3C4Y7CLgyvJ4aHt5pkKQL
 JYLcuKDcsj2fgFerttau5sprfU0Pn95thvO073SonMlD78O2C9hIgF+nd/65NxZFrsXR
 xovGpJ3ShztKJZ+EdBjJa5GDkQjUdX2EDe88Xtwsv+O8f5SYErZ4R8Ayh5vx5w0TlUTH
 cFIw==
X-Gm-Message-State: AAQBX9cPrnzmqp1WGyXaqoV1rH0QELrPKRvGp5ypYZJx9njCZ7vxchMz
 HdveRvuZAkph8EW94MJvmuuze2VBlWhf5IZcR3psIz5i1EJzd0v7oZ1yAZBZPr2YD9vBKQ7xYLs
 /f09NO86gKKXthMs=
X-Received: by 2002:a05:600c:2201:b0:3f1:806d:33ad with SMTP id
 z1-20020a05600c220100b003f1806d33admr1871254wml.6.1682089218706; 
 Fri, 21 Apr 2023 08:00:18 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZN9z1b+JX0Fpu8eDM0UYHud72wgDxx81eo7wkR/mMD1Q7Po8Imj1HTqSh3MQ+1S+IFzMZlhQ==
X-Received: by 2002:a05:600c:2201:b0:3f1:806d:33ad with SMTP id
 z1-20020a05600c220100b003f1806d33admr1871220wml.6.1682089218407; 
 Fri, 21 Apr 2023 08:00:18 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-178-20.web.vodafone.de.
 [109.43.178.20]) by smtp.gmail.com with ESMTPSA id
 q13-20020adfcd8d000000b002d7a75a2c20sm4511568wrj.80.2023.04.21.08.00.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Apr 2023 08:00:17 -0700 (PDT)
Message-ID: <48389ddb-3c59-3bce-532e-012d5f92f493@redhat.com>
Date: Fri, 21 Apr 2023 17:00:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v10 07/11] tests/qtest: Fix tests when no KVM or TCG are
 present
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Cornelia Huck <cohuck@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <ani@anisinha.ca>, Laurent Vivier <lvivier@redhat.com>
References: <20230412121829.14452-1-farosas@suse.de>
 <20230412121829.14452-8-farosas@suse.de>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230412121829.14452-8-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.297, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 12/04/2023 14.18, Fabiano Rosas wrote:
> It is possible to have a build with both TCG and KVM disabled due to
> Xen requiring the i386 and x86_64 binaries to be present in an aarch64
> host.
> 
> If we build with --disable-tcg on the aarch64 host, we will end-up
> with a QEMU binary (x86) that does not support TCG nor KVM.
> 
> Skip tests that crash or hang in the above scenario. Do not include
> any test cases if TCG and KVM are missing.
> 
> Make sure that calls to qtest_has_accel are placed after g_test_init
> in similar fashion to commit ae4b01b349 ("tests: Ensure TAP version is
> printed before other messages") to avoid TAP parsing errors.
> 
> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> Reviewed-by: Juan Quintela <quintela@redhat.com>
> ---
>   tests/qtest/bios-tables-test.c | 11 +++++++++--
>   tests/qtest/boot-serial-test.c |  5 +++++
>   tests/qtest/migration-test.c   |  9 ++++++++-
>   tests/qtest/pxe-test.c         |  8 +++++++-
>   tests/qtest/vmgenid-test.c     |  9 +++++++--
>   5 files changed, 36 insertions(+), 6 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>


