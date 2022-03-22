Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 359D64E44DD
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 18:18:06 +0100 (CET)
Received: from localhost ([::1]:54342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWi8z-0001aU-0P
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 13:18:05 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nWi7v-0000oR-7U
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 13:16:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29059)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nWi7q-0008Dv-Rm
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 13:16:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647969413;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uwB4SSqf/SktOs0ivHuA26TeYqMvjr8vdYHkZO+OXw8=;
 b=CwuDbUoSbKSi5Kk6eYKiOj2B0DzFbH5/TAnQCq71w3guvN+d5Zs4TzSC88tGf8hVrEqfbb
 3mvWXfM9OsqP2e9NJ3u5wXrJIPipxDhNMKU59j504mvUDMH9KDM7S/78df/Q1iJILSqY1y
 mB+z3xPfceL5FvwBpUCjhCrxxPNRB+Y=
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com
 [209.85.221.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-673-hdIV_MKiOteXBj21s3NJcQ-1; Tue, 22 Mar 2022 13:16:52 -0400
X-MC-Unique: hdIV_MKiOteXBj21s3NJcQ-1
Received: by mail-vk1-f197.google.com with SMTP id
 e79-20020a1f1e52000000b0033ecfa8aa1fso1797997vke.11
 for <qemu-devel@nongnu.org>; Tue, 22 Mar 2022 10:16:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uwB4SSqf/SktOs0ivHuA26TeYqMvjr8vdYHkZO+OXw8=;
 b=ebXws4K553pia3htawNa/L4k2P86dzuAgA2RpCC9+4OZ30eOUidGxcE26JER8tnX9C
 GOQvRZsldfqDjXQl1wIJntzi+i5LCJTDaPrLFYm/ZKarbr5opB9/xuNVKIWpFgaazer3
 kph8bNHEdFUOOMy2rIXAvovpzFsHK+/nsvqYIFKjKnc9iXKYq20zK21yNouk+9LKB5CX
 mGcu/obRYMxRnfLQX8GbGMEoac3NioHxd/FNsVAI8muHABLh6UGoalh9kWQ7Cl0DPYdU
 B8ss0IuTh06efQcrX21XneXiCyz8znWKXANOVKNQZ4roFxbEVhD9E5dGVkwbf80Lk9FY
 ML0g==
X-Gm-Message-State: AOAM533Ssfh7VO87va62P6YnuMJNDjDg93wMD5OcV6CBeigMI0+u2c4W
 vPRBH/CxS+/zPraW2/iXC3JFKo1CUfZbBlc9AauAe59wnmZIoT1FnzG42ZnGeayJBXISXhEP79B
 CwuZ4Qfcxooo6VCRgfrKU0UVCjnrN/50=
X-Received: by 2002:a67:17c4:0:b0:322:cfd8:15a1 with SMTP id
 187-20020a6717c4000000b00322cfd815a1mr9313245vsx.61.1647969412267; 
 Tue, 22 Mar 2022 10:16:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzgAkxYSLgK/1hEpyOAR0bQGLNnkmxFzk/A6cMqiJc7K9HDG1dNJPEAL+TIgQcZmuYAOWSRY2kNEtU4BqUZUus=
X-Received: by 2002:a67:17c4:0:b0:322:cfd8:15a1 with SMTP id
 187-20020a6717c4000000b00322cfd815a1mr9313234vsx.61.1647969412109; Tue, 22
 Mar 2022 10:16:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220318203655.676907-1-jsnow@redhat.com>
 <20220318203655.676907-15-jsnow@redhat.com>
 <6d1bcfb1-312c-f36b-e512-f4091af37084@redhat.com>
In-Reply-To: <6d1bcfb1-312c-f36b-e512-f4091af37084@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Tue, 22 Mar 2022 13:16:41 -0400
Message-ID: <CAFn=p-baLoYxX2Dxtk85H-X+=uNQw+k7BM_QWH3_V0pTgVtpkQ@mail.gmail.com>
Subject: Re: [PATCH 14/15] iotests: remove qemu_io_silent() and
 qemu_io_silent_check().
To: Hanna Reitz <hreitz@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 22, 2022 at 1:00 PM Hanna Reitz <hreitz@redhat.com> wrote:
>
> On 18.03.22 21:36, John Snow wrote:
> > Like qemu-img, qemu-io returning 0 should be the norm and not the
> > exception. Remove all calls to qemu_io_silent that just assert the
> > return code is zero (That's every last call, as it turns out), and
> > replace them with a normal qemu_io() call.
> >
> > Signed-off-by: John Snow <jsnow@redhat.com>
> > ---
> >   tests/qemu-iotests/216                        | 12 +++++-----
> >   tests/qemu-iotests/218                        |  5 ++---
> >   tests/qemu-iotests/224                        |  4 ++--
> >   tests/qemu-iotests/258                        | 12 +++++-----
> >   tests/qemu-iotests/298                        | 16 ++++++--------
> >   tests/qemu-iotests/310                        | 22 +++++++++----------
> >   tests/qemu-iotests/iotests.py                 | 16 --------------
> >   tests/qemu-iotests/tests/image-fleecing       |  4 ++--
> >   .../tests/mirror-ready-cancel-error           |  2 +-
> >   .../qemu-iotests/tests/stream-error-on-reset  |  4 ++--
> >   10 files changed, 39 insertions(+), 58 deletions(-)
>
> qemu_io_silent_check() was unused anyway, right...?
>
> Reviewed-by: Hanna Reitz <hreitz@redhat.com>
>

As far as I can tell.


