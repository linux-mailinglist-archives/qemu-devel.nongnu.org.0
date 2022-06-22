Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DEEA554F00
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jun 2022 17:21:41 +0200 (CEST)
Received: from localhost ([::1]:55280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o42Aj-0005GH-8e
	for lists+qemu-devel@lfdr.de; Wed, 22 Jun 2022 11:21:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1o428f-0004Hm-5D
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 11:19:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54099)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1o428b-0005Bx-90
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 11:19:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655911164;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=McgBJJnIIAV3xFyVsVFtSAnyubTR8lWtmm2PL+qT63g=;
 b=FpjOSkbF2nQLRAS7/64g+dU8+qsIOXzU1YFttqX3aMNkrjc9kDh84WKAVveNOLfO18W3JF
 BdyV2Zx80rVxRV7FYJDcAfUbVkMYon7VQBb5FLKBplS4Tnd2CObCYEOhVBQe8CmyToSC8j
 FjxQGeTDoY3CKDyXt9fUtY0x2Acnuf8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-582-djt6Pw28MPSRkPjNK9CdaA-1; Wed, 22 Jun 2022 11:19:23 -0400
X-MC-Unique: djt6Pw28MPSRkPjNK9CdaA-1
Received: by mail-wm1-f70.google.com with SMTP id
 k15-20020a7bc40f000000b0039c4b7f7d09so7974460wmi.8
 for <qemu-devel@nongnu.org>; Wed, 22 Jun 2022 08:19:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=McgBJJnIIAV3xFyVsVFtSAnyubTR8lWtmm2PL+qT63g=;
 b=YjTrgyWfI5jFbqYS/wR+9cr7nc/4EisH6zBu1M8BXsPT9rJ+8ulFw5tIL6SQLvxCPk
 LfeOPIcX00MmefFqsza8622fq6/dpuuztTxspDHD1TOPDuHnrsLZGcqhY7v2ZTNoqiW/
 LEsfhcp+GEuj99MN4YpSD7zbYvW+dL9mtdnOc/+OXjt2UJqhJVzrvRQA1Le4A3cxQ8Of
 dOAbAzL7DnxwflhayivbDz5akRGE/Kkgh8vrNLQHFc/aSddvzg+duljWM0N2Xk/2FyLP
 SkuEIVsN2s8XLcpe3Dw4ugMfGpkpSWwVuNw3BLLAku9vEpzVBQTk49IHhhc5IwKLh2aO
 1eEQ==
X-Gm-Message-State: AJIora/jJfD3lE9G4Iq0HAfzdeNbsPPFjD7fRwo1eQa4h3F7FqGW9a4A
 h3+jksBLvet+dcO0QmM2ym3CrA/ib+XWTI3dFJeptyMCRHnHu3qZX6GdpqSljCR4DfNHL4CJ8SI
 Jj4ddjig41zod8lQ=
X-Received: by 2002:a05:6000:102:b0:21b:9219:b28e with SMTP id
 o2-20020a056000010200b0021b9219b28emr3870784wrx.236.1655911160352; 
 Wed, 22 Jun 2022 08:19:20 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vTUJLBXP+0q/fTPT+7prTQY88LUa7ZyjdqF6u4sSHypm/RPWBBY6RI7e8J4T5FnP9aQGvc6g==
X-Received: by 2002:a05:6000:102:b0:21b:9219:b28e with SMTP id
 o2-20020a056000010200b0021b9219b28emr3870750wrx.236.1655911160047; 
 Wed, 22 Jun 2022 08:19:20 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 f8-20020a05600c4e8800b003974b95d897sm30537225wmq.37.2022.06.22.08.19.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jun 2022 08:19:19 -0700 (PDT)
Date: Wed, 22 Jun 2022 16:19:17 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Hailiang Zhang <zhanghailiang@xfusion.com>, Eric Blake <eblake@redhat.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Fam Zheng <fam@euphon.net>, qemu-block@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Subject: Re: [PULL 00/25] Migration 20220621 patches
Message-ID: <YrMy9dd8ikmJfFvu@work-vm>
References: <20220622002547.64784-1-quintela@redhat.com>
 <e3bb7c52-8c01-2a8c-765b-bd5eb49039a1@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e3bb7c52-8c01-2a8c-765b-bd5eb49039a1@linaro.org>
User-Agent: Mutt/2.2.5 (2022-05-16)
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Richard Henderson (richard.henderson@linaro.org) wrote:
> On 6/21/22 17:25, Juan Quintela wrote:
> > The following changes since commit c8b2d413761af732a0798d8df45ce968732083fe:
> > 
> >    Merge tag 'bsd-user-syscall-2022q2-pull-request' of ssh://github.com/qemu-bsd-user/qemu-bsd-user into staging (2022-06-19 13:56:13 -0700)
> > 
> > are available in the Git repository at:
> > 
> >    https://gitlab.com/juan.quintela/qemu.git tags/migration-20220621-pull-request
> > 
> > for you to fetch changes up to 720eceaa316f2a75a7930085bb305850831a065f:
> > 
> >    migration: remove the QEMUFileOps abstraction (2022-06-21 18:06:55 +0200)
> > 
> > ----------------------------------------------------------------
> > Migration Pull request
> > 
> > Hi
> > 
> > In this today migration PULL request:
> > - dainiel Berrangé qemufileops cleanup
> > - Leonardo Brass cleanups for zero copy
> > - RDMA cleanups (me)
> 
> Build failures:

Hmm, I'll fix these up

> https://gitlab.com/qemu-project/qemu/-/jobs/2622407867
> https://gitlab.com/qemu-project/qemu/-/jobs/2622407794
> https://gitlab.com/qemu-project/qemu/-/jobs/2622407791
> 
> ../migration/migration.c:166:5: error: 'MIGRATION_CAPABILITY_ZERO_COPY_SEND'
> undeclared here (not in a function); did you mean
> 'MIGRATION_CAPABILITY_ZERO_BLOCKS'?
>   166 |     MIGRATION_CAPABILITY_ZERO_COPY_SEND);
>       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> ../migration/migration.c:145:35: note: in definition of macro 'INITIALIZE_MIGRATE_CAPS_SET'
>   145 |         .size = sizeof((int []) { __VA_ARGS__ }) / sizeof(int), \
>       |                                   ^~~~~~~~~~~
> [1118/1665] Compiling C object libcommon.fa.p/migration_multifd.c.obj

So these are non-Linux's; so I guess that constant is guardded;
> 
> https://gitlab.com/qemu-project/qemu/-/jobs/2622407863
> https://gitlab.com/qemu-project/qemu/-/jobs/2622407862
> https://gitlab.com/qemu-project/qemu/-/jobs/2622407860
> https://gitlab.com/qemu-project/qemu/-/jobs/2622407811
> 
> ../io/channel-socket.c:589:9: error: implicit declaration of function
> 'g_assert_unreachable' is invalid in C99
> [-Werror,-Wimplicit-function-declaration]
>         g_assert_unreachable();
>         ^

Again, non Linux; and should be g_assert_not_reached

I'll fix this up.

Dave

> 
> r~
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


