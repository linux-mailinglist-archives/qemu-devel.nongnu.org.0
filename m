Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4200D587A15
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Aug 2022 11:51:32 +0200 (CEST)
Received: from localhost ([::1]:44646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIoYl-0003ca-C5
	for lists+qemu-devel@lfdr.de; Tue, 02 Aug 2022 05:51:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oIoUb-0006WZ-9I
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 05:47:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26013)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oIoUV-000177-Ri
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 05:47:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659433627;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yx0k741sDluaz5rj8jn0sh3Z3LhSGpIqK3EYgfAGNyE=;
 b=Y9GLs8MZrpB+oY9BHbWNvsCMjkY+1hbQExgqEOoWIgqh+SWGfH6qQd3sENx+3aWJcmPDZX
 fuEOJGRiagaLGCzvW/J1UngHKe85hnQAxT3SgD0ecFQImxkcQxKJo5TDe43fKuIKsp+Rgz
 KjSn2PXtTowAYOYrl1Fxif+BVv+G774=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-568-1rnNx8QdMROQeGGtb1SVug-1; Tue, 02 Aug 2022 05:47:06 -0400
X-MC-Unique: 1rnNx8QdMROQeGGtb1SVug-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DC8383C0E213;
 Tue,  2 Aug 2022 09:47:05 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.62])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EF2C4909FF;
 Tue,  2 Aug 2022 09:47:04 +0000 (UTC)
Date: Tue, 2 Aug 2022 11:47:03 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Lev Kujawski <lkujaw@member.fsf.org>
Cc: qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 qemu-block@nongnu.org, John Snow <jsnow@redhat.com>
Subject: Re: [PATCH] hw/block/hd-geometry: Do not override specified
 bios-chs-trans
Message-ID: <Yujyl0CDDtbFa6vz@redhat.com>
References: <20220707204045.999544-1-lkujaw@member.fsf.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220707204045.999544-1-lkujaw@member.fsf.org>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
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

Am 07.07.2022 um 22:40 hat Lev Kujawski geschrieben:
> For small disk images (<4 GiB), QEMU and SeaBIOS default to the
> LARGE/ECHS disk translation method, but it is not uncommon for other
> BIOS software to use LBA in these cases as well.  Some operating
> system boot loaders (e.g., NT 4) do not handle LARGE translations
> outside of fixed configurations.  See, e.g., Q154052:

I wonder if this means that we should just always use LBA by default
instead of using LARGE for smaller disks, or if this would break other
cases that are working well with the current default.

> "When starting an x86 based computer, Ntdetect.com retrieves and
> stores Interrupt 13 information. . . If the disk controller is using a
> 32 sector/64 head translation scheme, this boundary will be 1 GB. If
> the controller uses 63 sector/255 head translation [AUTHOR: i.e.,
> LBA], the limit will be 4 GB."
> 
> To accommodate these situations, hd_geometry_guess() now follows the
> disk translation specified by the user even when the ATA disk geometry
> is guessed.
> 
> hd_geometry_guess():
> * Only set the disk translation when translation is AUTO.
> * Show the soon-to-be active translation (*ptrans) in the trace rather
>   than what was guessed.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/56
> Buglink: https://bugs.launchpad.net/qemu/+bug/1745312
> 
> Signed-off-by: Lev Kujawski <lkujaw@member.fsf.org>

Thanks, irrespective of my wondering above, the fix looks right, so I've
applied it to my block branch.

Kevin


