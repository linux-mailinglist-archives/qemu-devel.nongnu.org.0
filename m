Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E02A388B9D
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 12:24:09 +0200 (CEST)
Received: from localhost ([::1]:56072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljJN2-0001LR-H5
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 06:24:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ljJIj-0005cz-1d
 for qemu-devel@nongnu.org; Wed, 19 May 2021 06:19:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21696)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ljJIf-0000o7-SD
 for qemu-devel@nongnu.org; Wed, 19 May 2021 06:19:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621419576;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T5ehWv9IXR/RcFMusi+a0C+AN+lNWBL46fufQzZEkRQ=;
 b=gaHQjrHIB81dqCa1Wsw8KN3gqBvgx41D3ePS9cTAoELVIxBaSw5wz/LDv8Qz/YZ1Jb87wc
 dXeW/xebijHhV6Umu9Jf30qXWpYoyreAhkWD6KlvvnA5Ky5QlyRfddxzm0YgKbNT1azKCa
 fEKTWA9q2Dzy954OwO1wB/AaJa0PDeA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-191-oXnhRjBcOJeHxyHtWNn2pQ-1; Wed, 19 May 2021 06:19:33 -0400
X-MC-Unique: oXnhRjBcOJeHxyHtWNn2pQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 790021009446;
 Wed, 19 May 2021 10:19:32 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-85.ams2.redhat.com [10.36.112.85])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 56EFA5E275;
 Wed, 19 May 2021 10:19:29 +0000 (UTC)
Subject: Re: [RFC PATCH] block/vpc: Support probing of fixed-size VHD images
From: Thomas Huth <thuth@redhat.com>
To: qemu-block@nongnu.org, Kevin Wolf <kwolf@redhat.com>
References: <20210329072559.2668780-1-thuth@redhat.com>
Message-ID: <a14b4678-f447-4949-14e1-0d4be9e37e7c@redhat.com>
Date: Wed, 19 May 2021 12:19:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210329072559.2668780-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Cc: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 29/03/2021 09.25, Thomas Huth wrote:
> Fixed-size VHD images don't have a header, only a footer. To be able
> to still detect them right, support probing via the file name, too.
> 
> Without this change, images get detected as raw:
> 
> $ qemu-img create -f vpc -o subformat=fixed test.vhd 2G
> Formatting 'test.vhd', fmt=vpc size=2147483648 subformat=fixed
> $ qemu-img info test.vhd
> image: test.vhd
> file format: raw
> virtual size: 2 GiB (2147992064 bytes)
> disk size: 8 KiB
> 
> With this change:
> 
> $ qemu-img info test.vhd
> image: test.vhd
> file format: vpc
> virtual size: 2 GiB (2147991552 bytes)
> disk size: 8 KiB
> 
> Resolves: https://bugs.launchpad.net/qemu/+bug/1819182
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   I've marked the subject with RFC since I'm not quite sure whether this
>   is really a good idea... please let me know what you think about it...
> 
>   block/vpc.c | 12 +++++++++++-
>   1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/block/vpc.c b/block/vpc.c
> index 17a705b482..be561e4b39 100644
> --- a/block/vpc.c
> +++ b/block/vpc.c
> @@ -191,8 +191,18 @@ static uint32_t vpc_checksum(void *p, size_t size)
>   
>   static int vpc_probe(const uint8_t *buf, int buf_size, const char *filename)
>   {
> -    if (buf_size >= 8 && !strncmp((char *)buf, "conectix", 8))
> +    if (buf_size >= 8 && !strncmp((char *)buf, "conectix", 8)) {
>           return 100;
> +    }
> +
> +    /* It could be a fixed-size image without header -> check extension, too */
> +    if (filename) {
> +        int len = strlen(filename);
> +        if (len > 4 && !strcasecmp(&filename[len - 4], ".vhd")) {
> +            return 10;
> +        }
> +    }
> +
>       return 0;
>   }

Ping!

Anybody any comments on this one?

  Thomas


