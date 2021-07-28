Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D1353D9611
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Jul 2021 21:32:55 +0200 (CEST)
Received: from localhost ([::1]:60096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8pIU-0005Yp-6Z
	for lists+qemu-devel@lfdr.de; Wed, 28 Jul 2021 15:32:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1m8pGQ-0004Hw-Hz
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 15:30:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24289)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1m8pGJ-00041G-IO
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 15:30:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627500637;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ep/Dva8z7hYY53Jz7pw17csWph1G6d8ftkEehvx+Jgw=;
 b=Ij88e/mpNKNadz/cLQ+IFF0m9ACpvAIynJ8r5G5nmaf4RrJm/hxPQZIPs6WU2YRFTxchJj
 0wiczpsvyiLYpj31c24gAM3YQGzpOacoPYjDuKO4d8UkqKW5bzUYM5FHV01IcrEb35iEe6
 6mWgWTR4qlvKhIvKcFI+iK4SZn7GrP8=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-10-xmVoBA9KMrGus8iHVId6Tg-1; Wed, 28 Jul 2021 15:30:33 -0400
X-MC-Unique: xmVoBA9KMrGus8iHVId6Tg-1
Received: by mail-pj1-f71.google.com with SMTP id
 pg12-20020a17090b1e0cb0290177328fc06dso3905614pjb.2
 for <qemu-devel@nongnu.org>; Wed, 28 Jul 2021 12:30:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ep/Dva8z7hYY53Jz7pw17csWph1G6d8ftkEehvx+Jgw=;
 b=HZu4O9/dlfa5EwvyveO89Vg9YOPrmP95RH+R9jCT3NKBnDmoZwFYrfxvqa10uD1o2G
 i07nBDCQ08yVIs2ThJYfw978pn8T6njsfSUlNwXXOKjvF/Bj3d5S60ti9vfnCJkSN01n
 szGKTEMg++xQCjXFmaziLHNrY66z+vtBWeF65Ukx0feCUAdeV4qy1d2Sgbx+/aQKMb/X
 Utujo2z4dIzATVamN4ZQbW/Dy0L/AYaiueRbotwVUKvYuu7Lm1eUXcsfz1ZpT0u0Cheh
 7dnLNcsIqaFxBS1K/gpWsKCn2/0QilguvpRmnthag4bWbeqomBxTvulmSppaFBxgF88Y
 OqrA==
X-Gm-Message-State: AOAM533LENwaxpdHB2g004klOMBTc3DN3SliD21sGBAt5Ls/st+oz2GF
 Qks5sfbxQI3d0mYKm3eUqTVn+Rw9OuOKziMp4Vmu1xjfj65vFx/mFzJoOsSh8Jh0mTXvhDUc5qV
 WbYPFRgowZdEMN6XciIN9YJCirFVGoX4=
X-Received: by 2002:a17:902:d681:b029:12b:381c:c86 with SMTP id
 v1-20020a170902d681b029012b381c0c86mr1206110ply.46.1627500632780; 
 Wed, 28 Jul 2021 12:30:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwQLNZexbY9Llw/h0VV7brD/odaCDmeOZ6s6Trn6G6u/aGENpWz5zHxV35XOguE2+2XqHwP/HMw+huvTizY3Fo=
X-Received: by 2002:a17:902:d681:b029:12b:381c:c86 with SMTP id
 v1-20020a170902d681b029012b381c0c86mr1206086ply.46.1627500632520; Wed, 28 Jul
 2021 12:30:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210728173857.497523-1-thuth@redhat.com>
In-Reply-To: <20210728173857.497523-1-thuth@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Wed, 28 Jul 2021 16:30:05 -0300
Message-ID: <CAKJDGDY822PrOL5iy12jg-OsQtiju_oKDGtM04NATHjig12VjQ@mail.gmail.com>
Subject: Re: [PATCH] gitlab-ci.d/custom-runners: Improve rules for the staging
 branch
To: Thomas Huth <thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) DKIMWL_WL_HIGH=-0.719, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Cleber Rosa Junior <crosa@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jul 28, 2021 at 2:39 PM Thomas Huth <thuth@redhat.com> wrote:
>
> If maintainers are currently pushing to a branch called "staging"
> in their repository, they are ending up with some stuck jobs - unless
> they have a s390x CI runner machine available. That's ugly, we should
> make sure that the related jobs are really only started if such a
> runner is available. So let's only run these jobs if it's the
> "staging" branch of the main repository of the QEMU project (where
> we can be sure that the s390x runner is available), or if the user
> explicitly set a S390X_RUNNER_AVAILABLE variable in their CI configs
> to declare that they have such a runner available, too.
>
> Fixes: 4799c21023 ("Jobs based on custom runners: add job definitions ...")
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  .gitlab-ci.d/custom-runners.yml | 40 +++++++++++++++++++++++----------
>  1 file changed, 28 insertions(+), 12 deletions(-)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


