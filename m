Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 317154773C0
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 14:58:24 +0100 (CET)
Received: from localhost ([::1]:40924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxrH4-0000qj-QI
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 08:58:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bleal@redhat.com>) id 1mxrA1-0007M4-Sc
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 08:51:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38848)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bleal@redhat.com>) id 1mxr9x-0001ly-Lr
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 08:51:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639662661;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XR5z4SZiG6mZ+//Zqk8F5eQvNy0uiytJBaao2c5A5kE=;
 b=C9d7z8g2keC/QXLEFlKeswgBTUfMwecHa/SdYdG6Gq+KFv73i2gPmtPXk72n7dhJJpcHbk
 eX2dWjlCeEXDn6wvRN2viSGD1wFOwGo4x/FfuSpUskg6JRYl0RQkmkuegdnhxdOUYgyB/m
 UQijGw98CP5Sz5oxdcoIp+bVUozcM5k=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-391-B0NVV6jzPz-NYR7zyC_tFw-1; Thu, 16 Dec 2021 08:51:00 -0500
X-MC-Unique: B0NVV6jzPz-NYR7zyC_tFw-1
Received: by mail-qk1-f197.google.com with SMTP id
 v13-20020a05620a440d00b00468380f4407so20662634qkp.17
 for <qemu-devel@nongnu.org>; Thu, 16 Dec 2021 05:51:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=XR5z4SZiG6mZ+//Zqk8F5eQvNy0uiytJBaao2c5A5kE=;
 b=q4wPmz4N/O96IfP/TuR1RNdE0HzN9LD64Lq8d8wST3abGljopmaEdz/E3LzyR6kdDe
 B1ksJfHwELa+aLJ1La0K4zqyiXHuMeL9TOGriOZfhuh6RsfljzMzA4Bj2KQJaVaXLxfy
 8XmARbl1xFeuikjPW0e1h7+rBNBVi2ITgqBnq2MK/ytnJsRkn6AjR1rJuhENsB5YFe3Y
 iw6I20wp+8LfW4wbmFgrRK7xkukCojNfa4uA6Fr/OpuaobQGyhGTHBRHsceWQuNqu6UL
 VY6VyREVCg2KpHI4ufH9eLDRGqJe2NFIPi7KnJx76fHnst1kZ7s21D5RYnN5D+4KzNXD
 VtPQ==
X-Gm-Message-State: AOAM533F0ZgY11PYci+is8tX3FDajKPxBipkmhnxVL7u9YSD/IZ0VBhr
 2P0r0Crwwr378DUxWENASz3xxGqNGOk6wrs5E3SxtiKpOkl6SqToY9rawfqq68oy/WDMXMskbwG
 XngnD2TE1483XAeg=
X-Received: by 2002:a05:620a:4011:: with SMTP id
 h17mr12278252qko.564.1639662659390; 
 Thu, 16 Dec 2021 05:50:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyVhgpp0FZxsgJ3pbAAu7ADWDPxcd7ZIgDIXt0IZO7WEiTTOcfOgqwPgTNxcgOTitZ7rKWA+Q==
X-Received: by 2002:a05:620a:4011:: with SMTP id
 h17mr12278238qko.564.1639662659193; 
 Thu, 16 Dec 2021 05:50:59 -0800 (PST)
Received: from localhost ([181.191.236.130])
 by smtp.gmail.com with ESMTPSA id d19sm4268380qtb.47.2021.12.16.05.50.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 05:50:58 -0800 (PST)
Date: Thu, 16 Dec 2021 10:50:51 -0300
From: Beraldo Leal <bleal@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v2 17/25] iotests/mirror-top-perms: switch to AQMP
Message-ID: <20211216135051.oxnidozxbps44kf4@laptop.redhat>
References: <20211215193939.3768033-1-jsnow@redhat.com>
 <20211215193939.3768033-18-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211215193939.3768033-18-jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=bleal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=bleal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Daniel Berrange <berrange@redhat.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Wainer Moschetta <wainersm@redhat.com>, Andrea Bolognani <abologna@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Dec 15, 2021 at 02:39:31PM -0500, John Snow wrote:
> Signed-off-by: John Snow <jsnow@redhat.com>
> 
> ---
> 
> Note: I still need to adjust the logging. The problem now is that the
> logging messages include the PID of the test process, so they need to be
> filtered out. I'll investigate that for a follow-up, or for v2.
> 
> I could just add yet another filtering function somewhere, but I think
> it's getting out of hand with how many filters and loggers there are, so
> I want to give it a slightly more serious treatment instead of a
> hackjob.
> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  tests/qemu-iotests/tests/mirror-top-perms | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/qemu-iotests/tests/mirror-top-perms b/tests/qemu-iotests/tests/mirror-top-perms
> index 0a51a613f3..f394931a00 100755
> --- a/tests/qemu-iotests/tests/mirror-top-perms
> +++ b/tests/qemu-iotests/tests/mirror-top-perms
> @@ -23,7 +23,6 @@ import os
>  
>  from qemu.aqmp import ConnectError
>  from qemu.machine import machine
> -from qemu.qmp import QMPConnectError
>  
>  import iotests
>  from iotests import change_log_level, qemu_img
> @@ -101,13 +100,13 @@ class TestMirrorTopPerms(iotests.QMPTestCase):
>          self.vm_b.add_device('virtio-blk,drive=drive0,share-rw=on')
>          try:
>              # Silence AQMP errors temporarily.
> -            # TODO: Remove this and just allow the errors to be logged when
> -            # AQMP fully replaces QMP.
> +            # TODO: Remove change_log_level and allow the errors to be logged.
> +            #       This necessitates a PID filter on *all* logging output.
>              with change_log_level('qemu.aqmp'):
>                  self.vm_b.launch()
>                  print('ERROR: VM B launched successfully, '
>                        'this should not have happened')
> -        except (QMPConnectError, ConnectError):
> +        except ConnectError:
>              assert 'Is another process using the image' in self.vm_b.get_log()
>  
>          result = self.vm.qmp('block-job-cancel',

Reviewed-by: Beraldo Leal <bleal@redhat.com>

--
Beraldo


