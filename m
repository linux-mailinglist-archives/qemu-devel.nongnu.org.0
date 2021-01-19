Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51C252FC4A8
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 00:22:32 +0100 (CET)
Received: from localhost ([::1]:45154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l20KU-0006AV-Th
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 18:22:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l20Iv-0005MW-CS
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 18:20:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45120)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l20Is-0004uj-Qs
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 18:20:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611098449;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uoCPlMQz8Hf4sewh7ij7sdB0Ny7KdxHmj3fhHS0g0qY=;
 b=hZUdIsIv8NrmDAqs28549e6233Kt4IV76v7VSPSgB+0+PzaV5egTG/AjRzM5oo4MYvlh2E
 lD32mEnvsrSDYl/R+K8GGRXQ94Im4ROgvkcNWaqi9xiSosmJ5/HO98MDMdRdaB9MTbaLLY
 fyfX1MSoBgRx7o/575mzi/+znVepsXY=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-283-c5jbyQ0HP2GNvTFRAn8FDA-1; Tue, 19 Jan 2021 18:20:46 -0500
X-MC-Unique: c5jbyQ0HP2GNvTFRAn8FDA-1
Received: by mail-ed1-f71.google.com with SMTP id r4so873168eds.4
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 15:20:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=uoCPlMQz8Hf4sewh7ij7sdB0Ny7KdxHmj3fhHS0g0qY=;
 b=geo45bRhiJrMzmov4VrlR9MADW+eELDqefEpbJwscAZfBF5LQ/ms4o+U9QQxdJkXrc
 a4rezmXVVFqG1J93DIAf2e9BFPoyCgMio7EBLwAmeFeLwGwrJHxCX+2wCaTMEoimeC3g
 +Hf1PCNXfu6J21mZ5BGNsRjAIIQaJfOUwYSc9P74KVKlgPlPuVqOirWFpooLPLWsFYbd
 D8SodnBpCVOt2+CGha+cMJ7luGDA/yWVYZL/RXoRn/ghIP8vNI+KiHMDAP70iFOGxbbW
 TZSZ4JyS69jNgpZDTDTId37LpG7H1CFpp5t62o5sLgffg4Ykj8v1OdHjg7KqzzVqvSUq
 8iJA==
X-Gm-Message-State: AOAM533n8EwjT4AZ7z79RkSixWRh0oy/bEVnlew0stTuIaWxqfJSwjW8
 ohS/yI1DS2/PTEyc1mYemX09pjOeWuQC/ihC9QaIJrb3Cq4Lb/gsFx5BvhU8eUOtBRbYDwZv2Cl
 DnFasP3obqh9hUqw=
X-Received: by 2002:a17:906:48f:: with SMTP id
 f15mr4448200eja.392.1611098445477; 
 Tue, 19 Jan 2021 15:20:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxxShGE3q8TugQWo/CFtg7IyJT/BBEd28XfxBRto56kToT3UEQns2xVH8a8gkQa+wcyKO0aKw==
X-Received: by 2002:a17:906:48f:: with SMTP id
 f15mr4448190eja.392.1611098445314; 
 Tue, 19 Jan 2021 15:20:45 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id x17sm134712edd.76.2021.01.19.15.20.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Jan 2021 15:20:44 -0800 (PST)
Subject: Re: [PATCH] usb: Fix clang build
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
References: <20210119230741.810007-1-eblake@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <fd1b9e5f-5436-2cd7-d97a-c6136ce43c95@redhat.com>
Date: Wed, 20 Jan 2021 00:20:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210119230741.810007-1-eblake@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.195,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 "Daniel P . Berrange" <berrange@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Eric,

On 1/20/21 12:07 AM, Eric Blake wrote:
> ../hw/usb/dev-uas.c:157:31: error: field 'status' with variable sized type 'uas_iu' not at the end of a struct or class is a GNU extension [-Werror,-Wgnu-variable-sized-type-not-at-end]
>     uas_iu                    status;
>                               ^
> 
> Fix this by specifying a size for the add_cdb member; and at present,
> the code does not actually use that field other than for the size
> chosen for the packed uas_iu_command struct, and the choice of one
> byte does not change the size of the uas_iu union.

I sent a maybe safer approach (from the bus PoV):
https://www.mail-archive.com/qemu-block@nongnu.org/msg79192.html

Do you mind reviewing it?

> 
> Signed-off-by: Eric Blake <eblake@redhat.com>
> ---
> 
> I'm not sure why none of our CI tools pick up this particular clang
> build failure; I hit it on Fedora 33 when configuring to build the
> entire tree with clang.

Same issue after upgrading to f33. I sent a patch to bump our CI:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg774117.html

To track Fedora releases I was thinking about a gitlab job checking
if we are using the latest, else failing; smth as:

 $ curl https://getfedora.org/ | grep -q 'Fedora 33 released'


