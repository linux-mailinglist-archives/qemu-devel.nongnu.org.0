Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C025824A75E
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Aug 2020 22:01:47 +0200 (CEST)
Received: from localhost ([::1]:57614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k8UHK-00018W-8v
	for lists+qemu-devel@lfdr.de; Wed, 19 Aug 2020 16:01:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1k8UFw-0000Ry-QA
 for qemu-devel@nongnu.org; Wed, 19 Aug 2020 16:00:20 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:51294
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1k8UFt-0004lE-Gz
 for qemu-devel@nongnu.org; Wed, 19 Aug 2020 16:00:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597867216;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H6qQIjl0fjMGp3iigdQ/Q7pl1sy0GxaPjwH1a94aV98=;
 b=PZ/hDZqNtYYYjPJTvHHN6TrjDWPMi6zon6mFiw6+6r20hOzn/9mxlX2QgBUCKRbIVjXTwY
 djz/GgffkPamGE9eGHHyk9sVriTEtfLFoHkaus2PTKa0EPTG+PtSnRBeW0txC6e3nlK29L
 EPOcIcIIxKpDTJYEF2pFQSXnYpXzXdY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-179-bn_OjaImN2ag7MKfBAl-RA-1; Wed, 19 Aug 2020 16:00:14 -0400
X-MC-Unique: bn_OjaImN2ag7MKfBAl-RA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 881AF1885D87;
 Wed, 19 Aug 2020 20:00:10 +0000 (UTC)
Received: from [10.3.112.136] (ovpn-112-136.phx2.redhat.com [10.3.112.136])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2D5937DFFA;
 Wed, 19 Aug 2020 20:00:10 +0000 (UTC)
Subject: Re: [RFC PATCH 08/22] nbd: Add max-connections to nbd-server-start
To: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
References: <20200813162935.210070-1-kwolf@redhat.com>
 <20200813162935.210070-9-kwolf@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <973cb8f5-b042-fa70-da45-0aefeaad2fcd@redhat.com>
Date: Wed, 19 Aug 2020 15:00:09 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200813162935.210070-9-kwolf@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=eblake@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/19 16:00:16
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-devel@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/13/20 11:29 AM, Kevin Wolf wrote:
> This is a QMP equivalent of qemu-nbd's --share option, limiting the
> maximum number of clients that can attach at the same time.
> 
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>   qapi/block-export.json         | 10 ++++++++--
>   include/block/nbd.h            |  3 ++-
>   block/monitor/block-hmp-cmds.c |  2 +-
>   blockdev-nbd.c                 | 33 ++++++++++++++++++++++++++-------
>   qemu-storage-daemon.c          |  4 ++--
>   5 files changed, 39 insertions(+), 13 deletions(-)
> 
> diff --git a/qapi/block-export.json b/qapi/block-export.json
> index 40369814b4..1fdc55c53a 100644
> --- a/qapi/block-export.json
> +++ b/qapi/block-export.json
> @@ -14,6 +14,8 @@
>   #             is only resolved at time of use, so can be deleted and
>   #             recreated on the fly while the NBD server is active.
>   #             If missing, it will default to denying access (since 4.0).
> +# @max-connections: The maximum number of connections to allow at the same
> +#                   time, 0 for unlimited. (since 5.2; default: 0)

Nice way to add feature parity.

Limiting the number of connections (particularly for a writable client, 
where we cannot guarantee cache consistency between the connections), 
seems like a worthwhile feature to have; I've always found it odd that 
qemu-nbd and QMP nbd-server-add defaulted to different limits (1 vs. 
unlimited).  For reference, nbdkit defaults to unlimited, and I'm happy 
if qemu-storage-daemon does likewise; but changing qemu-nbd's default of 
1 would be backwards incompatible and may cause surprises (there's 
always 'qemu-nbd -e' when needed).  I also wonder if we should change 
'qemu-nbd -e 0' to mean unlimited rather than an error (right now, 
qemu-iotests/common.rc uses -e 42 for all nbd-based tests for a saner 
limit than just 1, but it smells of being arbitrary compared to unlimited).

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


