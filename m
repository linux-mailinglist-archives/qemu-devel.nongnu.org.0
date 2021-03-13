Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 669B9339C98
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Mar 2021 08:41:54 +0100 (CET)
Received: from localhost ([::1]:55364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKyuG-0000L6-Rh
	for lists+qemu-devel@lfdr.de; Sat, 13 Mar 2021 02:41:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lKytD-0008Et-7N
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 02:40:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50403)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lKytA-0007KX-9Z
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 02:40:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615621242;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RPqpslrlP82Ii0oTsmiCbWwn6yUbKHvLY/tXsFTvJr8=;
 b=he7rzRH8wzKJT6DVFDz9gPEW/CcnIdvU4mRsTyW/c0wQLVJ+IlvUmH5ch/PqFw3mpRBhL7
 fS2ewr7dRKhtYorUUNhgyek6F6iQpQX5DQnEgI093qdz3zfTV7pCr5NtCcA7clKeLxp/xA
 GA/9Gl83HC3/rUPdYRaJ2zbbhq+cfUs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-223-V_IuzjTbPsSsE1DB4a1-Sw-1; Sat, 13 Mar 2021 02:40:40 -0500
X-MC-Unique: V_IuzjTbPsSsE1DB4a1-Sw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D02F218460E1;
 Sat, 13 Mar 2021 07:40:39 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-83.phx2.redhat.com
 [10.3.112.83])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8E43560CDE;
 Sat, 13 Mar 2021 07:40:33 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 029A51132C12; Sat, 13 Mar 2021 08:40:31 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH v3 26/30] qemu-img: Use user_creatable_process_cmdline()
 for --object
References: <20210308165440.386489-1-kwolf@redhat.com>
 <20210308165440.386489-27-kwolf@redhat.com>
Date: Sat, 13 Mar 2021 08:40:31 +0100
In-Reply-To: <20210308165440.386489-27-kwolf@redhat.com> (Kevin Wolf's message
 of "Mon, 8 Mar 2021 17:54:36 +0100")
Message-ID: <87k0qby00g.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: lvivier@redhat.com, thuth@redhat.com, pkrempa@redhat.com,
 berrange@redhat.com, ehabkost@redhat.com, qemu-block@nongnu.org,
 libvir-list@redhat.com, jasowang@redhat.com, qemu-devel@nongnu.org,
 mreitz@redhat.com, kraxel@redhat.com, pbonzini@redhat.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Kevin Wolf <kwolf@redhat.com> writes:

> This switches qemu-img from a QemuOpts-based parser for --object to
> user_creatable_process_cmdline() which uses a keyval parser and enforces
> the QAPI schema.
>
> Apart from being a cleanup, this makes non-scalar properties accessible.
>
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> Acked-by: Peter Krempa <pkrempa@redhat.com>
> ---
>  qemu-img.c | 251 ++++++++++-------------------------------------------
>  1 file changed, 45 insertions(+), 206 deletions(-)
>
> diff --git a/qemu-img.c b/qemu-img.c
> index e2952fe955..babb5573ab 100644
> --- a/qemu-img.c
> +++ b/qemu-img.c
> @@ -226,23 +226,6 @@ static void QEMU_NORETURN help(void)
>      exit(EXIT_SUCCESS);
>  }
>  
> -static QemuOptsList qemu_object_opts = {
> -    .name = "object",
> -    .implied_opt_name = "qom-type",
> -    .head = QTAILQ_HEAD_INITIALIZER(qemu_object_opts.head),
> -    .desc = {
> -        { }
> -    },
> -};
> -
> -static bool qemu_img_object_print_help(const char *type, QemuOpts *opts)
> -{
> -    if (user_creatable_print_help(type, opts)) {
> -        exit(0);
> -    }
> -    return true;
> -}
> -
>  /*
>   * Is @optarg safe for accumulate_options()?
>   * It is when multiple of them can be joined together separated by ','.
> @@ -566,14 +549,9 @@ static int img_create(int argc, char **argv)
>          case 'u':
>              flags |= BDRV_O_NO_BACKING;
>              break;
> -        case OPTION_OBJECT: {
> -            QemuOpts *opts;
> -            opts = qemu_opts_parse_noisily(&qemu_object_opts,
> -                                           optarg, true);
> -            if (!opts) {
> -                goto fail;
> -            }
> -        }   break;
> +        case OPTION_OBJECT:
> +            user_creatable_process_cmdline(optarg);
> +            break;
>          }
>      }
>  
> @@ -589,12 +567,6 @@ static int img_create(int argc, char **argv)
>      }
>      optind++;
>  
> -    if (qemu_opts_foreach(&qemu_object_opts,
> -                          user_creatable_add_opts_foreach,
> -                          qemu_img_object_print_help, &error_fatal)) {
> -        goto fail;
> -    }
> -
>      /* Get image size, if specified */
>      if (optind < argc) {
>          int64_t sval;
> @@ -804,14 +776,9 @@ static int img_check(int argc, char **argv)
>          case 'U':
>              force_share = true;
>              break;
> -        case OPTION_OBJECT: {
> -            QemuOpts *opts;
> -            opts = qemu_opts_parse_noisily(&qemu_object_opts,
> -                                           optarg, true);
> -            if (!opts) {
> -                return 1;
> -            }
> -        }   break;
> +        case OPTION_OBJECT:
> +            user_creatable_process_cmdline(optarg);
> +            break;
>          case OPTION_IMAGE_OPTS:
>              image_opts = true;
>              break;
> @@ -831,12 +798,6 @@ static int img_check(int argc, char **argv)
>          return 1;
>      }
>  
> -    if (qemu_opts_foreach(&qemu_object_opts,
> -                          user_creatable_add_opts_foreach,
> -                          qemu_img_object_print_help, &error_fatal)) {
> -        return 1;
> -    }
> -
>      ret = bdrv_parse_cache_mode(cache, &flags, &writethrough);
>      if (ret < 0) {
>          error_report("Invalid source cache option: %s", cache);
> @@ -1034,14 +995,9 @@ static int img_commit(int argc, char **argv)
>                  return 1;
>              }
>              break;
> -        case OPTION_OBJECT: {
> -            QemuOpts *opts;
> -            opts = qemu_opts_parse_noisily(&qemu_object_opts,
> -                                           optarg, true);
> -            if (!opts) {
> -                return 1;
> -            }
> -        }   break;
> +        case OPTION_OBJECT:
> +            user_creatable_process_cmdline(optarg);
> +            break;
>          case OPTION_IMAGE_OPTS:
>              image_opts = true;
>              break;
> @@ -1058,12 +1014,6 @@ static int img_commit(int argc, char **argv)
>      }
>      filename = argv[optind++];
>  
> -    if (qemu_opts_foreach(&qemu_object_opts,
> -                          user_creatable_add_opts_foreach,
> -                          qemu_img_object_print_help, &error_fatal)) {
> -        return 1;
> -    }
> -
>      flags = BDRV_O_RDWR | BDRV_O_UNMAP;
>      ret = bdrv_parse_cache_mode(cache, &flags, &writethrough);
>      if (ret < 0) {
> @@ -1353,7 +1303,7 @@ static int check_empty_sectors(BlockBackend *blk, int64_t offset,
>  /*
>   * Compares two images. Exit codes:
>   *
> - * 0 - Images are identical
> + * 0 - Images are identical or the requested help was printed
>   * 1 - Images differ
>   * >1 - Error occurred
>   */
> @@ -1423,15 +1373,21 @@ static int img_compare(int argc, char **argv)
>          case 'U':
>              force_share = true;
>              break;
> -        case OPTION_OBJECT: {
> -            QemuOpts *opts;
> -            opts = qemu_opts_parse_noisily(&qemu_object_opts,
> -                                           optarg, true);
> -            if (!opts) {
> -                ret = 2;
> -                goto out4;
> +        case OPTION_OBJECT:
> +            {
> +                Error *local_err = NULL;
> +
> +                if (!user_creatable_add_from_str(optarg, &local_err)) {
> +                    if (local_err) {
> +                        error_report_err(local_err);
> +                        exit(2);
> +                    } else {
> +                        /* Help was printed */
> +                        exit(EXIT_SUCCESS);
> +                    }
> +                }
> +                break;
>              }
> -        }   break;
>          case OPTION_IMAGE_OPTS:
>              image_opts = true;
>              break;

Why is this one different?  The others all call
user_creatable_process_cmdline().


> @@ -1450,13 +1406,6 @@ static int img_compare(int argc, char **argv)
>      filename1 = argv[optind++];
>      filename2 = argv[optind++];
>  
> -    if (qemu_opts_foreach(&qemu_object_opts,
> -                          user_creatable_add_opts_foreach,
> -                          qemu_img_object_print_help, &error_fatal)) {
> -        ret = 2;
> -        goto out4;
> -    }
> -
>      /* Initialize before goto out */
>      qemu_progress_init(progress, 2.0);
>  
> @@ -1641,7 +1590,6 @@ out2:
>      blk_unref(blk1);
>  out3:
>      qemu_progress_end();
> -out4:
>      return ret;
>  }
>  
[...]


