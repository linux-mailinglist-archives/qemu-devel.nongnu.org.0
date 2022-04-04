Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38BE94F1131
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Apr 2022 10:47:37 +0200 (CEST)
Received: from localhost ([::1]:38344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbIN6-0004jG-Af
	for lists+qemu-devel@lfdr.de; Mon, 04 Apr 2022 04:47:36 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsaenzju@redhat.com>)
 id 1nbIHw-00016A-8V
 for qemu-devel@nongnu.org; Mon, 04 Apr 2022 04:42:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45529)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsaenzju@redhat.com>)
 id 1nbIHt-0000fO-Rd
 for qemu-devel@nongnu.org; Mon, 04 Apr 2022 04:42:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649061733;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UKlzhhhyzk9WKbflvCvDcSEXupMDK85nE01gdnGBCko=;
 b=ck9HzxQw6nDWf0SOAyvLb1HKxTu0SY33LM3xoK1kaum1jSyR2i5G9SKtnTG39OzlW3QE8W
 jUTLT+VE55hezyTQnHhnI4s/tj62L6jz/kWwp8yuKu5iy+CwmgVAquAmKvOv4t574LGqxj
 W0/TZZEr213gsS1hNeGIFr5SgubE/VQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-557-N5k4R6OSP1-ykzRC0kJM4Q-1; Mon, 04 Apr 2022 04:42:10 -0400
X-MC-Unique: N5k4R6OSP1-ykzRC0kJM4Q-1
Received: by mail-wm1-f69.google.com with SMTP id
 r206-20020a1c44d7000000b0038e6a1b25f1so2846240wma.7
 for <qemu-devel@nongnu.org>; Mon, 04 Apr 2022 01:42:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=UKlzhhhyzk9WKbflvCvDcSEXupMDK85nE01gdnGBCko=;
 b=WbZi19mLfgt6c2FD6+FgyHeG6Zaox6SlHxP3JFfxiopom0VFmq859riuSxNH3ApIKP
 gE+IMePIxJNMLqPL1FzweUv9UFlrK+VnzNKQeXAuBZWBlarvLom2ivf7XwucvCZOqgMS
 FjBI+0gCW8qmEF4F9jFAPNfkZv8TMk0ILIzKWrGsA4Mh1S0nkjq/7cnF+xqOV5QWjJ4m
 z0OTqxr7XunU3/amNb6o3Impt/f8bxn7NffO972n677agV9JV8SBrY9Uuj+t1BMYsDHy
 o3zM2AE6xWwy7qYF8MT/FrhP2H15giKd070uQtLlf1l7V+8Ie7PQ1Ssf8+VPMzZ5jrNz
 y/Ig==
X-Gm-Message-State: AOAM5315FX+KIzhGtNDS4DjOVIPPSLxmetmGmjYhYc3zZJaYJu3zrNjH
 GRPqldzlxv+3ORlVCMYtLvO+iOq1xoTiPw0mK6HOSZDFNqS3QlcvTBMXgRrcZI2q2SCmEl6S8Zb
 50UDk7jU8xs5QEvo=
X-Received: by 2002:a05:600c:1f14:b0:38c:946f:6812 with SMTP id
 bd20-20020a05600c1f1400b0038c946f6812mr18414814wmb.192.1649061729333; 
 Mon, 04 Apr 2022 01:42:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzQJ9Vh/nK6a5h+XWhYq7+YPrc6WD/pXEnvDhboqQMfbyIHyoxbnf3W0n2kXWqxs0mK6EeqVA==
X-Received: by 2002:a05:600c:1f14:b0:38c:946f:6812 with SMTP id
 bd20-20020a05600c1f1400b0038c946f6812mr18414786wmb.192.1649061729010; 
 Mon, 04 Apr 2022 01:42:09 -0700 (PDT)
Received: from ?IPv6:2a0c:5a80:1306:2f00:cfcf:62cf:6f38:dd92?
 ([2a0c:5a80:1306:2f00:cfcf:62cf:6f38:dd92])
 by smtp.gmail.com with ESMTPSA id
 l126-20020a1c2584000000b00387d4f35651sm16885315wml.10.2022.04.04.01.42.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Apr 2022 01:42:08 -0700 (PDT)
Message-ID: <0270b6fc1df8de20ea638bd0010c599454d11c56.camel@redhat.com>
Subject: Re: [PATCH v4 0/4] util/thread-pool: Expose minimun and maximum size
From: Nicolas Saenz Julienne <nsaenzju@redhat.com>
To: kwolf@redhat.com, stefanha@redhat.com, berrange@redhat.com
Date: Mon, 04 Apr 2022 10:42:07 +0200
In-Reply-To: <20220401093523.873508-1-nsaenzju@redhat.com>
References: <20220401093523.873508-1-nsaenzju@redhat.com>
User-Agent: Evolution 3.42.4 (3.42.4-1.fc35)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=nsaenzju@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=nsaenzju@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: fam@euphon.net, eduardo@habkost.net, qemu-block@nongnu.org,
 michael.roth@amd.com, mtosatti@redhat.com, qemu-devel@nongnu.org,
 armbru@redhat.com, hreitz@redhat.com, pbonzini@redhat.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 2022-04-01 at 11:35 +0200, Nicolas Saenz Julienne wrote:

Subject says 0/4 where is should've been 0/3.

> As discussed on the previous RFC[1] the thread-pool's dynamic thread
> management doesn't play well with real-time and latency sensitive
> systems. This series introduces a set of controls that'll permit
> achieving more deterministic behaviours, for example by fixing the
> pool's size.
> 
> We first introduce a new common interface to event loop configuration by
> moving iothread's already available properties into an abstract class
> called 'EventLooopBackend' and have both 'IOThread' and the newly
> created 'MainLoop' inherit the properties from that class.
> 
> With this new configuration interface in place it's relatively simple to
> introduce new options to fix the even loop's thread pool sizes. The
> resulting QAPI looks like this:
> 
>     -object main-loop,id=main-loop,thread-pool-min=1,thread-pool-max=1
> 
> Note that all patches are bisect friendly and pass all the tests.
> 
> [1] https://patchwork.ozlabs.org/project/qemu-devel/patch/20220202175234.656711-1-nsaenzju@redhat.com/
> 
> @Stefan I kept your Signed-off-by, since the changes trivial/not
> thread-pool related
> 
> ---
> Changes since v3:
>  - Avoid duplication in qom.json by creating EventLoopBaseProperties.
>  - Fix failures on first compilation due to race between
>    event-loop-base.o and qapi header generation.
> 
> Changes since v2:
>  - Get rid of wrong locking/waiting
>  - Fix qapi versioning
>  - Better commit messages
> 
> Changes since v1:
>  - Address all Stefan's comments
>  - Introduce new fix
> 
> Nicolas Saenz Julienne (3):
>   Introduce event-loop-base abstract class
>   util/main-loop: Introduce the main loop into QOM
>   util/event-loop-base: Introduce options to set the thread pool size
> 
>  event-loop-base.c                | 140 +++++++++++++++++++++++++++++++
>  include/block/aio.h              |  10 +++
>  include/block/thread-pool.h      |   3 +
>  include/qemu/main-loop.h         |  10 +++
>  include/sysemu/event-loop-base.h |  41 +++++++++
>  include/sysemu/iothread.h        |   6 +-
>  iothread.c                       |  68 +++++----------
>  meson.build                      |  26 +++---
>  qapi/qom.json                    |  40 +++++++--
>  util/aio-posix.c                 |   1 +
>  util/async.c                     |  20 +++++
>  util/main-loop.c                 |  65 ++++++++++++++
>  util/thread-pool.c               |  55 +++++++++++-
>  13 files changed, 416 insertions(+), 69 deletions(-)
>  create mode 100644 event-loop-base.c
>  create mode 100644 include/sysemu/event-loop-base.h
> 

-- 
Nicolás Sáenz


