Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EF962FF2C2
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 19:04:12 +0100 (CET)
Received: from localhost ([::1]:35078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2eJW-0004ep-Kx
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 13:04:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l2eHn-000453-KX
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 13:02:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:21897)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l2eHj-00022g-OW
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 13:02:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611252138;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H3AzriRm3uvUUNxFeqtVBBRBFfpUOibrEWd8BR2FbH0=;
 b=gg4WSYZfK+ytNg4gaA3LmO5CLLWVf3f/LzkVSQni4SfSvUhjkPCU6ZfrM0G51lhYVwP0h3
 Vcpe+BKPv9xeXyAWFBPxlU1ObOko7LIGuzn1shiuS4gQninTRgRw5uDlmF6rp1fnOJ4yGK
 ljMflaX0M4rEcCYqBWnktFPg5HfKoiU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-538-5jKwi6NHMIarCD9BkHPKyA-1; Thu, 21 Jan 2021 13:02:14 -0500
X-MC-Unique: 5jKwi6NHMIarCD9BkHPKyA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E883759;
 Thu, 21 Jan 2021 18:02:13 +0000 (UTC)
Received: from [10.3.113.116] (ovpn-113-116.phx2.redhat.com [10.3.113.116])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C6F4361F55;
 Thu, 21 Jan 2021 18:02:10 +0000 (UTC)
Subject: Re: [PATCH v3 2/2] block: move blk_exp_close_all() to qemu_cleanup()
To: Sergio Lopez <slp@redhat.com>, qemu-devel@nongnu.org
References: <20210121170700.59734-1-slp@redhat.com>
 <20210121170700.59734-3-slp@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <7ba7c46c-3435-c982-7f23-6e1abad26f83@redhat.com>
Date: Thu, 21 Jan 2021 12:02:10 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210121170700.59734-3-slp@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.168,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/21/21 11:07 AM, Sergio Lopez wrote:
> Move blk_exp_close_all() from bdrv_close() to qemu_cleanup(), before
> bdrv_drain_all_begin().
> 
> Export drivers may have coroutines yielding at some point in the block
> layer, so we need to shut them down before draining the block layer,
> as otherwise they may get stuck blk_wait_while_drained().

stuck in

> 
> RHBZ: https://bugzilla.redhat.com/show_bug.cgi?id=1900505
> Signed-off-by: Sergio Lopez <slp@redhat.com>
> ---
>  block.c            | 1 -
>  softmmu/runstate.c | 9 +++++++++
>  2 files changed, 9 insertions(+), 1 deletion(-)
> 

> @@ -783,6 +784,14 @@ void qemu_cleanup(void)
>       */
>      migration_shutdown();
>  
> +    /*
> +     * Close the exports before draining the block layer. The export
> +     * drivers may have coroutines yielding on it, so we need to clean
> +     * them up before the drain, as otherwise they may be get stuck in

s/be //

> +     * blk_wait_while_drained().
> +     */
> +    blk_exp_close_all();
> +
>      /*
>       * We must cancel all block jobs while the block layer is drained,
>       * or cancelling will be affected by throttling and thus may block
> 

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


