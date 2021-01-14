Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 225E42F6BC5
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 21:07:06 +0100 (CET)
Received: from localhost ([::1]:54730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l08td-0003MI-3K
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 15:07:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1l08pV-0000Hi-MJ
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 15:02:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:32692)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1l08pO-0007VA-0E
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 15:02:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610654561;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bHf1JImI9bPQ2qO6IwEzMZXNYMdMdLTsAzpIVbOGQQc=;
 b=e+KYb5/t/c/+aTvubHCnXxS0zCsWdjY1GnbgGqVOOzq5Gz7qv8dQ5gOMVXA3MbgSxzc5vF
 qZjVMqp14twLE7Lzj1sseWbbVVteUxHI4xemDsVXx05Ge3BsxKTOFBUhKiS6f/gFiBLBqR
 CaNO4JuSi4HNfEpF8V4CDcjdhYsmYdA=
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com
 [209.85.221.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-136-Oj5elS2LOmmxiwN5qeXEtg-1; Thu, 14 Jan 2021 15:02:39 -0500
X-MC-Unique: Oj5elS2LOmmxiwN5qeXEtg-1
Received: by mail-vk1-f200.google.com with SMTP id m20so2749324vkk.16
 for <qemu-devel@nongnu.org>; Thu, 14 Jan 2021 12:02:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bHf1JImI9bPQ2qO6IwEzMZXNYMdMdLTsAzpIVbOGQQc=;
 b=pPAT3w2at4qhRr6tgKs17DGpNhSoCix6LWvcaHScDHTpm/ftvNkbA61ZvvupjTRfWv
 5Caob2c5PmheLIS8zVQeewrCaxkdfK5mmXPd2mbGvDc9w6RkOoMf+Xxunqr2czyrZUTq
 TkEW49aRO1B7/iWV+XE8aRlSUtt7Xrs/iRsiP05iM8fTBQQ/tTH/Pkqa+DF1/f70Cy2X
 SK/LoCIDU3mPkr2uQuPqufHQ7G3AzjWk0J5vpJTOOl8ZrKLowkuAeva1oAIEG4geZ+tw
 Cj4Q2HKnZ4Q0twmE3PT0I9axlJwwfDLfdQxp4AuLfwNlr6XYVMimW52tCJLVCkFYyfma
 4DIQ==
X-Gm-Message-State: AOAM530JWmQsh9nksX5tqu9TTvrgQRDm0D7H6qKtiwnNQteu3MpFb4rW
 3MXhr4Bc7NIdGgCN6faK8DFdXSMeQaT23mlBNk6ihnxNEU3da9PD6LxZtH5VRY+1iSTFNHFI/et
 +wSI/oNgCUQF5UrCEyc9pLXhycDYHa6M=
X-Received: by 2002:a05:6102:7d8:: with SMTP id
 y24mr8067487vsg.50.1610654558698; 
 Thu, 14 Jan 2021 12:02:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwXvGBOTXFqFyShQa6uLeXTPnMqXhpxc8tsVr7fzVxTyjgsEA6h3e6g4svhs6x3EaT5HEgXJQ/SYs9K4V0FybI=
X-Received: by 2002:a05:6102:7d8:: with SMTP id
 y24mr8067451vsg.50.1610654558516; 
 Thu, 14 Jan 2021 12:02:38 -0800 (PST)
MIME-Version: 1.0
References: <20210114170304.87507-1-mreitz@redhat.com>
 <20210114170304.87507-10-mreitz@redhat.com>
In-Reply-To: <20210114170304.87507-10-mreitz@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Thu, 14 Jan 2021 17:02:12 -0300
Message-ID: <CAKJDGDZ+NGeuXbH0WuH73JyHYYnWVrLyNQberqOqF3b5p89pRg@mail.gmail.com>
Subject: Re: [PATCH v3 09/10] iotests/129: Clean up pylint and mypy complaints
To: Max Reitz <mreitz@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-devel <qemu-devel@nongnu.org>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jan 14, 2021 at 2:41 PM Max Reitz <mreitz@redhat.com> wrote:
>
> Signed-off-by: Max Reitz <mreitz@redhat.com>
> ---
>  tests/qemu-iotests/129 | 4 ++--
>  tests/qemu-iotests/297 | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/tests/qemu-iotests/129 b/tests/qemu-iotests/129
> index 6d21470cd7..201d9e0a0b 100755
> --- a/tests/qemu-iotests/129
> +++ b/tests/qemu-iotests/129
> @@ -20,7 +20,6 @@
>
>  import os
>  import iotests
> -import time
>
>  class TestStopWithBlockJob(iotests.QMPTestCase):
>      test_img = os.path.join(iotests.test_dir, 'test.img')
> @@ -32,7 +31,8 @@ class TestStopWithBlockJob(iotests.QMPTestCase):
>          iotests.qemu_img('create', '-f', iotests.imgfmt, self.base_img, "1G")
>          iotests.qemu_img('create', '-f', iotests.imgfmt, self.test_img,
>                           "-b", self.base_img, '-F', iotests.imgfmt)
> -        iotests.qemu_io('-f', iotests.imgfmt, '-c', 'write -P0x5d 1M 128M', self.test_img)
> +        iotests.qemu_io('-f', iotests.imgfmt, '-c', 'write -P0x5d 1M 128M',
> +                        self.test_img)
>          self.vm = iotests.VM()
>          self.vm.add_object('throttle-group,id=tg0,x-bps-total=1024')
>
> diff --git a/tests/qemu-iotests/297 b/tests/qemu-iotests/297
> index bfa26d280b..1dce1d1b1c 100755
> --- a/tests/qemu-iotests/297
> +++ b/tests/qemu-iotests/297
> @@ -27,7 +27,7 @@ import iotests
>  # TODO: Empty this list!
>  SKIP_FILES = (
>      '030', '040', '041', '044', '045', '055', '056', '057', '065', '093',
> -    '096', '118', '124', '129', '132', '136', '139', '147', '148', '149',
> +    '096', '118', '124', '132', '136', '139', '147', '148', '149',

Is this also part of mypy/pylint cleanup? It seems you are doing more
than that here. It would be good to have this listed in the commit
message. Despite that,

Reviewed-by: Willian Rampazzo <willianr@redhat.com>

>      '151', '152', '155', '163', '165', '169', '194', '196', '199', '202',
>      '203', '205', '206', '207', '208', '210', '211', '212', '213', '216',
>      '218', '219', '222', '224', '228', '234', '235', '236', '237', '238',
> --
> 2.29.2
>
>


