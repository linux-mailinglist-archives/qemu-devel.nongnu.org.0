Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4113A2DC340
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 16:39:09 +0100 (CET)
Received: from localhost ([::1]:43530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpYtO-0007uL-TH
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 10:39:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1kpYeB-0003mc-KL
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 10:23:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26304)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1kpYe4-00065R-U7
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 10:23:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608132195;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IAaAxJMCBDlyzGSD7LG5FfL1luH2HzwoKic3yjl/vZU=;
 b=OgMmQEU7l3pTxvvmUnENd5bhWkB0M3qUJ6jJXeTmsaXiCqvN42cNxZZ/GOWEi+T1HlCRIA
 KCnbKYkBMSjweVh2JEdLi6e4VhPoj5oVwiJWIHduFZgsCdyEn/CLdMa3tob1/AV/iAlXNi
 3TBn2fCuCWk3Hpqrq8NAS7YJeeN2oqs=
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com
 [209.85.221.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-295-sif2Yzg_OGuAEvIQ6wQ9kA-1; Wed, 16 Dec 2020 10:23:12 -0500
X-MC-Unique: sif2Yzg_OGuAEvIQ6wQ9kA-1
Received: by mail-vk1-f200.google.com with SMTP id l69so10456188vkl.4
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 07:23:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=IAaAxJMCBDlyzGSD7LG5FfL1luH2HzwoKic3yjl/vZU=;
 b=ravywFKszDfR9PNPNeh71sYUOOm4E5pICUbCnBSPyCQpmm4aesyQARUsMAnATqO2mx
 AhE2MgMC4+IFBsR17DVppPOMKKACIzS63ERvmi2Lbj9+747apAynn3oP/x+nO5RhakHL
 8bhs1mXlSrYRevY2rSjuseea3stn8V12e+YM5IAknVZo25cUVI3RNSXzJJCWSqTDA5y7
 f4DpdDJd/gyNF2R66q6SIYDFEhlUvV/l6smhVbRv0u1jmsSJnGpRuZpl7tyGqvoQdILd
 EjY+fzrwQh33x552PApsNBzi7L4U+Vq241aa4x9Zg+6ubrLhiC2Q7HK0fnWSq8jaAk40
 oJjw==
X-Gm-Message-State: AOAM533eNd3NrrCdQ8GCAih0Tp/7tz0Gju7QXbiEWmnZ6IidJVmviyxt
 Fn4A8aMlsMp7ogG3+O/ZNcwdj5Dk7UKPi9OXK1UdOs/U+jFf7yuCC1jEunGmPxkeUFjIyvDYHGC
 SXd4sw8ulvUrfEUPtztpD5Yjevo85g+s=
X-Received: by 2002:a1f:2c01:: with SMTP id s1mr34159679vks.11.1608132191945; 
 Wed, 16 Dec 2020 07:23:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwhiewGHXhgT0aWPzP1sRAQZjAiCrHqC+p3CKZA2Q9fBDszOZcvBau9zvi8IMpHpNy34/RuwH7/dBcghXSaD+A=
X-Received: by 2002:a1f:2c01:: with SMTP id s1mr34159649vks.11.1608132191763; 
 Wed, 16 Dec 2020 07:23:11 -0800 (PST)
MIME-Version: 1.0
References: <20201216141653.213980-1-berrange@redhat.com>
In-Reply-To: <20201216141653.213980-1-berrange@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Wed, 16 Dec 2020 12:23:00 -0300
Message-ID: <CAKJDGDZeVwQVWDTQ=MTLc7giEk5ENVHXqPurwfOW0X6NVWrhkQ@mail.gmail.com>
Subject: Re: [PATCH] tests: update for rename of CentOS8 PowerTools repo
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Fam Zheng <fam@euphon.net>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Dec 16, 2020 at 11:21 AM Daniel P. Berrang=C3=A9 <berrange@redhat.c=
om> wrote:
>
> This was intentionally renamed recently to be all lowercase:
>
> https://bugs.centos.org/view.php?id=3D17920
> https://wiki.centos.org/Manuals/ReleaseNotes/CentOS8.2011#Yum_repo_file_a=
nd_repoid_changes
>
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> ---
>
> This needs to be merged asap, as CI will break for anyone whose branch
> triggers a rebuild of the centos container image.
>
> eg current broken git master:
>
>   https://gitlab.com/berrange/qemu/-/jobs/915852165
>
> vs with this fix
>
>   https://gitlab.com/berrange/qemu/-/jobs/915862731
>
>  tests/docker/dockerfiles/centos8.docker | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


