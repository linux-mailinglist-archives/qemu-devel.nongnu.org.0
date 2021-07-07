Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD1BF3BF15C
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 23:23:39 +0200 (CEST)
Received: from localhost ([::1]:50528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1F18-0002Pb-UL
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 17:23:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.duyck@gmail.com>)
 id 1m1F0L-0001jV-07; Wed, 07 Jul 2021 17:22:49 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:38505)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alexander.duyck@gmail.com>)
 id 1m1F0J-0005G1-4N; Wed, 07 Jul 2021 17:22:48 -0400
Received: by mail-ed1-x532.google.com with SMTP id x12so5322077eds.5;
 Wed, 07 Jul 2021 14:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IX98sfedunE/b1mi5uLJCyWdqpbD3Iqov+vChPCcoTw=;
 b=cycKYlsxsv9ICJY4kiiUWAE+cCI7ENLoE9r/1LQLZ5XH62dod28HG9JqgS+XYIhZF+
 b//mKX4i8nU3gCMYredahDVnkB7r/a+cRe9S1f1tKwpvtIBeOJMIOwPtino38So4dsYT
 p6AgVKFCLnRBmAX3N9KOnHOq0xhJJoyv4HxNAGIuzCOUQKzLne0e6VYTE5UEXnOLTw0R
 nu/IXrzcuJDM5Al1PRlIpe11mGSWBqLCQFyQRr3SstZeC8XGO7F46WXgcXi6uRmCAKuD
 3EMMLhD80bvGsjuMGIwGp/uXkauDwYbJ34cXHgc80WfJhoxdHf8WkTqOS1A7FiN35jxD
 TQRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IX98sfedunE/b1mi5uLJCyWdqpbD3Iqov+vChPCcoTw=;
 b=B9uAq9moT4LhFPrVCBpnXvkLWpIuMfLKr1fOGZcyFho5rFfvAzd9ovTPk15o7ksbgz
 w0mk9EGoxJQNWWcWDdt14mBgjRcqhhst5IWoiqlg9r+PcxOTxisAtlir4l/jwcYqw8Al
 9vGpykB5Ngw+wH9kMywPx2KZMxQvL0FdYKojb9WBS2K2/za9Y39WN6TjjDvWQ+pA5QNd
 NlXYjoK/+IGnOqZ+N77eZFI76rvAuNMoFMQS0uDLvHtFR0UIKdJ0rKYBvxnHPI+tbp9Y
 VB5q45TZvd+fHWTbnMIcRuuGTcVHGtvFy5MBVSfiYHJOGOToVw4o0OKmXYerATwFyXS4
 951w==
X-Gm-Message-State: AOAM531TuvmZf+hwtm9mv8hwHjXOIPDFxjLhg8+k6WYDA8refLJn0BFT
 UJHar7TkKgqWMGQIuzhs8yKBOsYzQOHYEXpdVh0=
X-Google-Smtp-Source: ABdhPJxE7rL4yyoVerR8SwvupwlTPObHHBPoiVKFc3WVqpAQHZaP89J4bDjAtB/aJ0Z3bBIKBurK9GPUGu7opV7FA1Q=
X-Received: by 2002:a05:6402:22c6:: with SMTP id
 dm6mr8683740edb.228.1625692964208; 
 Wed, 07 Jul 2021 14:22:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210707140655.30982-1-david@redhat.com>
 <20210707140655.30982-3-david@redhat.com>
 <YOXsTQoq6eeIR8B5@t490s> <5f5dd7f3-ce09-53d6-db48-1a333119205d@redhat.com>
 <YOYJsMUfx1XHFk6G@t490s>
In-Reply-To: <YOYJsMUfx1XHFk6G@t490s>
From: Alexander Duyck <alexander.duyck@gmail.com>
Date: Wed, 7 Jul 2021 14:22:32 -0700
Message-ID: <CAKgT0Ucp60nxvk4ysydE29RPXUEFUU2f4+=3XMaXFagMef+hbA@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] virtio-balloon: disallow postcopy with
 VIRTIO_BALLOON_F_FREE_PAGE_HINT
To: Peter Xu <peterx@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=alexander.duyck@gmail.com; helo=mail-ed1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "Michael S . Tsirkin" <mst@redhat.com>,
 David Hildenbrand <david@redhat.com>, qemu-stable@nongnu.org,
 qemu-devel@nongnu.org, Juan Quintela <quintela@redhat.com>,
 Wei Wang <wei.w.wang@intel.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jul 7, 2021 at 1:08 PM Peter Xu <peterx@redhat.com> wrote:
>
> On Wed, Jul 07, 2021 at 08:57:29PM +0200, David Hildenbrand wrote:
> > On 07.07.21 20:02, Peter Xu wrote:
> > > On Wed, Jul 07, 2021 at 04:06:55PM +0200, David Hildenbrand wrote:
> > > > As it never worked properly, let's disable it via the postcopy notifier on
> > > > the destination. Trying to set "migrate_set_capability postcopy-ram on"
> > > > on the destination now results in "virtio-balloon: 'free-page-hint' does
> > > > not support postcopy Error: Postcopy is not supported".
> > >
> > > Would it be possible to do this in reversed order?  Say, dynamically disable
> > > free-page-hinting if postcopy capability is set when migration starts? Perhaps
> > > it can also be re-enabled automatically when migration completes?
> >
> > I remember that this might be quite racy. We would have to make sure that no
> > hinting happens before we enable the capability.
> >
> > As soon as we messed with the dirty bitmap (during precopy), postcopy is no
> > longer safe. As noted in the patch, the only runtime alternative is to
> > disable postcopy as soon as we actually do clear a bit. Alternatively, we
> > could ignore any hints if the postcopy capability was enabled.
>
> Logically migration capabilities are applied at VM starts, and these
> capabilities should be constant during migration (I didn't check if there's a
> hard requirement; easy to add that if we want to assure it), and in most cases
> for the lifecycle of the vm.

Would it make sense to maybe just look at adding a postcopy value to
the PrecopyNotifyData that you could populate with
migration_in_postcopy() in precopy_notify()?

Then all you would need to do is check for that value and if it is set
you shut down the page hinting or don't start it since I suspect it
wouldn't likely add any value anyway since I would think flagging
unused pages doesn't add much value in a postcopy environment anyway.

> >
> > Whatever we do, we have to make sure that a user cannot trick the system
> > into an inconsistent state. Like enabling hinting, starting migration, then
> > enabling the postcopy capability and kicking of postcopy. I did not check if
> > we allow for that, though.
>
> We could turn free page hinting off when migration starts with postcopy-ram=on,
> then re-enable it after migration finishes.  That looks very safe to me.  And I
> don't even worry on user trying to mess it up - as that only put their own VM
> at risk; that's mostly fine to me.

We wouldn't necessarily even need to really turn it off, just don't
start it. I wonder if we couldn't just get away with adding a check to
the existing virtio_balloon_free_page_hint_notify to see if we are in
the postcopy state there and just shut things down or not start them.

