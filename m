Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AAA3564A4C
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 00:28:55 +0200 (CEST)
Received: from localhost ([::1]:52800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o885G-000050-4Y
	for lists+qemu-devel@lfdr.de; Sun, 03 Jul 2022 18:28:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1o884I-0007kV-Tf
 for qemu-devel@nongnu.org; Sun, 03 Jul 2022 18:27:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26880)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1o884H-00063r-Ai
 for qemu-devel@nongnu.org; Sun, 03 Jul 2022 18:27:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656887272;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HzdmeUa11z4tOMEgiI4enE+AAZoMh0UIGJLWt/3fMtg=;
 b=hTbDRN4jkHDFerraYwaRrip+mcenwOrFChOxfakbbm6WjP3a1jFiqbyGfLw5dfXVVnEHq1
 oyxNyf14PZqn2D1lj5bRHonj61Q/e1H1ZIBhs5oVG+ja3CR4Ygg9G2y68mOBS3OSaIYZeR
 pRamCrvGRvlKc0M/x/CPC07pe4+TB0o=
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-86-0EXwrNZ1NKioGgpRgQJYmA-1; Sun, 03 Jul 2022 18:27:51 -0400
X-MC-Unique: 0EXwrNZ1NKioGgpRgQJYmA-1
Received: by mail-il1-f199.google.com with SMTP id
 i8-20020a056e020d8800b002d931252904so3358255ilj.23
 for <qemu-devel@nongnu.org>; Sun, 03 Jul 2022 15:27:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HzdmeUa11z4tOMEgiI4enE+AAZoMh0UIGJLWt/3fMtg=;
 b=cbcYJ37oWmU/XNBNjFW23LxmNgrvNB0jHUuipel504TTjD4g42wScKFWbUD29cmRW3
 frI2VEd/X+gPhU9Kcaz5xKEZVQQxNnVj+TKs0BnYxnMWZRLISfoNW+wiG7jHM1mdSVFo
 y5Z+OTiQq7P5Sz+M0YyDPL2nKv1opP6IUHMegd8tYKxQOE9VXzm20fabreREwY76eb0n
 ocF01sl4VZTAYBDgkkzUZaP71P7LS65YVXY8mJuN+kLWpfmFP4scV6bGbJtzlOAOfpPS
 rOdODhSvmKhA7dJ1/DZ1ZNm7vt1l0OAOg2uR+uqb11qy6zm+AhKMjii88ib7K8RLmqal
 9tQQ==
X-Gm-Message-State: AJIora9NGZNArOvbwKzYjidzRx55aWGmuL1AW5/B8/1RrtJFHJBgHqZh
 UTcY7w9EQLu5JRsz87oBdXQ3SAEkrGEEDPI+Z5BUrB2R04sCvhPYnOemM7TYB1dnF3NZ9Cde9nn
 4TM/EwmyQnth5vM6+DuNHbz8szdoRKeg=
X-Received: by 2002:a05:6638:271f:b0:33c:c07e:3034 with SMTP id
 m31-20020a056638271f00b0033cc07e3034mr16418628jav.263.1656887271078; 
 Sun, 03 Jul 2022 15:27:51 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1svnpfinHa45zy4qTBx1oLhomo2/su0Yf0evyj2JgTcj04JnbBe4tvWaWneQIKyxyE0FOc1T5lr80+Y45k1Sqc=
X-Received: by 2002:a05:6638:271f:b0:33c:c07e:3034 with SMTP id
 m31-20020a056638271f00b0033cc07e3034mr16418614jav.263.1656887270893; Sun, 03
 Jul 2022 15:27:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220609152744.3891847-1-afaria@redhat.com>
 <20220609152744.3891847-8-afaria@redhat.com>
 <20220623214706.hxjpk4ub76w37g6t@redhat.com>
In-Reply-To: <20220623214706.hxjpk4ub76w37g6t@redhat.com>
From: Alberto Faria <afaria@redhat.com>
Date: Sun, 3 Jul 2022 23:27:15 +0100
Message-ID: <CAELaAXxqTQFk1DRLLjj6qTYiShortd8mnKEukWHpiM-JdUpQTA@mail.gmail.com>
Subject: Re: [PATCH v5 07/10] block: Implement bdrv_{pread, pwrite,
 pwrite_zeroes}() using generated_co_wrapper
To: Eric Blake <eblake@redhat.com>
Cc: qemu-devel@nongnu.org, John Snow <jsnow@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, 
 Stefan Hajnoczi <stefanha@redhat.com>, Ari Sundholm <ari@tuxera.com>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 "Denis V. Lunev" <den@openvz.org>, Fam Zheng <fam@euphon.net>,
 Jeff Cody <codyprime@gmail.com>, 
 qemu-block@nongnu.org, Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>, 
 Hanna Reitz <hreitz@redhat.com>, Stefan Weil <sw@weilnetz.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=afaria@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Thu, Jun 23, 2022 at 10:47 PM Eric Blake <eblake@redhat.com> wrote:
> I did not get through all of the callers (you are right, there ARE a
> lot), but the ones I checked, particularly in block/qcow2-*.c, appear
> to handle -EIO just fine.
>
> I did notice, however, that qcow2-bitmap.c:free_bitmap_clusters()
> returns an int failure, but none of its three callers
> (qcow2_co_remove_persistent_dirty_bitmap, and twice in
> qcow2_store_persistent_dirty_bitmaps) care about the return value.
> That may be worth a separate cleanup patch.

Thanks, Eric. I decided to add a check for this kind of thing to the
static analyzer I've been working on, which I sent as an RFC [1].

Alberto

[1] https://lore.kernel.org/qemu-devel/20220702113331.2003820-1-afaria@redhat.com/


