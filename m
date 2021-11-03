Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C97844469B
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 18:06:04 +0100 (CET)
Received: from localhost ([::1]:47240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miJi6-00028a-QB
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 13:06:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1miJgA-0000kx-7E
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 13:04:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25058)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1miJg8-0003Gg-71
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 13:04:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635959039;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DWjHljkY7gWe5x6Uuu2j7XAzN83AsH9ey4m/laKSshM=;
 b=YX99IBsSr17mv7Mc3gpVchZZAEbdgHNxzoCahETN21zSIevTVBV/XMRztGh6NusQ04ysfY
 IKFAYWWJak0Zw+jv6nSrmOdNUJqdVPRvpeW733hKwoNnE9C7IjhsTa60TSOsau2IXbIpl1
 +rnLs5Pue6OwfKS+A4KFOOec1x4HC0s=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-506-BSRoiFH2NzKdTExjJjslrQ-1; Wed, 03 Nov 2021 13:03:53 -0400
X-MC-Unique: BSRoiFH2NzKdTExjJjslrQ-1
Received: by mail-pf1-f197.google.com with SMTP id
 o202-20020a6292d3000000b00480ffe3c3baso1677683pfd.12
 for <qemu-devel@nongnu.org>; Wed, 03 Nov 2021 10:03:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DWjHljkY7gWe5x6Uuu2j7XAzN83AsH9ey4m/laKSshM=;
 b=FzBBDbYdBNMY0rGtAv2qj7yj/viXbXVGQT66u46or1D8ju1ReaHOaorzbRUMO4yEdz
 5G7JXlPtLGW7T/1rpk8mBLpszAt4Kllc19L3lQQ5Hr++R4h2sHCZvpP8DjmERbCqYcuP
 +TT4isA7CleqR8hwjIVbhbewn8xbOVTYtdg8tZQf8Jq42BHC9ZmSXvY2bD81s0wdz4fN
 1SVgjQvxMlyEhvU1DVk8IBaznaqT3VQVuXtxCW+CzN6EInyF3GStBsSvX94WEAMm87En
 rJMeZji1i81b7tAes9IVvJJsDLAQ+UEnRli9I4Uh5ZXGMP22VMwj/wUxkigrpnN75pwX
 E1Gg==
X-Gm-Message-State: AOAM533n30yTPEia92LcQcaumHmmcdZGAmzjZQDJtkYUgdX02gFmb9GT
 +x/oeKJtxIS6SfeSgCqURYWoLkWLJtj9Mvn7+DaBEMcpxwJQa/G/9Wns6xHFd7CGoqCxd/Jn8Fi
 jsrS+/CWF47j92yV+siP53E4HY5PHdxw=
X-Received: by 2002:aa7:8b56:0:b0:44c:10a:4ee9 with SMTP id
 i22-20020aa78b56000000b0044c010a4ee9mr46223552pfd.46.1635959031987; 
 Wed, 03 Nov 2021 10:03:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwOXsHn2gZnLxaiXAiW0d6lqA9T5eXTi+Q0wUCl6JTdr1Z8KE8B68nbwhWF+LZPJyNpQQRnhIKtL5UL41jZpIQ=
X-Received: by 2002:aa7:8b56:0:b0:44c:10a:4ee9 with SMTP id
 i22-20020aa78b56000000b0044c010a4ee9mr46223501pfd.46.1635959031641; Wed, 03
 Nov 2021 10:03:51 -0700 (PDT)
MIME-Version: 1.0
References: <20211103081459.369912-1-pbonzini@redhat.com>
In-Reply-To: <20211103081459.369912-1-pbonzini@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Wed, 3 Nov 2021 14:03:25 -0300
Message-ID: <CAKJDGDaq_mRY+wmN_Vdw1VTuHoAYkcGp20MRr3yneQuRpu7dLQ@mail.gmail.com>
Subject: Re: [qemu-web PATCH] remove deployment phase from CI
To: Paolo Bonzini <pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Nov 3, 2021 at 5:16 AM Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> qemu.org is now served via a reverse proxy from qemu-project.gitlab.io; it does
> not need anymore the rsync step to the QEMU project\s shell server.
> Remove it from the CI.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  .gitlab-ci.yml | 24 ------------------------
>  1 file changed, 24 deletions(-)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


