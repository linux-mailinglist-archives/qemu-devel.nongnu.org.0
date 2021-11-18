Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE19B455EAE
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Nov 2021 15:52:44 +0100 (CET)
Received: from localhost ([::1]:41856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnimJ-0005rg-RT
	for lists+qemu-devel@lfdr.de; Thu, 18 Nov 2021 09:52:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mnikr-0003Zy-SI
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 09:51:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45380)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mniko-0006mB-Pj
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 09:51:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637247070;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eCMo10FUp5Sk/Q8OOd97ooj8iLtVQeU94nF/QiFXPQM=;
 b=Sz5ldsCnIeyJrQ2+xtoyzgG9jUIXz/J70QMj8O3/ZEpnluuIH7bnH6FzRQ0cceQ4wwD7Em
 eBhleKC15pFopuPTTh5xikTzVQAM7/G+mSvTHvmGv9CBSFNdWxEOULjDueORxgeOSteHKb
 DzZxLnx6adHvSzVfaYf6bRKJCs8D/08=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-227-t4zPoUbIMZ-l5LCuKCWUKw-1; Thu, 18 Nov 2021 09:51:06 -0500
X-MC-Unique: t4zPoUbIMZ-l5LCuKCWUKw-1
Received: by mail-wm1-f72.google.com with SMTP id
 l6-20020a05600c4f0600b0033321934a39so3215245wmq.9
 for <qemu-devel@nongnu.org>; Thu, 18 Nov 2021 06:51:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:cc:from:in-reply-to
 :content-transfer-encoding;
 bh=eCMo10FUp5Sk/Q8OOd97ooj8iLtVQeU94nF/QiFXPQM=;
 b=yKJmmhXVgTZRfsv6SxoYQzOcvgY2a1UbaTLj33sd+jxPy1UzvmHyWQJrkvhXrbteFO
 DcKiEolpMn7gjVJ7gisT+YtaYclKOqzeO+iF30R4QZ3M1fhRPU1dDbyAazSnNqHYcQlg
 c6mEjEO7z7U3z6vBS03m3f94EC+6PFCma5XpKT8cYtUl2vgxHSzD6GHYaBpB3spk2ymV
 uu60LiPjD2jXWfb0zlMUeW4eWQkt9MADN/zwIRWZ+arQyyCMQci69EBJWJ3j6RvLX45E
 bEeSgi1ViynJjiO/7cygjI+4bvVkCBU9LN6+S5/eiNs5eFpYbw6c4uKki2guEdISC1Y7
 Cpsg==
X-Gm-Message-State: AOAM533T8d2alIe/p4vip9nGmr55cXxgmjnW/uI2Hg3OZVpdOftoAQ8T
 L+pa5EzYinOgInM5NmvlAyM0av9KqrpEJPUZm2xj3M5WwKg3VyvZNzqEu657TULOctEGTEMY+NL
 rzClY8gPI8Iyi2Nk=
X-Received: by 2002:adf:a194:: with SMTP id u20mr31197190wru.153.1637247065419; 
 Thu, 18 Nov 2021 06:51:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyQMrc+clZEQj/tjQxiGuJ+EBDR4X20I3QJwM9EuT9j+gs9ikQ+3vomKyELCUiHG7brydCoqQ==
X-Received: by 2002:adf:a194:: with SMTP id u20mr31197146wru.153.1637247065067; 
 Thu, 18 Nov 2021 06:51:05 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id d9sm58058wre.52.2021.11.18.06.51.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Nov 2021 06:51:04 -0800 (PST)
Message-ID: <d02640d5-7c6c-f78b-da6a-0cad1d53d80f@redhat.com>
Date: Thu, 18 Nov 2021 15:51:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] block/vvfat.c fix leak when failure occurs
To: Daniella Lee <daniellalee111@gmail.com>
References: <20211116125718.2922980-1-daniellalee111@gmail.com>
 <6077174b-c7e9-99a9-fb03-e0b27e97d39f@redhat.com>
 <CAH1re1FV07jaUF9xQZn-spX0A+rwdebWvm0LXdaAqBWDocvGcw@mail.gmail.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <CAH1re1FV07jaUF9xQZn-spX0A+rwdebWvm0LXdaAqBWDocvGcw@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.084, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18.11.21 10:33, Daniella Lee wrote:
> Thanks for your reply and your suggestion is useful.
> This is my first submission, and I will pay attention to these issues 
> in the future.
> There are many other places you mentioned need to be modified,
> do I need to resubmit the patch, or you want to modify them with other 
> codes?

Hi,

Yes, you should send a v2 that addresses the issues.

As for the suggestions that concern places outside of `vvfat_open()`:  
Most of them need not be your concern if you don’t want them to be, but 
we definitely need to have `s->used_clusters` be allocated with 
`g_malloc0()`, or we can’t free it with `g_free()`.  (We could free it 
with `free()`, but that would be a suboptimal solution...)  So that 
allocation line in `enable_write_target()` should be fixed in v2.  The 
best way to do that would be to do it in an own patch (i.e. patch 1 
changes that allocation, and patch 2 is this patch), but I wouldn’t mind 
it too much if you do both changes in a single patch.

Regarding the other suggestions for other places: It would be nice to 
drop the clean-up path in `enable_write_target()`, but isn’t necessary.  
If you want to do it, you can do it as part of this patch, or on top in 
another patch, but you can also choose just to ignore that bit.  (And 
maybe then I’ll send a patch later.)

The fact that we’re leaking two of these buffers in `vvfat_close()` is 
definitely unrelated to this patch, so that’s also nothing you have to 
care about if you don’t want to.

I hope that made it clear...?  Don’t hesitate to ask more if it didn’t 
(or for any other questions you might have).

Hanna

> On Thu, Nov 18, 2021 at 4:34 PM Hanna Reitz <hreitz@redhat.com> wrote:
>
>     On 16.11.21 13:57, Daniella Lee wrote:
>     > Function vvfat_open called function enable_write_target and
>     init_directories,
>     > and these functions malloc new memory for
>     BDRVVVFATState::qcow_filename,
>     > BDRVVVFATState::used_clusters, and BDRVVVFATState::cluster_buff.
>     >
>     > When the specified folder does not exist ,it may contains memory
>     leak.
>     > After init_directories function is executed, the vvfat_open
>     return -EIO,
>     > and bdrv_open_driver goto label open_failed,
>     > the program use g_free(bs->opaque) to release BDRVVVFATState struct
>     > without members mentioned.
>     >
>     > command line:
>     > qemu-system-x86_64 -hdb <vdisk qcow file>  -usb -device
>     usb-storage,drive=fat16
>     > -drive file=fat:rw:fat-type=16:"<path of a host folder does not
>     exist>",
>     > id=fat16,format=raw,if=none
>     >
>     > enable_write_target called:
>     > (gdb) bt
>     > #0  enable_write_target (bs=0x555556f9f000, errp=0x7fffffffd780)
>     >      at ../block/vvfat.c:3114
>     > #1  vvfat_open (bs=0x555556f9f000, options=0x555556fa45d0,
>     >      flags=155650, errp=0x7fffffffd780) at ../block/vvfat.c:1236
>     > #2  bdrv_open_driver (bs=0x555556f9f000, drv=0x555556c47920
>     <bdrv_vvfat>,
>     >      node_name=0x0, options=0x555556fa45d0, open_flags=155650,
>     >      errp=0x7fffffffd890) at ../block.c:1558
>     > #3  bdrv_open_common (bs=0x555556f9f000, file=0x0,
>     options=0x555556fa45d0,
>     >      errp=0x7fffffffd890) at ../block.c:1852
>     > #4  bdrv_open_inherit (filename=0x555556f73310 "fat:rw:<dirNone>",
>     >      reference=0x0, options=0x555556fa45d0, flags=40962,
>     parent=0x555556f98cd0,
>     >      child_class=0x555556b1d6a0 <child_of_bds>, child_role=19,
>     >      errp=0x7fffffffda90) at ../block.c:3779
>     > #5  bdrv_open_child_bs (filename=0x555556f73310 "fat:rw:<dirNone>",
>     >      options=0x555556f9cfc0, bdref_key=0x555556239bb8 "file",
>     >      parent=0x555556f98cd0, child_class=0x555556b1d6a0
>     <child_of_bds>,
>     >      child_role=19, allow_none=true, errp=0x7fffffffda90) at
>     ../block.c:3419
>     > #6  bdrv_open_inherit (filename=0x555556f73310 "fat:rw:<dirNone>",
>     >      reference=0x0, options=0x555556f9cfc0, flags=8194, parent=0x0,
>     >      child_class=0x0, child_role=0, errp=0x555556c98c40
>     <error_fatal>)
>     >      at ../block.c:3726
>     > #7  bdrv_open (filename=0x555556f73310 "fat:rw:<dirNone>",
>     reference=0x0,
>     >      options=0x555556f757b0, flags=0, errp=0x555556c98c40
>     <error_fatal>)
>     >      at ../block.c:3872
>     > #8  blk_new_open (filename=0x555556f73310 "fat:rw:<dirNone>",
>     reference=0x0,
>     >      options=0x555556f757b0, flags=0, errp=0x555556c98c40
>     <error_fatal>)
>     >      at ../block/block-backend.c:436
>     > #9  blockdev_init (file=0x555556f73310 "fat:rw:<dirNone>",
>     >      bs_opts=0x555556f757b0, errp=0x555556c98c40 <error_fatal>)
>     >      at ../blockdev.c:608
>     > #10 drive_new (all_opts=0x555556d2b700, block_default_type=IF_IDE,
>     >      errp=0x555556c98c40 <error_fatal>) at ../blockdev.c:992
>     > ......
>     >
>     > Signed-off-by: Daniella Lee <daniellalee111@gmail.com>
>     > ---
>     >   block/vvfat.c | 15 +++++++++++++++
>     >   1 file changed, 15 insertions(+)
>
>     Hi,
>
>     Thanks for your patch!  Yes, that makes sense.
>
>     I believe there are some issues that should be addressed, though:
>
>     > diff --git a/block/vvfat.c b/block/vvfat.c
>     > index 05e78e3c27..454a74c5d5 100644
>     > --- a/block/vvfat.c
>     > +++ b/block/vvfat.c
>     > @@ -1280,7 +1280,22 @@ static int vvfat_open(BlockDriverState
>     *bs, QDict *options, int flags,
>     >       qemu_co_mutex_init(&s->lock);
>     >
>     >       ret = 0;
>     > +
>     > +    qemu_opts_del(opts);
>     > +    return ret;
>
>     Optional: I’d drop the `ret = 0;` line and just `return 0;` here.
>
>     >   fail:
>     > +    if(s->qcow_filename) {
>
>     Our coding style requires a space between `if` and the opening
>     parenthesis.
>
>     > +        g_free(s->qcow_filename);
>
>     `g_free()` checks whether the parameter given to it is `NULL`, and if
>     so, performs a no-op.  So checking whether `s->qcow_filename != NULL`
>     before calling `g_free()` is not necessary.
>
>     We have a script under scripts/checkpatch.pl
>     <http://checkpatch.pl> that takes patch files as
>     input and checks whether they conform to our coding style. It’s
>     really
>     helpful, for example in these two cases it does report the issues.
>
>     > +        s->qcow_filename = NULL;
>     > +    }
>     > +    if(s->cluster_buffer) {
>     > +        g_free(s->cluster_buffer);
>     > +        s->cluster_buffer = NULL;
>     > +    }
>     > +    if(s->used_clusters) {
>     > +        g_free(s->used_clusters);
>
>     `s->used_clusters` is allocated with `calloc()`, so it can’t be freed
>     with `g_free()`.  But you’re right, it should be `g_free()`-able,
>     so the
>     fix is to have `enable_write_target()` allocate it with
>     `g_malloc0(size)`.
>
>     (And this made me notice that we free neither `s->used_clusters` nor
>     `s->qcow_filename` in vvfat_close()...  Oops.)
>
>     > +        s->used_clusters = NULL;
>     > +    }
>     >       qemu_opts_del(opts);
>     >       return ret;
>     >   }
>
>     Finally, `enable_write_target()` frees `s->qcow_filename` on error.
>     That seems unnecessary now, though not wrong.  (It’s just weird
>     that it
>     frees that one, but not `s->used_clusters`...)
>
>     Hanna
>


