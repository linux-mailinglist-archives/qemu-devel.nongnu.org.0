Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 514BB35E088
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 15:47:52 +0200 (CEST)
Received: from localhost ([::1]:49610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWJOR-0008FK-DY
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 09:47:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lWJKR-0006CU-So
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 09:43:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28429)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lWJKP-0007j9-5S
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 09:43:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618321420;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fEDmTaI9cHDNJ/8GO/HMIGBKm66AEMkxQW/a1ggHvoU=;
 b=DHJ1WGlLdlwOpnQb/9D7780hNSWzBeAOnDa5GuNJlR10mGij8WMHKJMJBZ6jp9NQtk46Nc
 UGXMZW0lg3dUNWW9w20nH0dTL9uNoeRCEbBuNFGaeRJ8ejX+m2rcEGPQ1za8eTnCDnj6Bu
 8lzYM+T7558rf3TSLUPvqk8HYBnGOsk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-428--N2tHZcvPoSJW8Ob8ZKITQ-1; Tue, 13 Apr 2021 09:43:37 -0400
X-MC-Unique: -N2tHZcvPoSJW8Ob8ZKITQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DD202188352E;
 Tue, 13 Apr 2021 13:43:36 +0000 (UTC)
Received: from [10.3.114.86] (ovpn-114-86.phx2.redhat.com [10.3.114.86])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 85EA260DA0;
 Tue, 13 Apr 2021 13:43:36 +0000 (UTC)
Subject: Re: [PATCH 2/2] qemu-img convert: Unshare write permission for source
To: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
References: <20210413132324.24043-1-kwolf@redhat.com>
 <20210413132324.24043-3-kwolf@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <5edcdaf9-2133-b426-82bb-8849264ff4fd@redhat.com>
Date: Tue, 13 Apr 2021 08:43:35 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210413132324.24043-3-kwolf@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: xuwei@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/13/21 8:23 AM, Kevin Wolf wrote:
> For a successful conversion of an image, we must make sure that its
> content doesn't change during the conversion.
> 
> A special case of this is using the same image file both as the source
> and as the destination. If both input and output format are raw, the
> operation would just be useless work, with other formats it is a sure
> way to destroy the image. This will now fail because the image file
> can't be opened a second time for the output when opening it for the
> input has already acquired file locks to unshare BLK_PERM_WRITE.
> 
> Nevertheless, if there is some reason in a special case why it is
> actually okay to allow writes to the image while it is being converted,
> -U can still be used to force sharing all permissions.
> 
> Note that for most image formats, BLK_PERM_WRITE would already be
> unshared by the format driver, so this only really makes a difference
> for raw source images (but any output format).
> 
> Reported-by: Xueqiang Wei <xuwei@redhat.com>
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>  qemu-img.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Eric Blake <eblake@redhat.com>

> 
> diff --git a/qemu-img.c b/qemu-img.c
> index babb5573ab..a5993682aa 100644
> --- a/qemu-img.c
> +++ b/qemu-img.c
> @@ -2146,7 +2146,7 @@ static void set_rate_limit(BlockBackend *blk, int64_t rate_limit)
>  
>  static int img_convert(int argc, char **argv)
>  {
> -    int c, bs_i, flags, src_flags = 0;
> +    int c, bs_i, flags, src_flags = BDRV_O_NO_SHARE;
>      const char *fmt = NULL, *out_fmt = NULL, *cache = "unsafe",
>                 *src_cache = BDRV_DEFAULT_CACHE, *out_baseimg = NULL,
>                 *out_filename, *out_baseimg_param, *snapshot_name = NULL;
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


