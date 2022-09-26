Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 660955EABE2
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 18:03:05 +0200 (CEST)
Received: from localhost ([::1]:34712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocqZT-0006QK-W9
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 12:03:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ocq1x-0003CO-N4; Mon, 26 Sep 2022 11:28:25 -0400
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f]:46868)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ocq1u-0005PG-2x; Mon, 26 Sep 2022 11:28:23 -0400
Received: by mail-yb1-xb2f.google.com with SMTP id e81so8786218ybb.13;
 Mon, 26 Sep 2022 08:28:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=yM6c9d0obzWHWMQ4T5X81ECcL0HoO0jBdwedhP1V7Lc=;
 b=Zon/SE5sG9e+wphTr0+nKNSvZGt79hZLw2flpbIQSJmaYTXGcFWlMsGixUY1U36AHz
 HFAMCpS0ltn5/SV1F/Wb2YM3aAYcPjjqHPiIuPWi+SNLYiqfJ3UqvQ1lHFqj0Zsf9tLf
 wmM4YxzkRvIOuxUPIgwVaGHYiV5b+qGFhJiKWgvr7uN+iDiGrYd2EunziMP5oIXl5hBN
 ftSSMJKM6dH20aTVC3/FEVZ/u8IbkOMmAyFmvuVeIujA5dSTyJrC5nlnUQVnwMgQ9j6j
 2XCMBKMUwd5hvGY19y6fpMQQa/Pakj76wjFNI+W+dx2lcr75x57qD+wlusJDoHiTN0vL
 OP1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=yM6c9d0obzWHWMQ4T5X81ECcL0HoO0jBdwedhP1V7Lc=;
 b=QQBJ2QXlt3/ro2M6eLDP6pmP/fydX8Q5dMXun8G4ohpbSBYOxx6mmIA1TsBOlqD1j4
 Mk4Q4Wbo5q026ZrIFPZS29W8oTufgfn8xVvKa6m+V/mxbvvmSC/PsroxcujeSNFrryCN
 mobHyd19ttsHTg/r8Q6QIMBKP7GP8JnYbBJD6kZck45FrZqPoOygTkFDKf7OdK3JoZxi
 Cym/BKHAEC89sF6ovnutA++5F7G39+4vjIFPXHhU2ryptkitpyLn80JkN3uW5IoYiXbu
 6lK4lE2Vy4EsvffiXh9v6wp4HXH/v6KFtoLa+wl98SGC/el5N0Ou3xrKxsUKXOaKqiNS
 76Ew==
X-Gm-Message-State: ACrzQf2LJCobrmLyyYz0uU/TltBRf5DmeiLWZFQJksd9Z0lEUlUS0Jq2
 PhrL/PSWLuX1XEM33SbvGmYX1UEyl6/o/9DkS5VTX6ba
X-Google-Smtp-Source: AMsMyM43+P5dzm1KW54UrpGo6SV0MWWaW4qOead+i1gX8CXVOmRtlhc7Cni+XHoAsu5LaRmESoZ/EDmox4dAgze+kZs=
X-Received: by 2002:a25:4107:0:b0:6a9:332b:dec4 with SMTP id
 o7-20020a254107000000b006a9332bdec4mr19533307yba.367.1664206099692; Mon, 26
 Sep 2022 08:28:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220924114544.1906498-1-bmeng.cn@gmail.com>
 <87edvya1ez.fsf@pond.sub.org>
In-Reply-To: <87edvya1ez.fsf@pond.sub.org>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 26 Sep 2022 23:28:08 +0800
Message-ID: <CAEUhbmX61MEXRv0XMXAVnuuVmq841i1_z2U5bR8hS39-cS7cKg@mail.gmail.com>
Subject: Re: [PATCH v2] block: Refactor get_tmp_filename()
To: Markus Armbruster <armbru@redhat.com>
Cc: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Bin Meng <bin.meng@windriver.com>, Hanna Reitz <hreitz@redhat.com>, 
 Kevin Wolf <kwolf@redhat.com>, Qemu-block <qemu-block@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2f;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Mon, Sep 26, 2022 at 6:13 PM Markus Armbruster <armbru@redhat.com> wrote:
>
> Bin Meng <bmeng.cn@gmail.com> writes:
>
> > From: Bin Meng <bin.meng@windriver.com>
> >
> > At present there are two callers of get_tmp_filename() and they are
> > inconsistent.
> >
> > One does:
> >
> >     /* TODO: extra byte is a hack to ensure MAX_PATH space on Windows. */
> >     char *tmp_filename = g_malloc0(PATH_MAX + 1);
> >     ...
> >     ret = get_tmp_filename(tmp_filename, PATH_MAX + 1);
> >
> > while the other does:
> >
> >     s->qcow_filename = g_malloc(PATH_MAX);
> >     ret = get_tmp_filename(s->qcow_filename, PATH_MAX);
> >
> > As we can see different 'size' arguments are passed. There are also
> > platform specific implementations inside the function, and this use
> > of snprintf is really undesirable.
> >
> > Refactor this routine by changing its signature to:
> >
> >     char *get_tmp_filename(void)
> >
> > and use g_file_open_tmp() for a consistent implementation.
> >
> > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> > ---
> >
> > Changes in v2:
> > - Use g_autofree and g_steal_pointer
> >
> >  include/block/block_int-common.h |  2 +-
> >  block.c                          | 42 ++++++++++----------------------
> >  block/vvfat.c                    |  8 +++---
> >  3 files changed, 18 insertions(+), 34 deletions(-)
> >
> > diff --git a/include/block/block_int-common.h b/include/block/block_int-common.h
> > index 8947abab76..ea69a9349c 100644
> > --- a/include/block/block_int-common.h
> > +++ b/include/block/block_int-common.h
> > @@ -1230,7 +1230,7 @@ static inline BlockDriverState *child_bs(BdrvChild *child)
> >  }
> >
> >  int bdrv_check_request(int64_t offset, int64_t bytes, Error **errp);
> > -int get_tmp_filename(char *filename, int size);
> > +char *get_tmp_filename(void);
> >  void bdrv_parse_filename_strip_prefix(const char *filename, const char *prefix,
> >                                        QDict *options);
> >
> > diff --git a/block.c b/block.c
> > index bc85f46eed..4e7a795566 100644
> > --- a/block.c
> > +++ b/block.c
> > @@ -860,38 +860,23 @@ int bdrv_probe_geometry(BlockDriverState *bs, HDGeometry *geo)
> >
> >  /*
> >   * Create a uniquely-named empty temporary file.
> > - * Return 0 upon success, otherwise a negative errno value.
> > + * Return the actual name used upon success, otherwise NULL.
> > + * The called function is responsible for freeing it.
> >   */
> > -int get_tmp_filename(char *filename, int size)
> > +char *get_tmp_filename(void)
> >  {
> > -#ifdef _WIN32
> > -    char temp_dir[MAX_PATH];
> > -    /* GetTempFileName requires that its output buffer (4th param)
> > -       have length MAX_PATH or greater.  */
> > -    assert(size >= MAX_PATH);
> > -    return (GetTempPath(MAX_PATH, temp_dir)
> > -            && GetTempFileName(temp_dir, "qem", 0, filename)
> > -            ? 0 : -GetLastError());
> > -#else
> > +    g_autofree char *filename = NULL;
> >      int fd;
> > -    const char *tmpdir;
> > -    tmpdir = getenv("TMPDIR");
> > -    if (!tmpdir) {
> > -        tmpdir = "/var/tmp";
> > -    }
> > -    if (snprintf(filename, size, "%s/vl.XXXXXX", tmpdir) >= size) {
> > -        return -EOVERFLOW;
> > -    }
> > -    fd = mkstemp(filename);
> > +
> > +    fd = g_file_open_tmp("vl.XXXXXX", &filename, NULL);
> >      if (fd < 0) {
> > -        return -errno;
> > +        return NULL;
> >      }
> >      if (close(fd) != 0) {
> >          unlink(filename);
> > -        return -errno;
> > +        return NULL;
> >      }
> > -    return 0;
> > -#endif
> > +    return g_steal_pointer(&filename);
> >  }
>
> Oh my, what a lovely mess you're messing with!
>
> The function creates a temporary *file*, not just a filename.  Makes
> sense, as creating a unique filename is inherently racy.  The contract
> is clear enough ("Create a uniquely-named empty temporary file"), but
> the function name is actively misleading.

Agreed that the name is misleading.

> Of course, creating a temporary file for the caller to (re)open is also
> racy.  By the time the caller gets around to it, the filename could name
> anything.  Return an open file file descriptor is a better idea.  It's
> basically g_file_open_tmp().  Could we rework the two users of
> get_tmp_filename() accept a file descriptor?

I looked at the 2 callers, and it looks like we need to do more than
these 2 callers to teach them to accept a file descriptor. :(

>
> Anyway, code after the patch:
>
>    /*
>     * Create a uniquely-named empty temporary file.
>     * Return the actual name used upon success, otherwise NULL.
>     * The called function is responsible for freeing it.
>     */
>    char *get_tmp_filename(void)
>    {
>        g_autofree char *filename = NULL;
>        int fd;
>
>        fd = g_file_open_tmp("vl.XXXXXX", &filename, NULL);
>        if (fd < 0) {
>
> As Philippe wrote, this throws away possibly useful error information.
>
>            return NULL;
>        }
>        if (close(fd) != 0) {
>            unlink(filename);
>            return NULL;
>        }
>        return g_steal_pointer(&filename);
>    }
>
> Other than that, it's an improvement within the limits of a flawed
> interface.
>
> [...]
>

Regards,
Bin

