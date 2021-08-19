Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E0253F19CA
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Aug 2021 14:53:04 +0200 (CEST)
Received: from localhost ([::1]:45394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGhXb-0003VL-L4
	for lists+qemu-devel@lfdr.de; Thu, 19 Aug 2021 08:53:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mGhVq-0001vN-4g
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 08:51:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26485)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mGhVm-0004Pt-Sl
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 08:51:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629377469;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f9YBM1PnnjXcvsxKKwo4Gt5OJhhcwSmt9c/VM/CkwQI=;
 b=UIL+QhkI29LsDsELjjIA9vpPi51kg+Z7YglZHtwBbxuL24eZ5nSovsT2/S9OLWo9wVsKVA
 pOqyJC5BmLSgPlIDc9VdMFY+PGMbaJPobHI8dJCzI6HDEwiKHgEAKuJkNPv4DywsV6UJHF
 0uuTfR3/xwwAyak4hh41UyS11FTco9Q=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-489-pkbo96mTNjy46O1NZdQjcA-1; Thu, 19 Aug 2021 08:51:08 -0400
X-MC-Unique: pkbo96mTNjy46O1NZdQjcA-1
Received: by mail-wm1-f72.google.com with SMTP id
 z186-20020a1c7ec30000b02902e6a27a9962so3461196wmc.3
 for <qemu-devel@nongnu.org>; Thu, 19 Aug 2021 05:51:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=f9YBM1PnnjXcvsxKKwo4Gt5OJhhcwSmt9c/VM/CkwQI=;
 b=oOSESMl9L0MIoNXUtCanipXvAGuYSkc6REQvyWwJz2UlX9gZQ0msSsqU9iDsAJufvQ
 Mgp4MU8cFm8kSMJ/L7Lodvf/49qIg608+jgy/5KPzoN566nCuCuXhovSh7uk7TQ1FDMV
 eNz+8utSuTwsbY/Twx2plytL20S0KZEXLdjRAkvunj5PBhDjLxT0bXn41BSkz2gI5FVo
 /LcjE5nyAwh5i1gnyzNIxakjj2HmtZRxBcCYusn9Gu+Kr7Lv5y+6WqK+wnf8xJx/CPCF
 5ZH8lONCi85KrMqGMtky28D3mYGGg6APlbjqF11itl4e9Vo+VCGeVNOMUhMqe0mC370Q
 iloA==
X-Gm-Message-State: AOAM531y5oUhUO/aPw6h86s8aKQu51tEmunk/Kh6t5mI3u9553GPAYCr
 ryb2K+5tuY6Ykyuqmvib0fZ7h7Q2Xaf3TE6ooec9dKuuOS9nE8o9Zb1Elc5NyAoDO8jEDUzJteP
 TsfS2tNMSI/cjaIKU2xt+lWjuv65GWhKL5QCfH0uhPZ9Q+uftRxkpc2c+QBiCLVKy
X-Received: by 2002:adf:f704:: with SMTP id r4mr3799403wrp.389.1629377467546; 
 Thu, 19 Aug 2021 05:51:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwu8oOa5mPZQcC2Cmn7/+e+kUMlLDlvZUmpNMlGQzUZa+mIvz0IKnGtqzedKVTzPx8ZInJvuw==
X-Received: by 2002:adf:f704:: with SMTP id r4mr3799346wrp.389.1629377467060; 
 Thu, 19 Aug 2021 05:51:07 -0700 (PDT)
Received: from dresden.str.redhat.com ([2a02:908:1e46:160:b272:8083:d5:bc7d])
 by smtp.gmail.com with ESMTPSA id
 e11sm2851552wrm.80.2021.08.19.05.51.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Aug 2021 05:51:06 -0700 (PDT)
Subject: Re: [PATCH v3] block/file-win32: add reopen handlers
To: Viktor Prutyanov <viktor.prutyanov@phystech.edu>, philmd@redhat.com,
 kwolf@redhat.com, sw@weilnetz.de, qemu-block@nongnu.org,
 qemu-devel@nongnu.org
References: <20210817202115.16771-1-viktor.prutyanov@phystech.edu>
From: Hanna Reitz <hreitz@redhat.com>
Message-ID: <829993e6-0718-f54c-f480-9566477b907f@redhat.com>
Date: Thu, 19 Aug 2021 14:51:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210817202115.16771-1-viktor.prutyanov@phystech.edu>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -60
X-Spam_score: -6.1
X-Spam_bar: ------
X-Spam_report: (-6.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.591, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 17.08.21 22:21, Viktor Prutyanov wrote:
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
>   v2:
>      - fix indentation in raw_reopen_prepare
>      - free rs if raw_reopen_prepare fails
>   v3:
>      - restore suggested-by field missed in v2
>
>   block/file-win32.c | 90 +++++++++++++++++++++++++++++++++++++++++++++-
>   1 file changed, 89 insertions(+), 1 deletion(-)

Overall, looks good to me, thanks!

I just have some questions/suggestions on places where this patch 
deviates from my draft:

> diff --git a/block/file-win32.c b/block/file-win32.c
> index 2642088bd6..9dcbb2b53b 100644
> --- a/block/file-win32.c
> +++ b/block/file-win32.c
> @@ -58,6 +58,10 @@ typedef struct BDRVRawState {
>       QEMUWin32AIOState *aio;
>   } BDRVRawState;
>   
> +typedef struct BDRVRawReopenState {
> +    HANDLE hfile;
> +} BDRVRawReopenState;
> +
>   /*
>    * Read/writes the data to/from a given linear buffer.
>    *
> @@ -392,7 +396,7 @@ static int raw_open(BlockDriverState *bs, QDict *options, int flags,
>       }
>   
>       s->hfile = CreateFile(filename, access_flags,
> -                          FILE_SHARE_READ, NULL,
> +                          FILE_SHARE_READ | FILE_SHARE_WRITE, NULL,
>                             OPEN_EXISTING, overlapped, NULL);
>       if (s->hfile == INVALID_HANDLE_VALUE) {
>           int err = GetLastError();
> @@ -634,6 +638,86 @@ static int coroutine_fn raw_co_create_opts(BlockDriver *drv,
>       return raw_co_create(&options, errp);
>   }
>   
> +static int raw_reopen_prepare(BDRVReopenState *state,
> +                              BlockReopenQueue *queue, Error **errp)
> +{
> +    BDRVRawState *s = state->bs->opaque;
> +    BDRVRawReopenState *rs;
> +    int access_flags;
> +    DWORD overlapped;
> +    int ret = 0;

Comparing with my original draft 
(https://gitlab.com/hreitz/qemu/-/commit/433ee9a6559dad253e7553692f942dc1824132f0), 
I prevented reopening any node that is not of type FTYPE_FILE (i.e. host 
devices), just to be sure (and because I thought we wouldn’t really need 
other cases).

I don’t strongly lean either way, so perhaps we should indeed just allow 
reopening host devices, but if we do, I think the CreateFile() call in 
hdev_open() should be changed to pass FILE_SHARE_READ | 
FILE_SHARED_WRITE, too (instead of just FILE_SHARE_READ).

> +
> +    rs = g_new0(BDRVRawReopenState, 1);
> +

I had this comment here:

> /*
>  * We do not support changing any options (only flags). By leaving
>  * all options in state->options, we tell the generic reopen code
>  * that we do not support changing any of them, so it will verify
>  * that their values did not change.
>  */

Is there a reason you chose to not include it?  (I think it’s quite nice 
to have this comment, because otherwise it may not be clear why it’s 
“fine” that we don’t look into state->options at all – it’s fine because 
leaving it untouched will make the generic block code verify that 
nothing was changed.)

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
> +
> +    state->opaque = rs;
> +
> +    return 0;
> +
> +fail:
> +    g_free(rs);
> +    state->opaque = NULL;
> +
> +    return ret;
> +}
> +
> +static void raw_reopen_commit(BDRVReopenState *state)
> +{
> +    BDRVRawState *s = state->bs->opaque;
> +    BDRVRawReopenState *rs = state->opaque;
> +
> +    if (!rs) {
> +        return;
> +    }

I hope this can’t happen (and I believe it’d be a bug if it did), so I’d 
prefer an

assert(rs != NULL);

instead.

Hanna

> +
> +    CloseHandle(s->hfile);
> +    s->hfile = rs->hfile;
> +
> +    g_free(rs);
> +    state->opaque = NULL;
> +}


