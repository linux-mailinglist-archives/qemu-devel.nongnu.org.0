Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD60F612C00
	for <lists+qemu-devel@lfdr.de>; Sun, 30 Oct 2022 18:39:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opCGM-00010B-71; Sun, 30 Oct 2022 13:38:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsoffer@redhat.com>)
 id 1opCGK-0000zw-8Y
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 13:38:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsoffer@redhat.com>)
 id 1opCGG-0003ay-6g
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 13:38:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667151495;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dVcaCCvIom40oJ+f8V8glBs+MfcQYLnOX0o07lC0QFc=;
 b=i9f5+93GLnJapi2dtEex7ZlOrIHxHrniqhMsC8T/V2rrRA7sCXWQwZ81lFKWJN4Wtr/J+6
 yRejz7D2/gzGKIHbqctkOrdAkgLdjitbbWAnsd20O/XoEilYiMf9ybeBFZSdo+7ywe9DNe
 +hICMdSfsAFbXMAEajfKPz0qvVtZAXc=
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-380-UzCjipthPQuy-if4LmP6Sg-1; Sun, 30 Oct 2022 13:38:13 -0400
X-MC-Unique: UzCjipthPQuy-if4LmP6Sg-1
Received: by mail-io1-f70.google.com with SMTP id
 y5-20020a056602120500b006cf628c14ddso478135iot.15
 for <qemu-devel@nongnu.org>; Sun, 30 Oct 2022 10:38:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dVcaCCvIom40oJ+f8V8glBs+MfcQYLnOX0o07lC0QFc=;
 b=0ee6a61S9G3zDLsoO4upUIE+mhavcm0BXL65XEj38eq0PMtxBxbEDNwoYU2Sx1kL9B
 qrpmLWKksj7h2j8Z082Mukxo/eFEY01mbVHi9/psS154Noi4YJJx7vVDXa39u3pPl84U
 wHD1EXSt/40nsXveuZ85ctLQswnmq35XFTBXz+CwEMwe8iMZ5HBuAbPhgRdQXMrwrKlG
 HA0L9t1JAPlBkLpql22+L0lHbH8v0JWfmhW7MxaDDJbRL5XdkImujG2JGBLH8WJy0Kyc
 lwlNRP6+bM1WcZFBNk0xglp6k57J7R/LQBqTLimStBESVR+IbVGgqS72SIj9JvvAgAIM
 Vgyw==
X-Gm-Message-State: ACrzQf157xr+DbLEBMXAuhETbgs4ZEjd0A56P5+jyVdTLhQ78O1bdUNJ
 bZ87/r9TWKaNFE/pvxyQ8g85vksPl9JB6rrLk9b4sbkjuo6y90DhbPdlIJm5fBbNUnVYUa62w70
 svJF4Lppt8NsLBXLXPvsEoewcKtdYA2A=
X-Received: by 2002:a05:6e02:1d8d:b0:2fa:7390:8f72 with SMTP id
 h13-20020a056e021d8d00b002fa73908f72mr4477612ila.197.1667151491902; 
 Sun, 30 Oct 2022 10:38:11 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5Hg99rp5UajA4hCGw2n6Lalb2slQqn0BRiG/MCNEFo9hKCZupU7fek2mZ/ldnTrRjbgYNGgk8sPwNYXY0b25s=
X-Received: by 2002:a05:6e02:1d8d:b0:2fa:7390:8f72 with SMTP id
 h13-20020a056e021d8d00b002fa73908f72mr4477596ila.197.1667151491485; Sun, 30
 Oct 2022 10:38:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220901143223.201295-1-nsoffer@redhat.com>
 <20220901143223.201295-2-nsoffer@redhat.com>
 <6f9ad126-eb51-25d5-d7d2-bb478c3ecc19@redhat.com>
In-Reply-To: <6f9ad126-eb51-25d5-d7d2-bb478c3ecc19@redhat.com>
From: Nir Soffer <nsoffer@redhat.com>
Date: Sun, 30 Oct 2022 19:37:54 +0200
Message-ID: <CAMRbyyt5KvHd-e5ujF+9QQZYe+QsFNmfVYuk7+fGFcU7cBFSvg@mail.gmail.com>
Subject: Re: [PATCH 1/3] qemu-img: Add checksum command
To: Hanna Reitz <hreitz@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, 
 Kevin Wolf <kwolf@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000006feebe05ec43f44d"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=nsoffer@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.055,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

--0000000000006feebe05ec43f44d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 26, 2022 at 4:00 PM Hanna Reitz <hreitz@redhat.com> wrote:

> On 01.09.22 16:32, Nir Soffer wrote:
> > The checksum command compute a checksum for disk image content using th=
e
> > blkhash library[1]. The blkhash library is not packaged yet, but it is
> > available via copr[2].
> >
> > Example run:
> >
> >      $ ./qemu-img checksum -p fedora-35.qcow2
> >      6e5c00c995056319d52395f8d91c7f84725ae3da69ffcba4de4c7d22cff713a5
> fedora-35.qcow2
> >
> > The block checksum is constructed by splitting the image to fixed sized
> > blocks and computing a digest of every block. The image checksum is the
> > digest of the all block digests.
> >
> > The checksum uses internally the "sha256" algorithm but it cannot be
> > compared with checksums created by other tools such as `sha256sum`.
> >
> > The blkhash library supports sparse images, zero detection, and
> > optimizes zero block hashing (they are practically free). The library
> > uses multiple threads to speed up the computation.
> >
> > Comparing to `sha256sum`, `qemu-img checksum` is 3.5-4800[3] times
> > faster, depending on the amount of data in the image:
> >
> >      $ ./qemu-img info /scratch/50p.raw
> >      file format: raw
> >      virtual size: 6 GiB (6442450944 bytes)
> >      disk size: 2.91 GiB
> >
> >      $ hyperfine -w2 -r5 -p "sleep 1" "./qemu-img checksum
> /scratch/50p.raw" \
> >                                       "sha256sum /scratch/50p.raw"
> >      Benchmark 1: ./qemu-img checksum /scratch/50p.raw
> >        Time (mean =C2=B1 =CF=83):      1.849 s =C2=B1  0.037 s    [User=
: 7.764 s,
> System: 0.962 s]
> >        Range (min =E2=80=A6 max):    1.813 s =E2=80=A6  1.908 s    5 ru=
ns
> >
> >      Benchmark 2: sha256sum /scratch/50p.raw
> >        Time (mean =C2=B1 =CF=83):     14.585 s =C2=B1  0.072 s    [User=
: 13.537 s,
> System: 1.003 s]
> >        Range (min =E2=80=A6 max):   14.501 s =E2=80=A6 14.697 s    5 ru=
ns
> >
> >      Summary
> >        './qemu-img checksum /scratch/50p.raw' ran
> >          7.89 =C2=B1 0.16 times faster than 'sha256sum /scratch/50p.raw=
'
> >
> > The new command is available only when `blkhash` is available during
> > build. To test the new command please install the `blkhash-devel`
> > package:
> >
> >      $ dnf copr enable nsoffer/blkhash
> >      $ sudo dnf install blkhash-devel
> >
> > [1] https://gitlab.com/nirs/blkhash
> > [2] https://copr.fedorainfracloud.org/coprs/nsoffer/blkhash/
> > [3] Computing checksum for 8T empty image: qemu-img checksum: 3.7s,
> >      sha256sum (estimate): 17,749s
> >
> > Signed-off-by: Nir Soffer <nsoffer@redhat.com>
> > ---
> >   docs/tools/qemu-img.rst |  22 +++++
> >   meson.build             |  10 ++-
> >   meson_options.txt       |   2 +
> >   qemu-img-cmds.hx        |   8 ++
> >   qemu-img.c              | 191 +++++++++++++++++++++++++++++++++++++++=
+
> >   5 files changed, 232 insertions(+), 1 deletion(-)
> >
> > diff --git a/docs/tools/qemu-img.rst b/docs/tools/qemu-img.rst
> > index 85a6e05b35..8be9c45cbf 100644
> > --- a/docs/tools/qemu-img.rst
> > +++ b/docs/tools/qemu-img.rst
> > @@ -347,20 +347,42 @@ Command description:
> >       Check completed, image is corrupted
> >     3
> >       Check completed, image has leaked clusters, but is not corrupted
> >     63
> >       Checks are not supported by the image format
> >
> >     If ``-r`` is specified, exit codes representing the image state
> refer to the
> >     state after (the attempt at) repairing it. That is, a successful
> ``-r all``
> >     will yield the exit code 0, independently of the image state before=
.
> >
> > +.. option:: checksum [--object OBJECTDEF] [--image-opts] [-f FMT] [-T
> SRC_CACHE] [-p] FILENAME
> > +
> > +  Print a checksum for image *FILENAME* guest visible content.
>
> Why not say which kind of checksum it is?
>

Do you mean the algorithm used? This may be confusing, for example we write

   Print a sha256 checksum ...

User will expect to get the same result from "sha256sum disk.img". How abou=
t

   Print a blkhash checksum ...

And add a link to the blkhash project?


>
> >                                                                  Images
> with
> > +  different format or settings wil have the same checksum.
>
> s/wil/will/
>

Fixing


>
> > +
> > +  The format is probed unless you specify it by ``-f``.
> > +
> > +  The checksum is computed for guest visible content. Allocated areas
> full of
> > +  zeroes, zero clusters, and unallocated areas are read as zeros so
> they will
> > +  have the same checksum. Images with single or multiple files or
> backing files
> > +  will have the same checksums if the guest will see the same content
> when
> > +  reading the image.
> > +
> > +  Image metadata that is not visible to the guest such as dirty bitmap=
s
> does
> > +  not affect the checksum.
> > +
> > +  Computing a checksum requires a read-only image. You cannot compute =
a
> > +  checksum of an active image used by a guest,
>
> Makes me ask: Why not?  Other subcommands have the -U flag for this.
>

The text is not precise enough, the issue is not active image but having a
read only
image.

What we really want is to take a shared read lock on the image when opening
it to ensure
that qemu or another instance of qemu-img is not holding a write lock and
cannot upgrade
a read lock to write lock on this image.

If the image can be changed while we read from it there is no point in
computing
a checksum.

If the -U/--force-share flag has these semantics we can add it, but based
on testing it
works for images open for writing (e.g. qemu-img info, qemu-img measure).


>
> >                                                  but you can compute a
> checksum
> > +  of a guest during pull mode incremental backup using NBD URL.
> > +
> > +  The checksum is not compatible with other tools such as *sha256sum*.
>
> Why not?  I can see it differs even for raw images, but why?  I would
> have very much assumed that this gives me exactly what sha256sum in the
> guest on the guest device would yield.


The blkhash is a construction based on other cryptographic hash functions
(e.g. sha256).
The way the hash is constructed is explained here:
https://gitlab.com/nirs/blkhash/-/blob/master/blkhash.py#L52

We can provide a very slow version using a single thread and no zero
optimization
that will create the same hash as sha256sum for raw image. I don't think
this is very
interesting since it is not practical for large images. If we want
something like this,
we can add it later when we add an option to configure the algorithm.

We can also start with a slow version using available hash function and
enable
blkhash only if the library is available in build time.

[...]
>
> > diff --git a/qemu-img.c b/qemu-img.c
> > index 7d4b33b3da..7edcfe4bc8 100644
> > --- a/qemu-img.c
> > +++ b/qemu-img.c
> > @@ -17,20 +17,21 @@
> >    * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
> MERCHANTABILITY,
> >    * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT
> SHALL
> >    * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES
> OR OTHER
> >    * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> ARISING FROM,
> >    * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
> DEALINGS IN
> >    * THE SOFTWARE.
> >    */
> >
> >   #include "qemu/osdep.h"
> >   #include <getopt.h>
> > +#include <blkhash.h>
>
> This must be guarded by CONFIG_BLKHASH.
>

Right

[...]

> > +#ifdef CONFIG_BLKHASH
> > +/*
> > + * Compute image checksum.
> > + */
> > +static int img_checksum(int argc, char **argv)
> > +{
> > +    const char *digest_name =3D "sha256";
>
> Why don=E2=80=99t we make this configurable?
>

We can, but this is not easy:
- which hash functions should be supported?
- how to encode the algorithm used in the hash function?

The blksum tool (part of blkhash) has a --digest and --list-digests options
and
can use any hash function supported by openssl. Currently it does not
include
the algorithm, in the result, so the user has to know 2 values to compare
hashes
of different images.

If we don't support configuration, all these issues are gone, and the tool
is
easier and safer to use.

If we want to make this configurable, I think we need to include the
algorithm
in the result, something like:

    $ qemu-img checksum disk.img

blk-sha256:9b3d2f329b8e1a3a10ac623efa163c12e953dbb5192825b4772dcf0f8905e1b1
disk.img

    $ qemu-img checksum --digest sha1 disk.img
    blk-sha1:6d7e6d55bed36e733bf50127d151f8af7bb5077f  disk.img

Or if we want to support standard checksums, maybe:

    $ qemu-img checksum --digest sha256 disk.img

sha256:49bc20df15e412a64472421e13fe86ff1c5165e18b2afccf160d4dc19fe68a14
disk.img

    $ qemu-img checksum --digest blk-sha256 disk.img

blk-sha256:9b3d2f329b8e1a3a10ac623efa163c12e953dbb5192825b4772dcf0f8905e1b1
disk.img


> > +    const size_t block_size =3D 64 * KiB;
> > +
> > +    const char *format =3D NULL;
> > +    const char *cache =3D BDRV_DEFAULT_CACHE;
> > +    const char *filename;
> > +    BlockBackend *blk;
> > +    BlockDriverState *bs;
> > +    uint8_t *buf =3D NULL;
> > +    int64_t pnum;
> > +    bool progress =3D false;
> > +    int flags =3D 0;
> > +    bool writethrough;
> > +    int64_t total_size;
> > +    int64_t offset =3D 0;
> > +    int c;
> > +    bool image_opts =3D false;
> > +    struct blkhash *h =3D NULL;
> > +    unsigned char digest[64];
> > +    unsigned int digest_len;
> > +    int ret =3D 1;
> > +    int err;
> > +
> > +    for (;;) {
> > +        static const struct option long_options[] =3D {
> > +            {"help", no_argument, 0, 'h'},
> > +            {"object", required_argument, 0, OPTION_OBJECT},
> > +            {"image-opts", no_argument, 0, OPTION_IMAGE_OPTS},
> > +            {0, 0, 0, 0}
> > +        };
> > +        c =3D getopt_long(argc, argv, ":hf:T:p",
> > +                        long_options, NULL);
> > +        if (c =3D=3D -1) {
> > +            break;
> > +        }
> > +        switch (c) {
> > +        case ':':
> > +            missing_argument(argv[optind - 1]);
> > +            break;
> > +        case '?':
> > +            unrecognized_option(argv[optind - 1]);
> > +            break;
> > +        case 'h':
> > +            help();
> > +            break;
> > +        case 'f':
> > +            format =3D optarg;
> > +            break;
> > +        case 'T':
> > +            cache =3D optarg;
> > +            break;
> > +        case 'p':
> > +            progress =3D true;
> > +            break;
> > +        case OPTION_OBJECT:
> > +            {
> > +                Error *local_err =3D NULL;
> > +
> > +                if (!user_creatable_add_from_str(optarg, &local_err)) =
{
> > +                    if (local_err) {
> > +                        error_report_err(local_err);
> > +                        exit(2);
> > +                    } else {
> > +                        /* Help was printed */
> > +                        exit(EXIT_SUCCESS);
> > +                    }
> > +                }
>
> How about simply using user_creatable_process_cmdline(optarg)? (which
> most other subcommands use)
>
> (I believe img_compare() has to have its own code, because exit code 1
> is reserved there.  But that isn=E2=80=99t a concern here.)
>

Sure I can use it, I did not know about this.


>
> > +                break;
> > +            }
> > +        case OPTION_IMAGE_OPTS:
> > +            image_opts =3D true;
> > +            break;
> > +        }
> > +    }
> > +
> > +    if (optind !=3D argc - 1) {
> > +        error_exit("Expecting image file name");
> > +    }
> > +
> > +    filename =3D argv[optind++];
> > +
> > +    err =3D bdrv_parse_cache_mode(cache, &flags, &writethrough);
> > +    if (err < 0) {
> > +        error_report("Invalid source cache option: %s", cache);
> > +        return ret;
>
> Personally, I=E2=80=99m not too big of a fan of using `ret` here, because=
 it was
> set so far above.  Why not just `return 1;`?
>
> (Same in other error cases below.)
>

ret is set at the start to error value (1) and modified to 0 only if
everything
completed successfully.  This way we can return the same value in all
the exit paths.

> +    }
> > +
> > +    blk =3D img_open(image_opts, filename, format, flags, writethrough=
,
> false,
> > +                   false);
> > +    if (!blk) {
> > +        return ret;
> > +    }
> > +
> > +    /* Initialize before using goto out. */
> > +    qemu_progress_init(progress, 2.0);
> > +
> > +    bs =3D blk_bs(blk);
> > +    buf =3D blk_blockalign(blk, IO_BUF_SIZE);
>
> It looks like this macro is kind of specific to `img_compare()`, and is
> currently somewhere in the middle of its code.  I don=E2=80=99t mind reus=
ing it
> here, but if so, we might want to move it up to the top of this file,
> and add a comment that this is the buffer size used for commands like
> compare or checksum.
>

IO_BUF_SIZE is also used by qemu-img convert. In the next commits
I'm adding another macro for the checksum code, so this change is not
needed, but I can move the macro to the top of the file to make it clear
that this is a default for many commands, and not specific qemu-img compare
default.


>
> > +
> > +    total_size =3D blk_getlength(blk);
> > +    if (total_size < 0) {
> > +        error_report("Can't get size of %s: %s",
> > +                     filename, strerror(-total_size));
> > +        goto out;
>
> I suggest adding `ret =3D 1;` before such a `goto out;` (not just here),
> so it is clear exactly what value we are going to return (it isn=E2=80=99=
t
> trivial to track that `ret` isn=E2=80=99t used for anything else). But I =
can see
> that it=E2=80=99s extra code, so maybe you don=E2=80=99t like that.
>
> If we keep this as-is, perhaps we could rename `ret` to something more
> explicit like `exit_status`, though?  That way, it=E2=80=99s pretty clear=
 that
> we won=E2=80=99t accidentally reuse it for anything else.  (I know this i=
sn=E2=80=99t
> the first subcommand to use `ret` for the process exist status, but I
> don=E2=80=99t think those other subcommands are great role models in this=
 regard.)
>

exit_status is much better!

I'll rename ret to exit_status in the next version, and keep the way it is
handled
(initialized to 1, set to 0 on success).


>
> > +    }
> > +
> > +    h =3D blkhash_new(block_size, digest_name);
>
> Should we somehow make sure that IO_BUF_SIZE is a multiple of
> block_size?  I mean, it is, but it isn=E2=80=99t obvious at least, and I =
guess
> maybe at some point someone might want to make block_size a parameter.
> Would a static assertion work?  (Would stop working once someone decide
> to make block_size a parameter, which is good, because it draws attention=
.)


Using a multiple of block_size is no required but it can improve
performance by
minimizing copies in the pending buffer managed by blkhash.

Making block_size configurable is not good way, since it changes the value
of the
hash. In we do in this way we maybe wan to encode the block size in the
result
so someone can restore the arguments for comparing an image against a hash:


blk-sha256/64k:9b3d2f329b8e1a3a10ac623efa163c12e953dbb5192825b4772dcf0f8905=
e1b1

This starts to look too complicated to me. In blksum I do not allow
changing the block size.

I'll add an assert in the next version to keeps this default optimal.


> > +    if (!h) {
> > +        error_report("Can't create blkhash: %s", strerror(errno));
> > +        goto out;
> > +    }
> > +
> > +    qemu_progress_print(0, 100);
> > +
> > +    while (offset < total_size) {
> > +        int status;
> > +        int64_t chunk;
> > +
> > +        status =3D bdrv_block_status_above(bs, NULL, offset,
> > +                                         total_size - offset, &pnum,
> NULL,
> > +                                         NULL);
> > +        if (status < 0) {
> > +            error_report("Error checking status at offset %" PRId64 "
> for %s",
> > +                         offset, filename);
> > +            goto out;
> > +        }
> > +
> > +        assert(pnum);
> > +        chunk =3D pnum;
>
> Can=E2=80=99t we drop `pnum` and replace it by `chunk` in all cases?
>

I did this in the next commit, I can update it in this commit.


>
> > +
> > +        if (status & BDRV_BLOCK_ZERO) {
> > +            chunk =3D MIN(chunk, SIZE_MAX);
>
> Itches me a bit to propose rounding SIZE_MAX down to block_size, but I
> guess given the magnitude of SIZE_MAX on 64-bit systems, it doesn=E2=80=
=99t matter.
>

We round down to SIZE_MAX, since blkash_zero() accept size_t.

I can also change blkhash to use int64_t instead. Testing show that 16g is
a good
value to ensure timely progress updates.


>
> > +            err =3D blkhash_zero(h, chunk);
> > +            if (err) {
> > +                error_report("Error zeroing hash at offset %" PRId64
> > +                             " of %s: %s",
> > +                             offset, filename, strerror(err));
> > +                goto out;
> > +            }
> > +        } else {
> > +            chunk =3D MIN(chunk, IO_BUF_SIZE);
> > +            err =3D blk_pread(blk, offset, chunk, buf, 0);
> > +            if (err < 0) {
> > +                error_report("Error reading at offset %" PRId64 " of
> %s: %s",
> > +                             offset, filename, strerror(-err));
> > +                goto out;
> > +            }
> > +            err =3D blkhash_update(h, buf, chunk);
> > +            if (err) {
> > +                error_report("Error updating hash at offset %" PRId64
> > +                             " of %s: %s",
> > +                             offset, filename, strerror(err));
> > +                goto out;
> > +            }
> > +        }
> > +
> > +        offset +=3D chunk;
> > +        qemu_progress_print(((float) chunk / total_size) * 100, 100);
> > +    }
> > +
> > +    err =3D blkhash_final(h, digest, &digest_len);
>
> How does this verify that `digest` is sufficiently large?
>
> I mean, it is, given that we only have sha256 now.  But it still seems
> rather dangerous to me.
>

In blksum I'm using EVP_MAX_MD_SIZE (from <openssl/evp.h>) which is 64
(e.g. sha512).

I'll add a similar macro in blkhash.h so users do not have to assume
anything.


>
> > +    if (err) {
> > +        error_report("Error finalizing hash of %s: %s",
> > +                     filename, strerror(err));
> > +        goto out;
> > +    }
> > +
> > +    for (unsigned i =3D 0; i < digest_len; i++) {
>
> I always such declarations weren=E2=80=99t allowed in qemu, but this isn=
=E2=80=99t the
> first place, and I don=E2=80=99t mind.  Good to know. :)
>

meson.build uses:

    'c_std=3Dgnu99',

So the more modern and safer way should be allowed.

Thanks for reviewing, this is very helpful!

Nir

--0000000000006feebe05ec43f44d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Wed, Oct 26, 2022 at 4:00 PM Hanna Rei=
tz &lt;<a href=3D"mailto:hreitz@redhat.com" target=3D"_blank">hreitz@redhat=
.com</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">On 01.09.22 16:32, Nir Soffer wrote:<br>
&gt; The checksum command compute a checksum for disk image content using t=
he<br>
&gt; blkhash library[1]. The blkhash library is not packaged yet, but it is=
<br>
&gt; available via copr[2].<br>
&gt;<br>
&gt; Example run:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 $ ./qemu-img checksum -p fedora-35.qcow2<br>
&gt;=C2=A0 =C2=A0 =C2=A0 6e5c00c995056319d52395f8d91c7f84725ae3da69ffcba4de=
4c7d22cff713a5=C2=A0 fedora-35.qcow2<br>
&gt;<br>
&gt; The block checksum is constructed by splitting the image to fixed size=
d<br>
&gt; blocks and computing a digest of every block. The image checksum is th=
e<br>
&gt; digest of the all block digests.<br>
&gt;<br>
&gt; The checksum uses internally the &quot;sha256&quot; algorithm but it c=
annot be<br>
&gt; compared with checksums created by other tools such as `sha256sum`.<br=
>
&gt;<br>
&gt; The blkhash library supports sparse images, zero detection, and<br>
&gt; optimizes zero block hashing (they are practically free). The library<=
br>
&gt; uses multiple threads to speed up the computation.<br>
&gt;<br>
&gt; Comparing to `sha256sum`, `qemu-img checksum` is 3.5-4800[3] times<br>
&gt; faster, depending on the amount of data in the image:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 $ ./qemu-img info /scratch/50p.raw<br>
&gt;=C2=A0 =C2=A0 =C2=A0 file format: raw<br>
&gt;=C2=A0 =C2=A0 =C2=A0 virtual size: 6 GiB (6442450944 bytes)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 disk size: 2.91 GiB<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 $ hyperfine -w2 -r5 -p &quot;sleep 1&quot; &quot;.=
/qemu-img checksum /scratch/50p.raw&quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;=
sha256sum /scratch/50p.raw&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Benchmark 1: ./qemu-img checksum /scratch/50p.raw<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 Time (mean =C2=B1 =CF=83):=C2=A0 =C2=A0 =C2=
=A0 1.849 s =C2=B1=C2=A0 0.037 s=C2=A0 =C2=A0 [User: 7.764 s, System: 0.962=
 s]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 Range (min =E2=80=A6 max):=C2=A0 =C2=A0 1.8=
13 s =E2=80=A6=C2=A0 1.908 s=C2=A0 =C2=A0 5 runs<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Benchmark 2: sha256sum /scratch/50p.raw<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 Time (mean =C2=B1 =CF=83):=C2=A0 =C2=A0 =C2=
=A014.585 s =C2=B1=C2=A0 0.072 s=C2=A0 =C2=A0 [User: 13.537 s, System: 1.00=
3 s]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 Range (min =E2=80=A6 max):=C2=A0 =C2=A014.5=
01 s =E2=80=A6 14.697 s=C2=A0 =C2=A0 5 runs<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Summary<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;./qemu-img checksum /scratch/50p.raw&#=
39; ran<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 7.89 =C2=B1 0.16 times faster than &=
#39;sha256sum /scratch/50p.raw&#39;<br>
&gt;<br>
&gt; The new command is available only when `blkhash` is available during<b=
r>
&gt; build. To test the new command please install the `blkhash-devel`<br>
&gt; package:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 $ dnf copr enable nsoffer/blkhash<br>
&gt;=C2=A0 =C2=A0 =C2=A0 $ sudo dnf install blkhash-devel<br>
&gt;<br>
&gt; [1] <a href=3D"https://gitlab.com/nirs/blkhash" rel=3D"noreferrer" tar=
get=3D"_blank">https://gitlab.com/nirs/blkhash</a><br>
&gt; [2] <a href=3D"https://copr.fedorainfracloud.org/coprs/nsoffer/blkhash=
/" rel=3D"noreferrer" target=3D"_blank">https://copr.fedorainfracloud.org/c=
oprs/nsoffer/blkhash/</a><br>
&gt; [3] Computing checksum for 8T empty image: qemu-img checksum: 3.7s,<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 sha256sum (estimate): 17,749s<br>
&gt;<br>
&gt; Signed-off-by: Nir Soffer &lt;<a href=3D"mailto:nsoffer@redhat.com" ta=
rget=3D"_blank">nsoffer@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0docs/tools/qemu-img.rst |=C2=A0 22 +++++<br>
&gt;=C2=A0 =C2=A0meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 10 ++-<br>
&gt;=C2=A0 =C2=A0meson_options.txt=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0=
2 +<br>
&gt;=C2=A0 =C2=A0qemu-img-cmds.hx=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0=
8 ++<br>
&gt;=C2=A0 =C2=A0qemu-img.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 | 191 ++++++++++++++++++++++++++++++++++++++++<br>
&gt;=C2=A0 =C2=A05 files changed, 232 insertions(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/docs/tools/qemu-img.rst b/docs/tools/qemu-img.rst<br>
&gt; index 85a6e05b35..8be9c45cbf 100644<br>
&gt; --- a/docs/tools/qemu-img.rst<br>
&gt; +++ b/docs/tools/qemu-img.rst<br>
&gt; @@ -347,20 +347,42 @@ Command description:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Check completed, image is corrupted<br>
&gt;=C2=A0 =C2=A0 =C2=A03<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Check completed, image has leaked clusters, =
but is not corrupted<br>
&gt;=C2=A0 =C2=A0 =C2=A063<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Checks are not supported by the image format=
<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0If ``-r`` is specified, exit codes representing the=
 image state refer to the<br>
&gt;=C2=A0 =C2=A0 =C2=A0state after (the attempt at) repairing it. That is,=
 a successful ``-r all``<br>
&gt;=C2=A0 =C2=A0 =C2=A0will yield the exit code 0, independently of the im=
age state before.<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +.. option:: checksum [--object OBJECTDEF] [--image-opts] [-f FMT] [-T=
 SRC_CACHE] [-p] FILENAME<br>
&gt; +<br>
&gt; +=C2=A0 Print a checksum for image *FILENAME* guest visible content.<b=
r>
<br>
Why not say which kind of checksum it is?<br></blockquote><div><br></div><d=
iv>Do you mean the algorithm used? This may be confusing, for example we wr=
ite</div><div><br></div><div>=C2=A0 =C2=A0Print a sha256 checksum ...</div>=
<div><br></div><div>User will expect to get the same result from &quot;sha2=
56sum disk.img&quot;. How about</div><div><br></div><div>=C2=A0 =C2=A0Print=
 a blkhash checksum ...</div><div><br></div><div>And add a link to the blkh=
ash project?</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 Images with<br>
&gt; +=C2=A0 different format or settings wil have the same checksum.<br>
<br>
s/wil/will/<br></blockquote><div><br></div><div>Fixing</div><div>=C2=A0</di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; +<br>
&gt; +=C2=A0 The format is probed unless you specify it by ``-f``.<br>
&gt; +<br>
&gt; +=C2=A0 The checksum is computed for guest visible content. Allocated =
areas full of<br>
&gt; +=C2=A0 zeroes, zero clusters, and unallocated areas are read as zeros=
 so they will<br>
&gt; +=C2=A0 have the same checksum. Images with single or multiple files o=
r backing files<br>
&gt; +=C2=A0 will have the same checksums if the guest will see the same co=
ntent when<br>
&gt; +=C2=A0 reading the image.<br>
&gt; +<br>
&gt; +=C2=A0 Image metadata that is not visible to the guest such as dirty =
bitmaps does<br>
&gt; +=C2=A0 not affect the checksum.<br>
&gt; +<br>
&gt; +=C2=A0 Computing a checksum requires a read-only image. You cannot co=
mpute a<br>
&gt; +=C2=A0 checksum of an active image used by a guest,<br>
<br>
Makes me ask: Why not?=C2=A0 Other subcommands have the -U flag for this.<b=
r></blockquote><div><br></div><div>The text is not precise enough, the issu=
e is not active image but having a read only</div><div>image.</div><div><br=
></div><div>What we really want is to take a shared read lock on the image =
when opening it to ensure</div><div>that qemu or another instance of qemu-i=
mg is not holding a write lock and cannot upgrade</div><div>a read lock to =
write lock on this image.</div><div><br></div><div>If the image can be chan=
ged while we read from it there is no point in computing</div><div>a checks=
um.</div><div><br></div><div>If the -U/--force-share flag has these semanti=
cs we can add it, but based on testing it</div><div>works for images open f=
or writing (e.g. qemu-img info, qemu-img measure).</div><div>=C2=A0</div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 but you can compute a checksum<br>
&gt; +=C2=A0 of a guest during pull mode incremental backup using NBD URL.<=
br>
&gt; +<br>
&gt; +=C2=A0 The checksum is not compatible with other tools such as *sha25=
6sum*.<br>
<br>
Why not?=C2=A0 I can see it differs even for raw images, but why?=C2=A0 I w=
ould <br>
have very much assumed that this gives me exactly what sha256sum in the <br=
>
guest on the guest device would yield.</blockquote><div><br></div><div>The =
blkhash is a construction based on other cryptographic hash functions (e.g.=
 sha256).</div><div>The way the hash is constructed is explained here:</div=
><div><a href=3D"https://gitlab.com/nirs/blkhash/-/blob/master/blkhash.py#L=
52" target=3D"_blank">https://gitlab.com/nirs/blkhash/-/blob/master/blkhash=
.py#L52</a></div><div><br></div><div>We can provide a very slow version usi=
ng a single thread and no zero optimization</div><div>that will create the =
same hash as sha256sum for raw image. I don&#39;t think this is very</div><=
div>interesting since it is not practical for large images. If we want some=
thing like this,</div><div>we can add it later when we add an option to con=
figure the algorithm.</div><div><br></div><div>We can also start with a slo=
w version using available hash function and enable</div><div>blkhash only i=
f the library is available in build time.</div><div><br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">
[...]<br>
<br>
&gt; diff --git a/qemu-img.c b/qemu-img.c<br>
&gt; index 7d4b33b3da..7edcfe4bc8 100644<br>
&gt; --- a/qemu-img.c<br>
&gt; +++ b/qemu-img.c<br>
&gt; @@ -17,20 +17,21 @@<br>
&gt;=C2=A0 =C2=A0 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF=
 MERCHANTABILITY,<br>
&gt;=C2=A0 =C2=A0 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. I=
N NO EVENT SHALL<br>
&gt;=C2=A0 =C2=A0 * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAI=
M, DAMAGES OR OTHER<br>
&gt;=C2=A0 =C2=A0 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OT=
HERWISE, ARISING FROM,<br>
&gt;=C2=A0 =C2=A0 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR=
 OTHER DEALINGS IN<br>
&gt;=C2=A0 =C2=A0 * THE SOFTWARE.<br>
&gt;=C2=A0 =C2=A0 */<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0#include &quot;qemu/osdep.h&quot;<br>
&gt;=C2=A0 =C2=A0#include &lt;getopt.h&gt;<br>
&gt; +#include &lt;blkhash.h&gt;<br>
<br>
This must be guarded by CONFIG_BLKHASH.<br></blockquote><div><br></div><div=
>Right</div><div>=C2=A0</div><div>[...]=C2=A0</div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">
&gt; +#ifdef CONFIG_BLKHASH<br>
&gt; +/*<br>
&gt; + * Compute image checksum.<br>
&gt; + */<br>
&gt; +static int img_checksum(int argc, char **argv)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 const char *digest_name =3D &quot;sha256&quot;;<br>
<br>
Why don=E2=80=99t we make this configurable?<br></blockquote><div><br></div=
><div>We can, but this is not easy:</div><div>- which hash functions should=
 be supported?</div><div>- how to encode the algorithm used in the hash fun=
ction?</div><div><br></div><div>The blksum=C2=A0tool (part of blkhash) has =
a --digest and --list-digests options and</div><div>can use any hash functi=
on supported by openssl. Currently it does not include</div><div>the algori=
thm, in the result, so the user has to know 2 values to compare hashes</div=
><div>of different images.</div><div><br></div><div>If we don&#39;t support=
 configuration, all these issues are gone, and the tool is</div><div>easier=
 and safer to use.</div><div><br></div><div>If we want to make this configu=
rable, I think we need to include the algorithm=C2=A0</div><div>in the resu=
lt, something like:</div><div><br></div><div>=C2=A0 =C2=A0 $ qemu-img check=
sum disk.img</div><div>=C2=A0 =C2=A0 blk-sha256:9b3d2f329b8e1a3a10ac623efa1=
63c12e953dbb5192825b4772dcf0f8905e1b1=C2=A0 disk.img</div><div><br></div><d=
iv><div>=C2=A0 =C2=A0 $ qemu-img checksum --digest sha1 disk.img</div><div>=
=C2=A0 =C2=A0 blk-sha1:6d7e6d55bed36e733bf50127d151f8af7bb5077f=C2=A0 disk.=
img</div><div><br></div></div><div>Or if we want to support standard checks=
ums, maybe:</div><div><br></div><div><div>=C2=A0 =C2=A0 $ qemu-img checksum=
 --digest sha256 disk.img</div><div>=C2=A0 =C2=A0 sha256:49bc20df15e412a644=
72421e13fe86ff1c5165e18b2afccf160d4dc19fe68a14=C2=A0 disk.img</div><div><br=
></div></div><div><div>=C2=A0 =C2=A0 $ qemu-img checksum --digest blk-sha25=
6 disk.img</div><div>=C2=A0 =C2=A0 blk-sha256:9b3d2f329b8e1a3a10ac623efa163=
c12e953dbb5192825b4772dcf0f8905e1b1=C2=A0 disk.img</div><div><br></div></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; +=C2=A0 =C2=A0 const size_t block_size =3D 64 * KiB;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 const char *format =3D NULL;<br>
&gt; +=C2=A0 =C2=A0 const char *cache =3D BDRV_DEFAULT_CACHE;<br>
&gt; +=C2=A0 =C2=A0 const char *filename;<br>
&gt; +=C2=A0 =C2=A0 BlockBackend *blk;<br>
&gt; +=C2=A0 =C2=A0 BlockDriverState *bs;<br>
&gt; +=C2=A0 =C2=A0 uint8_t *buf =3D NULL;<br>
&gt; +=C2=A0 =C2=A0 int64_t pnum;<br>
&gt; +=C2=A0 =C2=A0 bool progress =3D false;<br>
&gt; +=C2=A0 =C2=A0 int flags =3D 0;<br>
&gt; +=C2=A0 =C2=A0 bool writethrough;<br>
&gt; +=C2=A0 =C2=A0 int64_t total_size;<br>
&gt; +=C2=A0 =C2=A0 int64_t offset =3D 0;<br>
&gt; +=C2=A0 =C2=A0 int c;<br>
&gt; +=C2=A0 =C2=A0 bool image_opts =3D false;<br>
&gt; +=C2=A0 =C2=A0 struct blkhash *h =3D NULL;<br>
&gt; +=C2=A0 =C2=A0 unsigned char digest[64];<br>
&gt; +=C2=A0 =C2=A0 unsigned int digest_len;<br>
&gt; +=C2=A0 =C2=A0 int ret =3D 1;<br>
&gt; +=C2=A0 =C2=A0 int err;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 for (;;) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 static const struct option long_options[]=
 =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {&quot;help&quot;, no_argum=
ent, 0, &#39;h&#39;},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {&quot;object&quot;, requir=
ed_argument, 0, OPTION_OBJECT},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {&quot;image-opts&quot;, no=
_argument, 0, OPTION_IMAGE_OPTS},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {0, 0, 0, 0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 c =3D getopt_long(argc, argv, &quot;:hf:T=
:p&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 long_options, NULL);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (c =3D=3D -1) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 switch (c) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 case &#39;:&#39;:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 missing_argument(argv[optin=
d - 1]);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 case &#39;?&#39;:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unrecognized_option(argv[op=
tind - 1]);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 case &#39;h&#39;:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 help();<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 case &#39;f&#39;:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 format =3D optarg;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 case &#39;T&#39;:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cache =3D optarg;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 case &#39;p&#39;:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 progress =3D true;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 case OPTION_OBJECT:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Error *local_=
err =3D NULL;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!user_cre=
atable_add_from_str(optarg, &amp;local_err)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 if (local_err) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 error_report_err(local_err);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 exit(2);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 } else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 /* Help was printed */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 exit(EXIT_SUCCESS);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
How about simply using user_creatable_process_cmdline(optarg)? (which <br>
most other subcommands use)<br>
<br>
(I believe img_compare() has to have its own code, because exit code 1 <br>
is reserved there.=C2=A0 But that isn=E2=80=99t a concern here.)<br></block=
quote><div><br></div><div>Sure I can use it, I did not know about this.</di=
v><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 case OPTION_IMAGE_OPTS:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 image_opts =3D true;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (optind !=3D argc - 1) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_exit(&quot;Expecting image file nam=
e&quot;);<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 filename =3D argv[optind++];<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 err =3D bdrv_parse_cache_mode(cache, &amp;flags, &amp;w=
ritethrough);<br>
&gt; +=C2=A0 =C2=A0 if (err &lt; 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_report(&quot;Invalid source cache o=
ption: %s&quot;, cache);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return ret;<br>
<br>
Personally, I=E2=80=99m not too big of a fan of using `ret` here, because i=
t was <br>
set so far above.=C2=A0 Why not just `return 1;`?<br>
<br>
(Same in other error cases below.)<br></blockquote><div><br></div><div>ret =
is set at the start to error value (1) and modified to 0 only if everything=
</div><div>completed successfully.=C2=A0 This way we can return the same va=
lue in all</div><div>the exit paths.</div><div><br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 blk =3D img_open(image_opts, filename, format, flags, w=
ritethrough, false,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
false);<br>
&gt; +=C2=A0 =C2=A0 if (!blk) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return ret;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /* Initialize before using goto out. */<br>
&gt; +=C2=A0 =C2=A0 qemu_progress_init(progress, 2.0);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 bs =3D blk_bs(blk);<br>
&gt; +=C2=A0 =C2=A0 buf =3D blk_blockalign(blk, IO_BUF_SIZE);<br>
<br>
It looks like this macro is kind of specific to `img_compare()`, and is <br=
>
currently somewhere in the middle of its code.=C2=A0 I don=E2=80=99t mind r=
eusing it <br>
here, but if so, we might want to move it up to the top of this file, <br>
and add a comment that this is the buffer size used for commands like <br>
compare or checksum.<br></blockquote><div><br></div><div>IO_BUF_SIZE is als=
o used by qemu-img convert. In the next commits</div><div>I&#39;m adding an=
other macro for the checksum code, so this change is not</div><div>needed, =
but I can move the macro to the top of the file to make it clear</div><div>=
that this is a default for many commands, and not specific qemu-img compare=
</div><div>default.</div><div>=C2=A0<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">
<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 total_size =3D blk_getlength(blk);<br>
&gt; +=C2=A0 =C2=A0 if (total_size &lt; 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_report(&quot;Can&#39;t get size of =
%s: %s&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0filename, strerror(-total_size));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out;<br>
<br>
I suggest adding `ret =3D 1;` before such a `goto out;` (not just here), <b=
r>
so it is clear exactly what value we are going to return (it isn=E2=80=99t =
<br>
trivial to track that `ret` isn=E2=80=99t used for anything else). But I ca=
n see <br>
that it=E2=80=99s extra code, so maybe you don=E2=80=99t like that.<br>
<br>
If we keep this as-is, perhaps we could rename `ret` to something more <br>
explicit like `exit_status`, though?=C2=A0 That way, it=E2=80=99s pretty cl=
ear that <br>
we won=E2=80=99t accidentally reuse it for anything else.=C2=A0 (I know thi=
s isn=E2=80=99t <br>
the first subcommand to use `ret` for the process exist status, but I <br>
don=E2=80=99t think those other subcommands are great role models in this r=
egard.)<br></blockquote><div><br></div><div>exit_status is much better!</di=
v><div><br></div><div>I&#39;ll rename ret to exit_status in the next versio=
n, and keep the way it is handled</div><div>(initialized to 1, set to 0 on =
success).</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">
<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 h =3D blkhash_new(block_size, digest_name);<br>
<br>
Should we somehow make sure that IO_BUF_SIZE is a multiple of <br>
block_size?=C2=A0 I mean, it is, but it isn=E2=80=99t obvious at least, and=
 I guess <br>
maybe at some point someone might want to make block_size a parameter.=C2=
=A0 <br>
Would a static assertion work?=C2=A0 (Would stop working once someone decid=
e <br>
to make block_size a parameter, which is good, because it draws attention.)=
</blockquote><div><br></div><div>Using a multiple of block_size is no requi=
red but it can improve performance by</div><div>minimizing copies in the pe=
nding buffer managed by blkhash.</div><div><br></div><div>Making block_size=
 configurable is not good way, since it changes the value of the</div><div>=
hash. In we do in this way we maybe wan to encode the block size in the res=
ult</div><div>so someone can restore the arguments for comparing an image a=
gainst a hash:</div><div><br></div><div>=C2=A0 =C2=A0 blk-sha256/64k:9b3d2f=
329b8e1a3a10ac623efa163c12e953dbb5192825b4772dcf0f8905e1b1</div><div><br></=
div><div>This starts to look too complicated to me. In blksum I do not allo=
w changing the block size.</div><div><br></div><div>I&#39;ll add an assert =
in the next version to keeps this default optimal.</div><div>=C2=A0</div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">
&gt; +=C2=A0 =C2=A0 if (!h) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_report(&quot;Can&#39;t create blkha=
sh: %s&quot;, strerror(errno));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 qemu_progress_print(0, 100);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 while (offset &lt; total_size) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 int status;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 int64_t chunk;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 status =3D bdrv_block_status_above(bs, NU=
LL, offset,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0total_size - offset, &amp;pnum, NULL,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0NULL);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (status &lt; 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_report(&quot;Error ch=
ecking status at offset %&quot; PRId64 &quot; for %s&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0offset, filename);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 assert(pnum);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 chunk =3D pnum;<br>
<br>
Can=E2=80=99t we drop `pnum` and replace it by `chunk` in all cases?<br></b=
lockquote><div><br></div><div>I did this in the next commit, I can update i=
t in this commit.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">
<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (status &amp; BDRV_BLOCK_ZERO) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 chunk =3D MIN(chunk, SIZE_M=
AX);<br>
<br>
Itches me a bit to propose rounding SIZE_MAX down to block_size, but I <br>
guess given the magnitude of SIZE_MAX on 64-bit systems, it doesn=E2=80=99t=
 matter.<br></blockquote><div><br></div><div>We round down to SIZE_MAX, sin=
ce blkash_zero() accept size_t.</div><div><br></div><div>I can also change =
blkhash to use int64_t instead. Testing show that 16g is a good</div><div>v=
alue to ensure timely progress updates.</div><div>=C2=A0</div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 err =3D blkhash_zero(h, chu=
nk);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (err) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_report(=
&quot;Error zeroing hash at offset %&quot; PRId64<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot; of %s: %s&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0offset, filename, strerror(err));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 chunk =3D MIN(chunk, IO_BUF=
_SIZE);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 err =3D blk_pread(blk, offs=
et, chunk, buf, 0);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (err &lt; 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_report(=
&quot;Error reading at offset %&quot; PRId64 &quot; of %s: %s&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0offset, filename, strerror(-err));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 err =3D blkhash_update(h, b=
uf, chunk);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (err) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_report(=
&quot;Error updating hash at offset %&quot; PRId64<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot; of %s: %s&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0offset, filename, strerror(err));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 offset +=3D chunk;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_progress_print(((float) chunk / tota=
l_size) * 100, 100);<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 err =3D blkhash_final(h, digest, &amp;digest_len);<br>
<br>
How does this verify that `digest` is sufficiently large?<br>
<br>
I mean, it is, given that we only have sha256 now.=C2=A0 But it still seems=
 <br>
rather dangerous to me.<br></blockquote><div><br></div><div>In blksum I&#39=
;m using=C2=A0EVP_MAX_MD_SIZE (from &lt;openssl/evp.h&gt;) which is 64</div=
><div>(e.g. sha512).</div><div><br></div><div>I&#39;ll add a similar macro =
in blkhash.h so users do not have to assume</div><div>anything.</div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; +=C2=A0 =C2=A0 if (err) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_report(&quot;Error finalizing hash =
of %s: %s&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0filename, strerror(err));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 for (unsigned i =3D 0; i &lt; digest_len; i++) {<br>
<br>
I always such declarations weren=E2=80=99t allowed in qemu, but this isn=E2=
=80=99t the <br>
first place, and I don=E2=80=99t mind.=C2=A0 Good to know. :)<br></blockquo=
te><div><br></div><div>meson.build uses:</div><div><br></div><div>=C2=A0 =
=C2=A0 &#39;c_std=3Dgnu99&#39;,</div><div><br></div><div>So the more modern=
 and safer way should be allowed.</div><div><br></div><div>Thanks for revie=
wing, this is very helpful!</div><div><br></div><div>Nir</div></div></div>

--0000000000006feebe05ec43f44d--


