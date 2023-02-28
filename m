Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D228B6A5B31
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 15:58:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pX1Qw-0007cB-0z; Tue, 28 Feb 2023 09:58:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pX1QW-0007PM-K7
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 09:58:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pX1QU-0002dc-Ux
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 09:58:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677596278;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iWpMszcCJXWCpgiuRnvs+fw7ApHP2G3OFxEc3YYrYzo=;
 b=CeNpL5eE9+QSeKugYYjAVjgRDSNmRN2XrgCqcgpwpAhRxO1tJE1fac0wDd4AGCE1RphXB+
 Ggi0MapVnraafLNGboTkpWv5/ShgaV0+nWWgrUpslOO6zruPcFYNJas/CZ48pbxUxpXZ6+
 Qy6X6Mk8nGlOeLbz0rgBj6UZs0AFXIU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-664-EyoB-UezNwS7Vy2J_1nWFg-1; Tue, 28 Feb 2023 09:57:56 -0500
X-MC-Unique: EyoB-UezNwS7Vy2J_1nWFg-1
Received: by mail-wm1-f70.google.com with SMTP id
 az12-20020a05600c600c00b003e8910ec2fdso3709948wmb.6
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 06:57:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677596275;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iWpMszcCJXWCpgiuRnvs+fw7ApHP2G3OFxEc3YYrYzo=;
 b=ZKXT+mdrFTsJeGgdCty91GnUA9Ca5f+ngyDxINDjFOQErNhXq3kPuxvR8M4FLqnUHj
 9sJyancflvNgSHcNPqLM50lX9kyLpOhZpKjreB8BWOgif35SheBxL48BlC/x5vWD+/UO
 epS3XYi5nmQUx0Fw1mdFVLFhl/EZDRi/735te/WiQ/5FuNxJMv+3Wozw4y0K39u/nYY3
 IYEMHqRhBoBRhB5boxOLHOGSJv0bCCwPiYLAX9s1WZJzRRUk03vlocWc37W4wH3sF9Gk
 bmhRscIs+/EnCZwRQDXjNqBNNmFTjEOax/l0qRTOlZ7eEGLb59DxMS943JjPKBhiqqvl
 mwhA==
X-Gm-Message-State: AO0yUKU5baiLsnAENyyMkOBK5AYbtgDkGv6yVjIRF703DGJ7JEiMtgQd
 dghtqK9OEyoiYFmxZjUn6PxsYclPMQkhjr5bgzNC97JQZsqBeHKt+wz+e5RxbCY2zZtpCOnC6K+
 y5QSeGmm0ww4xNiM=
X-Received: by 2002:a5d:428e:0:b0:2c7:a3c:5b90 with SMTP id
 k14-20020a5d428e000000b002c70a3c5b90mr2138764wrq.9.1677596275465; 
 Tue, 28 Feb 2023 06:57:55 -0800 (PST)
X-Google-Smtp-Source: AK7set9qPD1X1ugrnYjzXkrbYvs2CKaGwPZ4zk0tjqurktVVPxpvOhB4RnDC7c+yuRecJzzLOXY7Aw==
X-Received: by 2002:a5d:428e:0:b0:2c7:a3c:5b90 with SMTP id
 k14-20020a5d428e000000b002c70a3c5b90mr2138739wrq.9.1677596275126; 
 Tue, 28 Feb 2023 06:57:55 -0800 (PST)
Received: from redhat.com ([2.52.141.194]) by smtp.gmail.com with ESMTPSA id
 c10-20020a5d4f0a000000b002c54911f50bsm10056050wru.84.2023.02.28.06.57.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 06:57:54 -0800 (PST)
Date: Tue, 28 Feb 2023 09:57:50 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Anton Kuchin <antonkuchin@yandex-team.ru>
Cc: Stefan Hajnoczi <stefanha@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-devel@nongnu.org, yc-core@yandex-team.ru,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Juan Quintela <quintela@redhat.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, virtio-fs@redhat.com,
 Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH v3 1/1] vhost-user-fs: add migration type property
Message-ID: <20230228094756-mutt-send-email-mst@kernel.org>
References: <333c4451-8eef-0603-c3f5-10e38c0eb24e@yandex-team.ru>
 <20230222115106-mutt-send-email-mst@kernel.org>
 <11593688-7ca4-def3-6212-7c26faa4d1c6@yandex-team.ru>
 <20230222121133-mutt-send-email-mst@kernel.org>
 <a477ca70-8aea-6c16-122e-1ded4af11f49@yandex-team.ru>
 <20230222151814-mutt-send-email-mst@kernel.org>
 <20230223023604-mutt-send-email-mst@kernel.org>
 <Y/fZm12yGIPnwaDX@fedora>
 <20230224034258-mutt-send-email-mst@kernel.org>
 <8611d901-0940-3747-c2cd-9c193c7f24f2@yandex-team.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8611d901-0940-3747-c2cd-9c193c7f24f2@yandex-team.ru>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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

On Tue, Feb 28, 2023 at 04:30:36PM +0200, Anton Kuchin wrote:
> I really don't understand why and what do you want to check on
> destination.

Yes I understand your patch controls source. Let me try to rephrase
why I think it's better on destination.
Here's my understanding
- With vhost-user-fs state lives inside an external daemon.
A- If after load you connect to the same daemon you can get migration mostly
  for free.
B- If you connect to a different daemon then that daemon will need
  to pass information from original one.

Is this a fair summary?

Current solution is to set flag on the source meaning "I have an
orchestration tool that will make sure that either A or B is correct".

However both A and B can only be known when destination is known.
Especially as long as what we are really trying to do is just allow qemu
restarts, Checking the flag on load will thus achive it in a cleaner
way, in that orchestration tool can reasonably keep the flag
clear normally and only set it if restarting qemu locally.


By comparison, with your approach orchestration tool will have
to either always set the flag (risky since then we lose the
extra check that we coded) or keep it clear and set before migration
(complex).

I hope I explained what and why I want to check.

I am far from a vhost-user-fs expert so maybe I am wrong but
I wanted to make sure I got the point across even if other
disagree.

-- 
MST


