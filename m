Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E078F3B95D5
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Jul 2021 20:02:10 +0200 (CEST)
Received: from localhost ([::1]:44552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lz10r-00064E-Ep
	for lists+qemu-devel@lfdr.de; Thu, 01 Jul 2021 14:02:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1lz0yZ-0005D8-Ev
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 13:59:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31997)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1lz0yU-0008KK-Rg
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 13:59:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625162378;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=096pTFbky0tBM8sjRAUFjBkjaha4REpJ1g+WyABWgc0=;
 b=f13xEkaH9DYZMj5MOQOr1w3p230d5NE1v+hsbyZ3Wlye8FaR3Sr/xDsUJK/A4g2oqHI8M5
 BVwFfQ9/0VBxGwnzzhDibwXIqOX1Bd1sqzGLPTUAcPqVoFW9Hk3Bxs25wj1rkCj2AE30Vf
 eooLsKFpszeNWaTTwfAZomflOnl6EeI=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-306-hi6HFXw6Mva3tcUB6Llo9g-1; Thu, 01 Jul 2021 13:59:37 -0400
X-MC-Unique: hi6HFXw6Mva3tcUB6Llo9g-1
Received: by mail-wr1-f71.google.com with SMTP id
 u16-20020a5d51500000b029011a6a17cf62so2867896wrt.13
 for <qemu-devel@nongnu.org>; Thu, 01 Jul 2021 10:59:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=096pTFbky0tBM8sjRAUFjBkjaha4REpJ1g+WyABWgc0=;
 b=gZMpF+LOdvNhmYB5/UmJgTpJvR71MG87SiBwe+2V3UU60+GkvrpZHflhfsEkhFUmBJ
 ZLYHhhiljHThscUAaPHOylJXfo/DfCd1Lw/wbkpxFHWZCelTK9ki4HZ9VjKpPrqDFEa9
 hX90ZikAsnGjHbeOSCdUL50vXXzbICXk0wDEttlhWraNPqn9coaJBYWwcnPopdQC9PRa
 DgSsQKMHi3hykWDP5MXTWfi3xKN7nhV4nyc2TqUsMj3d/6yVVacwNwD9XNl7QW9DDEKZ
 HKjs4P6NEPc0Pusgx298gqNICf2iZRRSCmTB7G8GJmkjvTvaL7iB1G1+ivnwdSufBprT
 2h8Q==
X-Gm-Message-State: AOAM532KTX9yc05BN9dAvdOmVKaCx8nBo8qRPKULZtCd2mUCrBMpHKTc
 NFucoBcTdEQi4I4Idi3Z1oXIVCnmmyZATxzFw72z0HCvYxdJqAY8k5iZ2Ww2omUMHmLPWwCd/9D
 EgPXBF0CaI2vd9pk=
X-Received: by 2002:a05:600c:4410:: with SMTP id
 u16mr971523wmn.143.1625162375910; 
 Thu, 01 Jul 2021 10:59:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwQoJzL3Xr7m4d68pymC3fNcjoKaoX6TmP3KPL/chZBIv6rWGe/Ri2bEQgtORyPYz0pYlSK3w==
X-Received: by 2002:a05:600c:4410:: with SMTP id
 u16mr971490wmn.143.1625162375689; 
 Thu, 01 Jul 2021 10:59:35 -0700 (PDT)
Received: from localhost (62.83.194.64.dyn.user.ono.com. [62.83.194.64])
 by smtp.gmail.com with ESMTPSA id d17sm622866wro.93.2021.07.01.10.59.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Jul 2021 10:59:35 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Subject: Re: [PATCH] migration: failover: emit a warning when the card is
 not fully unplugged
In-Reply-To: <20210701131458.112036-1-lvivier@redhat.com> (Laurent Vivier's
 message of "Thu, 1 Jul 2021 15:14:58 +0200")
References: <20210701131458.112036-1-lvivier@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
Date: Thu, 01 Jul 2021 19:59:34 +0200
Message-ID: <87pmw1ykxl.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.402,
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
Reply-To: quintela@redhat.com
Cc: qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Laurent Vivier <lvivier@redhat.com> wrote:
> When the migration fails or is canceled we wait the end of the unplug
> operation to be able to plug it back. But if the unplug operation
> is never finished we stop to wait and QEMU emits a warning to inform
> the user.
>
> Based-on: 20210629155007.629086-1-lvivier@redhat.com
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>


