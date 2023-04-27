Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39DD86F0794
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 16:35:38 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ps2hM-0001jC-9i; Thu, 27 Apr 2023 10:34:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ps2hJ-0001hJ-Nh
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 10:34:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ps2hH-0003ia-61
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 10:34:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682606050;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Sy1pHTmDzZpVFB1ni/7ZIB3WubBoik6fUpr8nvC7QZs=;
 b=dGvMZODhpthEjrgVs00SCqi3lg5jksMHSlq2eQNcLOM8GdVA0nKJn5asFgF1ZF6Jf7Ej2z
 1ikiv8tVuNgS/7iGNPa6ICTazhSKQexHhoVvLZOrnah2e+YShDbbAdD6xVU/4jxIjnY2SL
 7l9OQadH0yRt+BsofQ47TuEgasmiLJs=
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com
 [209.85.217.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-519-FzbMc_WOOhqBwUnEkY6anA-1; Thu, 27 Apr 2023 10:31:31 -0400
X-MC-Unique: FzbMc_WOOhqBwUnEkY6anA-1
Received: by mail-vs1-f71.google.com with SMTP id
 ada2fe7eead31-430063e0910so5893087137.0
 for <qemu-devel@nongnu.org>; Thu, 27 Apr 2023 07:31:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682605871; x=1685197871;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Sy1pHTmDzZpVFB1ni/7ZIB3WubBoik6fUpr8nvC7QZs=;
 b=XMkq2lgS0UeXn5MIpZ8hyfcN+rqcWWiMEED3kJ2mnwQi2HYbeuNOk0RGGuykJshH/W
 4p5fqzBU3jZ920edgFkTUAsu3nPJLir8AKSSEx5zX8qUcmiQecGER4SNkkECDairBM5i
 xHsKx2KdRNOUcvMUwIxfIGx8ElmjMCGvjglWZTWoyRNKqBOrpA+GWX9t5Mp8c2CKv5yJ
 EDn1OL3K64QKfvw9Zp5marr0NupgE6Mal4y6vtoy4c0jGOkcb8splspCOLQ85wmw/s1i
 UNRGIYAbuWbXJz23mOwmnF04YQ/mk7IsZaRuMwACD5SbgW//yLUMmIk467RGhK93AGaW
 8xYQ==
X-Gm-Message-State: AC+VfDwYe8/FLEKVomAc1BPZDZ0klpPBNcUuOM+e1C4JjgaWPKtRsZt/
 rS94S0Z6JEK5jLeeYT4NJgXIfZj1sZaDZeMAntH1uVDCMIq09wEpZAsCvP7kKR8AH6d9i8kqLF5
 baP7AgcVq0jIASn1HI8M3AwiCUucxxPY=
X-Received: by 2002:a67:ed49:0:b0:42c:9732:d17f with SMTP id
 m9-20020a67ed49000000b0042c9732d17fmr1008733vsp.1.1682605870921; 
 Thu, 27 Apr 2023 07:31:10 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7fR2GOdp6WQM9GUrq9W2k1UaqahWBFeouMhM2v8KGNAykQRqj1BgA26wx/pH5xExNswMfKMUSR0nVoIU/+Rpg=
X-Received: by 2002:a67:ed49:0:b0:42c:9732:d17f with SMTP id
 m9-20020a67ed49000000b0042c9732d17fmr1008677vsp.1.1682605870553; Thu, 27 Apr
 2023 07:31:10 -0700 (PDT)
MIME-Version: 1.0
References: <20230425173158.574203-1-kwolf@redhat.com>
 <20230425173158.574203-4-kwolf@redhat.com>
In-Reply-To: <20230425173158.574203-4-kwolf@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Thu, 27 Apr 2023 16:30:58 +0200
Message-ID: <CABgObfbOD+cpEdP0JE6Os1-vYvrp1zMvCFOST0YrBw3H0s9noQ@mail.gmail.com>
Subject: Re: [PATCH 03/20] block: bdrv/blk_co_unref() for calls in coroutine
 context
To: Kevin Wolf <kwolf@redhat.com>
Cc: "open list:Block layer core" <qemu-block@nongnu.org>, "Hajnoczi,
 Stefan" <stefanha@redhat.com>, 
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="000000000000362dea05fa52355c"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

--000000000000362dea05fa52355c
Content-Type: text/plain; charset="UTF-8"

Il mar 25 apr 2023, 19:32 Kevin Wolf <kwolf@redhat.com> ha scritto:

> These functions must not be called in coroutine context, because they
> need write access to the graph.
>

With these patches applied vrc is still complaining about calls to
bdrv_unref_child from qcow2_do_open and qcow2_do_close.

Otherwise, the situation looks pretty good.

Paolo

>
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>  include/block/block-global-state.h          |  3 ++-
>  include/sysemu/block-backend-global-state.h |  5 ++++-
>  block.c                                     |  2 +-
>  block/crypto.c                              |  6 +++---
>  block/parallels.c                           |  6 +++---
>  block/qcow.c                                |  6 +++---
>  block/qcow2.c                               | 14 +++++++-------
>  block/qed.c                                 |  6 +++---
>  block/vdi.c                                 |  6 +++---
>  block/vhdx.c                                |  6 +++---
>  block/vmdk.c                                | 18 +++++++++---------
>  block/vpc.c                                 |  6 +++---
>  12 files changed, 44 insertions(+), 40 deletions(-)
>
> diff --git a/include/block/block-global-state.h
> b/include/block/block-global-state.h
> index 2c312cc774..ec3ddb17a8 100644
> --- a/include/block/block-global-state.h
> +++ b/include/block/block-global-state.h
> @@ -218,7 +218,8 @@ void bdrv_img_create(const char *filename, const char
> *fmt,
>                       bool quiet, Error **errp);
>
>  void bdrv_ref(BlockDriverState *bs);
> -void bdrv_unref(BlockDriverState *bs);
> +void no_coroutine_fn bdrv_unref(BlockDriverState *bs);
> +void coroutine_fn no_co_wrapper bdrv_co_unref(BlockDriverState *bs);
>  void bdrv_unref_child(BlockDriverState *parent, BdrvChild *child);
>  BdrvChild *bdrv_attach_child(BlockDriverState *parent_bs,
>                               BlockDriverState *child_bs,
> diff --git a/include/sysemu/block-backend-global-state.h
> b/include/sysemu/block-backend-global-state.h
> index 2b6d27db7c..fa83f9389c 100644
> --- a/include/sysemu/block-backend-global-state.h
> +++ b/include/sysemu/block-backend-global-state.h
> @@ -42,7 +42,10 @@ blk_co_new_open(const char *filename, const char
> *reference, QDict *options,
>
>  int blk_get_refcnt(BlockBackend *blk);
>  void blk_ref(BlockBackend *blk);
> -void blk_unref(BlockBackend *blk);
> +
> +void no_coroutine_fn blk_unref(BlockBackend *blk);
> +void coroutine_fn no_co_wrapper blk_co_unref(BlockBackend *blk);
> +
>  void blk_remove_all_bs(void);
>  BlockBackend *blk_by_name(const char *name);
>  BlockBackend *blk_next(BlockBackend *blk);
> diff --git a/block.c b/block.c
> index 5ec1a3897e..20d5ee0959 100644
> --- a/block.c
> +++ b/block.c
> @@ -680,7 +680,7 @@ int coroutine_fn
> bdrv_co_create_opts_simple(BlockDriver *drv,
>
>      ret = 0;
>  out:
> -    blk_unref(blk);
> +    blk_co_unref(blk);
>      return ret;
>  }
>
> diff --git a/block/crypto.c b/block/crypto.c
> index ca67289187..8fd3ad0054 100644
> --- a/block/crypto.c
> +++ b/block/crypto.c
> @@ -355,7 +355,7 @@ block_crypto_co_create_generic(BlockDriverState *bs,
> int64_t size,
>      ret = 0;
>   cleanup:
>      qcrypto_block_free(crypto);
> -    blk_unref(blk);
> +    blk_co_unref(blk);
>      return ret;
>  }
>
> @@ -661,7 +661,7 @@ block_crypto_co_create_luks(BlockdevCreateOptions
> *create_options, Error **errp)
>
>      ret = 0;
>  fail:
> -    bdrv_unref(bs);
> +    bdrv_co_unref(bs);
>      return ret;
>  }
>
> @@ -730,7 +730,7 @@ fail:
>          bdrv_co_delete_file_noerr(bs);
>      }
>
> -    bdrv_unref(bs);
> +    bdrv_co_unref(bs);
>      qapi_free_QCryptoBlockCreateOptions(create_opts);
>      qobject_unref(cryptoopts);
>      return ret;
> diff --git a/block/parallels.c b/block/parallels.c
> index 013684801a..b49c35929e 100644
> --- a/block/parallels.c
> +++ b/block/parallels.c
> @@ -613,8 +613,8 @@ static int coroutine_fn
> parallels_co_create(BlockdevCreateOptions* opts,
>
>      ret = 0;
>  out:
> -    blk_unref(blk);
> -    bdrv_unref(bs);
> +    blk_co_unref(blk);
> +    bdrv_co_unref(bs);
>      return ret;
>
>  exit:
> @@ -691,7 +691,7 @@ parallels_co_create_opts(BlockDriver *drv, const char
> *filename,
>
>  done:
>      qobject_unref(qdict);
> -    bdrv_unref(bs);
> +    bdrv_co_unref(bs);
>      qapi_free_BlockdevCreateOptions(create_options);
>      return ret;
>  }
> diff --git a/block/qcow.c b/block/qcow.c
> index 490e4f819e..a0c701f578 100644
> --- a/block/qcow.c
> +++ b/block/qcow.c
> @@ -915,8 +915,8 @@ static int coroutine_fn
> qcow_co_create(BlockdevCreateOptions *opts,
>      g_free(tmp);
>      ret = 0;
>  exit:
> -    blk_unref(qcow_blk);
> -    bdrv_unref(bs);
> +    blk_co_unref(qcow_blk);
> +    bdrv_co_unref(bs);
>      qcrypto_block_free(crypto);
>      return ret;
>  }
> @@ -1015,7 +1015,7 @@ qcow_co_create_opts(BlockDriver *drv, const char
> *filename,
>  fail:
>      g_free(backing_fmt);
>      qobject_unref(qdict);
> -    bdrv_unref(bs);
> +    bdrv_co_unref(bs);
>      qapi_free_BlockdevCreateOptions(create_options);
>      return ret;
>  }
> diff --git a/block/qcow2.c b/block/qcow2.c
> index 94cf59af8b..01742b3ebe 100644
> --- a/block/qcow2.c
> +++ b/block/qcow2.c
> @@ -3705,7 +3705,7 @@ qcow2_co_create(BlockdevCreateOptions
> *create_options, Error **errp)
>          goto out;
>      }
>
> -    blk_unref(blk);
> +    blk_co_unref(blk);
>      blk = NULL;
>
>      /*
> @@ -3785,7 +3785,7 @@ qcow2_co_create(BlockdevCreateOptions
> *create_options, Error **errp)
>          }
>      }
>
> -    blk_unref(blk);
> +    blk_co_unref(blk);
>      blk = NULL;
>
>      /* Reopen the image without BDRV_O_NO_FLUSH to flush it before
> returning.
> @@ -3810,9 +3810,9 @@ qcow2_co_create(BlockdevCreateOptions
> *create_options, Error **errp)
>
>      ret = 0;
>  out:
> -    blk_unref(blk);
> -    bdrv_unref(bs);
> -    bdrv_unref(data_bs);
> +    blk_co_unref(blk);
> +    bdrv_co_unref(bs);
> +    bdrv_co_unref(data_bs);
>      return ret;
>  }
>
> @@ -3943,8 +3943,8 @@ finish:
>      }
>
>      qobject_unref(qdict);
> -    bdrv_unref(bs);
> -    bdrv_unref(data_bs);
> +    bdrv_co_unref(bs);
> +    bdrv_co_unref(data_bs);
>      qapi_free_BlockdevCreateOptions(create_options);
>      return ret;
>  }
> diff --git a/block/qed.c b/block/qed.c
> index 0705a7b4e2..aff2a2076e 100644
> --- a/block/qed.c
> +++ b/block/qed.c
> @@ -748,8 +748,8 @@ static int coroutine_fn
> bdrv_qed_co_create(BlockdevCreateOptions *opts,
>      ret = 0; /* success */
>  out:
>      g_free(l1_table);
> -    blk_unref(blk);
> -    bdrv_unref(bs);
> +    blk_co_unref(blk);
> +    bdrv_co_unref(bs);
>      return ret;
>  }
>
> @@ -819,7 +819,7 @@ bdrv_qed_co_create_opts(BlockDriver *drv, const char
> *filename,
>
>  fail:
>      qobject_unref(qdict);
> -    bdrv_unref(bs);
> +    bdrv_co_unref(bs);
>      qapi_free_BlockdevCreateOptions(create_options);
>      return ret;
>  }
> diff --git a/block/vdi.c b/block/vdi.c
> index f2434d6153..08331d2dd7 100644
> --- a/block/vdi.c
> +++ b/block/vdi.c
> @@ -886,8 +886,8 @@ static int coroutine_fn
> vdi_co_do_create(BlockdevCreateOptions *create_options,
>
>      ret = 0;
>  exit:
> -    blk_unref(blk);
> -    bdrv_unref(bs_file);
> +    blk_co_unref(blk);
> +    bdrv_co_unref(bs_file);
>      g_free(bmap);
>      return ret;
>  }
> @@ -975,7 +975,7 @@ vdi_co_create_opts(BlockDriver *drv, const char
> *filename,
>  done:
>      qobject_unref(qdict);
>      qapi_free_BlockdevCreateOptions(create_options);
> -    bdrv_unref(bs_file);
> +    bdrv_co_unref(bs_file);
>      return ret;
>  }
>
> diff --git a/block/vhdx.c b/block/vhdx.c
> index 81420722a1..00777da91a 100644
> --- a/block/vhdx.c
> +++ b/block/vhdx.c
> @@ -2053,8 +2053,8 @@ static int coroutine_fn
> vhdx_co_create(BlockdevCreateOptions *opts,
>
>      ret = 0;
>  delete_and_exit:
> -    blk_unref(blk);
> -    bdrv_unref(bs);
> +    blk_co_unref(blk);
> +    bdrv_co_unref(bs);
>      g_free(creator);
>      return ret;
>  }
> @@ -2144,7 +2144,7 @@ vhdx_co_create_opts(BlockDriver *drv, const char
> *filename,
>
>  fail:
>      qobject_unref(qdict);
> -    bdrv_unref(bs);
> +    bdrv_co_unref(bs);
>      qapi_free_BlockdevCreateOptions(create_options);
>      return ret;
>  }
> diff --git a/block/vmdk.c b/block/vmdk.c
> index 3f8c731e32..11b553ef25 100644
> --- a/block/vmdk.c
> +++ b/block/vmdk.c
> @@ -2306,7 +2306,7 @@ exit:
>          if (pbb) {
>              *pbb = blk;
>          } else {
> -            blk_unref(blk);
> +            blk_co_unref(blk);
>              blk = NULL;
>          }
>      }
> @@ -2516,12 +2516,12 @@ vmdk_co_do_create(int64_t size,
>          if (strcmp(blk_bs(backing)->drv->format_name, "vmdk")) {
>              error_setg(errp, "Invalid backing file format: %s. Must be
> vmdk",
>                         blk_bs(backing)->drv->format_name);
> -            blk_unref(backing);
> +            blk_co_unref(backing);
>              ret = -EINVAL;
>              goto exit;
>          }
>          ret = vmdk_read_cid(blk_bs(backing), 0, &parent_cid);
> -        blk_unref(backing);
> +        blk_co_unref(backing);
>          if (ret) {
>              error_setg(errp, "Failed to read parent CID");
>              goto exit;
> @@ -2542,14 +2542,14 @@ vmdk_co_do_create(int64_t size,
>                               blk_bs(extent_blk)->filename);
>          created_size += cur_size;
>          extent_idx++;
> -        blk_unref(extent_blk);
> +        blk_co_unref(extent_blk);
>      }
>
>      /* Check whether we got excess extents */
>      extent_blk = extent_fn(-1, extent_idx, flat, split, compress,
> zeroed_grain,
>                             opaque, NULL);
>      if (extent_blk) {
> -        blk_unref(extent_blk);
> +        blk_co_unref(extent_blk);
>          error_setg(errp, "List of extents contains unused extents");
>          ret = -EINVAL;
>          goto exit;
> @@ -2590,7 +2590,7 @@ vmdk_co_do_create(int64_t size,
>      ret = 0;
>  exit:
>      if (blk) {
> -        blk_unref(blk);
> +        blk_co_unref(blk);
>      }
>      g_free(desc);
>      g_free(parent_desc_line);
> @@ -2641,7 +2641,7 @@ vmdk_co_create_opts_cb(int64_t size, int idx, bool
> flat, bool split,
>                             errp)) {
>          goto exit;
>      }
> -    bdrv_unref(bs);
> +    bdrv_co_unref(bs);
>  exit:
>      g_free(ext_filename);
>      return blk;
> @@ -2797,12 +2797,12 @@ static BlockBackend * coroutine_fn
> vmdk_co_create_cb(int64_t size, int idx,
>          return NULL;
>      }
>      blk_set_allow_write_beyond_eof(blk, true);
> -    bdrv_unref(bs);
> +    bdrv_co_unref(bs);
>
>      if (size != -1) {
>          ret = vmdk_init_extent(blk, size, flat, compress, zeroed_grain,
> errp);
>          if (ret) {
> -            blk_unref(blk);
> +            blk_co_unref(blk);
>              blk = NULL;
>          }
>      }
> diff --git a/block/vpc.c b/block/vpc.c
> index b89b0ff8e2..07ddda5b99 100644
> --- a/block/vpc.c
> +++ b/block/vpc.c
> @@ -1082,8 +1082,8 @@ static int coroutine_fn
> vpc_co_create(BlockdevCreateOptions *opts,
>      }
>
>  out:
> -    blk_unref(blk);
> -    bdrv_unref(bs);
> +    blk_co_unref(blk);
> +    bdrv_co_unref(bs);
>      return ret;
>  }
>
> @@ -1162,7 +1162,7 @@ vpc_co_create_opts(BlockDriver *drv, const char
> *filename,
>
>  fail:
>      qobject_unref(qdict);
> -    bdrv_unref(bs);
> +    bdrv_co_unref(bs);
>      qapi_free_BlockdevCreateOptions(create_options);
>      return ret;
>  }
> --
> 2.40.0
>
>

--000000000000362dea05fa52355c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Il mar 25 apr 2023, 19:32 Kevin Wolf &lt;<a href=3D"ma=
ilto:kwolf@redhat.com">kwolf@redhat.com</a>&gt; ha scritto:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc=
 solid;padding-left:1ex">These functions must not be called in coroutine co=
ntext, because they<br>
need write access to the graph.<br></blockquote></div></div><div dir=3D"aut=
o"><br></div><div dir=3D"auto">With these patches applied vrc is still comp=
laining about calls to bdrv_unref_child from qcow2_do_open and qcow2_do_clo=
se.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Otherwise, the situa=
tion looks pretty good.</div><div dir=3D"auto"><br></div><div dir=3D"auto">=
Paolo</div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">
<br>
Signed-off-by: Kevin Wolf &lt;<a href=3D"mailto:kwolf@redhat.com" target=3D=
"_blank" rel=3D"noreferrer">kwolf@redhat.com</a>&gt;<br>
---<br>
=C2=A0include/block/block-global-state.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
|=C2=A0 3 ++-<br>
=C2=A0include/sysemu/block-backend-global-state.h |=C2=A0 5 ++++-<br>
=C2=A0block.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 2 +-<br>
=C2=A0block/crypto.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 6 +++---<br>
=C2=A0block/parallels.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 6 +++---<br>
=C2=A0block/qcow.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 6 +++---<br=
>
=C2=A0block/qcow2.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 14 +++++++-------<=
br>
=C2=A0block/qed.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 6 +++=
---<br>
=C2=A0block/vdi.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 6 +++=
---<br>
=C2=A0block/vhdx.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 6 +++---<br=
>
=C2=A0block/vmdk.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 18 +++++++++-----=
----<br>
=C2=A0block/vpc.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 6 +++=
---<br>
=C2=A012 files changed, 44 insertions(+), 40 deletions(-)<br>
<br>
diff --git a/include/block/block-global-state.h b/include/block/block-globa=
l-state.h<br>
index 2c312cc774..ec3ddb17a8 100644<br>
--- a/include/block/block-global-state.h<br>
+++ b/include/block/block-global-state.h<br>
@@ -218,7 +218,8 @@ void bdrv_img_create(const char *filename, const char *=
fmt,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 bool quiet, Error **errp);<br>
<br>
=C2=A0void bdrv_ref(BlockDriverState *bs);<br>
-void bdrv_unref(BlockDriverState *bs);<br>
+void no_coroutine_fn bdrv_unref(BlockDriverState *bs);<br>
+void coroutine_fn no_co_wrapper bdrv_co_unref(BlockDriverState *bs);<br>
=C2=A0void bdrv_unref_child(BlockDriverState *parent, BdrvChild *child);<br=
>
=C2=A0BdrvChild *bdrv_attach_child(BlockDriverState *parent_bs,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 BlockDriverState *child_bs,<br>
diff --git a/include/sysemu/block-backend-global-state.h b/include/sysemu/b=
lock-backend-global-state.h<br>
index 2b6d27db7c..fa83f9389c 100644<br>
--- a/include/sysemu/block-backend-global-state.h<br>
+++ b/include/sysemu/block-backend-global-state.h<br>
@@ -42,7 +42,10 @@ blk_co_new_open(const char *filename, const char *refere=
nce, QDict *options,<br>
<br>
=C2=A0int blk_get_refcnt(BlockBackend *blk);<br>
=C2=A0void blk_ref(BlockBackend *blk);<br>
-void blk_unref(BlockBackend *blk);<br>
+<br>
+void no_coroutine_fn blk_unref(BlockBackend *blk);<br>
+void coroutine_fn no_co_wrapper blk_co_unref(BlockBackend *blk);<br>
+<br>
=C2=A0void blk_remove_all_bs(void);<br>
=C2=A0BlockBackend *blk_by_name(const char *name);<br>
=C2=A0BlockBackend *blk_next(BlockBackend *blk);<br>
diff --git a/block.c b/block.c<br>
index 5ec1a3897e..20d5ee0959 100644<br>
--- a/block.c<br>
+++ b/block.c<br>
@@ -680,7 +680,7 @@ int coroutine_fn bdrv_co_create_opts_simple(BlockDriver=
 *drv,<br>
<br>
=C2=A0 =C2=A0 =C2=A0ret =3D 0;<br>
=C2=A0out:<br>
-=C2=A0 =C2=A0 blk_unref(blk);<br>
+=C2=A0 =C2=A0 blk_co_unref(blk);<br>
=C2=A0 =C2=A0 =C2=A0return ret;<br>
=C2=A0}<br>
<br>
diff --git a/block/crypto.c b/block/crypto.c<br>
index ca67289187..8fd3ad0054 100644<br>
--- a/block/crypto.c<br>
+++ b/block/crypto.c<br>
@@ -355,7 +355,7 @@ block_crypto_co_create_generic(BlockDriverState *bs, in=
t64_t size,<br>
=C2=A0 =C2=A0 =C2=A0ret =3D 0;<br>
=C2=A0 cleanup:<br>
=C2=A0 =C2=A0 =C2=A0qcrypto_block_free(crypto);<br>
-=C2=A0 =C2=A0 blk_unref(blk);<br>
+=C2=A0 =C2=A0 blk_co_unref(blk);<br>
=C2=A0 =C2=A0 =C2=A0return ret;<br>
=C2=A0}<br>
<br>
@@ -661,7 +661,7 @@ block_crypto_co_create_luks(BlockdevCreateOptions *crea=
te_options, Error **errp)<br>
<br>
=C2=A0 =C2=A0 =C2=A0ret =3D 0;<br>
=C2=A0fail:<br>
-=C2=A0 =C2=A0 bdrv_unref(bs);<br>
+=C2=A0 =C2=A0 bdrv_co_unref(bs);<br>
=C2=A0 =C2=A0 =C2=A0return ret;<br>
=C2=A0}<br>
<br>
@@ -730,7 +730,7 @@ fail:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bdrv_co_delete_file_noerr(bs);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
-=C2=A0 =C2=A0 bdrv_unref(bs);<br>
+=C2=A0 =C2=A0 bdrv_co_unref(bs);<br>
=C2=A0 =C2=A0 =C2=A0qapi_free_QCryptoBlockCreateOptions(create_opts);<br>
=C2=A0 =C2=A0 =C2=A0qobject_unref(cryptoopts);<br>
=C2=A0 =C2=A0 =C2=A0return ret;<br>
diff --git a/block/parallels.c b/block/parallels.c<br>
index 013684801a..b49c35929e 100644<br>
--- a/block/parallels.c<br>
+++ b/block/parallels.c<br>
@@ -613,8 +613,8 @@ static int coroutine_fn parallels_co_create(BlockdevCre=
ateOptions* opts,<br>
<br>
=C2=A0 =C2=A0 =C2=A0ret =3D 0;<br>
=C2=A0out:<br>
-=C2=A0 =C2=A0 blk_unref(blk);<br>
-=C2=A0 =C2=A0 bdrv_unref(bs);<br>
+=C2=A0 =C2=A0 blk_co_unref(blk);<br>
+=C2=A0 =C2=A0 bdrv_co_unref(bs);<br>
=C2=A0 =C2=A0 =C2=A0return ret;<br>
<br>
=C2=A0exit:<br>
@@ -691,7 +691,7 @@ parallels_co_create_opts(BlockDriver *drv, const char *=
filename,<br>
<br>
=C2=A0done:<br>
=C2=A0 =C2=A0 =C2=A0qobject_unref(qdict);<br>
-=C2=A0 =C2=A0 bdrv_unref(bs);<br>
+=C2=A0 =C2=A0 bdrv_co_unref(bs);<br>
=C2=A0 =C2=A0 =C2=A0qapi_free_BlockdevCreateOptions(create_options);<br>
=C2=A0 =C2=A0 =C2=A0return ret;<br>
=C2=A0}<br>
diff --git a/block/qcow.c b/block/qcow.c<br>
index 490e4f819e..a0c701f578 100644<br>
--- a/block/qcow.c<br>
+++ b/block/qcow.c<br>
@@ -915,8 +915,8 @@ static int coroutine_fn qcow_co_create(BlockdevCreateOp=
tions *opts,<br>
=C2=A0 =C2=A0 =C2=A0g_free(tmp);<br>
=C2=A0 =C2=A0 =C2=A0ret =3D 0;<br>
=C2=A0exit:<br>
-=C2=A0 =C2=A0 blk_unref(qcow_blk);<br>
-=C2=A0 =C2=A0 bdrv_unref(bs);<br>
+=C2=A0 =C2=A0 blk_co_unref(qcow_blk);<br>
+=C2=A0 =C2=A0 bdrv_co_unref(bs);<br>
=C2=A0 =C2=A0 =C2=A0qcrypto_block_free(crypto);<br>
=C2=A0 =C2=A0 =C2=A0return ret;<br>
=C2=A0}<br>
@@ -1015,7 +1015,7 @@ qcow_co_create_opts(BlockDriver *drv, const char *fil=
ename,<br>
=C2=A0fail:<br>
=C2=A0 =C2=A0 =C2=A0g_free(backing_fmt);<br>
=C2=A0 =C2=A0 =C2=A0qobject_unref(qdict);<br>
-=C2=A0 =C2=A0 bdrv_unref(bs);<br>
+=C2=A0 =C2=A0 bdrv_co_unref(bs);<br>
=C2=A0 =C2=A0 =C2=A0qapi_free_BlockdevCreateOptions(create_options);<br>
=C2=A0 =C2=A0 =C2=A0return ret;<br>
=C2=A0}<br>
diff --git a/block/qcow2.c b/block/qcow2.c<br>
index 94cf59af8b..01742b3ebe 100644<br>
--- a/block/qcow2.c<br>
+++ b/block/qcow2.c<br>
@@ -3705,7 +3705,7 @@ qcow2_co_create(BlockdevCreateOptions *create_options=
, Error **errp)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto out;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
-=C2=A0 =C2=A0 blk_unref(blk);<br>
+=C2=A0 =C2=A0 blk_co_unref(blk);<br>
=C2=A0 =C2=A0 =C2=A0blk =3D NULL;<br>
<br>
=C2=A0 =C2=A0 =C2=A0/*<br>
@@ -3785,7 +3785,7 @@ qcow2_co_create(BlockdevCreateOptions *create_options=
, Error **errp)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
-=C2=A0 =C2=A0 blk_unref(blk);<br>
+=C2=A0 =C2=A0 blk_co_unref(blk);<br>
=C2=A0 =C2=A0 =C2=A0blk =3D NULL;<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* Reopen the image without BDRV_O_NO_FLUSH to flush it=
 before returning.<br>
@@ -3810,9 +3810,9 @@ qcow2_co_create(BlockdevCreateOptions *create_options=
, Error **errp)<br>
<br>
=C2=A0 =C2=A0 =C2=A0ret =3D 0;<br>
=C2=A0out:<br>
-=C2=A0 =C2=A0 blk_unref(blk);<br>
-=C2=A0 =C2=A0 bdrv_unref(bs);<br>
-=C2=A0 =C2=A0 bdrv_unref(data_bs);<br>
+=C2=A0 =C2=A0 blk_co_unref(blk);<br>
+=C2=A0 =C2=A0 bdrv_co_unref(bs);<br>
+=C2=A0 =C2=A0 bdrv_co_unref(data_bs);<br>
=C2=A0 =C2=A0 =C2=A0return ret;<br>
=C2=A0}<br>
<br>
@@ -3943,8 +3943,8 @@ finish:<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0qobject_unref(qdict);<br>
-=C2=A0 =C2=A0 bdrv_unref(bs);<br>
-=C2=A0 =C2=A0 bdrv_unref(data_bs);<br>
+=C2=A0 =C2=A0 bdrv_co_unref(bs);<br>
+=C2=A0 =C2=A0 bdrv_co_unref(data_bs);<br>
=C2=A0 =C2=A0 =C2=A0qapi_free_BlockdevCreateOptions(create_options);<br>
=C2=A0 =C2=A0 =C2=A0return ret;<br>
=C2=A0}<br>
diff --git a/block/qed.c b/block/qed.c<br>
index 0705a7b4e2..aff2a2076e 100644<br>
--- a/block/qed.c<br>
+++ b/block/qed.c<br>
@@ -748,8 +748,8 @@ static int coroutine_fn bdrv_qed_co_create(BlockdevCrea=
teOptions *opts,<br>
=C2=A0 =C2=A0 =C2=A0ret =3D 0; /* success */<br>
=C2=A0out:<br>
=C2=A0 =C2=A0 =C2=A0g_free(l1_table);<br>
-=C2=A0 =C2=A0 blk_unref(blk);<br>
-=C2=A0 =C2=A0 bdrv_unref(bs);<br>
+=C2=A0 =C2=A0 blk_co_unref(blk);<br>
+=C2=A0 =C2=A0 bdrv_co_unref(bs);<br>
=C2=A0 =C2=A0 =C2=A0return ret;<br>
=C2=A0}<br>
<br>
@@ -819,7 +819,7 @@ bdrv_qed_co_create_opts(BlockDriver *drv, const char *f=
ilename,<br>
<br>
=C2=A0fail:<br>
=C2=A0 =C2=A0 =C2=A0qobject_unref(qdict);<br>
-=C2=A0 =C2=A0 bdrv_unref(bs);<br>
+=C2=A0 =C2=A0 bdrv_co_unref(bs);<br>
=C2=A0 =C2=A0 =C2=A0qapi_free_BlockdevCreateOptions(create_options);<br>
=C2=A0 =C2=A0 =C2=A0return ret;<br>
=C2=A0}<br>
diff --git a/block/vdi.c b/block/vdi.c<br>
index f2434d6153..08331d2dd7 100644<br>
--- a/block/vdi.c<br>
+++ b/block/vdi.c<br>
@@ -886,8 +886,8 @@ static int coroutine_fn vdi_co_do_create(BlockdevCreate=
Options *create_options,<br>
<br>
=C2=A0 =C2=A0 =C2=A0ret =3D 0;<br>
=C2=A0exit:<br>
-=C2=A0 =C2=A0 blk_unref(blk);<br>
-=C2=A0 =C2=A0 bdrv_unref(bs_file);<br>
+=C2=A0 =C2=A0 blk_co_unref(blk);<br>
+=C2=A0 =C2=A0 bdrv_co_unref(bs_file);<br>
=C2=A0 =C2=A0 =C2=A0g_free(bmap);<br>
=C2=A0 =C2=A0 =C2=A0return ret;<br>
=C2=A0}<br>
@@ -975,7 +975,7 @@ vdi_co_create_opts(BlockDriver *drv, const char *filena=
me,<br>
=C2=A0done:<br>
=C2=A0 =C2=A0 =C2=A0qobject_unref(qdict);<br>
=C2=A0 =C2=A0 =C2=A0qapi_free_BlockdevCreateOptions(create_options);<br>
-=C2=A0 =C2=A0 bdrv_unref(bs_file);<br>
+=C2=A0 =C2=A0 bdrv_co_unref(bs_file);<br>
=C2=A0 =C2=A0 =C2=A0return ret;<br>
=C2=A0}<br>
<br>
diff --git a/block/vhdx.c b/block/vhdx.c<br>
index 81420722a1..00777da91a 100644<br>
--- a/block/vhdx.c<br>
+++ b/block/vhdx.c<br>
@@ -2053,8 +2053,8 @@ static int coroutine_fn vhdx_co_create(BlockdevCreate=
Options *opts,<br>
<br>
=C2=A0 =C2=A0 =C2=A0ret =3D 0;<br>
=C2=A0delete_and_exit:<br>
-=C2=A0 =C2=A0 blk_unref(blk);<br>
-=C2=A0 =C2=A0 bdrv_unref(bs);<br>
+=C2=A0 =C2=A0 blk_co_unref(blk);<br>
+=C2=A0 =C2=A0 bdrv_co_unref(bs);<br>
=C2=A0 =C2=A0 =C2=A0g_free(creator);<br>
=C2=A0 =C2=A0 =C2=A0return ret;<br>
=C2=A0}<br>
@@ -2144,7 +2144,7 @@ vhdx_co_create_opts(BlockDriver *drv, const char *fil=
ename,<br>
<br>
=C2=A0fail:<br>
=C2=A0 =C2=A0 =C2=A0qobject_unref(qdict);<br>
-=C2=A0 =C2=A0 bdrv_unref(bs);<br>
+=C2=A0 =C2=A0 bdrv_co_unref(bs);<br>
=C2=A0 =C2=A0 =C2=A0qapi_free_BlockdevCreateOptions(create_options);<br>
=C2=A0 =C2=A0 =C2=A0return ret;<br>
=C2=A0}<br>
diff --git a/block/vmdk.c b/block/vmdk.c<br>
index 3f8c731e32..11b553ef25 100644<br>
--- a/block/vmdk.c<br>
+++ b/block/vmdk.c<br>
@@ -2306,7 +2306,7 @@ exit:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (pbb) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*pbb =3D blk;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 blk_unref(blk);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 blk_co_unref(blk);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0blk =3D NULL;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0}<br>
@@ -2516,12 +2516,12 @@ vmdk_co_do_create(int64_t size,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (strcmp(blk_bs(backing)-&gt;drv-&gt;fo=
rmat_name, &quot;vmdk&quot;)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_setg(errp, &quot;Inva=
lid backing file format: %s. Must be vmdk&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 blk_bs(backing)-&gt;drv-&gt;format_name);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 blk_unref(backing);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 blk_co_unref(backing);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D -EINVAL;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto exit;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D vmdk_read_cid(blk_bs(backing), 0,=
 &amp;parent_cid);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 blk_unref(backing);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 blk_co_unref(backing);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_setg(errp, &quot;Fail=
ed to read parent CID&quot;);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto exit;<br>
@@ -2542,14 +2542,14 @@ vmdk_co_do_create(int64_t size,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 blk_bs(extent_blk)-&gt;filename);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0created_size +=3D cur_size;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0extent_idx++;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 blk_unref(extent_blk);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 blk_co_unref(extent_blk);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* Check whether we got excess extents */<br>
=C2=A0 =C2=A0 =C2=A0extent_blk =3D extent_fn(-1, extent_idx, flat, split, c=
ompress, zeroed_grain,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 opaque, NULL);<br>
=C2=A0 =C2=A0 =C2=A0if (extent_blk) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 blk_unref(extent_blk);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 blk_co_unref(extent_blk);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_setg(errp, &quot;List of extents co=
ntains unused extents&quot;);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D -EINVAL;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto exit;<br>
@@ -2590,7 +2590,7 @@ vmdk_co_do_create(int64_t size,<br>
=C2=A0 =C2=A0 =C2=A0ret =3D 0;<br>
=C2=A0exit:<br>
=C2=A0 =C2=A0 =C2=A0if (blk) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 blk_unref(blk);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 blk_co_unref(blk);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0g_free(desc);<br>
=C2=A0 =C2=A0 =C2=A0g_free(parent_desc_line);<br>
@@ -2641,7 +2641,7 @@ vmdk_co_create_opts_cb(int64_t size, int idx, bool fl=
at, bool split,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 errp)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto exit;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 bdrv_unref(bs);<br>
+=C2=A0 =C2=A0 bdrv_co_unref(bs);<br>
=C2=A0exit:<br>
=C2=A0 =C2=A0 =C2=A0g_free(ext_filename);<br>
=C2=A0 =C2=A0 =C2=A0return blk;<br>
@@ -2797,12 +2797,12 @@ static BlockBackend * coroutine_fn vmdk_co_create_c=
b(int64_t size, int idx,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return NULL;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0blk_set_allow_write_beyond_eof(blk, true);<br>
-=C2=A0 =C2=A0 bdrv_unref(bs);<br>
+=C2=A0 =C2=A0 bdrv_co_unref(bs);<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (size !=3D -1) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D vmdk_init_extent(blk, size, flat,=
 compress, zeroed_grain, errp);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 blk_unref(blk);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 blk_co_unref(blk);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0blk =3D NULL;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0}<br>
diff --git a/block/vpc.c b/block/vpc.c<br>
index b89b0ff8e2..07ddda5b99 100644<br>
--- a/block/vpc.c<br>
+++ b/block/vpc.c<br>
@@ -1082,8 +1082,8 @@ static int coroutine_fn vpc_co_create(BlockdevCreateO=
ptions *opts,<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0out:<br>
-=C2=A0 =C2=A0 blk_unref(blk);<br>
-=C2=A0 =C2=A0 bdrv_unref(bs);<br>
+=C2=A0 =C2=A0 blk_co_unref(blk);<br>
+=C2=A0 =C2=A0 bdrv_co_unref(bs);<br>
=C2=A0 =C2=A0 =C2=A0return ret;<br>
=C2=A0}<br>
<br>
@@ -1162,7 +1162,7 @@ vpc_co_create_opts(BlockDriver *drv, const char *file=
name,<br>
<br>
=C2=A0fail:<br>
=C2=A0 =C2=A0 =C2=A0qobject_unref(qdict);<br>
-=C2=A0 =C2=A0 bdrv_unref(bs);<br>
+=C2=A0 =C2=A0 bdrv_co_unref(bs);<br>
=C2=A0 =C2=A0 =C2=A0qapi_free_BlockdevCreateOptions(create_options);<br>
=C2=A0 =C2=A0 =C2=A0return ret;<br>
=C2=A0}<br>
-- <br>
2.40.0<br>
<br>
</blockquote></div></div></div>

--000000000000362dea05fa52355c--


