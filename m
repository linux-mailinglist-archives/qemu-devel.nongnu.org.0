Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41B1F6F545C
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 11:17:04 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu8an-0007JF-O0; Wed, 03 May 2023 05:16:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1pu8aj-0007G3-H3
 for qemu-devel@nongnu.org; Wed, 03 May 2023 05:16:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1pu8ah-00089E-Jv
 for qemu-devel@nongnu.org; Wed, 03 May 2023 05:16:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683105363;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7PfWx+4L8tVMDT6YvXRaefQEdtEekB0UNnbXp8Nir9s=;
 b=fJc/ygEtHRXaa9uQHscaTwbilnhsovGsPsHZgp3pFLFv6y40fxyz2u3Fc5qx0iR91NjH4x
 Mat1EAKs+zfarch0hZCg/weMETCUVcMRI4dGu+X0EOHfPwpF0TqD2w0DqlgBA+gz1KtV0Y
 kHkK5NPMwdqNKF4NIzXRUHNdrIw92Ys=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-158-ji4_NXV-PvW44ya957xSNA-1; Wed, 03 May 2023 05:16:01 -0400
X-MC-Unique: ji4_NXV-PvW44ya957xSNA-1
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-95f6f291b9aso592549466b.3
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 02:16:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683105361; x=1685697361;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7PfWx+4L8tVMDT6YvXRaefQEdtEekB0UNnbXp8Nir9s=;
 b=dSoRaET/eiK5mLoZwlO8lUWxAt+sMUyP5y6evDkEjGAuU8RINRBfCMxSVZAwvIuyTf
 pZzWYd1Wx4g+gEQAOtPFAjIy1Tb37EBRUO4PuWCllOaS81oOtNICxPlxke5C2f1ccZ4j
 5d1nXbrxz+pg//G2dZ7ABnBfsRFLlxY5/SuUMXEJJXPqmpczZsInCTUeGb1+cH5G3Dos
 x0FsueGMopXBppDNTaqlNQeVwQh98ck8jMyzY3F3xJl+Rnd8q3SP+Hfjv9+lyWWTY0+Q
 bnX7FTFLEA52AGj7SS1Jct+NlcyKZZ/tPVhXQPYw580gjtDa+C8/4wqbcOygYsW4WVQI
 0S+A==
X-Gm-Message-State: AC+VfDyba92QJXJ99O5wosxxhITVtIvAhQTBxG6nGbUlXxPrZc9YF4dL
 De/MeE2Qe1mFZjShQepjGLnewkt3JomIIZbpZXq9TYX8m2zxsjGbPRvTEZea1/zOYHy2j+Y/T7Q
 Hk/p4uae24Z22SxI=
X-Received: by 2002:a17:906:d54d:b0:94f:6003:c3cf with SMTP id
 cr13-20020a170906d54d00b0094f6003c3cfmr2583723ejc.16.1683105360801; 
 Wed, 03 May 2023 02:16:00 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5WLeSGpzcIVY/XfjlS2IfOAYucKTn1WrNEtXc0q8vqQQO2tF+Mg02MDR3eR/429qcymt+5EQ==
X-Received: by 2002:a17:906:d54d:b0:94f:6003:c3cf with SMTP id
 cr13-20020a170906d54d00b0094f6003c3cfmr2583699ejc.16.1683105360439; 
 Wed, 03 May 2023 02:16:00 -0700 (PDT)
Received: from sgarzare-redhat ([185.29.96.107])
 by smtp.gmail.com with ESMTPSA id
 bw7-20020a170907928700b0095844605bb8sm14420043ejc.10.2023.05.03.02.15.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 02:15:59 -0700 (PDT)
Date: Wed, 3 May 2023 11:15:56 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, 
 Hanna Reitz <hreitz@redhat.com>, jjongsma@redhat.com,
 Kevin Wolf <kwolf@redhat.com>, 
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH] block/blkio: add 'fd' option to virtio-blk-vhost-vdpa
 driver
Message-ID: <2dhjygwf76syej7espfdecxcoawborvm2qqx66bz3g6ljdvg53@xo3d64wtbdeu>
References: <20230502145050.224615-1-sgarzare@redhat.com>
 <20230502190232.GB535070@fedora>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20230502190232.GB535070@fedora>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Tue, May 02, 2023 at 03:02:32PM -0400, Stefan Hajnoczi wrote:
>On Tue, May 02, 2023 at 04:50:50PM +0200, Stefano Garzarella wrote:
>> The virtio-blk-vhost-vdpa driver in libblkio 1.3.0 supports the new
>> 'fd' property. Let's expose this to the user, so the management layer
>> can pass the file descriptor of an already opened vhost-vdpa character
>> device. This is useful especially when the device can only be accessed
>> with certain privileges.
>>
>> Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
>> ---
>>
>> Notes:
>>     As an alternative we could support passing `/dev/fdset/N` via 'path',
>>     always opening the path with qemu_open() and passing the fd to the
>>     libblkio driver.
>>     I preferred to add a new parameter though, because the code is
>>     simpler without changing how path works (alternatively we should check
>>     first if fd is supported by the driver or not).
>>
>>     What do you think?
>
>I think the approach in this patch is fine.
>
>>
>>     Thanks,
>>     Stefano
>>
>>  qapi/block-core.json |  6 +++++-
>>  block/blkio.c        | 45 +++++++++++++++++++++++++++++++++++++++++++-
>>  2 files changed, 49 insertions(+), 2 deletions(-)
>>
>> diff --git a/qapi/block-core.json b/qapi/block-core.json
>> index b57978957f..9f70777d49 100644
>> --- a/qapi/block-core.json
>> +++ b/qapi/block-core.json
>> @@ -3841,10 +3841,14 @@
>>  #
>>  # @path: path to the vhost-vdpa character device.
>>  #
>> +# @fd: file descriptor of an already opened vhost-vdpa character device.
>> +#      (Since 8.1)
>> +#
>>  # Since: 7.2
>>  ##
>>  { 'struct': 'BlockdevOptionsVirtioBlkVhostVdpa',
>> -  'data': { 'path': 'str' },
>> +  'data': { '*path': 'str',
>> +            '*fd': 'str' },
>>    'if': 'CONFIG_BLKIO' }
>>
>>  ##
>> diff --git a/block/blkio.c b/block/blkio.c
>> index 0cdc99a729..98394b5745 100644
>> --- a/block/blkio.c
>> +++ b/block/blkio.c
>> @@ -694,6 +694,49 @@ static int blkio_virtio_blk_common_open(BlockDriverState *bs,
>>      return 0;
>>  }
>>
>> +static int blkio_virtio_blk_vhost_vdpa_open(BlockDriverState *bs,
>> +        QDict *options, int flags, Error **errp)
>> +{
>> +    const char *path = qdict_get_try_str(options, "path");
>> +    const char *fd_str = qdict_get_try_str(options, "fd");
>> +    BDRVBlkioState *s = bs->opaque;
>> +    int ret;
>> +
>> +    if (path && fd_str) {
>> +        error_setg(errp, "'path' and 'fd' options are mutually exclusive");
>> +        return -EINVAL;
>> +    }
>> +
>> +    if (!path && !fd_str) {
>> +        error_setg(errp, "none of 'path' or 'fd' options was specified");
>> +        return -EINVAL;
>> +    }
>> +
>> +    if (path) {
>> +        ret = blkio_set_str(s->blkio, "path", path);
>> +        qdict_del(options, "path");
>> +        if (ret < 0) {
>> +            error_setg_errno(errp, -ret, "failed to set path: %s",
>> +                             blkio_get_error_msg());
>> +            return ret;
>> +        }
>> +    } else {
>> +        ret = blkio_set_str(s->blkio, "fd", fd_str);
>
>monitor_fd_param() is used by vhost-net, vhost-vsock, vhost-scsi, etc.
>
>I think QEMU should parse the fd string and resolve it to a file
>descriptor so the fd passing syntax matches the other vhost devices.

Okay, but I have a linker issue if I use monitor_fd_param().
IIUC because blkio is built as a module, so what about adding
qemu_fd_param() in libqemuutil?

I mean something like this:

diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
index 9eff0be95b..87360c983a 100644
--- a/include/qemu/osdep.h
+++ b/include/qemu/osdep.h
@@ -568,6 +568,7 @@ int qemu_lock_fd(int fd, int64_t start, int64_t len, bool exclusive);
  int qemu_unlock_fd(int fd, int64_t start, int64_t len);
  int qemu_lock_fd_test(int fd, int64_t start, int64_t len, bool exclusive);
  bool qemu_has_ofd_lock(void);
+int qemu_fd_param(const char *fdname, Error **errp);
  #endif

  #if defined(__HAIKU__) && defined(__i386__)
diff --git a/util/osdep.c b/util/osdep.c
index e996c4744a..ed0832810b 100644
--- a/util/osdep.c
+++ b/util/osdep.c
@@ -234,6 +234,11 @@ bool qemu_has_ofd_lock(void)
  #endif
  }

+int qemu_fd_param(const char *fdname, Error **errp)
+{
+    return monitor_fd_param(monitor_cur(), fdname, errp);
+}
+
  static int qemu_lock_fcntl(int fd, int64_t start, int64_t len, int fl_type)
  {
      int ret;

Thanks,
Stefano


