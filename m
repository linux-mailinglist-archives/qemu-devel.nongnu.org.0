Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07C13534E9C
	for <lists+qemu-devel@lfdr.de>; Thu, 26 May 2022 13:52:35 +0200 (CEST)
Received: from localhost ([::1]:51566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuC2b-0004oo-LI
	for lists+qemu-devel@lfdr.de; Thu, 26 May 2022 07:52:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1nuBKA-0007aH-JG
 for qemu-devel@nongnu.org; Thu, 26 May 2022 07:06:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58748)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1nuBK7-0003FP-86
 for qemu-devel@nongnu.org; Thu, 26 May 2022 07:06:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653563194;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5AOCKMnRthII/jcSrXlOblfI4KKz232aYEIs5MpCUbc=;
 b=CxfbBYg3NK6QBzSUAQ6vnP2drXI69o+pzvQfJAIWNeN2MnYGdyNEGbIMeBXpjhfG3JseBF
 Z5p/GdQHbnW3lkgyncHxoXBQuWe7obc95AXlN40MBEXZhhKExdtjQdQAqrpZ7usoOZfXXV
 +yBeFt9yaWKE1rEy3bs9wvvvXy0m9F8=
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-49-F-HmU1BaM4ikmc0Rka2_cw-1; Thu, 26 May 2022 07:06:32 -0400
X-MC-Unique: F-HmU1BaM4ikmc0Rka2_cw-1
Received: by mail-il1-f199.google.com with SMTP id
 m9-20020a056e021c2900b002d13627892eso872833ilh.20
 for <qemu-devel@nongnu.org>; Thu, 26 May 2022 04:06:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5AOCKMnRthII/jcSrXlOblfI4KKz232aYEIs5MpCUbc=;
 b=3y4ry0pYYpXU4yuV+JXcL2n3T1ysyZUk6FaBG2W9ktkzJXu7vk7tsMSl0Dh4TswA9O
 gmQSv/FHh2J9ezdKG/icAPNRb2G12nYxUQLh7JLpyP/yeYz5l/1Qj6mSFtUmb7QAihEU
 2jQKy7Z1Gx3e2+Mu6+m0ozfmQ6/lDWwTQFqYnRGXL7orVdRSd/mQzqY3QLwMFl97trLf
 CfCG6j4fW6IJ/FSQgri3CN3A6rg0VfpwQv8eFz+QFhY9y4Jy36G9XANPWW/NjFTA2c6p
 bCYHGSAimb4m2txDfiCVPHrRL/afZ+x2IJQsu16BVeyyI8xPxhqBgbotxSCEYYjxdf1c
 3dKg==
X-Gm-Message-State: AOAM532UMoJyox/kU7umGgPJadrfmGM0sRSRfls+nGp79tnTZNu/yhvR
 VAuI3RAB2Uxy7aTrgXPoENdIEvsRpd5mOcDGoyEoDsgL1UX/H3sTqd0bRCxJlFOIitFYEg/+OCb
 JjjLC7hD7HaV8MRv0ex2geDrVWPTCEV4=
X-Received: by 2002:a92:cda6:0:b0:2d1:bc06:1d9b with SMTP id
 g6-20020a92cda6000000b002d1bc061d9bmr8107974ild.16.1653563191898; 
 Thu, 26 May 2022 04:06:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxZ5SJiZIImVFkJVipWU501jQ1UV2yHhNwoqY7yM5UCT2o4nQ4ZPFse67e3Ue5D7vrIB27DwstT9fTu2YtlHlA=
X-Received: by 2002:a92:cda6:0:b0:2d1:bc06:1d9b with SMTP id
 g6-20020a92cda6000000b002d1bc061d9bmr8107955ild.16.1653563191690; Thu, 26 May
 2022 04:06:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220519144841.784780-1-afaria@redhat.com>
 <20220519144841.784780-7-afaria@redhat.com>
 <Yo9BkD5gNPSVwHgn@stefanha-x1.localdomain>
In-Reply-To: <Yo9BkD5gNPSVwHgn@stefanha-x1.localdomain>
From: Alberto Faria <afaria@redhat.com>
Date: Thu, 26 May 2022 12:05:55 +0100
Message-ID: <CAELaAXwmOZsJWsUW=aqSHBj_bh-c8mL22JvcX+4+CBKS4ZSsBA@mail.gmail.com>
Subject: Re: [PATCH v3 06/10] block: Make 'bytes' param of bdrv_co_{pread,
 pwrite, preadv, pwritev}() an int64_t
To: Stefan Hajnoczi <stefanha@redhat.com>, Eric Blake <eblake@redhat.com>
Cc: qemu-devel@nongnu.org, "Denis V. Lunev" <den@openvz.org>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>, qemu-block@nongnu.org, 
 Kevin Wolf <kwolf@redhat.com>, John Snow <jsnow@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, 
 Stefan Weil <sw@weilnetz.de>, Jeff Cody <codyprime@gmail.com>,
 Fam Zheng <fam@euphon.net>, Ari Sundholm <ari@tuxera.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=afaria@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Thu, May 26, 2022 at 10:00 AM Stefan Hajnoczi <stefanha@redhat.com> wrote:
> Maybe let the existing bdrv_check_request32() call in bdrv_co_preadv()
> check this? It returns -EIO if bytes is too large.

I'd be okay with that. Does this warrant changing blk_co_pread() and
blk_co_pwrite() as well?

Eric, what do you think?


