Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAE7551AC8F
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 20:16:40 +0200 (CEST)
Received: from localhost ([::1]:35944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmJYF-0004Ki-Dc
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 14:16:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nmJWx-0002up-Rq
 for qemu-devel@nongnu.org; Wed, 04 May 2022 14:15:22 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:34035)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nmJWv-0008HR-Db
 for qemu-devel@nongnu.org; Wed, 04 May 2022 14:15:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=xllsAuj2GZH4QlTBbzBMKrKLnVVJy0Tl8SFqLyJ/t1I=; b=WOZ8LAeLx2MvH7yepN/Wv9vy9Q
 4OmdQWB6Ot1c+cevR4jqOwBJSU1GeXfd+8Mz3USsbf1er51J/b8q9RO0ZxjPXr4aZPGJjFZtibpJH
 SNZ6Bai7fg7jTIrhiUCT1vxBIr9eOyV8F8dNBjeu7uJoex0faR4lZCpSW3zGUPcZvrzLFHLTyJZm/
 ADrGxqPZeKDUqu0fowUoCBXzkkrsIhw3KyDBOvUEFGnn0HWtARd9P4iuYUZ58cNBY2BN/ZATO6K89
 k9Clns846zSJ9rGQctbP38/6MEwHpNcn0TmnEfEnVV9fqspo4emeeuBgW8kXWMhkoLNE9hZ7OyL+a
 WNWq0NJemd2crSNn9pvAcpQwvQ52IMd8YgCVeRm6Ee9OkwKuYVsrDVaK4uEFhv1HSyaBd793rahbw
 1IBMlIFJvDbtQRPnlkBtkRKICPThJtA4btqjpo1RxxloFdXE4glPAmJPNYB08+Eat6ywudOh3KA2v
 UQag+HLjFOT11+lK0W5znIuz35G3i6oS6MGyzLZDNCMA4KVHKsesm6DZk/owMgI8WwUeROwEiWeCc
 qKI7Jcl2GTuZ1tFj9EcYhI85AYiuyotAx0cL5JsUlK4G6l9m1PpDoJ+nz3Tg2LDnrSH31PBgys4fX
 7jAXnUISWPSAdg+MR9nfLmgLky2a6gBswbMZVxyGI=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>, Bin Meng <bin.meng@windriver.com>,
 Guohuai Shi <guohuai.shi@windriver.com>, Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [PATCH 9/9] hw/9p: win32: Translate Windows error number to Linux
 value
Date: Wed, 04 May 2022 20:15:12 +0200
Message-ID: <3252858.3Ads0fb212@silver>
In-Reply-To: <20220425142705.2099270-10-bmeng.cn@gmail.com>
References: <20220425142705.2099270-1-bmeng.cn@gmail.com>
 <20220425142705.2099270-10-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Received-SPF: pass client-ip=5.189.157.229;
 envelope-from=qemu_oss@crudebyte.com; helo=kylie.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Montag, 25. April 2022 16:27:05 CEST Bin Meng wrote:
> From: Guohuai Shi <guohuai.shi@windriver.com>
> 
> Some of Windows error numbers have different value from Linux ones.
> For example, ENOTEMPTY is defined to 39 in Linux, but is defined to
> 41 in Windows. So deleting a directory from a Linux guest on top
> of QEMU from a Windows host complains:
> 
>   # rmdir tmp
>   rmdir: 'tmp': Unknown error 41
> 
> This commit provides error number traslation from Windows to Linux.
> It can make Linux guest OS happy with the error number when running
> on top of QEMU from a Windows host.
> 
> This has a side effet that it requires all guest OSes' 9pfs drivers
> to use the same errno.
> 
> It looks like macOS has different errno too so using 9p in a Linux
> on top of QEMU from a macOS host may also fail in the above case.
> I suspect we only tested 9p from a macOS guest on top of QEMU from
> a macOS host, so this issue was not exposed.
> 
> I am not aware of Windows's native support for 9pfs so I think using
> the Linux errnor as the standard is probably okay, but I am open for
> suggestions.
> 
> Signed-off-by: Guohuai Shi <guohuai.shi@windriver.com>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---

This patch collides with recent fixes for macOS hosts. Please rebase and use 
the already existing function errno_to_dotl().

> 
>  hw/9pfs/9p.h            |  4 ++++
>  hw/9pfs/9p-util-win32.c | 38 ++++++++++++++++++++++++++++++++++++++
>  hw/9pfs/9p.c            |  7 +++++++
>  3 files changed, 49 insertions(+)
> 
> diff --git a/hw/9pfs/9p.h b/hw/9pfs/9p.h
> index 87e8eac840..db2013d549 100644
> --- a/hw/9pfs/9p.h
> +++ b/hw/9pfs/9p.h
> @@ -490,6 +490,10 @@ void pdu_free(V9fsPDU *pdu);
>  void pdu_submit(V9fsPDU *pdu, P9MsgHeader *hdr);
>  void v9fs_reset(V9fsState *s);
> 
> +#ifdef CONFIG_WIN32
> +int errno_translate_win32(int errno_win32);
> +#endif
> +
>  struct V9fsTransport {
>      ssize_t     (*pdu_vmarshal)(V9fsPDU *pdu, size_t offset, const char
> *fmt, va_list ap);
> diff --git a/hw/9pfs/9p-util-win32.c b/hw/9pfs/9p-util-win32.c
> index d9b35e7425..c4f90c6503 100644
> --- a/hw/9pfs/9p-util-win32.c
> +++ b/hw/9pfs/9p-util-win32.c
> @@ -20,6 +20,11 @@
>  #define V9FS_MAGIC 0x53465039 /* string "9PFS" */
>  #endif
> 
> +struct translate_map {
> +    int output;     /* Linux error number */
> +    int input;      /* Windows error number */
> +};
> +

No need to define a structure for this. Your motivation was to define a sparse 
array. That safes you only a couple bytes and comes with runtime overhead 
OTOH. See below.

>  static int build_ads_name(char *namebuf, size_t namebuflen,
>                            const char *dirname, const char *filename,
>                            const char *ads_name)
> @@ -301,3 +306,36 @@ int qemu_statfs(const char *fs_root, struct statfs
> *stbuf)
> 
>      return 0;
>  }
> +
> +int errno_translate_win32(int errno_win32)
> +    {
> +    unsigned int i;
> +
> +    /*
> +     * The translation table only contains values which could be returned
> +     * as a result of a filesystem operation, i.e. network/socket related
> +     * errno values need not be considered for translation.
> +     */
> +    static struct translate_map errno_map[] = {
> +        /* Linux errno          Windows errno   */
> +        { L_EDEADLK,            EDEADLK         },
> +        { L_ENAMETOOLONG,       ENAMETOOLONG    },
> +        { L_ENOLCK,             ENOLCK          },
> +        { L_ENOSYS,             ENOSYS          },
> +        { L_ENOTEMPTY,          ENOTEMPTY       },
> +        { L_EILSEQ,             EILSEQ          },
> +        { L_ELOOP,              ELOOP           },
> +    };

So far we are using if .. else if ... blocks for macOS host errno translation, 
because I needed quick and small patches for qemu-stable for fixing macOS host 
support.

So it is OK to use an array solution, but simply use a dense array and use GCC 
designated initializers ...

> +
> +    /* scan errno_win32 table for a matching Linux errno value */
> +
> +    for (i = 0; i < sizeof(errno_map) / sizeof(errno_map[0]); i++) {
> +        if (errno_win32 == errno_map[i].input) {
> +            return errno_map[i].output;
> +        }
> +    }

... then this loop will become unnecessary, and you can just make a constant 
time array access with prior array range check.

> +
> +    /* no translation necessary */
> +
> +    return errno_win32;
> +    }
> diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
> index a04889c1d6..0a9c0a509e 100644
> --- a/hw/9pfs/9p.c
> +++ b/hw/9pfs/9p.c
> @@ -1062,6 +1062,13 @@ static void coroutine_fn pdu_complete(V9fsPDU *pdu,
> ssize_t len) id = P9_RERROR;
>          }
> 
> +#ifdef CONFIG_WIN32
> +        /*
> +         * Some Windows errnos have different value from Linux,
> +         * and they need to be translated to the Linux value.
> +         */
> +        err = errno_translate_win32(err);
> +#endif

This would translate it for all 9p protocol versions. We want translation only 
for 9p2000.L. Current git version does this already correctly. So after having 
rebased you should not need to change anything here.

>          ret = pdu_marshal(pdu, len, "d", err);
>          if (ret < 0) {
>              goto out_notify;



