Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C15ED6FF6BD
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 18:04:45 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px8lw-0003Pp-Lj; Thu, 11 May 2023 12:04:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jjongsma@redhat.com>)
 id 1px8lf-0003Kx-VT
 for qemu-devel@nongnu.org; Thu, 11 May 2023 12:03:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jjongsma@redhat.com>)
 id 1px8le-0007Oi-8W
 for qemu-devel@nongnu.org; Thu, 11 May 2023 12:03:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683821025;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lKBU27RLLrStKk92yUp7V7p7FXJVOEgBSHq0USI89jg=;
 b=XJW6ye0zok3SjTg+heuLrd0JuY8pI2h98B57K26fVe1r6y8miRsREcUJkLXWt7HcONuTES
 Hazkpnl5ZnVgLnPCGjphVr7F4rL6WoWjUVI9dn0c+jnnF47Sb8yrHXu2JELY9U256ASbDR
 FSpwD/vr/SbbLmE2iFbnqDeZQBcVwL8=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-441-5TSpyJbXOwWsUmzSH9j2sQ-1; Thu, 11 May 2023 12:03:27 -0400
X-MC-Unique: 5TSpyJbXOwWsUmzSH9j2sQ-1
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-61b738ecf88so50467206d6.0
 for <qemu-devel@nongnu.org>; Thu, 11 May 2023 09:03:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683821004; x=1686413004;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lKBU27RLLrStKk92yUp7V7p7FXJVOEgBSHq0USI89jg=;
 b=UDzzUfv/pWvW1sCMnaXVEDu1lVBPMvkoi4ejXvmjIxBZRG8i4PCqFfJHBOcGwlUtvz
 Qn+f6mmeK+4GfAOtDTwYENI2FPza2gKLzC40bYzWRKtPnxXjJnVF3y/FkNrmr7if+rGv
 1/+nSDNErs6I/6IBpMPEDW9awaJEBXt3r4f6ijsKoLZLdZa4mr3WRuQDeUinRU8KFtIR
 ZTXP+4GUhDnh9KxvDSLJfR9qXpUPEY+fyDDjtQY/Oy9ALmuMrqpBouRhc5Phi+/HXANy
 rksVGh7Gms1PRMyW0BQGSBmvUk7Y4uZoPWqPe/1LYP+IMbZh4T0L1icpxfIi5lin5DVT
 Abpw==
X-Gm-Message-State: AC+VfDzVnf/J4tm87zn6+c7cgyf81GgbPnilMCj1Q10iTrx97gODpTkO
 aFRdtkBW1CNLooqFSP9qew3tSs886EJaDRr13CJPYi5wgzANbXWRZY8IiaX1GAVc5cUG4LEyNPz
 AuZ7GivkRQR1A4GA=
X-Received: by 2002:a05:6214:c64:b0:60e:52e:33df with SMTP id
 t4-20020a0562140c6400b0060e052e33dfmr29646238qvj.36.1683821004325; 
 Thu, 11 May 2023 09:03:24 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7NlN9COXFRNNXuLoc9o1D94yRXAwlK2bZ0H92KDEAD8jEU3sGizb7RPTVFwz5sWu54qwkkjQ==
X-Received: by 2002:a05:6214:c64:b0:60e:52e:33df with SMTP id
 t4-20020a0562140c6400b0060e052e33dfmr29646202qvj.36.1683821004047; 
 Thu, 11 May 2023 09:03:24 -0700 (PDT)
Received: from [192.168.0.245] (207-153-48-138.fttp.usinternet.com.
 [207.153.48.138]) by smtp.gmail.com with ESMTPSA id
 v3-20020ad448c3000000b005ef5f7c1ae1sm2337701qvx.105.2023.05.11.09.03.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 May 2023 09:03:23 -0700 (PDT)
Message-ID: <1a89ee2e-2368-4051-f9ec-018641721484@redhat.com>
Date: Thu, 11 May 2023 11:03:22 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v3 1/1] block/blkio: use qemu_open() to support fd passing
 for virtio-blk
Content-Language: en-US
To: Stefano Garzarella <sgarzare@redhat.com>, qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>
References: <20230511091527.46620-1-sgarzare@redhat.com>
 <20230511091527.46620-2-sgarzare@redhat.com>
From: Jonathon Jongsma <jjongsma@redhat.com>
In-Reply-To: <20230511091527.46620-2-sgarzare@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jjongsma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.124, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 5/11/23 4:15 AM, Stefano Garzarella wrote:
> The virtio-blk-vhost-vdpa driver in libblkio 1.3.0 supports the new
> 'fd' property. Let's expose this to the user, so the management layer
> can pass the file descriptor of an already opened vhost-vdpa character
> device. This is useful especially when the device can only be accessed
> with certain privileges.
> 
> If the libblkio virtio-blk driver supports fd passing, let's always
> use qemu_open() to open the `path`, so we can handle fd passing
> from the management layer through the "/dev/fdset/N" special path.
> 
> Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
> ---
> 
> Notes:
>      v3:
>      - use qemu_open() on `path` to simplify libvirt code [Jonathon]


Thanks

The one drawback now is that it doesn't seem possible for libvirt to 
introspect whether or not qemu supports passing an fd to the driver or 
not. When I was writing my initial patch (before I realized that it was 
missing fd-passing), I just checked for the existence of the 
virtio-blk-vhost-vdpa device. But we actually need to know both that 
this device exists and supports fd passing. As far as I can tell, 
versions 7.2.0 and 8.0.0 include this device but won't accept fds.

Jonathon


> 
>   block/blkio.c | 53 ++++++++++++++++++++++++++++++++++++++++++---------
>   1 file changed, 44 insertions(+), 9 deletions(-)
> 
> diff --git a/block/blkio.c b/block/blkio.c
> index 0cdc99a729..6a6f20f923 100644
> --- a/block/blkio.c
> +++ b/block/blkio.c
> @@ -672,25 +672,60 @@ static int blkio_virtio_blk_common_open(BlockDriverState *bs,
>   {
>       const char *path = qdict_get_try_str(options, "path");
>       BDRVBlkioState *s = bs->opaque;
> -    int ret;
> +    bool fd_supported = false;
> +    int fd, ret;
>   
>       if (!path) {
>           error_setg(errp, "missing 'path' option");
>           return -EINVAL;
>       }
>   
> -    ret = blkio_set_str(s->blkio, "path", path);
> -    qdict_del(options, "path");
> -    if (ret < 0) {
> -        error_setg_errno(errp, -ret, "failed to set path: %s",
> -                         blkio_get_error_msg());
> -        return ret;
> -    }
> -
>       if (!(flags & BDRV_O_NOCACHE)) {
>           error_setg(errp, "cache.direct=off is not supported");
>           return -EINVAL;
>       }
> +
> +    if (blkio_get_int(s->blkio, "fd", &fd) == 0) {
> +        fd_supported = true;
> +    }
> +
> +    /*
> +     * If the libblkio driver supports fd passing, let's always use qemu_open()
> +     * to open the `path`, so we can handle fd passing from the management
> +     * layer through the "/dev/fdset/N" special path.
> +     */
> +    if (fd_supported) {
> +        int open_flags;
> +
> +        if (flags & BDRV_O_RDWR) {
> +            open_flags = O_RDWR;
> +        } else {
> +            open_flags = O_RDONLY;
> +        }
> +
> +        fd = qemu_open(path, open_flags, errp);
> +        if (fd < 0) {
> +            return -EINVAL;
> +        }
> +
> +        ret = blkio_set_int(s->blkio, "fd", fd);
> +        if (ret < 0) {
> +            error_setg_errno(errp, -ret, "failed to set fd: %s",
> +                             blkio_get_error_msg());
> +            qemu_close(fd);
> +            return ret;
> +        }
> +    } else {
> +        ret = blkio_set_str(s->blkio, "path", path);
> +        if (ret < 0) {
> +            error_setg_errno(errp, -ret, "failed to set path: %s",
> +                             blkio_get_error_msg());
> +            return ret;
> +        }
> +    }
> +
> +    qdict_del(options, "path");
> +
>       return 0;
>   }
>   


