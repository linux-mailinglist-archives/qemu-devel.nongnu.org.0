Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AECE23EEAE8
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Aug 2021 12:24:22 +0200 (CEST)
Received: from localhost ([::1]:58590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFwGb-0003Oz-CH
	for lists+qemu-devel@lfdr.de; Tue, 17 Aug 2021 06:24:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mFwFZ-0002C2-Li
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 06:23:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55197)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mFwFW-0004bB-Lz
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 06:23:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629195793;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MACDhEG65gG89DvU0K5zqbThYFQMoZxPNr/cbDS1yW0=;
 b=QEUY3X9oKYYbdc2Zyn8u+lEV5Yl/TZSNR/i9v24SX6eyv1D9HySgwV5XSFE3ug5c/+3Glm
 62Zi09KEYS7MiLsweNHm9PrRgh7dz1iJVFakJDosdUgTt6CIJ+xNN8ZtWiHOCPHXfFdXav
 PkgJE7qHSa5iFRqfoQPuQ/lneYw++To=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-492-LC0ECSC8PKSBgaHtOnfhiw-1; Tue, 17 Aug 2021 06:23:12 -0400
X-MC-Unique: LC0ECSC8PKSBgaHtOnfhiw-1
Received: by mail-wr1-f72.google.com with SMTP id
 m5-20020a5d6a050000b0290154e83dce73so6351299wru.19
 for <qemu-devel@nongnu.org>; Tue, 17 Aug 2021 03:23:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MACDhEG65gG89DvU0K5zqbThYFQMoZxPNr/cbDS1yW0=;
 b=WqIBZ7JXHuOqaws7kXzH89WCDwBCGBza1RPwC6jlw9Pj/bJR06V9KUu+40h2tAfox9
 daThv0+0THA2vLaGqP9BHRf9duvSXxWhKgFd4k8t8Szjo2jidjsB1XzAtBUvPFDGzBNA
 26S/EjXNeeVS4F7RzaNGo8hHF4vU57/Tkoy3oO978FaWuoBYadwwMAR97R7KECF7q6IU
 E8jGvndCkv3NaZVpyH0T63sJYKHsppAE+yOup32ZxOV4LzSzsI5ARldBneZoIS4TmbRe
 IqQdZ4QYvhIR5m25OVjYcYltD0Q7b2EnXuiQQJDY6QpaRkvZRJxw5k5XrFHB1E9ELvTB
 lSVQ==
X-Gm-Message-State: AOAM532AU8IPOOyRDZUEvIuPDoVammhNWD6hSs1K2Hb1RlJExpNpAKNw
 bPnZvU766U3L+PME2bYq60Wf1RJIVd2DKX2aAlV118XDUbpablwAOjE9K+j1xNRggTNOm2Morhp
 GdL7mBeYQL/6bgRPwneHYZf5l1TgchanfhHNceppzuY5r/7E6Rl9IpXhTQXBWUyEt
X-Received: by 2002:a7b:cf0c:: with SMTP id l12mr2556316wmg.62.1629195791016; 
 Tue, 17 Aug 2021 03:23:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwv1kukfF/ZN2yiPlURyvkcH5w962op2z2T53G0RkM4h3GGUGDL51yDaSNogaxViKnmNf63BA==
X-Received: by 2002:a7b:cf0c:: with SMTP id l12mr2556288wmg.62.1629195790759; 
 Tue, 17 Aug 2021 03:23:10 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id z1sm1905740wrv.22.2021.08.17.03.23.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Aug 2021 03:23:10 -0700 (PDT)
Subject: Re: [PATCH] block/file-win32: add reopen handlers
To: Viktor Prutyanov <viktor.prutyanov@phystech.edu>, kwolf@redhat.com,
 hreitz@redhat.com, sw@weilnetz.de, qemu-block@nongnu.org,
 qemu-devel@nongnu.org
References: <20210817101251.28438-1-viktor.prutyanov@phystech.edu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <9ac4fad6-d328-36e7-6d6c-d772150c19a8@redhat.com>
Date: Tue, 17 Aug 2021 12:23:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210817101251.28438-1-viktor.prutyanov@phystech.edu>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) DKIMWL_WL_HIGH=-0.698, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.71,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Viktor,

Thanks for the patch :)

On 8/17/21 12:12 PM, Viktor Prutyanov wrote:
> Make 'qemu-img commit' work on Windows.
> 
> Command 'commit' requires reopening backing file in RW mode. So,
> add reopen prepare/commit/abort handlers and change dwShareMode
> for CreateFile call in order to allow further read/write reopening.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/418
> Suggested-by: Hanna Reitz <hreitz@redhat.com>
> Signed-off-by: Viktor Prutyanov <viktor.prutyanov@phystech.edu>
> ---
>  block/file-win32.c | 85 +++++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 84 insertions(+), 1 deletion(-)
> 
> diff --git a/block/file-win32.c b/block/file-win32.c
> index 2642088bd6..e44878e6be 100644
> --- a/block/file-win32.c
> +++ b/block/file-win32.c
> @@ -58,6 +58,10 @@ typedef struct BDRVRawState {
>      QEMUWin32AIOState *aio;
>  } BDRVRawState;
>  
> +typedef struct BDRVRawReopenState {
> +    HANDLE hfile;
> +} BDRVRawReopenState;
> +
>  /*
>   * Read/writes the data to/from a given linear buffer.
>   *
> @@ -392,7 +396,7 @@ static int raw_open(BlockDriverState *bs, QDict *options, int flags,
>      }
>  
>      s->hfile = CreateFile(filename, access_flags,
> -                          FILE_SHARE_READ, NULL,
> +                          FILE_SHARE_READ | FILE_SHARE_WRITE, NULL,
>                            OPEN_EXISTING, overlapped, NULL);
>      if (s->hfile == INVALID_HANDLE_VALUE) {
>          int err = GetLastError();
> @@ -634,6 +638,81 @@ static int coroutine_fn raw_co_create_opts(BlockDriver *drv,
>      return raw_co_create(&options, errp);
>  }
>  
> +static int raw_reopen_prepare(BDRVReopenState *state,
> +        BlockReopenQueue *queue, Error **errp)

Invalid style alignment.

> +{
> +    BDRVRawState *s = state->bs->opaque;
> +    BDRVRawReopenState *rs;
> +    int access_flags;
> +    DWORD overlapped;
> +    int ret = 0;
> +
> +    rs = state->opaque = g_new0(BDRVRawReopenState, 1);
> +
> +    raw_parse_flags(state->flags, s->aio != NULL, &access_flags, &overlapped);
> +    rs->hfile = CreateFile(state->bs->filename, access_flags,
> +                           FILE_SHARE_READ | FILE_SHARE_WRITE, NULL,
> +                           OPEN_EXISTING, overlapped, NULL);
> +
> +    if (rs->hfile == INVALID_HANDLE_VALUE) {
> +        int err = GetLastError();
> +
> +        error_setg_win32(errp, err, "Could not reopen '%s'",
> +                         state->bs->filename);
> +        if (err == ERROR_ACCESS_DENIED) {
> +            ret = -EACCES;
> +        } else {
> +            ret = -EINVAL;
> +        }
> +        goto fail;
> +    }
> +
> +    if (s->aio) {
> +        ret = win32_aio_attach(s->aio, rs->hfile);
> +        if (ret < 0) {
> +            error_setg_errno(errp, -ret, "Could not enable AIO");
> +            goto fail;
> +        }
> +    }
To avoid non-NULL value in state->opaque on failure,
I'd use in prologue:

       rs = g_new0(BDRVRawReopenState, 1);

and here:

       state->opaque = rs;

> +    return 0;
> +
> +fail:

Shouldn't we free state->opaque on failure? (I'm not sure because
I don't know well the bdrv_reopen_prepare handler).

> +    return ret;
> +}
> +
> +static void raw_reopen_commit(BDRVReopenState *state)
> +{
> +    BDRVRawState *s = state->bs->opaque;
> +    BDRVRawReopenState *rs = state->opaque;
> +
> +    if (!rs) {

Indeed, raw_reopen_prepare() could let state->opaque non-NULL.

> +        return;
> +    }
> +
> +    CloseHandle(s->hfile);
> +    s->hfile = rs->hfile;
> +
> +    g_free(rs);
> +    state->opaque = NULL;
> +}
> +
> +static void raw_reopen_abort(BDRVReopenState *state)
> +{
> +    BDRVRawReopenState *rs = state->opaque;
> +
> +    if (!rs) {
> +        return;
> +    }
> +
> +    if (rs->hfile != INVALID_HANDLE_VALUE) {
> +        CloseHandle(rs->hfile);
> +    }
> +
> +    g_free(rs);
> +    state->opaque = NULL;
> +}
> +
>  static QemuOptsList raw_create_opts = {
>      .name = "raw-create-opts",
>      .head = QTAILQ_HEAD_INITIALIZER(raw_create_opts.head),
> @@ -659,6 +738,10 @@ BlockDriver bdrv_file = {
>      .bdrv_co_create_opts = raw_co_create_opts,
>      .bdrv_has_zero_init = bdrv_has_zero_init_1,
>  
> +    .bdrv_reopen_prepare = raw_reopen_prepare,
> +    .bdrv_reopen_commit  = raw_reopen_commit,
> +    .bdrv_reopen_abort   = raw_reopen_abort,
> +
>      .bdrv_aio_preadv    = raw_aio_preadv,
>      .bdrv_aio_pwritev   = raw_aio_pwritev,
>      .bdrv_aio_flush     = raw_aio_flush,
> 


