Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5098669F842
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 16:44:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUrGc-0000W8-PV; Wed, 22 Feb 2023 10:42:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pUrGX-0000VQ-FY
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 10:42:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pUrGU-00039X-W7
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 10:42:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677080562;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OZs2O57QtzlIYiAw69fPIwHhPUD376Yn76VNAOdp8tg=;
 b=ROQFwID6aY2CkbMYb9HnCi/yZg4z6cVxsi+ekVEtt/JCZt09JBdPiGwJTd3k7179AHhUsb
 l0Hce58FmAZkpSmcbIFmg1C98E9RFqVzgeSzir3ZUfm14xbzBkN91CbIXobyHa8PZYr4fX
 ccrBFW84KTxZMP+wpGAzbCaexvenTSk=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-654-AN3tqlKSN3SzMkw3EoyxIw-1; Wed, 22 Feb 2023 10:42:39 -0500
X-MC-Unique: AN3tqlKSN3SzMkw3EoyxIw-1
Received: by mail-pj1-f70.google.com with SMTP id
 c13-20020a17090ab28d00b0023406b78560so3062816pjr.8
 for <qemu-devel@nongnu.org>; Wed, 22 Feb 2023 07:42:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OZs2O57QtzlIYiAw69fPIwHhPUD376Yn76VNAOdp8tg=;
 b=GuWz2sEv5HPc6ym0Tjn787j160urejdOpNchF5CoArWMaGxc/B14NnxfUX6SR2cG0n
 /QpdjyU0bMc8PIEeLYdQwqIqb9GH11AFEgH8zLllY5X5wckS9YEcw7eKpOXprFYav8dr
 BFJoS1Vd/7fhVAJp6jPUT87FcHYc6cRRrTx+6c+RVCLnt3htO8PX0EhfVx5HGOU+wUX9
 r8pCb86XFTRy2UbSsZ9+POu1oT7eEVCsCp5/YgnwkKnCSXu6nZc5Ia+wlKatizYnR2eS
 douJPHlbc4P+xOBuDjT1/3MpjD9aAN7Zx4dqhXot934dbOdjRwTy2RIWQGcnA2z03P5N
 OYkQ==
X-Gm-Message-State: AO0yUKUNcXAlZgCdyAvZu/C08IsltxTodAFjVJy0zprkxbH4wTNHHd4R
 GX3P6Ch6rXv/yVHfRwg/7EEddV77e59ev/yt5DNe5azrMEb5wbbeCd+TaVoLjQ7IcuHwCl+bBoA
 j1qTW2dDhCeb40o3SD6BMYqqk8SLp+oM=
X-Received: by 2002:a17:902:e888:b0:196:8798:404f with SMTP id
 w8-20020a170902e88800b001968798404fmr1379229plg.5.1677080558563; 
 Wed, 22 Feb 2023 07:42:38 -0800 (PST)
X-Google-Smtp-Source: AK7set+Xsl2JcqNmPE5KhoDCUGU2Y90+DZX/hNJEFL3WD9+VIafy7AyWPa8PZg0u7FgH4WuIOPcWyiTvMAGfziHciqc=
X-Received: by 2002:a17:902:e888:b0:196:8798:404f with SMTP id
 w8-20020a170902e88800b001968798404fmr1379225plg.5.1677080558200; Wed, 22 Feb
 2023 07:42:38 -0800 (PST)
MIME-Version: 1.0
References: <20230222143752.466090-1-pbonzini@redhat.com>
 <20230222143752.466090-5-pbonzini@redhat.com>
 <Y/YvEClRN4wRmjAH@redhat.com>
In-Reply-To: <Y/YvEClRN4wRmjAH@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 22 Feb 2023 16:25:08 +0100
Message-ID: <CABgObfZBUiOC51KiZMUBgBir3r9K=rF7ZbqW-wmeNwimSFoU3g@mail.gmail.com>
Subject: Re: [PATCH 04/10] configure: protect against escaping venv when
 running Meson
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, jsnow@redhat.com, peter.maydell@linaro.org, 
 thuth@redhat.com, alex.bennee@linaro.org, armbru@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
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

On Wed, Feb 22, 2023 at 4:04 PM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m> wrote:
> > So, detect whether a virtual environment is setup, and if the virtual
> > environment does not have Meson, use the meson submodule.  Meson will
> > then run under the virtual environment's Python interpreter.
>
> I fear this could be somewhat confusing to contributors. If I have
> meson in my $PATH, at a sufficient version, it would be surprising
> to find QEMU had been using a different version instead.
>
> I can understand wanting to make it "just work", but should we
> perhaps issue a warning from configure when we're intentionally
> ignoring an otherwise valid meson installation ?

I don't think a warning is needed. First, the exact Meson version
should be pretty much neutral to the rest of the build system, and
QEMU should ship a good one (Meson's .0 releases aren't of the best
quality). Second, after all the user has _not_ specified --meson at
all in this scenario.

FWIW I think --sphinx-build and --meson should go away, and the single
way to invoke Python packages should be through $python. This means
that sphinx-build would have to be installed in $python's search path
or, in the future, installed via pip (same for meson once we decide
that it's okay to remove the bundled copy).

Overall, the result will be much more intuitive even if it may seem to
be a "less standard" setup. Both sphinx-build's and meson's
interpreters influence which interpreter is used during the build, and
it's confusing if it is anything but --python.

Paolo


