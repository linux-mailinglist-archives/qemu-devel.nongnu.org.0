Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D738160E169
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 15:03:25 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ong1a-0002Nh-TH; Wed, 26 Oct 2022 09:00:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1ong15-0001mc-GJ
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 09:00:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1ong11-0001aX-SP
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 09:00:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666789214;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=urKEmvvqLnxAsAEOhPu6VDATPYb75KJ2quKPgQNd6Gk=;
 b=D54ErZcRHtrh0afapo9j3XErvLZqG+9MT+DI9c1PmssXqhqr9Xqw15zAxwU21ubOi//5rZ
 Bn4QggGqDFf26lduSW+ZIhJ8wcy6P1iiY2DhSgAXcE7/Rbkf/aVo+bRjTyOH12cAIXiYS2
 1+eRIp3g3ZNvouozNXkf1YZec4cxrEw=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-454-1SJsABMXPr6c9P7WmgeNXg-1; Wed, 26 Oct 2022 09:00:12 -0400
X-MC-Unique: 1SJsABMXPr6c9P7WmgeNXg-1
Received: by mail-ed1-f70.google.com with SMTP id
 h9-20020a05640250c900b00461d8ee12e2so6607233edb.23
 for <qemu-devel@nongnu.org>; Wed, 26 Oct 2022 06:00:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=urKEmvvqLnxAsAEOhPu6VDATPYb75KJ2quKPgQNd6Gk=;
 b=6ojEpjjBv56cmeJHZyiyX6XVUlSgqIMT4vbH8P1LXe96UMxGlKfbiC4OiLguHF5uHB
 IeXRDbc30v9LPrZjD20iQjQGakJX/0x59Mw1kma5EHeETd26KHe+WjreYwH8sFCqNreT
 QlEuw//JI4n/+6jdwmUVF4Jo1PGNbsvIBAtx6d62VYlRkZJdwGLS7yySFxsWt9O8F8Mj
 Dw6N6TqA1HkG4hK+h7n2PKm+U0mJbgTwkrF5PH2s9Anr5Lbtaf+F4dPZYZH/4WzHQeAc
 6qOLkepkjl0/IUhfJ99fT3Z6//y5PqblcrPimO8UprTgclBEQeTP7MpFRnjRqvNPC+2u
 Z6pA==
X-Gm-Message-State: ACrzQf3/fEcd+sMWtw+h/XNfy3Ti/z2IVx/8RQ5foX+0julGPwC20cpK
 Fkh6nrR6Z1P/Hi+Ye7ymHdDd/XvBoKeJNCKksGMrJqy8kibf0yxh4E6QvUp8XbLTFuDg4R91JY+
 YXsbm+4Xz9SmC5wE=
X-Received: by 2002:aa7:ccd2:0:b0:462:73bd:3acb with SMTP id
 y18-20020aa7ccd2000000b0046273bd3acbmr1540633edt.378.1666789211240; 
 Wed, 26 Oct 2022 06:00:11 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4hJKS0sbfYwexo71Sfa2NthsfRzWOSO3FwZ3OtyjSQQKRTLKYOBNVI43MA8xomuyin7lFHPg==
X-Received: by 2002:aa7:ccd2:0:b0:462:73bd:3acb with SMTP id
 y18-20020aa7ccd2000000b0046273bd3acbmr1540598edt.378.1666789210845; 
 Wed, 26 Oct 2022 06:00:10 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5050:c500:3cbc:a8ad:61a8:57e3?
 ([2a02:8071:5050:c500:3cbc:a8ad:61a8:57e3])
 by smtp.gmail.com with ESMTPSA id
 o7-20020a170906768700b0078c1e174e11sm2992858ejm.136.2022.10.26.06.00.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Oct 2022 06:00:09 -0700 (PDT)
Message-ID: <6f9ad126-eb51-25d5-d7d2-bb478c3ecc19@redhat.com>
Date: Wed, 26 Oct 2022 15:00:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/3] qemu-img: Add checksum command
Content-Language: en-US
To: Nir Soffer <nsoffer@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Kevin Wolf <kwolf@redhat.com>
References: <20220901143223.201295-1-nsoffer@redhat.com>
 <20220901143223.201295-2-nsoffer@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220901143223.201295-2-nsoffer@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 01.09.22 16:32, Nir Soffer wrote:
> The checksum command compute a checksum for disk image content using the
> blkhash library[1]. The blkhash library is not packaged yet, but it is
> available via copr[2].
>
> Example run:
>
>      $ ./qemu-img checksum -p fedora-35.qcow2
>      6e5c00c995056319d52395f8d91c7f84725ae3da69ffcba4de4c7d22cff713a5  fedora-35.qcow2
>
> The block checksum is constructed by splitting the image to fixed sized
> blocks and computing a digest of every block. The image checksum is the
> digest of the all block digests.
>
> The checksum uses internally the "sha256" algorithm but it cannot be
> compared with checksums created by other tools such as `sha256sum`.
>
> The blkhash library supports sparse images, zero detection, and
> optimizes zero block hashing (they are practically free). The library
> uses multiple threads to speed up the computation.
>
> Comparing to `sha256sum`, `qemu-img checksum` is 3.5-4800[3] times
> faster, depending on the amount of data in the image:
>
>      $ ./qemu-img info /scratch/50p.raw
>      file format: raw
>      virtual size: 6 GiB (6442450944 bytes)
>      disk size: 2.91 GiB
>
>      $ hyperfine -w2 -r5 -p "sleep 1" "./qemu-img checksum /scratch/50p.raw" \
>                                       "sha256sum /scratch/50p.raw"
>      Benchmark 1: ./qemu-img checksum /scratch/50p.raw
>        Time (mean ± σ):      1.849 s ±  0.037 s    [User: 7.764 s, System: 0.962 s]
>        Range (min … max):    1.813 s …  1.908 s    5 runs
>
>      Benchmark 2: sha256sum /scratch/50p.raw
>        Time (mean ± σ):     14.585 s ±  0.072 s    [User: 13.537 s, System: 1.003 s]
>        Range (min … max):   14.501 s … 14.697 s    5 runs
>
>      Summary
>        './qemu-img checksum /scratch/50p.raw' ran
>          7.89 ± 0.16 times faster than 'sha256sum /scratch/50p.raw'
>
> The new command is available only when `blkhash` is available during
> build. To test the new command please install the `blkhash-devel`
> package:
>
>      $ dnf copr enable nsoffer/blkhash
>      $ sudo dnf install blkhash-devel
>
> [1] https://gitlab.com/nirs/blkhash
> [2] https://copr.fedorainfracloud.org/coprs/nsoffer/blkhash/
> [3] Computing checksum for 8T empty image: qemu-img checksum: 3.7s,
>      sha256sum (estimate): 17,749s
>
> Signed-off-by: Nir Soffer <nsoffer@redhat.com>
> ---
>   docs/tools/qemu-img.rst |  22 +++++
>   meson.build             |  10 ++-
>   meson_options.txt       |   2 +
>   qemu-img-cmds.hx        |   8 ++
>   qemu-img.c              | 191 ++++++++++++++++++++++++++++++++++++++++
>   5 files changed, 232 insertions(+), 1 deletion(-)
>
> diff --git a/docs/tools/qemu-img.rst b/docs/tools/qemu-img.rst
> index 85a6e05b35..8be9c45cbf 100644
> --- a/docs/tools/qemu-img.rst
> +++ b/docs/tools/qemu-img.rst
> @@ -347,20 +347,42 @@ Command description:
>       Check completed, image is corrupted
>     3
>       Check completed, image has leaked clusters, but is not corrupted
>     63
>       Checks are not supported by the image format
>   
>     If ``-r`` is specified, exit codes representing the image state refer to the
>     state after (the attempt at) repairing it. That is, a successful ``-r all``
>     will yield the exit code 0, independently of the image state before.
>   
> +.. option:: checksum [--object OBJECTDEF] [--image-opts] [-f FMT] [-T SRC_CACHE] [-p] FILENAME
> +
> +  Print a checksum for image *FILENAME* guest visible content.

Why not say which kind of checksum it is?

>                                                                  Images with
> +  different format or settings wil have the same checksum.

s/wil/will/

> +
> +  The format is probed unless you specify it by ``-f``.
> +
> +  The checksum is computed for guest visible content. Allocated areas full of
> +  zeroes, zero clusters, and unallocated areas are read as zeros so they will
> +  have the same checksum. Images with single or multiple files or backing files
> +  will have the same checksums if the guest will see the same content when
> +  reading the image.
> +
> +  Image metadata that is not visible to the guest such as dirty bitmaps does
> +  not affect the checksum.
> +
> +  Computing a checksum requires a read-only image. You cannot compute a
> +  checksum of an active image used by a guest,

Makes me ask: Why not?  Other subcommands have the -U flag for this.

>                                                  but you can compute a checksum
> +  of a guest during pull mode incremental backup using NBD URL.
> +
> +  The checksum is not compatible with other tools such as *sha256sum*.

Why not?  I can see it differs even for raw images, but why?  I would 
have very much assumed that this gives me exactly what sha256sum in the 
guest on the guest device would yield.

> +
>   .. option:: commit [--object OBJECTDEF] [--image-opts] [-q] [-f FMT] [-t CACHE] [-b BASE] [-r RATE_LIMIT] [-d] [-p] FILENAME
>   
>     Commit the changes recorded in *FILENAME* in its base image or backing file.
>     If the backing file is smaller than the snapshot, then the backing file will be
>     resized to be the same size as the snapshot.  If the snapshot is smaller than
>     the backing file, the backing file will not be truncated.  If you want the
>     backing file to match the size of the smaller snapshot, you can safely truncate
>     it yourself once the commit operation successfully completes.
>   
>     The image *FILENAME* is emptied after the operation has succeeded. If you do

[...]

> diff --git a/qemu-img.c b/qemu-img.c
> index 7d4b33b3da..7edcfe4bc8 100644
> --- a/qemu-img.c
> +++ b/qemu-img.c
> @@ -17,20 +17,21 @@
>    * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
>    * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
>    * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
>    * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
>    * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
>    * THE SOFTWARE.
>    */
>   
>   #include "qemu/osdep.h"
>   #include <getopt.h>
> +#include <blkhash.h>

This must be guarded by CONFIG_BLKHASH.

>   #include "qemu/help-texts.h"
>   #include "qemu/qemu-progress.h"
>   #include "qemu-version.h"
>   #include "qapi/error.h"
>   #include "qapi/qapi-commands-block-core.h"
>   #include "qapi/qapi-visit-block-core.h"
>   #include "qapi/qobject-output-visitor.h"
>   #include "qapi/qmp/qjson.h"
>   #include "qapi/qmp/qdict.h"
> @@ -1611,20 +1612,210 @@ out:
>       qemu_vfree(buf1);
>       qemu_vfree(buf2);
>       blk_unref(blk2);
>   out2:
>       blk_unref(blk1);
>   out3:
>       qemu_progress_end();
>       return ret;
>   }
>   
> +#ifdef CONFIG_BLKHASH
> +/*
> + * Compute image checksum.
> + */
> +static int img_checksum(int argc, char **argv)
> +{
> +    const char *digest_name = "sha256";

Why don’t we make this configurable?

> +    const size_t block_size = 64 * KiB;
> +
> +    const char *format = NULL;
> +    const char *cache = BDRV_DEFAULT_CACHE;
> +    const char *filename;
> +    BlockBackend *blk;
> +    BlockDriverState *bs;
> +    uint8_t *buf = NULL;
> +    int64_t pnum;
> +    bool progress = false;
> +    int flags = 0;
> +    bool writethrough;
> +    int64_t total_size;
> +    int64_t offset = 0;
> +    int c;
> +    bool image_opts = false;
> +    struct blkhash *h = NULL;
> +    unsigned char digest[64];
> +    unsigned int digest_len;
> +    int ret = 1;
> +    int err;
> +
> +    for (;;) {
> +        static const struct option long_options[] = {
> +            {"help", no_argument, 0, 'h'},
> +            {"object", required_argument, 0, OPTION_OBJECT},
> +            {"image-opts", no_argument, 0, OPTION_IMAGE_OPTS},
> +            {0, 0, 0, 0}
> +        };
> +        c = getopt_long(argc, argv, ":hf:T:p",
> +                        long_options, NULL);
> +        if (c == -1) {
> +            break;
> +        }
> +        switch (c) {
> +        case ':':
> +            missing_argument(argv[optind - 1]);
> +            break;
> +        case '?':
> +            unrecognized_option(argv[optind - 1]);
> +            break;
> +        case 'h':
> +            help();
> +            break;
> +        case 'f':
> +            format = optarg;
> +            break;
> +        case 'T':
> +            cache = optarg;
> +            break;
> +        case 'p':
> +            progress = true;
> +            break;
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

How about simply using user_creatable_process_cmdline(optarg)? (which 
most other subcommands use)

(I believe img_compare() has to have its own code, because exit code 1 
is reserved there.  But that isn’t a concern here.)

> +                break;
> +            }
> +        case OPTION_IMAGE_OPTS:
> +            image_opts = true;
> +            break;
> +        }
> +    }
> +
> +    if (optind != argc - 1) {
> +        error_exit("Expecting image file name");
> +    }
> +
> +    filename = argv[optind++];
> +
> +    err = bdrv_parse_cache_mode(cache, &flags, &writethrough);
> +    if (err < 0) {
> +        error_report("Invalid source cache option: %s", cache);
> +        return ret;

Personally, I’m not too big of a fan of using `ret` here, because it was 
set so far above.  Why not just `return 1;`?

(Same in other error cases below.)

> +    }
> +
> +    blk = img_open(image_opts, filename, format, flags, writethrough, false,
> +                   false);
> +    if (!blk) {
> +        return ret;
> +    }
> +
> +    /* Initialize before using goto out. */
> +    qemu_progress_init(progress, 2.0);
> +
> +    bs = blk_bs(blk);
> +    buf = blk_blockalign(blk, IO_BUF_SIZE);

It looks like this macro is kind of specific to `img_compare()`, and is 
currently somewhere in the middle of its code.  I don’t mind reusing it 
here, but if so, we might want to move it up to the top of this file, 
and add a comment that this is the buffer size used for commands like 
compare or checksum.

> +
> +    total_size = blk_getlength(blk);
> +    if (total_size < 0) {
> +        error_report("Can't get size of %s: %s",
> +                     filename, strerror(-total_size));
> +        goto out;

I suggest adding `ret = 1;` before such a `goto out;` (not just here), 
so it is clear exactly what value we are going to return (it isn’t 
trivial to track that `ret` isn’t used for anything else). But I can see 
that it’s extra code, so maybe you don’t like that.

If we keep this as-is, perhaps we could rename `ret` to something more 
explicit like `exit_status`, though?  That way, it’s pretty clear that 
we won’t accidentally reuse it for anything else.  (I know this isn’t 
the first subcommand to use `ret` for the process exist status, but I 
don’t think those other subcommands are great role models in this regard.)

> +    }
> +
> +    h = blkhash_new(block_size, digest_name);

Should we somehow make sure that IO_BUF_SIZE is a multiple of 
block_size?  I mean, it is, but it isn’t obvious at least, and I guess 
maybe at some point someone might want to make block_size a parameter.  
Would a static assertion work?  (Would stop working once someone decide 
to make block_size a parameter, which is good, because it draws attention.)

> +    if (!h) {
> +        error_report("Can't create blkhash: %s", strerror(errno));
> +        goto out;
> +    }
> +
> +    qemu_progress_print(0, 100);
> +
> +    while (offset < total_size) {
> +        int status;
> +        int64_t chunk;
> +
> +        status = bdrv_block_status_above(bs, NULL, offset,
> +                                         total_size - offset, &pnum, NULL,
> +                                         NULL);
> +        if (status < 0) {
> +            error_report("Error checking status at offset %" PRId64 " for %s",
> +                         offset, filename);
> +            goto out;
> +        }
> +
> +        assert(pnum);
> +        chunk = pnum;

Can’t we drop `pnum` and replace it by `chunk` in all cases?

> +
> +        if (status & BDRV_BLOCK_ZERO) {
> +            chunk = MIN(chunk, SIZE_MAX);

Itches me a bit to propose rounding SIZE_MAX down to block_size, but I 
guess given the magnitude of SIZE_MAX on 64-bit systems, it doesn’t matter.

> +            err = blkhash_zero(h, chunk);
> +            if (err) {
> +                error_report("Error zeroing hash at offset %" PRId64
> +                             " of %s: %s",
> +                             offset, filename, strerror(err));
> +                goto out;
> +            }
> +        } else {
> +            chunk = MIN(chunk, IO_BUF_SIZE);
> +            err = blk_pread(blk, offset, chunk, buf, 0);
> +            if (err < 0) {
> +                error_report("Error reading at offset %" PRId64 " of %s: %s",
> +                             offset, filename, strerror(-err));
> +                goto out;
> +            }
> +            err = blkhash_update(h, buf, chunk);
> +            if (err) {
> +                error_report("Error updating hash at offset %" PRId64
> +                             " of %s: %s",
> +                             offset, filename, strerror(err));
> +                goto out;
> +            }
> +        }
> +
> +        offset += chunk;
> +        qemu_progress_print(((float) chunk / total_size) * 100, 100);
> +    }
> +
> +    err = blkhash_final(h, digest, &digest_len);

How does this verify that `digest` is sufficiently large?

I mean, it is, given that we only have sha256 now.  But it still seems 
rather dangerous to me.

> +    if (err) {
> +        error_report("Error finalizing hash of %s: %s",
> +                     filename, strerror(err));
> +        goto out;
> +    }
> +
> +    for (unsigned i = 0; i < digest_len; i++) {

I always such declarations weren’t allowed in qemu, but this isn’t the 
first place, and I don’t mind.  Good to know. :)

Hanna

> +        printf("%02x", digest[i]);
> +    }
> +    printf("  %s%s", filename, progress ? "" : "\n");
> +
> +    ret = 0;
> +
> +out:
> +    blkhash_free(h);
> +    qemu_vfree(buf);
> +    blk_unref(blk);
> +    qemu_progress_end();
> +
> +    return ret;
> +}
> +#endif /* CONFIG_BLKHASH */
> +
>   /* Convenience wrapper around qmp_block_dirty_bitmap_merge */
>   static void do_dirty_bitmap_merge(const char *dst_node, const char *dst_name,
>                                     const char *src_node, const char *src_name,
>                                     Error **errp)
>   {
>       BlockDirtyBitmapOrStr *merge_src;
>       BlockDirtyBitmapOrStrList *list = NULL;
>   
>       merge_src = g_new0(BlockDirtyBitmapOrStr, 1);
>       merge_src->type = QTYPE_QDICT;


