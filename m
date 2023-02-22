Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1B2369FCF5
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 21:23:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUve0-0007xi-By; Wed, 22 Feb 2023 15:23:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pUvdy-0007xL-Vm
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 15:23:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pUvdx-0002Iz-Kn
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 15:23:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677097392;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NomgbMGoO7zwIm1EDpRtr32URYH0a8zdhztsEcBCp44=;
 b=IjBHmmr2jBxW0RJxq0c2Y2zmpxhR2GGYVHgjPyRLXNBvATta2Ecwm3q4CFd1KNCb7eKqHK
 4l6XDtmxbjl7/GIcLAoWHbf257zIGmSlV+X3GPX426kzZng7YRZ+KkjlxR2eXfuRzzf31u
 qFpALMy/TS4pC1K7pQdAXnGLGCNl5ws=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-620-kOtA7HX8O4ipUD0soFj6IQ-1; Wed, 22 Feb 2023 15:23:11 -0500
X-MC-Unique: kOtA7HX8O4ipUD0soFj6IQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 a7-20020a056000188700b002c53d342406so1888935wri.2
 for <qemu-devel@nongnu.org>; Wed, 22 Feb 2023 12:23:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NomgbMGoO7zwIm1EDpRtr32URYH0a8zdhztsEcBCp44=;
 b=z7Td1Q7MTuFzRPCfHIeXbgc7sY77xMjY6WczOfQ7rSR+uoY6oCY8hIhdB47ZxiKa9G
 wdO8ry2qge35QrhIen1/54v9y6ygCw+E9EnKdqZkg8g2cYJqw6Sew6DtgGcSCHtdUkqi
 4P78hzRj2deraN0R+P+NQ/pEJx/vkumKtEpZ/sXuC+l01Ufex0hEZo24/JqjENnEnKh5
 eK6pBsFdCSrWS3f1e8JJsakuFtlXbASRBKLV28IjzBDVIWPSQOXEAQyediicO60ipJub
 1cTaSQjUJ5mN3YdsCOk/JKd3D98wKJEKLckPw2zeq3moTRivMtVMNIi+SDXBcdIXi6yJ
 2MEw==
X-Gm-Message-State: AO0yUKXJazM/haSduZCCNDbjjftx/BpssPY/KmQWaJMb0MrJZRabCKTK
 nsGrwutb4C+7fMEquUFkbofrxDxs35ZyPSAfl2FPTymQcn65uXqGj76rh6G6TQZd1wV+7WEP05X
 XLw6wZYk4eTGBNDY=
X-Received: by 2002:a05:600c:1d15:b0:3df:e21f:d705 with SMTP id
 l21-20020a05600c1d1500b003dfe21fd705mr8210635wms.28.1677097390057; 
 Wed, 22 Feb 2023 12:23:10 -0800 (PST)
X-Google-Smtp-Source: AK7set+nBQ402YXJdQnQiKUKLaFyWuRLXZWggR/ucM02EDpI2UXGTZybLTCVWzegCV16PoZ38JjL/Q==
X-Received: by 2002:a05:600c:1d15:b0:3df:e21f:d705 with SMTP id
 l21-20020a05600c1d1500b003dfe21fd705mr8210624wms.28.1677097389758; 
 Wed, 22 Feb 2023 12:23:09 -0800 (PST)
Received: from redhat.com ([2.52.2.78]) by smtp.gmail.com with ESMTPSA id
 y24-20020a1c4b18000000b003e22508a343sm9413425wma.12.2023.02.22.12.23.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Feb 2023 12:23:09 -0800 (PST)
Date: Wed, 22 Feb 2023 15:23:05 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org, qemu-arm@nongnu.org,
 Thomas Huth <thuth@redhat.com>, qemu-ppc@nongnu.org,
 Eric Blake <eblake@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Fam Zheng <fam@euphon.net>
Subject: Re: [PATCH 5/5] hw: Remove mentions of NDEBUG
Message-ID: <20230222152205-mutt-send-email-mst@kernel.org>
References: <20230221232520.14480-1-philmd@linaro.org>
 <20230221232520.14480-6-philmd@linaro.org>
 <20230222070529-mutt-send-email-mst@kernel.org>
 <3544bf56-4d5c-174d-5bfd-a67c9689ca37@linaro.org>
 <20230222112755-mutt-send-email-mst@kernel.org>
 <275ea039-aec1-8c81-6267-4a77208840f0@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <275ea039-aec1-8c81-6267-4a77208840f0@linaro.org>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Wed, Feb 22, 2023 at 08:43:35AM -1000, Richard Henderson wrote:
> On 2/22/23 06:28, Michael S. Tsirkin wrote:
> > On Wed, Feb 22, 2023 at 05:11:36PM +0100, Philippe Mathieu-Daudé wrote:
> > > On 22/2/23 13:05, Michael S. Tsirkin wrote:
> > > > On Wed, Feb 22, 2023 at 12:25:20AM +0100, Philippe Mathieu-Daudé wrote:
> > > > > Since commit 262a69f428 ("osdep.h: Prohibit disabling
> > > > > assert() in supported builds") 'NDEBUG' can not be defined.
> > > > > 
> > > > > Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> > > > 
> > > > this exactly says NDEBUG is not allowed. why are you removing this?
> > > 
> > > The project can not be built with NDEBUG. There is no point in
> > > mentioning it in each individual function.
> > 
> > the reason we mention it is because there are security implications
> > if we don't.
> 
> Yes.  However that's not what the text being removed suggests:
> 
> > > > > -     * This is just one thing (there are probably more) that must be
> > > > > -     * fixed before we can allow NDEBUG compilation.
> 
> This suggests that we *will* allow NDEBUG, once a few things are fixed.
> 
> I strongly approve of this text being removed.
> 
> 
> r~


OK I think it's a good idea to replace it with something like

/* Note: Do not remove this assertion, doing so will break qemu security! */

-- 
MST


