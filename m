Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8096E507A32
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 21:24:33 +0200 (CEST)
Received: from localhost ([::1]:55924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngtSi-0001TW-Lv
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 15:24:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ngtRU-0000Wj-RW
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 15:23:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51014)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ngtRS-00005d-WD
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 15:23:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650396194;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OqoglTO8cE6/CdjgRNXAvEQvF2IFwzb83r/eg6JiO3Y=;
 b=Ao11tQVNlE1NmpTzExN4jU7We02NRLH5us8Vxv/aEwkTwuzoof2dfGsyz5ia7Nyo09d7jT
 ZGhf7ldIBN98dcNKPw3AR6tr0CUx1UhEVwkmCUFbdNsVPyELC8JCOlTuHBFqBIfbxknbwu
 /2Qa374gQ8gMcOffSTsoID7w21bjg5o=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-191-z1_GOKDfMaa_JrPfayFSFg-1; Tue, 19 Apr 2022 15:23:10 -0400
X-MC-Unique: z1_GOKDfMaa_JrPfayFSFg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 63A63185A79C;
 Tue, 19 Apr 2022 19:23:10 +0000 (UTC)
Received: from redhat.com (unknown [10.2.17.175])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0E4A3111C4BE;
 Tue, 19 Apr 2022 19:23:09 +0000 (UTC)
Date: Tue, 19 Apr 2022 14:23:08 -0500
From: Eric Blake <eblake@redhat.com>
To: Dirk =?utf-8?Q?M=C3=BCller?= <dmueller@suse.de>
Subject: Re: [PATCH] Only advertise aio=io_uring if support is actually
 available
Message-ID: <20220419192308.bkcd2g7xah5ustfz@redhat.com>
References: <20220419171931.26192-1-dmueller@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220419171931.26192-1-dmueller@suse.de>
User-Agent: NeoMutt/20211029-35-db88c3
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eblake@redhat.com;
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
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Apr 19, 2022 at 07:19:31PM +0200, Dirk Müller wrote:
> This allows $qemu --help runtime configure checks for detecting
> the host support.

--help is human-parseable, and thus not stable text.  Relying on it
for detecting host support is not always ideal, but anything is better
than nothing, so I'm not opposed to this patch.

Reviewed-by: Eric Blake <eblake@redhat.com>

Since qemu-nbd is affected, I'm happy to queue this through my NBD
tree now that 7.1 development has opened, if no one else queues it
elsewhere first.

> 
> Signed-off-by: Dirk Müller <dmueller@suse.de>
> ---
>  block/file-posix.c | 4 ++++
>  qemu-nbd.c         | 4 ++++
>  qemu-options.hx    | 6 +++++-
>  3 files changed, 13 insertions(+), 1 deletion(-)
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


