Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E882C3F28D6
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Aug 2021 11:06:26 +0200 (CEST)
Received: from localhost ([::1]:57630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mH0Tp-0002xM-Tr
	for lists+qemu-devel@lfdr.de; Fri, 20 Aug 2021 05:06:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mH0Qk-0000bO-KB
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 05:03:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46595)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mH0Qe-0006Vu-RO
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 05:03:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629450187;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CrOq51JJF3CXrkVyFgCp0h6fGAqreOIZr6w5OMaxe9k=;
 b=ARtDd04n0Q30IthKgxUwqZMo7N/R9RFKEw/5v3VVBIkerjPlpXppPo5lXGJ4gDatL8Z6XM
 +f9egzThB0DUlnDXgHV7S+wh92aCcXyFed0p/9IumK48ogcJDnvQKsB64wRZdPBYmLPYaV
 B9nWyQjv42AxCx+RyogD97ZyzhAGSO0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-472-OZ7BnLKWPxeZ5PbwBGTB4Q-1; Fri, 20 Aug 2021 05:03:03 -0400
X-MC-Unique: OZ7BnLKWPxeZ5PbwBGTB4Q-1
Received: by mail-wr1-f70.google.com with SMTP id
 v18-20020adfe2920000b029013bbfb19640so2621670wri.17
 for <qemu-devel@nongnu.org>; Fri, 20 Aug 2021 02:03:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=CrOq51JJF3CXrkVyFgCp0h6fGAqreOIZr6w5OMaxe9k=;
 b=SzE2j5g3Kroko5KzE8HWYsShzqVTMpbmvbIlJ6rLfM0jYqHrFbsBTqskNb0fgltQLn
 9mV9jG7bVeYvAwRfXUGOvSNola3NgfLkw39/kLgEJfyLzAp6sd/YIBJ/6a6OT+xMAr6b
 Gw9O996Lz0TAc/HE9qxUwjSxA3tt24NnlEdec5hHiT8F7Ai6a7uZz4aaTyih+loyggmX
 Tdeyezc1nnoSE5CnPj+MLgRXAvjOHFexdWWd2VPcq2Z0aQ2S1eTi92BcP0VQWoLEm1hq
 gEmVlnRIhQkCHJJTC+JVEvPhsNAzvnor4yAeogzkGWfG4IDwEp8i0mMYH3WZpvX0W4Uc
 hTvg==
X-Gm-Message-State: AOAM530K+5dxzDJ2jdf1ccdu2guT9lfkBtaYqwd077z3CZ0fJejNSuV9
 Y6NMdL0PlD8y5+sPUT/DDOkiEr5+t+rcaLLava9zAiMmFXZhPbj8rgi4mkBqhC2CJLzJba6SDYL
 XkwBKlAnjm65PVss=
X-Received: by 2002:adf:f5d2:: with SMTP id k18mr8713409wrp.362.1629450182313; 
 Fri, 20 Aug 2021 02:03:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw65D5hAIe0uJsUn2jI6gOzLAFyIQotU6/OXf3EQdHuL0mBGBl8N9EmSxZVo3yD4akN0EhE7Q==
X-Received: by 2002:adf:f5d2:: with SMTP id k18mr8713332wrp.362.1629450181886; 
 Fri, 20 Aug 2021 02:03:01 -0700 (PDT)
Received: from dresden.str.redhat.com ([2a02:908:1e46:160:b272:8083:d5:bc7d])
 by smtp.gmail.com with ESMTPSA id
 z1sm5426730wrv.22.2021.08.20.02.03.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Aug 2021 02:03:01 -0700 (PDT)
Subject: Re: [qemu-web PATCH] Add a blog post about FUSE block exports
To: Klaus Kiwi <kkiwi@redhat.com>
References: <20210819102501.69638-1-hreitz@redhat.com>
 <CAELHpAD81hgKbvRV=R7jaLyi8Nwi-edd+mJ8arhXAp2=iAiokg@mail.gmail.com>
From: Hanna Reitz <hreitz@redhat.com>
Message-ID: <c55458f6-0fc4-b03f-ddf1-0a65d79b832c@redhat.com>
Date: Fri, 20 Aug 2021 11:03:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAELHpAD81hgKbvRV=R7jaLyi8Nwi-edd+mJ8arhXAp2=iAiokg@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -60
X-Spam_score: -6.1
X-Spam_bar: ------
X-Spam_report: (-6.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.591, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 19.08.21 20:22, Klaus Kiwi wrote:
>
>
> On Thu, Aug 19, 2021 at 7:27 AM Hanna Reitz <hreitz@redhat.com 
> <mailto:hreitz@redhat.com>> wrote:
>
>     This post explains when FUSE block exports are useful, how they work,
>     and that it is fun to export an image file on its own path so it looks
>     like your image file (in whatever format it was) is a raw image now.
>
>
> Thanks Hanna, great work. Even if you explained this to me multiple times,
> thanks to this I think I now finally understand *how* it works.

Oops, sorry for forgetting to CC you...

>     Signed-off-by: Hanna Reitz <hreitz@redhat.com
>     <mailto:hreitz@redhat.com>>
>     ---
>     You can also find this patch here:
>     https://gitlab.com/hreitz/qemu-web
>     <https://gitlab.com/hreitz/qemu-web> fuse-blkexport-v1
>
>     My first patch to qemu-web, so I hope I am not doing anything overly
>     stupid here (adding SVGs with extremely long lines comes to mind)...
>     ---
>      _posts/2021-08-18-fuse-blkexport.md       | 488
>     ++++++++++++++++++++++
>      screenshots/2021-08-18-block-graph-a.svg  |   2 +
>      screenshots/2021-08-18-block-graph-b.svg  |   2 +
>      screenshots/2021-08-18-block-graph-c.svg  |   2 +
>      screenshots/2021-08-18-block-graph-d.svg  |   2 +
>      screenshots/2021-08-18-block-graph-e.svg  |   2 +
>      screenshots/2021-08-18-root-directory.svg |   2 +
>      screenshots/2021-08-18-root-file.svg      |   2 +
>      8 files changed, 502 insertions(+)
>      create mode 100644 _posts/2021-08-18-fuse-blkexport.md
>      create mode 100644 screenshots/2021-08-18-block-graph-a.svg
>      create mode 100644 screenshots/2021-08-18-block-graph-b.svg
>      create mode 100644 screenshots/2021-08-18-block-graph-c.svg
>      create mode 100644 screenshots/2021-08-18-block-graph-d.svg
>      create mode 100644 screenshots/2021-08-18-block-graph-e.svg
>      create mode 100644 screenshots/2021-08-18-root-directory.svg
>      create mode 100644 screenshots/2021-08-18-root-file.svg
>
>     diff --git a/_posts/2021-08-18-fuse-blkexport.md
>     b/_posts/2021-08-18-fuse-blkexport.md
>     new file mode 100644
>     index 0000000..e6a55d0
>     --- /dev/null
>     +++ b/_posts/2021-08-18-fuse-blkexport.md
>     @@ -0,0 +1,488 @@
>     +---
>     +layout: post
>     +title:  "Exporting block devices as raw image files with FUSE"
>     +date:   2021-08-18 18:00:00 +0200
>     +author: Hanna Reitz
>     +categories: [storage, features, tutorials]
>
>
> Non-fatal, but I feel that the title doesn't summarize all that this' 
> blog posts is about.
> An alternate suggestion might be in the lines of "A look into QEMU's 
> FUSE export
> feature, and how to use it to manipulate guest images".

Hmm, I don’t know.  The feature itself doesn’t really allow you to 
manipulate guest images, it only provides a translation layer so that 
other tools can do it.  I can definitely replace “Exporting block 
devices” by “Presenting guest images”, but I’m not sure I want to go 
much further, actually.

>     +---
>     +Sometimes, there is a VM disk image whose contents you want to
>     manipulate
>     +without booting the VM.  For raw images, that process is usually
>     fairly simple,
>     +because most Linux systems bring tools for the job, e.g.:
>     +* *dd* to just copy data to and from given offsets,
>     +* *parted* to manipulate the partition table,
>     +* *kpartx* to present all partitions as block devices,
>     +* *mount* to access filesystems’ contents.
>     +
>     +Sadly, but naturally, such tools only work for raw images, and
>     not for images
>     +e.g. in QEMU’s qcow2 format.  To access such an image’s content,
>     the format has
>     +to be translated to create a raw image, for example by:
>     +* Exporting the image file with `qemu-nbd -c` as an NBD block
>     device file,
>     +* Converting between image formats using `qemu-img convert`,
>     +* Accessing the image from a guest, where it appears as a normal
>     block device.
>     +
>
> Guessing that this would be the best place to mention 
> guestmount/libguestfs, as Stefan
> mentioned in another reply to this thread?

Yes, probably replacing the “Accessing the image from a guest” point.

> Bonus points if you can identify (dis)advantages, similarly to that 
> you did below
> with the other methods.
>
>     +Unfortunately, none of these methods is perfect: `qemu-nbd -c`
>     generally
>     +requires root rights, converting to a temporary raw copy requires
>     additional
>     +disk space and the conversion process takes time, and accessing
>     the image from a
>     +guest is just quite cumbersome in general (and also specifically
>     something that
>     +we set out to avoid in the first sentence of this blog post).
>     +
>     +As of QEMU 6.0, there is another method, namely FUSE block exports.
>     +Conceptually, these are rather similar to using `qemu-nbd -c`,
>     but they do not
>     +require root rights.
>     +
>     +**Note**: FUSE block exports are a feature that can be enabled or
>     disabled
>     +during the build process with `--enable-fuse` or
>     `--disable-fuse`, respectively;
>     +omitting either configure option will enable the feature if and
>     only if libfuse3
>     +is present.  It is possible that the QEMU build you are using
>     does not have FUSE
>     +block export support, because it was not compiled in.
>     +
>     +FUSE (*Filesystem in Userspace*) is a technology to let userspace
>     processes
>     +provide filesystem drivers.  For example, *sshfs* is a program
>     that allows
>     +mounting remote directories from a machine accessible via SSH.
>     +
>
>
> Nitpicking but maybe FUSE here could link to another 
> tutorial/wikipedia page
> with more info?

The best I could do is link to Wikipedia, I suppose, but would that 
really be helpful?  I think this post itself kind of provides an intro 
into what FUSE is.

>     +QEMU can use FUSE to make a virtual block device appear as a
>     normal file on the
>     +host, so that tools like *kpartx* can interact with it regardless
>     of the image
>     +format.
>     +
>     +## Background information
>     +
>     +### File mounts
>
> I must confess that, as I've gone through the document, this felt a 
> bit like breaking
> the flow (probably due to my pre-conceptions of always mounting a 
> resource into
> some directory to see it's content, which I guess was what I was 
> expecting this
> would go before talking about mounting files).
>
> I understand now, however, that this introduction is necessary, but 
> perhaps
> something like "Before we are able to use QEMU's FUSE exports, we need 
> to clarify
> some fundamental concepts on the VFS and mountpoints: It is a 
> little-known fact
> that <...>" would help me understand the flow better here.

Oh, sure!

>     +A perhaps little-known fact is that, on Linux, filesystems do not
>     need to have
>     +a root directory, they only need to have a root node.  A
>     filesystem that only
>     +provides a single regular file is perfectly valid.
>     +
>     +Conceptually, every filesystem is a tree, and mounting works by
>     replacing one
>     +subtree of the global VFS tree by the mounted filesystem’s tree. 
>     Normally, a
>     +filesystem’s root node is a directory, like in the following example:
>     +
>     +|![Regular filesystem: Root directory is mounted to a directory
>     mount point](/screenshots/2021-08-18-root-directory.svg)|
>     +|:--:|
>     +|*Fig. 1: Mounting a regular filesystem with a directory as its
>     root node*|
>     +
>     +Here, the directory `/foo` and its content (the files `/foo/a`
>     and `/foo/b`) are
>     +shadowed by the new filesystem (showing `/foo/x` and `/foo/y`).
>     +
>
>
> Must confess that I wish there were a better term for it than 
> 'shadowed directory'
> or 'shadowed file', avoiding potential confusion with things like 
> /etc/shadow or
> 'shadow memory'.. But I couldn't think if any.
>
>     +Note that a filesystem’s root node generally has no name. After
>     mounting, the
>     +filesystem’s root directory’s name is determined by the original
>     name of the
>     +mount point.
>     +
>     +Because a tree does not need to have multiple nodes but may
>     consist of just a
>     +single leaf, a filesystem with a file for its root node works
>     just as well,
>     +though:
>     +
>     +|![Mounting a file root node to a regular file mount
>     point](/screenshots/2021-08-18-root-file.svg)|
>     +|:--:|
>     +|*Fig. 2: Mounting a filesystem with a regular (unnamed) file as
>     its root node*|
>     +
>     +Here, FS B only consists of a single node, a regular file with no
>     name.  (As
>     +above, a filesystem’s root node is generally unnamed.)
>     Consequently, the mount
>     +point for it must also be a regular file (`/foo/a` in our
>     example), and just
>     +like before, the content of `/foo/a` is shadowed, and when
>     opening it, one will
>     +instead see the contents of FS B’s unnamed root node.
>     +
>     +### QEMU block exports
>     +
>     +QEMU allows exporting block nodes via various protocols (as of
>     6.0: NBD,
>     +vhost-user, FUSE).  A block node is an element of QEMU’s block
>     graph (see e.g.
>     +[Managing the New Block
>     Layer](http://events17.linuxfoundation.org/sites/events/files/slides/talk\_11.pdf
>     <http://events17.linuxfoundation.org/sites/events/files/slides/talk%5C_11.pdf>),
>     +a talk given at KVM Forum 2017), which can for example be
>     attached to guest
>     +devices.  Here is a very simple example:
>     +
>     +|![Block graph: image file <-> file node (label: prot-node) <->
>     qcow2 node (label: fmt-node) <-> virtio-blk guest
>     device](/screenshots/2021-08-18-block-graph-a.svg)|
>     +|:--:|
>     +|*Fig. 3: A simple block graph for attaching a qcow2 image to a
>     virtio-blk guest device*|
>     +
>     +This is the simplest example for a block graph that connects a
>     *virtio-blk*
>     +guest device to a qcow2 image file.  The *file* block driver,
>     instanced in the
>     +form of a block node named *prot-node*, accesses the actual file
>     and provides
>     +the node above it access to the raw content.  This node above,
>     named *fmt-node*,
>     +is handled by the *qcow2* block driver, which is capable of
>     interpreting the
>     +qcow2 format.  Parents of this node will therefore see the actual
>     content of the
>     +virtual disk that is represented by the qcow2 image.  There is
>     only one parent
>     +here, which is the *virtio-blk* guest device, which will thus see
>     the virtual
>     +disk.
>     +
>     +The command line to achieve the above could look something like this:
>     +```
>     +$ qemu-system-x86_64 \
>     +    -blockdev node-name=prot-node,driver=file,filename=$image_path \
>     +    -blockdev node-name=fmt-node,driver=qcow2,file=prot-node \
>     +    -device virtio-blk,drive=fmt-node
>     +```
>     +
>     +Besides attaching guest devices to block nodes, you can also
>     export them for
>     +users outside of qemu, for example via NBD.  Say you have a QMP
>     channel open for
>     +the QEMU instance above, then you could do this:
>
>
> As much as I hate to say it, wouldn't it be better to give the example 
> below using
> (legacy?) qemu monitor commands, instead of JSON? Unless it cannot be 
> done that way
> of course, they feel more intuitive/recognizable to me I think.

nbd_server_start exists as an HMP command, but there’s no direct 
equivalent of block-export-add.  We do have nbd_server_add, but of note 
is that the nbd-server-add QMP command is deprecated.

In any case, I prefer using the JSON QMP commands here, because they map 
directly to the storage daemon’s command line (--nbd-server and --export).

If this is too confusing, then I’d rather jump directly to the storage 
daemon; but I feel like there’s value in showing that block exports work 
in the system emulator, too.

>
>     +```json
>     +{
>     +    "execute": "nbd-server-start",
>     +    "arguments": {
>     +        "addr": {
>     +            "type": "inet",
>     +            "data": {
>     +                "host": "localhost",
>     +                "port": "10809"
>     +            }
>     +        }
>     +    }
>     +}
>     +{
>     +    "execute": "block-export-add",
>     +    "arguments": {
>     +        "type": "nbd",
>     +        "id": "fmt-node-export",
>     +        "node-name": "fmt-node",
>     +        "name": "guest-disk"
>     +    }
>     +}
>     +```
>

[...]

> The rest of it is very didactic and educational - thanks!  And since 
> none of my comments are critical:
> Reviewed-by: Klaus Heinrich Kiwi <kkiwi@redhat.com 
> <mailto:kkiwi@redhat.com>>

Thanks!

Hanna


