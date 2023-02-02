Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B74F968815F
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 16:13:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNbFL-0003EC-Kn; Thu, 02 Feb 2023 10:11:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pNbFJ-0003Dg-C0
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 10:11:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pNbFH-0000Es-Pj
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 10:11:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675350687;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=+mhUfVjGQjABD5q60xCkO7lpHWO9uS8MrdzJIwXxY6A=;
 b=bm/JZeVg+rN0hXsDYywblkgi/g10TGdXSNvxK0DUgQaaNoD9CeRPbRKLCOxUv1pdI3W4b2
 blJVCC9d2Yi70URjpF990X/JQBQBPY14Due/XZDb17cQPUVpH0XYgfBlqmC0DpgWFPrgcy
 PdM3XKByDz1Poli6vsRQrslwQelq4RQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-36-shauxSDuOUmmN4zkyIoXXg-1; Thu, 02 Feb 2023 10:11:26 -0500
X-MC-Unique: shauxSDuOUmmN4zkyIoXXg-1
Received: by mail-wm1-f72.google.com with SMTP id
 k9-20020a05600c1c8900b003dc5dec2ac6so2992546wms.4
 for <qemu-devel@nongnu.org>; Thu, 02 Feb 2023 07:11:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+mhUfVjGQjABD5q60xCkO7lpHWO9uS8MrdzJIwXxY6A=;
 b=h9RKSPWdf0x1nm/T/kj14vH6MxkOG249JcfKkzenkMQF15BIwDLCswuvMeodSzRJ4S
 HB51nr3aIsQGwC6jUFdkjzHMN4Bk9jF2VhLs0WJIxgD2ugBSJ33hotKzxiTjUSoaM/4t
 WjETBV+7Ss1nRHVdfZjS3YzNoRQy3lvYx4iSM/8z+nYu90R4G+FHHABjnuN/fGT/+/ga
 MIdkhKlU6yScAB87X/5UpiWUMtk/G0oBNNJhwXA1vgvxxhxkEEYgM8vuOAdu4tJHwRkK
 a+ZcRc5JqB1IXIt7Tu83yO2ltLPYQD6XQ1ANPbEuGT29XUeuPCn7DGUrcjTyx556feiE
 P53Q==
X-Gm-Message-State: AO0yUKXHAnRLHEPbedyZBYm7a3MOsIc5C3dZwIWVit9pQwmpnUf9FuW2
 z9QPg2o1N1nuWvoTpsRuhIkhTor/E72kblgNOo6j/3vRCxeh53F+M9jXfkvpODpv7iaNWHbVYS6
 TYYbv7kQY0oA70CFY1WZpoS5WQe3XzHSuGksdXPJkBdXo6LU/iSa3rMXwiV7Jfd5UY8I=
X-Received: by 2002:a05:600c:5028:b0:3dd:ec52:5cc5 with SMTP id
 n40-20020a05600c502800b003ddec525cc5mr6437774wmr.30.1675350684327; 
 Thu, 02 Feb 2023 07:11:24 -0800 (PST)
X-Google-Smtp-Source: AK7set+dwjJr/1emRSLDe+woTAi51GduxdD4wCx5cav+X/7l+s518NouOC3em1HkEeu4CFDXSRprUw==
X-Received: by 2002:a05:600c:5028:b0:3dd:ec52:5cc5 with SMTP id
 n40-20020a05600c502800b003ddec525cc5mr6437735wmr.30.1675350684068; 
 Thu, 02 Feb 2023 07:11:24 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 m5-20020a7bcb85000000b003de8a1b06c0sm5231003wmi.7.2023.02.02.07.11.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Feb 2023 07:11:23 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>,  John Snow <jsnow@redhat.com>,  Richard
 Henderson <richard.henderson@linaro.org>,  Fam Zheng <fam@euphon.net>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,  Thomas Huth
 <thuth@redhat.com>,  Alex Williamson <alex.williamson@redhat.com>,  "Dr.
 David Alan Gilbert" <dgilbert@redhat.com>,  Stefan Hajnoczi
 <stefanha@redhat.com>,  qemu-s390x@nongnu.org,  Halil Pasic
 <pasic@linux.ibm.com>,  Eric Farman <farman@linux.ibm.com>,
 qemu-block@nongnu.org,  Vladimir Sementsov-Ogievskiy
 <vsementsov@yandex-team.ru>,  David Hildenbrand <david@redhat.com>,  Ilya
 Leoshkevich <iii@linux.ibm.com>
Subject: Re: [PULL 0/5] Next patches
In-Reply-To: <20230130080307.1792-1-quintela@redhat.com> (Juan Quintela's
 message of "Mon, 30 Jan 2023 09:03:02 +0100")
References: <20230130080307.1792-1-quintela@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Thu, 02 Feb 2023 16:11:22 +0100
Message-ID: <87zg9wnlut.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Juan Quintela <quintela@redhat.com> wrote:


NACK

As they are not integrated, I am sending a new PULL request with the fix
for the issue spotted by Vladimir.

> The following changes since commit 13356edb87506c148b163b8c7eb0695647d00c2a:
>
>   Merge tag 'block-pull-request' of https://gitlab.com/stefanha/qemu into staging (2023-01-24 09:45:33 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/juan.quintela/qemu.git tags/next-pull-request
>
> for you to fetch changes up to 07181bd32c39007855e25eb5675e9210e9ccd8da:
>
>   migration: simplify migration_iteration_run() (2023-01-30 08:55:04 +0100)
>
> ----------------------------------------------------------------
> Migration PULL request
>
> Hi
>
> - Peter Xu fix for crash on hosts with guest page bigger than host
> - The parts that are reviewed of my vfio series
>
> Please, apply.
>
> ----------------------------------------------------------------
>
> Juan Quintela (4):
>   migration: No save_live_pending() method uses the QEMUFile parameter
>   migration: Split save_live_pending() into state_pending_*
>   migration: Remove unused threshold_size parameter
>   migration: simplify migration_iteration_run()
>
> Peter Xu (1):
>   migration: Fix migration crash when target psize larger than host
>
>  docs/devel/migration.rst       | 18 ++++++-----
>  docs/devel/vfio-migration.rst  |  4 +--
>  include/migration/register.h   | 17 ++++++-----
>  migration/savevm.h             | 10 +++---
>  hw/s390x/s390-stattrib.c       | 11 ++++---
>  hw/vfio/migration.c            | 20 ++++++------
>  migration/block-dirty-bitmap.c | 14 ++++-----
>  migration/block.c              | 13 ++++----
>  migration/migration.c          | 42 ++++++++++++++-----------
>  migration/ram.c                | 56 +++++++++++++++++++++++++++-------
>  migration/savevm.c             | 39 ++++++++++++++++++-----
>  hw/vfio/trace-events           |  2 +-
>  migration/trace-events         |  7 +++--
>  13 files changed, 163 insertions(+), 90 deletions(-)


