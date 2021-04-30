Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B1BD370384
	for <lists+qemu-devel@lfdr.de>; Sat,  1 May 2021 00:33:14 +0200 (CEST)
Received: from localhost ([::1]:36702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcbhB-0007CS-G4
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 18:33:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lcbfF-0005v6-DU
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 18:31:14 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:36429)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lcbf8-0001Jo-Td
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 18:31:13 -0400
Received: by mail-ed1-x52a.google.com with SMTP id q6so25101060edr.3
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 15:31:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9LCTOryKGCP/gHex6IvlQN4fQEQ/oCzQB/dvGs9Qqnw=;
 b=FS93Ke8ZjYSyI9FrfAyrUm5/OersYsN655UVQTRx77Ce7I18ri1zYUT+spQQnrrwEj
 h3JABBVJe7HEBje+Dqe74IGlWmfPs7kqLctGD7/in4ePQVc9Ayraatq/uh960SpErlNR
 hDAXh/pPhyXeUm7brVLn3azM6v/a2l5LWdm3LYXUoa2lPHDUX33reqfp1z0h7vCb0giJ
 IFyIaNrv1aQItBvXveCkfeiDO1kCxpGL7Yd0AtRk2pZz/WL1irdm8e2Kq46oOCf2gNE6
 Zf2aoOeZrgSIgExuuVxWa7sygmkaFamGSQ8ZOkZuWJ7q7XJHgmYH1R2g03RbKWVuPVTi
 nIqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9LCTOryKGCP/gHex6IvlQN4fQEQ/oCzQB/dvGs9Qqnw=;
 b=XP+ZTPJdVmNgbwNEhXIdgjy7WwFXHGcOOWvvNakpvKxJGWNm46K0C3Snnna89CZKZ8
 /xX5nafGwL3PF9x5kSWU1iwG4fbafw8O27qjDRc/Lq8INQSNGHVMcozadoP3s+9/FU99
 mNL9C1oSUk4fQGOmxPMn4QbbC4IYW9YVP95Ijcu5mWEpcuoWbHdpNCYh5S5dE1vbpsNB
 UNLH9FnsCyO8zpNh4O4hBiVmdVC6Zs6YcqPou18vj8uohEmNmjyRzNq81Eh4rMr8kueA
 YztgtjKiO13f3j09+0CSHbUZC0dCqOKbYBIlNpLl4PpaoO2VO6wuuf3bNPQiiugX790a
 QE9g==
X-Gm-Message-State: AOAM533o5nJdihpBC2MS4eKiBgYfMocXenuzh/K6PiOsiNjZrvM/aOmM
 oOIvCDXYL74LYlXXPSUDrwg+se8peJ4tkJrBz7rMWg==
X-Google-Smtp-Source: ABdhPJySneqhHodJ+NQr7Xvo5YyuuhOK3diZpAabwZVrKxEWu21b58qjEsTsvu0pXlm5ykW8P3/TL98Q94H/I8xlmtM=
X-Received: by 2002:aa7:c0ce:: with SMTP id j14mr8470026edp.251.1619821864228; 
 Fri, 30 Apr 2021 15:31:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200907110936.261684-1-kwolf@redhat.com>
 <20200907110936.261684-38-kwolf@redhat.com>
In-Reply-To: <20200907110936.261684-38-kwolf@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 30 Apr 2021 23:30:01 +0100
Message-ID: <CAFEAcA8wGL61unoO=zGWR8KB6AiL8TR7MZeh7R34qGhzy7VKrg@mail.gmail.com>
Subject: Re: [PULL 37/64] block/snapshot: Fix fallback
To: Kevin Wolf <kwolf@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 7 Sept 2020 at 12:11, Kevin Wolf <kwolf@redhat.com> wrote:
>
> From: Max Reitz <mreitz@redhat.com>
>
> If the top node's driver does not provide snapshot functionality and we
> want to fall back to a node down the chain, we need to snapshot all
> non-COW children.  For simplicity's sake, just do not fall back if there
> is more than one such child.  Furthermore, we really only can fall back
> to bs->file and bs->backing, because bdrv_snapshot_goto() has to modify
> the child link (notably, set it to NULL).
>
> Suggested-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> Signed-off-by: Max Reitz <mreitz@redhat.com>
> Reviewed-by: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
> Reviewed-by: Kevin Wolf <kwolf@redhat.com>

Hi; Coverity thinks it's found a problem with this code
(CID 1452774):


> @@ -205,39 +258,46 @@ int bdrv_snapshot_goto(BlockDriverState *bs,
>          return ret;
>      }
>
> -    if (bs->file) {
> -        BlockDriverState *file;
> -        QDict *options = qdict_clone_shallow(bs->options);
> +    fallback_ptr = bdrv_snapshot_fallback_ptr(bs);
> +    if (fallback_ptr) {
> +        QDict *options;
>          QDict *file_options;
>          Error *local_err = NULL;
> +        BlockDriverState *fallback_bs = (*fallback_ptr)->bs;
> +        char *subqdict_prefix = g_strdup_printf("%s.", (*fallback_ptr)->name);
> +
> +        options = qdict_clone_shallow(bs->options);
>
> -        file = bs->file->bs;
>          /* Prevent it from getting deleted when detached from bs */
> -        bdrv_ref(file);
> +        bdrv_ref(fallback_bs);
>
> -        qdict_extract_subqdict(options, &file_options, "file.");
> +        qdict_extract_subqdict(options, &file_options, subqdict_prefix);
>          qobject_unref(file_options);
> -        qdict_put_str(options, "file", bdrv_get_node_name(file));
> +        g_free(subqdict_prefix);
> +
> +        qdict_put_str(options, (*fallback_ptr)->name,
> +                      bdrv_get_node_name(fallback_bs));
>
>          if (drv->bdrv_close) {
>              drv->bdrv_close(bs);
>          }
> -        bdrv_unref_child(bs, bs->file);
> -        bs->file = NULL;
>
> -        ret = bdrv_snapshot_goto(file, snapshot_id, errp);
> +        bdrv_unref_child(bs, *fallback_ptr);
> +        *fallback_ptr = NULL;

Here we set *fallback_ptr to NULL...

> +
> +        ret = bdrv_snapshot_goto(fallback_bs, snapshot_id, errp);
>          open_ret = drv->bdrv_open(bs, options, bs->open_flags, &local_err);
>          qobject_unref(options);
>          if (open_ret < 0) {
> -            bdrv_unref(file);
> +            bdrv_unref(fallback_bs);
>              bs->drv = NULL;
>              /* A bdrv_snapshot_goto() error takes precedence */
>              error_propagate(errp, local_err);
>              return ret < 0 ? ret : open_ret;
>          }
>
> -        assert(bs->file->bs == file);
> -        bdrv_unref(file);
> +        assert(fallback_bs == (*fallback_ptr)->bs);

...but here we dereference *fallback_ptr, and Coverity doesn't see
anything that it recognizes as being able to change it.

> +        bdrv_unref(fallback_bs);
>          return ret;
>      }

False positive, or real issue? (If a false positive, a comment
explaining what's going on wouldn't go amiss -- as a human reader
I'm kind of confused about whether there's some kind of hidden
magic going on here.)

thanks
-- PMM

