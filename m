Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F26D65FCA7C
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Oct 2022 20:20:22 +0200 (CEST)
Received: from localhost ([::1]:59128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oigL7-0000nI-CX
	for lists+qemu-devel@lfdr.de; Wed, 12 Oct 2022 14:20:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oigHl-0007ls-4v
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 14:16:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34665)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oigHh-0001Ft-PF
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 14:16:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665598608;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zHPgczNc+YXggPg+Cbzlzz8RhIMKKAdAqlxMNRtTDrE=;
 b=VIO1h4XYdPrCo5bPCHaa1Ze3J+5B3Thh+djO5DTQ3LTrC7zfPqFGuOG2mEy4N0uCad3jnN
 1uC4pye+CR1rIBeTki5WzQN6YdE0A2m1X375XhBMNlenA54I1P2haCQ0lXtdhEWqsUfTXr
 37BT58Uk66HUkKecXWBnZ7B6YGQSibA=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-609-4vM8RwzRNluEX60NypoDIQ-1; Wed, 12 Oct 2022 14:16:47 -0400
X-MC-Unique: 4vM8RwzRNluEX60NypoDIQ-1
Received: by mail-qt1-f200.google.com with SMTP id
 bv21-20020a05622a0a1500b00393a6724d4cso11961228qtb.23
 for <qemu-devel@nongnu.org>; Wed, 12 Oct 2022 11:16:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zHPgczNc+YXggPg+Cbzlzz8RhIMKKAdAqlxMNRtTDrE=;
 b=hlhINQ6bOsOQk4eyskwub4o22dIaGJ/BJjssR61fYEuqayoOPG/oJOT7yuTGNqbd+X
 tX5tQeBUjv6mFuw5z6IZjbjEQSdtFIzWzY4iynWauriMBqg19TUswpiZ1THV6GPc2WKr
 mgXfVXi9VOkIoBgJlItwAKPgvyIS+5lXQWAbBzcYz/Xl5oeHGXTqJkkvR1Ut0zYl5bw/
 misuOm/R5K9+ABtBs0dY+sr9Gqd+AFjvDz49EyuMqFk0qAwBVXN4ZV7RWQaqe4RdshA5
 eGfBCHsYSSVFBKoozPTE62llI0jY0r9ligESk36X7Ol3o7FIimZ8DMk2r5L3d4rxQ+i9
 lGMg==
X-Gm-Message-State: ACrzQf3ppROg29jJYuG++olkzaeLrDanY4HVUAoEwK2+KOHnjJ3CN0FI
 nR9F95mWS1GPih6gxJhzVDreQEKPhVzrHFx9ARAzPXgmrtQyvgA7Dt1sP9e6Y3Q6QsFaA+P+anb
 BKMRRId0n5UvGpzTDZANQCexLffAU82VzSZi0wi9jZQ1OkffCz2m3MCz+WFdY6rtm
X-Received: by 2002:ac8:5914:0:b0:35b:b041:3a09 with SMTP id
 20-20020ac85914000000b0035bb0413a09mr25299647qty.354.1665598606446; 
 Wed, 12 Oct 2022 11:16:46 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5arSLWjQZi+YeoX/yKNKdIgSxUY0uK0Hc891Nexe0Qe8zOskA89MePhdh+AFgaqi2EoEZGPA==
X-Received: by 2002:ac8:5914:0:b0:35b:b041:3a09 with SMTP id
 20-20020ac85914000000b0035bb0413a09mr25299619qty.354.1665598606147; 
 Wed, 12 Oct 2022 11:16:46 -0700 (PDT)
Received: from x1n (bras-base-aurron9127w-grc-46-70-31-27-79.dsl.bell.ca.
 [70.31.27.79]) by smtp.gmail.com with ESMTPSA id
 m19-20020a05620a24d300b006cbb8ca04f8sm17294541qkn.40.2022.10.12.11.16.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Oct 2022 11:16:45 -0700 (PDT)
Date: Wed, 12 Oct 2022 14:16:44 -0400
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Yury Kotov <yury-kotov@yandex-team.ru>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH RFC 0/2] qemu-thread: Strict unlock check
Message-ID: <Y0cEjAT6yMX/Xasv@x1n>
References: <20221011224154.644379-1-peterx@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221011224154.644379-1-peterx@redhat.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Oct 11, 2022 at 06:41:52PM -0400, Peter Xu wrote:
> NOTE: mark patchset RFC because "make check" will easily fail; but I didn't
> yet dig into why as I'm not familiar with the code paths that triggers, it
> can be bugs hidden or something I missed.  So RFC to just have some thoughts.

I just noticed (after reminded from Dave) that the reclock was actually the
recursive lock, which definitely won't work with patch 2 at all.

OTOH I also noticed PTHREAD_MUTEX_ERRORCHECK which does the same unlock
check that we can leverage (and it'll also check re-lock from the same
thread which causes deadlock).  I'll give that a shot instead.

Please ignore this version.  Patch 1 is still meaningful I think, but
anyway I'll repost.  Sorry for the noise.

-- 
Peter Xu


