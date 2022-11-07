Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE24761F04D
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Nov 2022 11:22:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1orzFL-0001v5-20; Mon, 07 Nov 2022 05:20:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1orzFI-0001ue-EU
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 05:20:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1orzFE-0006ec-4p
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 05:20:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667816442;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UgZnfDyqJadsRtN31k1RwvYts8OerntVqupvOBKDL/I=;
 b=WNc0MeB/4NitySwovQ//+XJnwtgb6wFMwZ571TIarvge6nUsh1SA/WvqWerukHdhTXZfrx
 wcQyAT6O7BXgimFS2Bo4+OKFqbFUYxZteRhZNTUATJX9in7e26jEtP9Ymca6BmJr/I/326
 6yx3emRCv+4YMHOfG0KKxcWXzwwkdT0=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-425-xiTYlTwSNbSmpTl6keHmQw-1; Mon, 07 Nov 2022 05:20:41 -0500
X-MC-Unique: xiTYlTwSNbSmpTl6keHmQw-1
Received: by mail-ed1-f71.google.com with SMTP id
 z9-20020a05640235c900b0046358415c4fso7922007edc.9
 for <qemu-devel@nongnu.org>; Mon, 07 Nov 2022 02:20:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UgZnfDyqJadsRtN31k1RwvYts8OerntVqupvOBKDL/I=;
 b=cSd0vXOlUK1EqGhdUQDxOzTVIg/lQJw3P4RbskCp8KGeN4Yg3zi2NqZIYGov8LcAQC
 tfyNRfj6Y8KzuMYzVBYbBnCIEedV4hfr+SWFMTrUxykkxmTJZJ9SXA8D+pQJ5XdIwpX9
 CDmzp84ekBG0xFKShIH+CKKWxNsDure5au9pLp6ezIJVKN6UCLJ+LJEk6Akn6IHSacld
 HXMYSbccoWiQMHpgZv4hpOcgkoKkZRVXbMAVPzrfUutK1bjM25OuJJqbTCccJClu8SM6
 XbyKcy6VhPhxaTUgh6FsLGyKnkJnpLahiEfQPTCPDJQMmbQfEd7nzmWYgl1LriK4QiNN
 bHnw==
X-Gm-Message-State: ACrzQf0cknOPYIvm/8hoKDfiowIxkf/TJWMcUkeVt4iqX4wrOhzxbxwn
 s1fvU0OJaTjve/yEpFFg9XM0L2FeFRrYDlKhI6prPoa4T43eXR1UqwLYw5xFvl0d5k7Ljy//cMf
 uxNAM3YZ8LOUsPD4=
X-Received: by 2002:aa7:c9c7:0:b0:463:4eff:a07 with SMTP id
 i7-20020aa7c9c7000000b004634eff0a07mr41055513edt.88.1667816439796; 
 Mon, 07 Nov 2022 02:20:39 -0800 (PST)
X-Google-Smtp-Source: AMsMyM50FvPqJfmSlOxu2tBJJIieqtYPI/TmsKkCIG2iCuF4tMNsLlifJ49Fq1BvSkVbllOr33OcJA==
X-Received: by 2002:aa7:c9c7:0:b0:463:4eff:a07 with SMTP id
 i7-20020aa7c9c7000000b004634eff0a07mr41055469edt.88.1667816439246; 
 Mon, 07 Nov 2022 02:20:39 -0800 (PST)
Received: from ?IPV6:2a02:8071:5050:c500:3cbc:a8ad:61a8:57e3?
 ([2a02:8071:5050:c500:3cbc:a8ad:61a8:57e3])
 by smtp.gmail.com with ESMTPSA id
 l2-20020a1709063d2200b007adbd01c566sm3251309ejf.146.2022.11.07.02.20.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Nov 2022 02:20:38 -0800 (PST)
Message-ID: <090561ea-9836-bece-3e73-a044f45c703d@redhat.com>
Date: Mon, 7 Nov 2022 11:20:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/3] qemu-img: Add checksum command
Content-Language: en-US
To: Nir Soffer <nsoffer@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, Kevin Wolf <kwolf@redhat.com>
References: <20220901143223.201295-1-nsoffer@redhat.com>
 <20220901143223.201295-2-nsoffer@redhat.com>
 <6f9ad126-eb51-25d5-d7d2-bb478c3ecc19@redhat.com>
 <CAMRbyyt5KvHd-e5ujF+9QQZYe+QsFNmfVYuk7+fGFcU7cBFSvg@mail.gmail.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <CAMRbyyt5KvHd-e5ujF+9QQZYe+QsFNmfVYuk7+fGFcU7cBFSvg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 30.10.22 18:37, Nir Soffer wrote:
> On Wed, Oct 26, 2022 at 4:00 PM Hanna Reitz <hreitz@redhat.com> wrote:
>
>     On 01.09.22 16:32, Nir Soffer wrote:
>     > The checksum command compute a checksum for disk image content
>     using the
>     > blkhash library[1]. The blkhash library is not packaged yet, but
>     it is
>     > available via copr[2].
>     >
>     > Example run:
>     >
>     >      $ ./qemu-img checksum -p fedora-35.qcow2
>     > 6e5c00c995056319d52395f8d91c7f84725ae3da69ffcba4de4c7d22cff713a5
>     fedora-35.qcow2
>     >
>     > The block checksum is constructed by splitting the image to
>     fixed sized
>     > blocks and computing a digest of every block. The image checksum
>     is the
>     > digest of the all block digests.
>     >
>     > The checksum uses internally the "sha256" algorithm but it cannot be
>     > compared with checksums created by other tools such as `sha256sum`.
>     >
>     > The blkhash library supports sparse images, zero detection, and
>     > optimizes zero block hashing (they are practically free). The
>     library
>     > uses multiple threads to speed up the computation.
>     >
>     > Comparing to `sha256sum`, `qemu-img checksum` is 3.5-4800[3] times
>     > faster, depending on the amount of data in the image:
>     >
>     >      $ ./qemu-img info /scratch/50p.raw
>     >      file format: raw
>     >      virtual size: 6 GiB (6442450944 bytes)
>     >      disk size: 2.91 GiB
>     >
>     >      $ hyperfine -w2 -r5 -p "sleep 1" "./qemu-img checksum
>     /scratch/50p.raw" \
>     >                                       "sha256sum /scratch/50p.raw"
>     >      Benchmark 1: ./qemu-img checksum /scratch/50p.raw
>     >        Time (mean ± σ):      1.849 s ±  0.037 s [User: 7.764 s,
>     System: 0.962 s]
>     >        Range (min … max):    1.813 s …  1.908 s    5 runs
>     >
>     >      Benchmark 2: sha256sum /scratch/50p.raw
>     >        Time (mean ± σ):     14.585 s ±  0.072 s [User: 13.537 s,
>     System: 1.003 s]
>     >        Range (min … max):   14.501 s … 14.697 s    5 runs
>     >
>     >      Summary
>     >        './qemu-img checksum /scratch/50p.raw' ran
>     >          7.89 ± 0.16 times faster than 'sha256sum /scratch/50p.raw'
>     >
>     > The new command is available only when `blkhash` is available during
>     > build. To test the new command please install the `blkhash-devel`
>     > package:
>     >
>     >      $ dnf copr enable nsoffer/blkhash
>     >      $ sudo dnf install blkhash-devel
>     >
>     > [1] https://gitlab.com/nirs/blkhash
>     > [2] https://copr.fedorainfracloud.org/coprs/nsoffer/blkhash/
>     > [3] Computing checksum for 8T empty image: qemu-img checksum: 3.7s,
>     >      sha256sum (estimate): 17,749s
>     >
>     > Signed-off-by: Nir Soffer <nsoffer@redhat.com>
>     > ---
>     >   docs/tools/qemu-img.rst |  22 +++++
>     >   meson.build             |  10 ++-
>     >   meson_options.txt       |   2 +
>     >   qemu-img-cmds.hx        |   8 ++
>     >   qemu-img.c              | 191
>     ++++++++++++++++++++++++++++++++++++++++
>     >   5 files changed, 232 insertions(+), 1 deletion(-)
>     >
>     > diff --git a/docs/tools/qemu-img.rst b/docs/tools/qemu-img.rst
>     > index 85a6e05b35..8be9c45cbf 100644
>     > --- a/docs/tools/qemu-img.rst
>     > +++ b/docs/tools/qemu-img.rst
>     > @@ -347,20 +347,42 @@ Command description:
>     >       Check completed, image is corrupted
>     >     3
>     >       Check completed, image has leaked clusters, but is not
>     corrupted
>     >     63
>     >       Checks are not supported by the image format
>     >
>     >     If ``-r`` is specified, exit codes representing the image
>     state refer to the
>     >     state after (the attempt at) repairing it. That is, a
>     successful ``-r all``
>     >     will yield the exit code 0, independently of the image state
>     before.
>     >
>     > +.. option:: checksum [--object OBJECTDEF] [--image-opts] [-f
>     FMT] [-T SRC_CACHE] [-p] FILENAME
>     > +
>     > +  Print a checksum for image *FILENAME* guest visible content.
>
>     Why not say which kind of checksum it is?
>
>
> Do you mean the algorithm used? This may be confusing, for example we 
> write
>
>    Print a sha256 checksum ...
>
> User will expect to get the same result from "sha256sum disk.img". How 
> about
>
>    Print a blkhash checksum ...
>
> And add a link to the blkhash project?

I did mean sha256, but if it isn’t pure sha256, then a link to any 
description how it is computed would be good, I think.

>
>     >           Images with
>     > +  different format or settings wil have the same checksum.
>
>     s/wil/will/
>
>
> Fixing
>
>
>     > +
>     > +  The format is probed unless you specify it by ``-f``.
>     > +
>     > +  The checksum is computed for guest visible content. Allocated
>     areas full of
>     > +  zeroes, zero clusters, and unallocated areas are read as
>     zeros so they will
>     > +  have the same checksum. Images with single or multiple files
>     or backing files
>     > +  will have the same checksums if the guest will see the same
>     content when
>     > +  reading the image.
>     > +
>     > +  Image metadata that is not visible to the guest such as dirty
>     bitmaps does
>     > +  not affect the checksum.
>     > +
>     > +  Computing a checksum requires a read-only image. You cannot
>     compute a
>     > +  checksum of an active image used by a guest,
>
>     Makes me ask: Why not?  Other subcommands have the -U flag for this.
>
>
> The text is not precise enough, the issue is not active image but 
> having a read only
> image.
>
> What we really want is to take a shared read lock on the image when 
> opening it to ensure
> that qemu or another instance of qemu-img is not holding a write lock 
> and cannot upgrade
> a read lock to write lock on this image.
>
> If the image can be changed while we read from it there is no point in 
> computing
> a checksum.

OK.

> If the -U/--force-share flag has these semantics we can add it, but 
> based on testing it
> works for images open for writing (e.g. qemu-img info, qemu-img measure).

Yes, -U would precisely allow other writers.

>
>     >                                                  but you can
>     compute a checksum
>     > +  of a guest during pull mode incremental backup using NBD URL.
>     > +
>     > +  The checksum is not compatible with other tools such as
>     *sha256sum*.
>
>     Why not?  I can see it differs even for raw images, but why?  I would
>     have very much assumed that this gives me exactly what sha256sum
>     in the
>     guest on the guest device would yield.
>
>
> The blkhash is a construction based on other cryptographic hash 
> functions (e.g. sha256).
> The way the hash is constructed is explained here:
> https://gitlab.com/nirs/blkhash/-/blob/master/blkhash.py#L52
>
> We can provide a very slow version using a single thread and no zero 
> optimization
> that will create the same hash as sha256sum for raw image.

Ah, right.  Yes, especially zero optimization is likely to make a huge 
difference.  Thanks for the explanation!

Maybe that could be mentioned here as a side note, though?  E.g. “The 
checksum is not compatible with other tools such as *sha256sum* for 
optimization purposes (to allow multithreading and optimized handling of 
zero areas).”?

> I don't think this is very
> interesting since it is not practical for large images. If we want 
> something like this,
> we can add it later when we add an option to configure the algorithm.
>
> We can also start with a slow version using available hash function 
> and enable
> blkhash only if the library is available in build time.

I mean, if that is necessary; but it feels like that would only 
complicate the code (in qemu-img) for little practical gain.

>
>     [...]
>
>     > diff --git a/qemu-img.c b/qemu-img.c
>     > index 7d4b33b3da..7edcfe4bc8 100644
>     > --- a/qemu-img.c
>     > +++ b/qemu-img.c
>     > @@ -17,20 +17,21 @@
>     >    * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
>     MERCHANTABILITY,
>     >    * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO
>     EVENT SHALL
>     >    * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,
>     DAMAGES OR OTHER
>     >    * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
>     OTHERWISE, ARISING FROM,
>     >    * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
>     OTHER DEALINGS IN
>     >    * THE SOFTWARE.
>     >    */
>     >
>     >   #include "qemu/osdep.h"
>     >   #include <getopt.h>
>     > +#include <blkhash.h>
>
>     This must be guarded by CONFIG_BLKHASH.
>
>
> Right
> [...]
>
>     > +#ifdef CONFIG_BLKHASH
>     > +/*
>     > + * Compute image checksum.
>     > + */
>     > +static int img_checksum(int argc, char **argv)
>     > +{
>     > +    const char *digest_name = "sha256";
>
>     Why don’t we make this configurable?
>
>
> We can, but this is not easy:
> - which hash functions should be supported?
> - how to encode the algorithm used in the hash function?

I think I wrote the question when I still thought that using sha256 
would trivially relate the result to pure sha256 (i.e. sha256sum). Given 
that there is no trivial relation, I no longer think it makes sense to 
have this be configurable either.

We can just add it and think about this later if anyone turns up with a 
need for it.

>
> The blksum tool (part of blkhash) has a --digest and --list-digests 
> options and
> can use any hash function supported by openssl. Currently it does not 
> include
> the algorithm, in the result, so the user has to know 2 values to 
> compare hashes
> of different images.
>
> If we don't support configuration, all these issues are gone, and the 
> tool is
> easier and safer to use.
>
> If we want to make this configurable, I think we need to include the 
> algorithm
> in the result, something like:
>
>     $ qemu-img checksum disk.img
> blk-sha256:9b3d2f329b8e1a3a10ac623efa163c12e953dbb5192825b4772dcf0f8905e1b1 
> disk.img
>
>     $ qemu-img checksum --digest sha1 disk.img
>     blk-sha1:6d7e6d55bed36e733bf50127d151f8af7bb5077f disk.img
>
> Or if we want to support standard checksums, maybe:
>
>     $ qemu-img checksum --digest sha256 disk.img
> sha256:49bc20df15e412a64472421e13fe86ff1c5165e18b2afccf160d4dc19fe68a14 
> disk.img
>
>     $ qemu-img checksum --digest blk-sha256 disk.img
> blk-sha256:9b3d2f329b8e1a3a10ac623efa163c12e953dbb5192825b4772dcf0f8905e1b1 
> disk.img
>
>
>     > +    const size_t block_size = 64 * KiB;
>     > +
>     > +    const char *format = NULL;
>     > +    const char *cache = BDRV_DEFAULT_CACHE;
>     > +    const char *filename;
>     > +    BlockBackend *blk;
>     > +    BlockDriverState *bs;
>     > +    uint8_t *buf = NULL;
>     > +    int64_t pnum;
>     > +    bool progress = false;
>     > +    int flags = 0;
>     > +    bool writethrough;
>     > +    int64_t total_size;
>     > +    int64_t offset = 0;
>     > +    int c;
>     > +    bool image_opts = false;
>     > +    struct blkhash *h = NULL;
>     > +    unsigned char digest[64];
>     > +    unsigned int digest_len;
>     > +    int ret = 1;
>     > +    int err;
>     > +
>     > +    for (;;) {
>     > +        static const struct option long_options[] = {
>     > +            {"help", no_argument, 0, 'h'},
>     > +            {"object", required_argument, 0, OPTION_OBJECT},
>     > +            {"image-opts", no_argument, 0, OPTION_IMAGE_OPTS},
>     > +            {0, 0, 0, 0}
>     > +        };
>     > +        c = getopt_long(argc, argv, ":hf:T:p",
>     > +                        long_options, NULL);
>     > +        if (c == -1) {
>     > +            break;
>     > +        }
>     > +        switch (c) {
>     > +        case ':':
>     > +            missing_argument(argv[optind - 1]);
>     > +            break;
>     > +        case '?':
>     > +            unrecognized_option(argv[optind - 1]);
>     > +            break;
>     > +        case 'h':
>     > +            help();
>     > +            break;
>     > +        case 'f':
>     > +            format = optarg;
>     > +            break;
>     > +        case 'T':
>     > +            cache = optarg;
>     > +            break;
>     > +        case 'p':
>     > +            progress = true;
>     > +            break;
>     > +        case OPTION_OBJECT:
>     > +            {
>     > +                Error *local_err = NULL;
>     > +
>     > +                if (!user_creatable_add_from_str(optarg,
>     &local_err)) {
>     > +                    if (local_err) {
>     > +                        error_report_err(local_err);
>     > +                        exit(2);
>     > +                    } else {
>     > +                        /* Help was printed */
>     > +                        exit(EXIT_SUCCESS);
>     > +                    }
>     > +                }
>
>     How about simply using user_creatable_process_cmdline(optarg)? (which
>     most other subcommands use)
>
>     (I believe img_compare() has to have its own code, because exit
>     code 1
>     is reserved there.  But that isn’t a concern here.)
>
>
> Sure I can use it, I did not know about this.
>
>
>     > +                break;
>     > +            }
>     > +        case OPTION_IMAGE_OPTS:
>     > +            image_opts = true;
>     > +            break;
>     > +        }
>     > +    }
>     > +
>     > +    if (optind != argc - 1) {
>     > +        error_exit("Expecting image file name");
>     > +    }
>     > +
>     > +    filename = argv[optind++];
>     > +
>     > +    err = bdrv_parse_cache_mode(cache, &flags, &writethrough);
>     > +    if (err < 0) {
>     > +        error_report("Invalid source cache option: %s", cache);
>     > +        return ret;
>
>     Personally, I’m not too big of a fan of using `ret` here, because
>     it was
>     set so far above.  Why not just `return 1;`?
>
>     (Same in other error cases below.)
>
>
> ret is set at the start to error value (1) and modified to 0 only if 
> everything
> completed successfully.  This way we can return the same value in all
> the exit paths.
>
>     > +    }
>     > +
>     > +    blk = img_open(image_opts, filename, format, flags,
>     writethrough, false,
>     > +                   false);
>     > +    if (!blk) {
>     > +        return ret;
>     > +    }
>     > +
>     > +    /* Initialize before using goto out. */
>     > +    qemu_progress_init(progress, 2.0);
>     > +
>     > +    bs = blk_bs(blk);
>     > +    buf = blk_blockalign(blk, IO_BUF_SIZE);
>
>     It looks like this macro is kind of specific to `img_compare()`,
>     and is
>     currently somewhere in the middle of its code.  I don’t mind
>     reusing it
>     here, but if so, we might want to move it up to the top of this file,
>     and add a comment that this is the buffer size used for commands like
>     compare or checksum.
>
>
> IO_BUF_SIZE is also used by qemu-img convert. In the next commits
> I'm adding another macro for the checksum code, so this change is not
> needed, but I can move the macro to the top of the file to make it clear
> that this is a default for many commands, and not specific qemu-img 
> compare
> default.

Works for me either way.

(During review I didn’t know yet that the use here would be replaced 
again by patch 3.  Since it is, I no longer really mind what happens to 
IO_BUF_SIZE.)

>
>
>     > +
>     > +    total_size = blk_getlength(blk);
>     > +    if (total_size < 0) {
>     > +        error_report("Can't get size of %s: %s",
>     > +                     filename, strerror(-total_size));
>     > +        goto out;
>
>     I suggest adding `ret = 1;` before such a `goto out;` (not just
>     here),
>     so it is clear exactly what value we are going to return (it isn’t
>     trivial to track that `ret` isn’t used for anything else). But I
>     can see
>     that it’s extra code, so maybe you don’t like that.
>
>     If we keep this as-is, perhaps we could rename `ret` to something
>     more
>     explicit like `exit_status`, though?  That way, it’s pretty clear
>     that
>     we won’t accidentally reuse it for anything else.  (I know this isn’t
>     the first subcommand to use `ret` for the process exist status, but I
>     don’t think those other subcommands are great role models in this
>     regard.)
>
>
> exit_status is much better!
>
> I'll rename ret to exit_status in the next version, and keep the way 
> it is handled
> (initialized to 1, set to 0 on success).
>
>
>     > +    }
>     > +
>     > +    h = blkhash_new(block_size, digest_name);
>
>     Should we somehow make sure that IO_BUF_SIZE is a multiple of
>     block_size?  I mean, it is, but it isn’t obvious at least, and I
>     guess
>     maybe at some point someone might want to make block_size a
>     parameter.
>     Would a static assertion work?  (Would stop working once someone
>     decide
>     to make block_size a parameter, which is good, because it draws
>     attention.)
>
>
> Using a multiple of block_size is no required but it can improve 
> performance by
> minimizing copies in the pending buffer managed by blkhash.
>
> Making block_size configurable is not good way, since it changes the 
> value of the
> hash.

Right.  I didn’t understand this at the time of the review.  Could we 
add a comment above blkhash_new() to that effect?  (E.g. “The value of 
block_size changes how the hash is calculated, so block_size must always 
be the same.”)

> In we do in this way we maybe wan to encode the block size in the result
> so someone can restore the arguments for comparing an image against a 
> hash:
>
> blk-sha256/64k:9b3d2f329b8e1a3a10ac623efa163c12e953dbb5192825b4772dcf0f8905e1b1
>
> This starts to look too complicated to me.

Right, right.

> In blksum I do not allow changing the block size.
>
> I'll add an assert in the next version to keeps this default optimal.

Thanks!  (Static assert should work, right?)

>     > +    if (!h) {
>     > +        error_report("Can't create blkhash: %s", strerror(errno));
>     > +        goto out;
>     > +    }
>     > +
>     > +    qemu_progress_print(0, 100);
>     > +
>     > +    while (offset < total_size) {
>     > +        int status;
>     > +        int64_t chunk;
>     > +
>     > +        status = bdrv_block_status_above(bs, NULL, offset,
>     > +                                         total_size - offset,
>     &pnum, NULL,
>     > +                                         NULL);
>     > +        if (status < 0) {
>     > +            error_report("Error checking status at offset %"
>     PRId64 " for %s",
>     > +                         offset, filename);
>     > +            goto out;
>     > +        }
>     > +
>     > +        assert(pnum);
>     > +        chunk = pnum;
>
>     Can’t we drop `pnum` and replace it by `chunk` in all cases?
>
>
> I did this in the next commit, I can update it in this commit.

Thanks!

>
>     > +
>     > +        if (status & BDRV_BLOCK_ZERO) {
>     > +            chunk = MIN(chunk, SIZE_MAX);
>
>     Itches me a bit to propose rounding SIZE_MAX down to block_size,
>     but I
>     guess given the magnitude of SIZE_MAX on 64-bit systems, it
>     doesn’t matter.
>
>
> We round down to SIZE_MAX, since blkash_zero() accept size_t.
>
> I can also change blkhash to use int64_t instead. Testing show that 
> 16g is a good
> value to ensure timely progress updates.

I mean, 64-bit systems are so widespread these days that size_t should 
generally be 64-bit anyway.

>
>     > +            err = blkhash_zero(h, chunk);
>     > +            if (err) {
>     > +                error_report("Error zeroing hash at offset %"
>     PRId64
>     > +                             " of %s: %s",
>     > +                             offset, filename, strerror(err));
>     > +                goto out;
>     > +            }
>     > +        } else {
>     > +            chunk = MIN(chunk, IO_BUF_SIZE);
>     > +            err = blk_pread(blk, offset, chunk, buf, 0);
>     > +            if (err < 0) {
>     > +                error_report("Error reading at offset %" PRId64
>     " of %s: %s",
>     > +                             offset, filename, strerror(-err));
>     > +                goto out;
>     > +            }
>     > +            err = blkhash_update(h, buf, chunk);
>     > +            if (err) {
>     > +                error_report("Error updating hash at offset %"
>     PRId64
>     > +                             " of %s: %s",
>     > +                             offset, filename, strerror(err));
>     > +                goto out;
>     > +            }
>     > +        }
>     > +
>     > +        offset += chunk;
>     > +        qemu_progress_print(((float) chunk / total_size) * 100,
>     100);
>     > +    }
>     > +
>     > +    err = blkhash_final(h, digest, &digest_len);
>
>     How does this verify that `digest` is sufficiently large?
>
>     I mean, it is, given that we only have sha256 now.  But it still
>     seems
>     rather dangerous to me.
>
>
> In blksum I'm using EVP_MAX_MD_SIZE (from <openssl/evp.h>) which is 64
> (e.g. sha512).
>
> I'll add a similar macro in blkhash.h so users do not have to assume
> anything.

Thanks!

>
>     > +    if (err) {
>     > +        error_report("Error finalizing hash of %s: %s",
>     > +                     filename, strerror(err));
>     > +        goto out;
>     > +    }
>     > +
>     > +    for (unsigned i = 0; i < digest_len; i++) {
>
>     I always such declarations weren’t allowed in qemu, but this isn’t
>     the
>     first place, and I don’t mind.  Good to know. :)
>
>
> meson.build uses:
>
>     'c_std=gnu99',
>
> So the more modern and safer way should be allowed.
>
> Thanks for reviewing, this is very helpful!

Thanks for the patches!

Hanna


