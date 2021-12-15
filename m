Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AC264758AC
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 13:17:20 +0100 (CET)
Received: from localhost ([::1]:41298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxTDj-0006GG-MH
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 07:17:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mxStO-0007Ir-6p
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 06:56:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30108)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mxStK-0005r7-Lc
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 06:56:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639569371;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KLpR3lKM42y0K0ofgg0xSqClCMUZR5oHByiqp6l3PQ8=;
 b=WiMMR8Jj+xWMiaAldgB8ZUQUIyQOsLe9G4myuj0Dpf6PriCXXHEtb6U6s2+ktggvBcEROy
 SHBXKGHHXQAXkY9CkgXmG/BIbGtfTfZg5muUD8VRKKPMNtMV5GBsoXj6sdREWinuzy9HcO
 elIGfWPJZmu8uwKwg3lrcSht+/ZfmZg=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-647-g4YHW1AoNaCGDHuP1f2YhA-1; Wed, 15 Dec 2021 06:56:09 -0500
X-MC-Unique: g4YHW1AoNaCGDHuP1f2YhA-1
Received: by mail-wr1-f69.google.com with SMTP id
 p17-20020adff211000000b0017b902a7701so5835953wro.19
 for <qemu-devel@nongnu.org>; Wed, 15 Dec 2021 03:56:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=KLpR3lKM42y0K0ofgg0xSqClCMUZR5oHByiqp6l3PQ8=;
 b=02PfHZ1tKceaKcLgy9E0YIK9UbAF2kKY1zS6AQKrYTsPRFf9hURkVsnVOHeL/mlsWf
 Vo7i7ciXynAw1H2Fm27szGPnP6EbTagRzl3nOKND+UM6pDWekYEuHY7sWbtnAjs7Sq1w
 67H9MoQlkvlcLEzp+Qnc5pEdh3ijzqtAlq9+W9kCP+1INoMtmxuoJZk1+jidUr752Hwj
 0zyaHmNVYzI+uSokOoq82ZeqEdTOiRm5Wr3+YPRVH5nU0e20Y6CucyXvx8018UtOixdy
 Mea91GcU9GvX5bmia5mrWdEN9cmmXuVwVuGDrwDFC2uoED2srG/X7x858AY2Bs4yO6J7
 THpQ==
X-Gm-Message-State: AOAM531PXcw9J4sF0+5oPC7qPRWbkIAFsz04BlWoarWZlk81EnWQ6EzE
 Xud31uI86WtBcX45BYyr9/Nx2WYBs8At0l8JN4/wKbRAsAqLeM0YaGjwMeBEZzcHIEx9ZOL978n
 8ViTIRk7KhdRx6j4=
X-Received: by 2002:a05:600c:4113:: with SMTP id
 j19mr4381884wmi.48.1639569368401; 
 Wed, 15 Dec 2021 03:56:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwIfsbUmSuKYdWmbgQN9a2bdioJttKZQMfl90U7d/YOe1jA7ZquIgo27TxbIT0ipszg8F97Rg==
X-Received: by 2002:a05:600c:4113:: with SMTP id
 j19mr4381863wmi.48.1639569368155; 
 Wed, 15 Dec 2021 03:56:08 -0800 (PST)
Received: from [192.168.1.36] (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id b14sm1959914wrg.15.2021.12.15.03.56.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Dec 2021 03:56:07 -0800 (PST)
Message-ID: <d45c1913-3224-98ac-2a02-15036fe1014c@redhat.com>
Date: Wed, 15 Dec 2021 12:56:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v4 03/18] meson: require liburing >= 0.3
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Cole Robinson <crobinso@redhat.com>
References: <20211124130150.268230-1-berrange@redhat.com>
 <20211124130150.268230-4-berrange@redhat.com>
 <977ffa85-1f5f-7493-cb05-5e2024e3c017@redhat.com>
In-Reply-To: <977ffa85-1f5f-7493-cb05-5e2024e3c017@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.64, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

+Cole too, who reviewed commit ae60ab7eb20
("aio-posix: fix test-aio /aio/event/wait with fdmon-io_uring").

On 12/15/21 12:27, Philippe Mathieu-Daudé wrote:
> Cc'ing Stefan & Stefano.
> 
> On 11/24/21 14:01, Daniel P. Berrangé wrote:
>> openSUSE Leap 15.2 ships with liburing == 0.2 against which QEMU fails
>> to build.
>>
>> ../util/fdmon-io_uring.c: In function ‘fdmon_io_uring_need_wait’:
>> ../util/fdmon-io_uring.c:305:9: error: implicit declaration of function ‘io_uring_sq_ready’; did you mean ‘io_uring_cq_ready’? [-Werror=implicit-function-declaration]
>>      if (io_uring_sq_ready(&ctx->fdmon_io_uring)) {
>>          ^~~~~~~~~~~~~~~~~
>>          io_uring_cq_ready
>>
>> This method was introduced in liburing 0.3, so set that as a minimum
>> requirement.

Indeed:

https://github.com/axboe/liburing/compare/liburing-0.2...liburing-0.3#diff-e0178cba1dc791a3b22c0a516225980907931d18a2773adf584e8dcffb51a2caR330

>> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
>> ---
>>  meson.build | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/meson.build b/meson.build
>> index e2d38a43e6..04d36bf47e 100644
>> --- a/meson.build
>> +++ b/meson.build
>> @@ -427,7 +427,8 @@ if not get_option('linux_aio').auto() or have_block
>>  endif
>>  linux_io_uring = not_found
>>  if not get_option('linux_io_uring').auto() or have_block
>> -  linux_io_uring = dependency('liburing', required: get_option('linux_io_uring'),
>> +  linux_io_uring = dependency('liburing', version: '>=0.3',

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

>> +                              required: get_option('linux_io_uring'),
>>                                method: 'pkg-config', kwargs: static_kwargs)
>>  endif
>>  libxml2 = not_found
>>


