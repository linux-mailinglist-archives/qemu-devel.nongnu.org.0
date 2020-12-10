Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 889B32D5FE4
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 16:39:03 +0100 (CET)
Received: from localhost ([::1]:50282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knO22-00009j-IR
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 10:39:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1knO09-0008AV-TK
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 10:37:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:36260)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1knO06-0005w2-MT
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 10:37:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607614621;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CQfkZ3KUBDFJd0ftfuOxiKkNM4+Pp6WIwrhjsV1OGSg=;
 b=N9s7Qo8zmzelxma45vZS3yRErFKy9+qbzqwweOXF02jMYXqx3p54h7wCu4rJRsV6QZ2ZGl
 VtqZm65mS/L7HT4Ug6rO5iCMFvo/hArEXOccPtxPkn0a6aBgnzV/SAO4uDjCiGLUeKsZHa
 N9W1ECIb/RetbWLbIdU+fwaOk8jfKIY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-324-aUtV4kwsPfSyx5I0YENWhw-1; Thu, 10 Dec 2020 10:36:57 -0500
X-MC-Unique: aUtV4kwsPfSyx5I0YENWhw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 78AE0190A7A5;
 Thu, 10 Dec 2020 15:36:56 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-115-58.ams2.redhat.com
 [10.36.115.58])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7613C19C78;
 Thu, 10 Dec 2020 15:36:51 +0000 (UTC)
Subject: Re: [PATCH] block/nvme: Implement fake truncate() coroutine
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20201210125202.858656-1-philmd@redhat.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <762c142d-9c90-d475-03b0-ac9fb388f454@redhat.com>
Date: Thu, 10 Dec 2020 16:36:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201210125202.858656-1-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Maxim Levitsky <mlevitsk@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Xueqiang Wei <xuwei@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10.12.20 13:52, Philippe Mathieu-Daudé wrote:
> NVMe drive can not be shrunk.

*cannot

> Since commit c80d8b06cfa we can use the @exact parameter (set
> to false) to return success if the block device is larger than
> the requested offset (even if we can not be shrunk).
> 
> Use this parameter to implement the NVMe truncate() coroutine,
> similarly how it is done for the iscsi and file-posix drivers
> (see commit 82325ae5f2f "Evaluate @exact in protocol drivers").
> 
> Reported-by: Xueqiang Wei <xuwei@redhat.com>
> Suggested-by: Max Reitz <mreitz@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>   block/nvme.c | 24 ++++++++++++++++++++++++
>   1 file changed, 24 insertions(+)
Thanks!  (Fixed the typo and) applied to my block branch:

https://git.xanclic.moe/XanClic/qemu/commits/branch/block


