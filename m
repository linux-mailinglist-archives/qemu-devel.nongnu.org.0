Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 615986120AA
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Oct 2022 08:07:07 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooeyN-0007Ho-BN; Sat, 29 Oct 2022 02:05:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ooeyL-0007H4-3W
 for qemu-devel@nongnu.org; Sat, 29 Oct 2022 02:05:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ooeyI-0005A2-MA
 for qemu-devel@nongnu.org; Sat, 29 Oct 2022 02:05:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667023529;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=F9BAY6Wrj/afAbKlLnZl3pFkUb6gtnb82a4btV5FItU=;
 b=KmEdb8en9AdY9NmTBSd6grB8tR51vtgnTac99iUCxHJd9q9h3jQMQ2yzqSzerztk+yU9BZ
 gx6jF+U0cu5SI3PJ233ZR9SQxVmaubOeVZAWfJFIDtt+QV2+kkfwEPzk+alCCyqtpEebLp
 TIQm90WOB4reeBzk1h62fo73difbnRo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-43-ZwA1F8PzN3uT6c5VAI-qPA-1; Sat, 29 Oct 2022 02:05:25 -0400
X-MC-Unique: ZwA1F8PzN3uT6c5VAI-qPA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 217203C0E211;
 Sat, 29 Oct 2022 06:05:25 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.118])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E3FD42027062;
 Sat, 29 Oct 2022 06:05:24 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 9D47A21E6921; Sat, 29 Oct 2022 08:05:23 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Alberto Faria <afaria@redhat.com>
Cc: qemu-devel@nongnu.org,  Eric Blake <eblake@redhat.com>,  Kevin Wolf
 <kwolf@redhat.com>,  qemu-block@nongnu.org,  Hanna Reitz
 <hreitz@redhat.com>,  Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH] block/blkio: Make driver nvme-io_uring take a "path"
 instead of a "filename"
References: <20221028233854.839933-1-afaria@redhat.com>
Date: Sat, 29 Oct 2022 08:05:23 +0200
In-Reply-To: <20221028233854.839933-1-afaria@redhat.com> (Alberto Faria's
 message of "Sat, 29 Oct 2022 00:38:54 +0100")
Message-ID: <87fsf7f9lo.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.516,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Alberto Faria <afaria@redhat.com> writes:

> The nvme-io_uring driver expects a character special file such as
> /dev/ng0n1. Follow the convention of having a "filename" option when a
> regular file is expected, and a "path" option otherwise.

I suspect this is by accident, not by design.  Is it desirable?

> This makes io_uring the only libblkio-based driver with a "filename"
> option, as it accepts a regular file (even though it can also take a
> block special file).
>
> Signed-off-by: Alberto Faria <afaria@redhat.com>

Patch does not apply to master (344744e148e).  What's your base?


