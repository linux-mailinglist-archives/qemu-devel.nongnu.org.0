Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD7C53F707A
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 09:35:45 +0200 (CEST)
Received: from localhost ([::1]:51472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mInRe-000706-OI
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 03:35:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mInQC-0005lz-A7
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 03:34:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26547)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mInQ9-0002y6-QM
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 03:34:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629876840;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ru2CLl2WA3L/nNjW2KGiEI084j/BhvsdVH2P4UbAal4=;
 b=MK5k0HLfHHU1rnCehwQAy7CGyWg8zV+kNuhTMH/kpEXmXjeMRSazCHNuHop6KH3r6f7u8I
 5EgUtuvqTQzGoVRl8RehsXVy8xyg/B5Aq1W49cOMN3odTq/J0srz/P9sd12f2Stdn+nm6E
 N7a6mAy8vbVT9nS3Nv7Zw2+V+3mf2f4=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-288-rV4wJDISNN6H8DMgbougBQ-1; Wed, 25 Aug 2021 03:33:56 -0400
X-MC-Unique: rV4wJDISNN6H8DMgbougBQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 b7-20020a5d4d87000000b001575d1053d2so1501199wru.23
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 00:33:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=ru2CLl2WA3L/nNjW2KGiEI084j/BhvsdVH2P4UbAal4=;
 b=RFkkDfeKbPL+JotwegjXZFzG/NnB0Y1wRTuPHRcECRpCKlZcNFTAvbFGJmJvDLpq62
 nS+egz3uck/j/2NjJBipDdOGyU45y2tQh08NavLQuycJOcdYyDTrujgdmJRFuD4lAUMP
 WhfNhTSJ+HMYbZfZDOXJpHtBIRfWzIN4UlKCmNZBhM9EoE2ET8PlbaiwdFFOxIZ55kT5
 UiPEldkf50XCA4MRjMzf1F+XUWUJ/ALufYeNMCjGGHNizTvii0VYC4lYyesn6K9+UgaH
 tOssbM+I6W9mjz7YfnNQKaQ8Rs4mdI/vLatF3ocHbvgGHJ5IxkwA1Dfqz3A0NYzsZOYA
 2AJQ==
X-Gm-Message-State: AOAM532E7MOdvh96w3gTT6sBdgAsTkcH/2QkeHJUeq1PzFsVcgh9JS5y
 wHi1QdWlIutI61/LNU7LOKot8j4/pFiUZbxHaVdJjs/D8/8ANgOMtUyKVOvGclcgcx4jklaca63
 XGXF/0qCPIkjkPeg=
X-Received: by 2002:a7b:ce93:: with SMTP id q19mr7953173wmj.7.1629876835597;
 Wed, 25 Aug 2021 00:33:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwe3uCDDxwDoKP6ZB0FAS9OQaOHScz34XRttdjFlYh0GGeCY07CL9uE70QkzUmvsnGgL/EV2g==
X-Received: by 2002:a7b:ce93:: with SMTP id q19mr7953136wmj.7.1629876835243;
 Wed, 25 Aug 2021 00:33:55 -0700 (PDT)
Received: from dresden.str.redhat.com ([2a02:908:1e46:160:b272:8083:d5:bc7d])
 by smtp.gmail.com with ESMTPSA id
 k4sm2883344wrm.74.2021.08.25.00.33.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Aug 2021 00:33:54 -0700 (PDT)
Subject: Re: [PATCH v4] block/file-win32: add reopen handlers
To: Viktor Prutyanov <viktor.prutyanov@phystech.edu>, philmd@redhat.com,
 kwolf@redhat.com, sw@weilnetz.de, yan@daynix.com, qemu-block@nongnu.org,
 qemu-devel@nongnu.org
References: <20210824234817.13343-1-viktor.prutyanov@phystech.edu>
From: Hanna Reitz <hreitz@redhat.com>
Message-ID: <73536e56-35d9-03c0-2d7d-51d2adb4a7c1@redhat.com>
Date: Wed, 25 Aug 2021 09:33:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210824234817.13343-1-viktor.prutyanov@phystech.edu>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.747,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.305, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Helge Konetzka <hk@zapateado.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 25.08.21 01:48, Viktor Prutyanov wrote:
> Make 'qemu-img commit' work on Windows.
>
> Command 'commit' requires reopening backing file in RW mode. So,
> add reopen prepare/commit/abort handlers and change dwShareMode
> for CreateFile call in order to allow further read/write reopening.
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/418
>
> Suggested-by: Hanna Reitz <hreitz@redhat.com>
> Signed-off-by: Viktor Prutyanov <viktor.prutyanov@phystech.edu>
> Tested-by: Helge Konetzka <hk@zapateado.de>
> ---
>   v2:
>      - fix indentation in raw_reopen_prepare
>      - free rs if raw_reopen_prepare fails
>   v3:
>      - restore suggested-by field missed in v2
>   v4:
>      - add file type check
>      - add comment about options
>      - replace rs check with assert in raw_reopen_commit
>
>   block/file-win32.c | 100 ++++++++++++++++++++++++++++++++++++++++++++-
>   1 file changed, 99 insertions(+), 1 deletion(-)
>
> diff --git a/block/file-win32.c b/block/file-win32.c
> index 2642088bd6..8320495f2b 100644
> --- a/block/file-win32.c
> +++ b/block/file-win32.c

[...]

> @@ -634,6 +638,96 @@ static int coroutine_fn raw_co_create_opts(BlockDriver *drv,
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
> +
> +    if (s->type != FTYPE_FILE) {
> +        error_setg(errp, "Can only reopen files");
> +        return -EINVAL;
> +    }
> +
> +    rs = g_new0(BDRVRawReopenState, 1);
> +
> +    /*
> +     * We do not support changing any options (only flags). By leaving
> +     * all options in state->options, we tell the generic reopen code
> +     * that we do not support changing any of them, so it will verify
> +     * that their values did not change.
> +     */
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

I believe if we fail here, we’ve already opened rs->hfile, so we must 
close it or we’d leak it.

(Sorry I missed this in my v3 review :/)

Hanna

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


