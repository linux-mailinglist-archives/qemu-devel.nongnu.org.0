Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01C03528417
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 14:23:15 +0200 (CEST)
Received: from localhost ([::1]:45698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqZko-0008FL-0a
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 08:23:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nqYHL-0004DJ-1l
 for qemu-devel@nongnu.org; Mon, 16 May 2022 06:48:52 -0400
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235]:37463)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nqYHI-0007H2-S2
 for qemu-devel@nongnu.org; Mon, 16 May 2022 06:48:42 -0400
Received: by mail-oi1-x235.google.com with SMTP id r1so18091444oie.4
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 03:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=lZsMa6TV6tJIexWmxOTjZoMTLI6G+zIeqmt1x/Ucysw=;
 b=x8uqIesqmEAG9oEOvonmmH5/2T2t5nK/U1KBAd2S6h3CbDHa/QrAGyqd/e1yeYEHkx
 CkJ5Ok4NZkbtC4odi8Y+Wuvf5+vvscvNJOsJ8MfNWM/tWY7ojODFoLUXhgO9/SR6XO7+
 CJ/A40Ata4Zm+/uuHCCrUb0GDHyM0/tDg9xGzShxXYGf2jsk8y5blZkgg8/TwsCR5UDb
 R77OSlFF2RONC4v2zQkxd96dlTlE58t/HGGBJr1dTDzJl0mcYNCXpuvMC2a7bI277qxX
 D9YVfYgMspTl1pIalXHDZZXiJ0NrkIwIMRs2Ykihl+HEHExWvcDKm4wf1VdJYGYIEiy6
 MZOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=lZsMa6TV6tJIexWmxOTjZoMTLI6G+zIeqmt1x/Ucysw=;
 b=tYwgrf5yMJNZ2Dou3z+yKVH8smZn7m01qCmKTC3uulEFGb2VL7CG8kIP0ri1rUzHVY
 iapiZ5/Tt857/s6SrHF8qKRBSi3/W8QZo+IYNCfj0ziWofuh4RH9P9vfp1z4eAuHp4Ek
 fwedXUkIL8iWjVSKSum4sO6RZqjS0PhDZe+m7p3ZtJPyhBujDEw+WuJ4JHPSam7lmfaH
 nNuYB5V90COc7YR0sFvEQtBgE91+EBjSNwuwuN8HY9MO1NK9YuLYIm/h6vep6IM/ykS7
 tsoViQP5T+A8gQufr6UU8UUrHXw7n1Mhns6or78EVdbBzV5Cschh0Y1jTLAXKfDH+GMw
 XxDw==
X-Gm-Message-State: AOAM530ABR/vAG7ItcXENATqCOkIUkX525ZvgL1RObPIBYnLd0RptnKM
 p2AD/fJKnIVTVO0qLSBQW1kggg==
X-Google-Smtp-Source: ABdhPJwypENs6bddqFf8u1Rd/N9PlD1bzXWnLQsINDNbaC2G95X2EbJ0Q8oaGm8trfNprd14HlNllQ==
X-Received: by 2002:a05:6808:2395:b0:326:a02e:2c3a with SMTP id
 bp21-20020a056808239500b00326a02e2c3amr7403586oib.169.1652698106028; 
 Mon, 16 May 2022 03:48:26 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 b18-20020a9d6b92000000b00606b1f72fcbsm3812382otq.31.2022.05.16.03.48.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 03:48:22 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id DF77B1FFB7;
 Mon, 16 May 2022 11:48:19 +0100 (BST)
References: <ac657a9f-a217-ee01-616d-85d8c960bb58@gmail.com>
User-agent: mu4e 1.7.21; emacs 28.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philippe.mathieu.daude@gmail.com>
Cc: qemu-devel@nongnu.org, slp@redhat.com, mathieu.poirier@linaro.org,
 mst@redhat.com, viresh.kumar@linaro.org, Raphael Norwitz
 <raphael.norwitz@nutanix.com>, stefanha@redhat.com,
 marcandre.lureau@redhat.com
Subject: Re: [PATCH v1 11/13] contrib/vhost-user-blk: fix 32 bit build and
 enable
Date: Mon, 16 May 2022 11:46:00 +0100
In-reply-to: <ac657a9f-a217-ee01-616d-85d8c960bb58@gmail.com>
Message-ID: <87v8u5sqh8.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::235;
 envelope-from=alex.bennee@linaro.org; helo=mail-oi1-x235.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Philippe Mathieu-Daud=C3=A9 <philippe.mathieu.daude@gmail.com> writes:

> On 21/3/22 16:30, Alex Benn=C3=A9e wrote:
>> We were not building the vhost-user-blk server due to 32 bit
>> compilation problems. The problem was due to format string types so
>> fix that and then enable the build. Tweak the rule to follow the same
>> rules as other vhost-user daemons.
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> ---
>>   meson.build                             | 2 +-
>>   contrib/vhost-user-blk/vhost-user-blk.c | 6 +++---
>>   contrib/vhost-user-blk/meson.build      | 3 +--
>>   3 files changed, 5 insertions(+), 6 deletions(-)
>> diff --git a/meson.build b/meson.build
>> index 282e7c4650..0435419307 100644
>> --- a/meson.build
>> +++ b/meson.build
>> @@ -1326,7 +1326,7 @@ have_vhost_user_blk_server =3D get_option('vhost_u=
ser_blk_server') \
>>              error_message: 'vhost_user_blk_server requires linux') \
>>     .require('CONFIG_VHOST_USER' in config_host,
>>              error_message: 'vhost_user_blk_server requires vhost-user s=
upport') \
>> -  .disable_auto_if(not have_system) \
>> +  .disable_auto_if(not have_tools and not have_system) \
>
> s/and/or/?

AIUI this is for auto-enabling so you probably want to build if you have
system build or are explicitly building tools. I think, it's confusing
being in a double negative.

>
>>     .allowed()


--=20
Alex Benn=C3=A9e

