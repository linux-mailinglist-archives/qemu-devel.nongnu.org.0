Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7177658B18
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Dec 2022 10:38:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pApJt-0007KJ-E9; Thu, 29 Dec 2022 04:35:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pApJa-0007H0-77
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 04:35:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pApJX-0007Ro-2J
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 04:35:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672306501;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GcdrvCqNGjGHU9f/3dmKHzhrW9q3ylvLAkxtIJNUh5k=;
 b=evdJoGFknbkEDR44YzS8Uqd34y4CJwDbAaa6Q8tPxoaaUUZlXKDzK2WktUWPbOaaeXC1La
 nm5nRfdQMydTYM5rFA03GsoiqhEKaISXf7CnWT9fod8dXlFaOIYKRI6q/+n2CljaNbWRcm
 HZ7uQpIUIbU5HDLJ4f+jL/Y3nlE930Y=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-127-mUbOXJwtNyWqOdRYv53DRQ-1; Thu, 29 Dec 2022 04:34:59 -0500
X-MC-Unique: mUbOXJwtNyWqOdRYv53DRQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 l31-20020a05600c1d1f00b003d9720d2a0eso8638510wms.7
 for <qemu-devel@nongnu.org>; Thu, 29 Dec 2022 01:34:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GcdrvCqNGjGHU9f/3dmKHzhrW9q3ylvLAkxtIJNUh5k=;
 b=ktZPAhncZW0unVRMiY8oA9xVK9i2B7sxqAJUJdyAGeIMbczuXUCZpPrXfhhM/xuYBa
 rauDJTj9v7W2f4xUDKAAzqGyeOpLKPwWsReGWFdDLhHnRkAEIz0yB4MUnBV5eh7yhS1d
 Y1u6o5ZdSl9ehAIMPnHm1D8qSbFLDDTsW7l8r8nmqprAdurgdaXsPdnb/a2oZVVD4dIf
 cWPEWU/cQazM4zjwJGVfUyAb/QyqjslJ+vfZxxrGpB9+r8ZbRhd+qFaMNuKocVntC72N
 CbwCHVAqEDlZKPHUzU75L23mDRTuGmX+tIwbDW/BlaH6LpMSzVXmW7unLB69WRRLuchj
 JM4g==
X-Gm-Message-State: AFqh2koxe73fB/nflV6x1EwIMJGm9AqCQq43UIpw8jAtciCXEAzeAzEO
 M1y8cmJ4MLBrTf0Uy1H6eMg4UOyJ804EkrtvTn0OiwzF4vGan+oMrxtW+VP/fAnvC3PDqLN2rqS
 BInGJYmtHtjFmByA=
X-Received: by 2002:a05:600c:41d1:b0:3d2:3d7b:6118 with SMTP id
 t17-20020a05600c41d100b003d23d7b6118mr19542868wmh.24.1672306498395; 
 Thu, 29 Dec 2022 01:34:58 -0800 (PST)
X-Google-Smtp-Source: AMrXdXt/4j8QTHWJSp160KylJKNWsBz1Vjettg8tniYVzZJu5Uz2eF3E4HoK9vYXUf1BDQV84SkA2g==
X-Received: by 2002:a05:600c:41d1:b0:3d2:3d7b:6118 with SMTP id
 t17-20020a05600c41d100b003d23d7b6118mr19542844wmh.24.1672306498196; 
 Thu, 29 Dec 2022 01:34:58 -0800 (PST)
Received: from [192.168.0.5] (ip-109-42-113-203.web.vodafone.de.
 [109.42.113.203]) by smtp.gmail.com with ESMTPSA id
 m185-20020a1c26c2000000b003c6f1732f65sm28144375wmm.38.2022.12.29.01.34.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Dec 2022 01:34:57 -0800 (PST)
Message-ID: <27da4d93-38e6-1c40-4a60-92f3343f380f@redhat.com>
Date: Thu, 29 Dec 2022 10:34:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 5/6] tests: add G_GNUC_PRINTF for various functions
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-ppc@nongnu.org,
 xen-devel@lists.xenproject.org, Laurent Vivier <lvivier@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, virtio-fs@redhat.com,
 Michael Roth <michael.roth@amd.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, qemu-block@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Paul Durrant <paul@xen.org>, Anthony Perard <anthony.perard@citrix.com>,
 David Gibson <david@gibson.dropbear.id.au>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>, John Snow <jsnow@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Greg Kurz <groug@kaod.org>
References: <20221219130205.687815-1-berrange@redhat.com>
 <20221219130205.687815-6-berrange@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20221219130205.687815-6-berrange@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.147, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 19/12/2022 14.02, Daniel P. Berrangé wrote:
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   tests/qtest/ahci-test.c           |  3 +++
>   tests/qtest/arm-cpu-features.c    |  1 +
>   tests/qtest/erst-test.c           |  2 +-
>   tests/qtest/ide-test.c            |  3 ++-
>   tests/qtest/ivshmem-test.c        |  4 ++--
>   tests/qtest/libqmp.c              |  2 +-
>   tests/qtest/libqos/libqos-pc.h    |  6 ++++--
>   tests/qtest/libqos/libqos-spapr.h |  6 ++++--
>   tests/qtest/libqos/libqos.h       |  6 ++++--
>   tests/qtest/libqos/virtio-9p.c    |  1 +
>   tests/qtest/migration-helpers.h   |  1 +
>   tests/qtest/rtas-test.c           |  2 +-
>   tests/qtest/usb-hcd-uhci-test.c   |  4 ++--
>   tests/unit/test-qmp-cmds.c        | 13 +++++++++----
>   14 files changed, 36 insertions(+), 18 deletions(-)
...
> diff --git a/tests/unit/test-qmp-cmds.c b/tests/unit/test-qmp-cmds.c
> index 2373cd64cb..6d52b4e5d8 100644
> --- a/tests/unit/test-qmp-cmds.c
> +++ b/tests/unit/test-qmp-cmds.c
> @@ -138,6 +138,7 @@ void qmp___org_qemu_x_command(__org_qemu_x_EnumList *a,
>   }
>   
>   
> +G_GNUC_PRINTF(2, 3)
>   static QObject *do_qmp_dispatch(bool allow_oob, const char *template, ...)
>   {
>       va_list ap;
> @@ -160,6 +161,7 @@ static QObject *do_qmp_dispatch(bool allow_oob, const char *template, ...)
>       return ret;
>   }
>   
> +G_GNUC_PRINTF(3, 4)
>   static void do_qmp_dispatch_error(bool allow_oob, ErrorClass cls,
>                                     const char *template, ...)
>   {
> @@ -269,7 +271,7 @@ static void test_dispatch_cmd_io(void)
>   
>   static void test_dispatch_cmd_deprecated(void)
>   {
> -    const char *cmd = "{ 'execute': 'test-command-features1' }";
> +    #define cmd "{ 'execute': 'test-command-features1' }"
>       QDict *ret;

That looks weird, why is this required?

  Thomas


