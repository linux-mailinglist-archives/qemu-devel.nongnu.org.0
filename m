Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE41C1C947B
	for <lists+qemu-devel@lfdr.de>; Thu,  7 May 2020 17:14:25 +0200 (CEST)
Received: from localhost ([::1]:50070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jWiEC-0002Lc-O1
	for lists+qemu-devel@lfdr.de; Thu, 07 May 2020 11:14:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1jWiDQ-0001s2-L8
 for qemu-devel@nongnu.org; Thu, 07 May 2020 11:13:36 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:50625
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1jWiDP-0004rw-SI
 for qemu-devel@nongnu.org; Thu, 07 May 2020 11:13:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588864414;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=egwXN44k4Pp3t6qWyEGlbMdl5/37Xfr0x97j8715ddw=;
 b=ibEQEynIvhyrs0zmWZLsSRGYa4LsGudQQf37xTG/uTID5F+W3k7itZAYZvSifVZlTalbbu
 3ckIAE5A4mVIa13gLbfiBqA4jy3Hi1+QZId1eXlprTuvKwX2ey6GcQvXtd3fgEw4R7nO5T
 SnCGO7rNfdbdX8LYGkvExCFzEVLxW8g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-38-pHvlmXhwPWCQwNkW_1jyJA-1; Thu, 07 May 2020 11:13:32 -0400
X-MC-Unique: pHvlmXhwPWCQwNkW_1jyJA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EDC05835B42;
 Thu,  7 May 2020 15:13:30 +0000 (UTC)
Received: from [10.3.114.73] (ovpn-114-73.phx2.redhat.com [10.3.114.73])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7381760CCC;
 Thu,  7 May 2020 15:13:30 +0000 (UTC)
Subject: Re: [PATCH 2/3] mirror: Make sure that source and target size match
To: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
References: <20200507145228.323412-1-kwolf@redhat.com>
 <20200507145228.323412-3-kwolf@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <fde78263-d1f8-6f3b-ec9c-f8527194c9a9@redhat.com>
Date: Thu, 7 May 2020 10:13:29 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200507145228.323412-3-kwolf@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/07 02:00:54
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: vsementsov@virtuozzo.com, jsnow@redhat.com, qemu-devel@nongnu.org,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/7/20 9:52 AM, Kevin Wolf wrote:
> If the target is shorter than the source, mirror would copy data until
> it reaches the end of the target and then fail with an I/O error when
> trying to write past the end.
> 
> If the target is longer than the source, the mirror job would complete
> successfully, but the target wouldn't actually be an accurate copy of
> the source image (it would contain some additional garbage at the end).
> 
> Fix this by checking that both images have the same size when the job
> starts.
> 
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>   block/mirror.c | 21 ++++++++++++---------
>   1 file changed, 12 insertions(+), 9 deletions(-)

An alternative would be trying to resize the target (like we have to do 
with active commit), but I'm fine with being conservative for now by 
forcing the user to have correct sizing, where we have the option to add 
magic resizing later only if it proves useful and not introducing more 
potential issues.

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


