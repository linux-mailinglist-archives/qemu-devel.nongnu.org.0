Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 530132B24DD
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Nov 2020 20:46:28 +0100 (CET)
Received: from localhost ([::1]:55024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdf1f-0007N9-Cv
	for lists+qemu-devel@lfdr.de; Fri, 13 Nov 2020 14:46:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kdezZ-0006rP-KW
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 14:44:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:37346)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kdezX-0004Rl-VP
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 14:44:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605296654;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UWTtZQEP4CnLn//iCLmgNYPo6ks5FrQDLLV7aRATc8Y=;
 b=F3Yp+GIMO0+1OSMutYDOp1PInJjHjTpHiX6ilq2czDy34louKhLr6W6uczHChFGB4ermDc
 3ufHWuAgCq74MfgcMKlLgUnMHhcjJQ6U+cs+EjZyVS9ZW54rzdqUHkQa3D2I2OWsP4a3pv
 rpPW/SSR00TCu/W+3ytI+SJZrUYouSA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-532-37LQpmLyMAOt3KFYBX3Kng-1; Fri, 13 Nov 2020 14:44:10 -0500
X-MC-Unique: 37LQpmLyMAOt3KFYBX3Kng-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C01B418B9EC8;
 Fri, 13 Nov 2020 19:44:08 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-114-96.ams2.redhat.com
 [10.36.114.96])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3BC315C26A;
 Fri, 13 Nov 2020 19:44:07 +0000 (UTC)
Subject: Re: [PATCH v4 2/2] quorum: Implement bdrv_co_pwrite_zeroes()
To: Alberto Garcia <berto@igalia.com>, qemu-devel@nongnu.org
References: <cover.1605286097.git.berto@igalia.com>
 <2f09c842781fe336b4c2e40036bba577b7430190.1605286097.git.berto@igalia.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <0bae0aab-999e-1a68-852e-decc7149bbf5@redhat.com>
Date: Fri, 13 Nov 2020 20:44:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <2f09c842781fe336b4c2e40036bba577b7430190.1605286097.git.berto@igalia.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 16:09:27
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Tao Xu <tao3.xu@intel.com>,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 13.11.20 17:52, Alberto Garcia wrote:
> This simply calls bdrv_co_pwrite_zeroes() in all children.
> 
> bs->supported_zero_flags is also set to the flags that are supported
> by all children.
> 
> Signed-off-by: Alberto Garcia <berto@igalia.com>
> ---
>   block/quorum.c             | 36 ++++++++++++++++++++++++++++++++++--
>   tests/qemu-iotests/312     | 11 +++++++++++
>   tests/qemu-iotests/312.out |  8 ++++++++
>   3 files changed, 53 insertions(+), 2 deletions(-)

Reviewed-by: Max Reitz <mreitz@redhat.com>

> @@ -897,6 +910,21 @@ static QemuOptsList quorum_runtime_opts = {
>       },
>   };
>   
> +static void quorum_refresh_flags(BlockDriverState *bs)
> +{
> +    BDRVQuorumState *s = bs->opaque;
> +    int i;
> +
> +    bs->supported_zero_flags =
> +        BDRV_REQ_FUA | BDRV_REQ_MAY_UNMAP | BDRV_REQ_NO_FALLBACK;
> +
> +    for (i = 0; i < s->num_children; i++) {
> +        bs->supported_zero_flags &= s->children[i]->bs->supported_zero_flags;
> +    }
> +
> +    bs->supported_zero_flags |= BDRV_REQ_WRITE_UNCHANGED;

This made me wonder whether it’s true when rewrite_corrupted is set.  I 
think it is, because that only does something when reading from the 
children (i.e. not for write requests from parents, where this flag 
might be set).

Looking into quorum_child_perm(), quorum doesn’t take the WRITE 
permission on its children even if rewrite_corrupted is true.  Hm... 
Something to look into.

Max

> +}
> +
>   static int quorum_open(BlockDriverState *bs, QDict *options, int flags,
>                          Error **errp)
>   {


