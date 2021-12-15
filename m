Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34FBF475A61
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 15:15:14 +0100 (CET)
Received: from localhost ([::1]:60646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxV3p-0007WE-7e
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 09:15:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1mxUda-0007la-ES
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 08:48:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29191)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1mxUdT-0005o7-4t
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 08:48:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639576078;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Yg1hmIa/mOh7Kt0DE8u7ESU2Zis1ASujsD3nlrAEayM=;
 b=L41qMpQr8zgeC2jMo7KJCdRKaXMwpL6Q96Q4IsU9aOnvfE1ZDbpqEm1rYPhjttxw0TU+lX
 5mZWUAl41rtquQyQNEzjQpsIwDtAewCKkzSH1Tb00Y3WpuEqW25HlvGstR4RFIuiYO6Fvn
 ED8UjsSy0no2A0VfLcrwbaWHbaiQV0k=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-365-_79Q-5EWOo2PyCuMlnHpWw-1; Wed, 15 Dec 2021 08:47:53 -0500
X-MC-Unique: _79Q-5EWOo2PyCuMlnHpWw-1
Received: by mail-wr1-f69.google.com with SMTP id
 d7-20020a5d6447000000b00186a113463dso5915667wrw.10
 for <qemu-devel@nongnu.org>; Wed, 15 Dec 2021 05:47:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=Yg1hmIa/mOh7Kt0DE8u7ESU2Zis1ASujsD3nlrAEayM=;
 b=zav/n0abkC452yI5uLuzZStcAITakpFR3F0pgthEMik1y1dE4hNR749hDzpe4EKEMI
 aycAbIla608X/cYlpC0Ej2O12YAgbocL9j5frzAsMe76qmM5J8ujrFm/2EZM7axFAAkZ
 g0gMPhl7F9ECenXeWkFQURkrE+qoG3PpP/NgtLJnyry3Z2FKXMynD1BOUxTsoOaRQwhk
 j7poVrIV6F3vKWiJza1pyBPTk5uDFzM96xLsXL9trltISaqaPVQHt10oMC+a8uIfQzN0
 Lv3CyYUZO2irQxQtu4PYHKm0KQ9UC2eEBm8If9y643ikjVkfioEeTclgGRC/JEjmPPQj
 m37w==
X-Gm-Message-State: AOAM532C4SYU4r/yS2PGGCiaBCSTsCKtP3KtwsfoKM4ASD5oVXk+attP
 uecikevTdsygcArJEJLJ10zdPQjxo+yQJbCAJ5xkgiUifPAsxSG5Acz2U3uBWNXcOubBOv/BbtE
 Vz5sIRArdyX8psVQ=
X-Received: by 2002:a5d:4ccb:: with SMTP id c11mr4176307wrt.689.1639576071880; 
 Wed, 15 Dec 2021 05:47:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw15wxHZ3EhpNW6MAovRfrUGkOgzTkI7x0xH3tcvdbbehuqQQLLgg2X+nSzHlMhL5b85M2g0A==
X-Received: by 2002:a5d:4ccb:: with SMTP id c11mr4176289wrt.689.1639576071647; 
 Wed, 15 Dec 2021 05:47:51 -0800 (PST)
Received: from steredhat (host-87-21-203-138.retail.telecomitalia.it.
 [87.21.203.138])
 by smtp.gmail.com with ESMTPSA id k6sm1810752wmj.16.2021.12.15.05.47.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Dec 2021 05:47:51 -0800 (PST)
Date: Wed, 15 Dec 2021 14:47:48 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v4 03/18] meson: require liburing >= 0.3
Message-ID: <20211215134748.i4mtaysdyrcwuf7y@steredhat>
References: <20211124130150.268230-1-berrange@redhat.com>
 <20211124130150.268230-4-berrange@redhat.com>
 <977ffa85-1f5f-7493-cb05-5e2024e3c017@redhat.com>
MIME-Version: 1.0
In-Reply-To: <977ffa85-1f5f-7493-cb05-5e2024e3c017@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Dec 15, 2021 at 12:27:43PM +0100, Philippe Mathieu-Daudé wrote:
>Cc'ing Stefan & Stefano.

Thanks Phil!

>
>On 11/24/21 14:01, Daniel P. Berrangé wrote:
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
>>
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
>> +                              required: get_option('linux_io_uring'),
>>                                method: 'pkg-config', kwargs: static_kwargs)
>>  endif
>>  libxml2 = not_found
>>
>

LGTM!

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>


