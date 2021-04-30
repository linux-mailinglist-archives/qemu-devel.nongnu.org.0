Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCBC837039F
	for <lists+qemu-devel@lfdr.de>; Sat,  1 May 2021 00:40:47 +0200 (CEST)
Received: from localhost ([::1]:44754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcboV-0002EF-09
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 18:40:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lcbnZ-0001i6-Cy
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 18:39:49 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:43696)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lcbnW-0005pK-Mq
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 18:39:49 -0400
Received: by mail-ej1-x633.google.com with SMTP id l4so107445020ejc.10
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 15:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4Zn/EL3Ujq5zOnVyueDU+K2wU6eciZamoS5BPOBOG6Q=;
 b=CxisKZz9a+v/T9wSmqjOYbHpKWwsGKsf7329zXXAAPy3eKVH4cZBeTyWAUM/NgoFu4
 dcpp7UtLqFiBn73EmeGI/0KnjUBSmVrMq+5fIarkuhwL0yRS9MsP6JwThHUsLza30qqe
 thuZQNpFTW6StRfSW6TI80SZy5uU1adsKf0JJp8fhfATfj1VHbFqyfYwnMwJarSe0deA
 gbSU2i5rAMyoRiJ+DMaM9hUR0J6TUiwuaHR1CLLsUnWiQqbej/3T8DyDJcziyC1TsnN1
 oxhnstlVQNw0AHZBniK1K57ISAq8ywG58DjgIUJ8zBPUZX+t0Sgivpi/poxsA+vHfZxr
 j8XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4Zn/EL3Ujq5zOnVyueDU+K2wU6eciZamoS5BPOBOG6Q=;
 b=GzOLHTKF5r5RszPAn/RjqJUcWrAdIPy+fa1L6RdlwUfFhVDzvIsIlxFOGa4ReeSjF/
 eLgtVn8h9/jPuRez1aeKW/j8di+jHpA5ggMAWMRB821OYBJPcSNxOVH2cDgZ5l0sePbn
 OYeE9+kQ8iGy1hWcsFW7iwq9BX4iJaW5BKCd7tDj0e4rnqzRpSj4kdj25VLwCQ1AtPoo
 Ct/an63mKcoPoQsAGIaV+eEQGRF7heUmbUIcVCEX3VCjE7kUe0oBvU/gng2BeURFZNM+
 P/0zYn66j9qqjFCyUQqcEsJ6A0zy89umyO/qCzsbwf1+9a1YPs9SMKwyv8I/tyYU4iJI
 8Tug==
X-Gm-Message-State: AOAM531idBme0PQscqBu1GW2BXRVQGBPjooePdRgV8SOi4Dgncb2SNk/
 peJojDR2N1nG7q6fbei+zo8M5Hphg6y05hvar8MQgw==
X-Google-Smtp-Source: ABdhPJye+4zbCjJWeLKGh18O4oLx62zR14012zmS0wAuv/TrtZOwxfXSnCneJB7TCviP7ZCH0A21TV9C+qLR2AaEX2w=
X-Received: by 2002:a17:906:1dd3:: with SMTP id
 v19mr6620174ejh.4.1619822385061; 
 Fri, 30 Apr 2021 15:39:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210430105147.125840-1-kwolf@redhat.com>
 <20210430105147.125840-31-kwolf@redhat.com>
In-Reply-To: <20210430105147.125840-31-kwolf@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 30 Apr 2021 23:38:42 +0100
Message-ID: <CAFEAcA_u4X+Cq6b0UtPeLXF7-7ugiMmOeb1u3UMMqTP-W0-MQA@mail.gmail.com>
Subject: Re: [PULL 30/39] block: bdrv_reopen_multiple: refresh permissions on
 updated graph
To: Kevin Wolf <kwolf@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 30 Apr 2021 at 11:53, Kevin Wolf <kwolf@redhat.com> wrote:
>
> From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>
> Move bdrv_reopen_multiple to new paradigm of permission update:
> first update graph relations, then do refresh the permissions.
>
> We have to modify reopen process in file-posix driver: with new scheme
> we don't have prepared permissions in raw_reopen_prepare(), so we
> should reconfigure fd in raw_check_perm(). Still this seems more native
> and simple anyway.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> Reviewed-by: Kevin Wolf <kwolf@redhat.com>
> Message-Id: <20210428151804.439460-31-vsementsov@virtuozzo.com>
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>

Hi; Coverity thinks this change introduced a resource leak
(CID 1452772):



> @@ -4271,6 +4270,9 @@ int bdrv_reopen_multiple(BlockReopenQueue *bs_queue, Error **errp)
>  {
>      int ret = -1;
>      BlockReopenQueueEntry *bs_entry, *next;
> +    Transaction *tran = tran_new();
> +    g_autoptr(GHashTable) found = NULL;
> +    g_autoptr(GSList) refresh_list = NULL;

Now we allocate a new Transaction at the start of the function...

>
>      assert(bs_queue != NULL);
>

...but in the code between these two hunks there is this:

    QTAILQ_FOREACH(bs_entry, bs_queue, entry) {
        ret = bdrv_flush(bs_entry->state.bs);
        if (ret < 0) {
            error_setg_errno(errp, -ret, "Error flushing drive");
            goto cleanup;
        }
    }

which jumps to 'cleanup' on failure...


> -    if (ret == 0) {
> -        QTAILQ_FOREACH_REVERSE(bs_entry, bs_queue, entry) {
> -            BlockDriverState *bs = bs_entry->state.bs;
> +    ret = 0;
> +    goto cleanup;
>
> -            if (bs->drv->bdrv_reopen_commit_post)
> -                bs->drv->bdrv_reopen_commit_post(&bs_entry->state);
> +abort:
> +    tran_abort(tran);
> +    QTAILQ_FOREACH_SAFE(bs_entry, bs_queue, entry, next) {
> +        if (bs_entry->prepared) {
> +            bdrv_reopen_abort(&bs_entry->state);
>          }
> +        qobject_unref(bs_entry->state.explicit_options);
> +        qobject_unref(bs_entry->state.options);
>      }
> +
>  cleanup:
>      QTAILQ_FOREACH_SAFE(bs_entry, bs_queue, entry, next) {
> -        if (ret) {
> -            if (bs_entry->prepared) {
> -                bdrv_reopen_abort(&bs_entry->state);
> -            }
> -            qobject_unref(bs_entry->state.explicit_options);
> -            qobject_unref(bs_entry->state.options);
> -        }
> -        if (bs_entry->state.new_backing_bs) {
> -            bdrv_unref(bs_entry->state.new_backing_bs);
> -        }
>          g_free(bs_entry);
>      }
>      g_free(bs_queue);

...and the 'cleanup' label doesn't free the Transaction.


An easy fix would be to move the call to tran_new() down to
below the loop that calls bdrv_flush().

thanks
-- PMM

