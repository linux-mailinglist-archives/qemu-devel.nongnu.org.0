Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8848F6A47A9
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 18:15:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWh4N-0002WE-Nc; Mon, 27 Feb 2023 12:13:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pWh4K-0002H8-23
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 12:13:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pWh4G-0005Gj-8q
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 12:13:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677518019;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T097oCflhdyY38IK2jdHpgB2HohxHNoOizvTylnaJ7c=;
 b=LUp6t4ym40jb66mhfRYqke6n6AUuTmcet+Mdd9A60eZkJho38/MM2UeVX8PbungMCYXEGL
 pCDEkMTPJqFOdNZfLEjh7DmjciuLGcAp80Vhu7Tn/8Acx1zD6C07wxqTP4WTiVU0qWLC5C
 +h68n6QiNVGcmNA/b+wJFd71VR4yO5U=
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-607-yCp-azP8MkuqV_yTqlMdog-1; Mon, 27 Feb 2023 12:13:34 -0500
X-MC-Unique: yCp-azP8MkuqV_yTqlMdog-1
Received: by mail-io1-f71.google.com with SMTP id
 v4-20020a6b5b04000000b0074cb180c5e2so4414139ioh.6
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 09:13:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:organization:references
 :in-reply-to:message-id:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=T097oCflhdyY38IK2jdHpgB2HohxHNoOizvTylnaJ7c=;
 b=5X7hXq4Re2DHcP0WVPAQdWghejMCD9IOTbJSxwUN/SSV6mb9ba/IKvcAwxePlyxHcm
 HtoQUL/+2ITGLjAmLIv8RD1sCea+EVm3B0A/4UoXkyaHthJrOwk/wjGpkjl50cSSISgf
 VppCJ3nenT0MZ2luXe274Gi1dvgM0C82xrKz8390yvc9Y1TSiB20zWpUZlQcxGWggJKt
 qSsyaoB7QAzI3K947xVLFoPOGFbto28UgrKDLBrAU8w/9peApFmQtW2VlPagwVR3Q8Rr
 segoX6hml4SWFq10JJ2RVcU3hNkCjugEPSJbBrafKyjtz80SVjSXKyttTdn1l7344fLH
 oJ3A==
X-Gm-Message-State: AO0yUKXt/im6v4k84pNtgEPgHN35y4wPk4Qw9JKqObGw0AAJyBQBy5xq
 YLDqAyj53OtJtZ5VaWosQ8ChOvXLJ2Awq2FpMEC/luVUVvzJ2tBzvr3MEpEL6V8/Sk61L3wZXCY
 utD3eZBT8xSV2+1s=
X-Received: by 2002:a05:6e02:1d05:b0:315:9959:c1c5 with SMTP id
 i5-20020a056e021d0500b003159959c1c5mr7009394ila.3.1677518008009; 
 Mon, 27 Feb 2023 09:13:28 -0800 (PST)
X-Google-Smtp-Source: AK7set8tq8GM91oZ0A8YBsgh8eCvtqnAbttTwcOBlunaqN9G/VUDRf3r1jjm2kg1la96rUeoMB8M0g==
X-Received: by 2002:a05:6e02:1d05:b0:315:9959:c1c5 with SMTP id
 i5-20020a056e021d0500b003159959c1c5mr7009379ila.3.1677518007764; 
 Mon, 27 Feb 2023 09:13:27 -0800 (PST)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 a25-20020a029999000000b003c50e23ef4esm2222021jal.74.2023.02.27.09.13.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 09:13:27 -0800 (PST)
Date: Mon, 27 Feb 2023 10:13:25 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Alex =?UTF-8?B?QmVubsOpZQ==?= <alex.bennee@linaro.org>
Cc: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>,
 =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@redhat.com>, Thomas Huth
 <thuth@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH 1/2] hw/vfio/migration: Remove unused 'exec/ram_addr.h'
 header
Message-ID: <20230227101325.1ba4f5c4.alex.williamson@redhat.com>
In-Reply-To: <87o7pfgjm6.fsf@linaro.org>
References: <20230227103258.13295-1-philmd@linaro.org>
 <20230227103258.13295-2-philmd@linaro.org>
 <20230227084621.15cab9da.alex.williamson@redhat.com>
 <87o7pfgjm6.fsf@linaro.org>
Organization: Red Hat
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, 27 Feb 2023 16:24:16 +0000
Alex Benn=C3=A9e <alex.bennee@linaro.org> wrote:

> Alex Williamson <alex.williamson@redhat.com> writes:
>=20
> > On Mon, 27 Feb 2023 11:32:57 +0100
> > Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> wrote:
> > =20
> >> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> =20
> >
> > Empty commit logs are a pet peeve of mine, there must be some sort of
> > motivation for the change, something that changed to make this
> > possible, or perhaps why this was never necessary.  Thanks, =20
>=20
> I think that is a little unfair for this case as the motivation and
> action are all covered by the summary line. Granted the overall goal is
> covered by the cover letter and the following patch however for this
> patch I would hope its self explanatory.

The commit title only conveys that the include is unused and the action
to therefore remove it.  The motivation is actually to create target
independent objects and the specific reasoning here is that not only is
this include file unnecessary, but forces per target builds.

This is exactly the "barrier to entry" I mention to Peter, it's obvious
to the experts in the crowd, but it provides no underlying direction
for those who might be more novice.  There is always some reasoning
that can be included in a commit log beyond the simple "a therefore b"
of the commit title.  Thanks,

Alex


