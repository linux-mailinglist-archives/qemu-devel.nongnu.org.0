Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBA6B32638B
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 14:51:55 +0100 (CET)
Received: from localhost ([::1]:40958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFdX8-0005mp-Ig
	for lists+qemu-devel@lfdr.de; Fri, 26 Feb 2021 08:51:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1lFdVj-0005Hq-RB
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 08:50:27 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:38209)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1lFdVe-0003Zp-H0
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 08:50:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=2e0w9bgZX9ceOLnFwbCZcdSSKJ4HpLRegJcKrfQc0dQ=; b=YWgHDkUwgMk+ORqfwaSSacR90s
 yUHAANZ4y9UUBi2pE/7NP/jI6wFCfl295FLyCg1rlQgjcbxXNirbEEoSNa7s13nKu+0trfFrhT+3N
 eALcLPubAP4trZfKELpdMR0JykXBAaB73M66Iei+YdDeTip2UmdSZcFCdgkzvzd+iN5ww30wduGo7
 Mah+tOYpwaWCMEvvTCO9CUb+ve97o0Hdv2WXdM4IE6250UAxZAp1+ViadSNlu+BAhfWTGPQNP1I9L
 CnM2waSqC/MITt7C75xbbQH9z/b6gWJJXBgK+ZOYgyvcHpPJCBztBCiTNVpA4/HmASfJghdoLMY3J
 ismbuS6tKEosx2P0lFb2FC3nHrlswmPyJTfmuAkzGWQN/WA63tjzX7AzYi/QkUPdTnoO/hOQQ0CEu
 ta4vNhy4OikYOz9ICXyfATIcFSSn7ht+sipgATwlwXe8MGle+WCLb6LVnlko0wr+JwIx53OEhOxr5
 n76ms2MF44sg19YxKlFyyl1PjRzQVSohTkifTdnAHHckhfhiSKFn+nq8diybcIk0p9vHYtzjhvzWR
 fUKR8uSFfXwKD63r/E5VfFLsHDurQ9aLpPDaNsTbUcxSeLGQvBou5wpeaKItJUHTVVVWhVEMYIv2A
 ghJ+xMKTAAEVnpZoSTt0hdyvl6TV4b5S6jbSVKo44=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Dominique Martinet <asmadeus@codewreck.org>,
 "cdupontd@redhat.com" <cdupontd@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, "Venegas Munoz,
 Jose Carlos" <jose.carlos.venegas.munoz@intel.com>, Greg Kurz <groug@kaod.org>,
 virtio-fs-list <virtio-fs@redhat.com>, Vivek Goyal <vgoyal@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, v9fs-developer@lists.sourceforge.net,
 "Shinde, Archana M" <archana.m.shinde@intel.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: Can not set high msize with virtio-9p (Was: Re: virtiofs vs 9p
 performance)
Date: Fri, 26 Feb 2021 14:49:12 +0100
Message-ID: <1918692.k70u9Ml6kK@silver>
In-Reply-To: <20210224154357.GA12207@tyr>
References: <20200918213436.GA3520@redhat.com> <2006960.IAZaadA1hq@silver>
 <20210224154357.GA12207@tyr>
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mittwoch, 24. Februar 2021 16:43:57 CET Dominique Martinet wrote:
> Christian Schoenebeck wrote on Wed, Feb 24, 2021 at 04:16:52PM +0100:
> > Misapprehension + typo(s) in my previous message, sorry Michael. That's
> > 500k of course (not 5k), yes.
> > 
> > Let me rephrase that question: are you aware of something in virtio that
> > would per se mandate an absolute hard coded message size limit (e.g. from
> > virtio specs perspective or maybe some compatibility issue)?
> > 
> > If not, we would try getting rid of that hard coded limit of the 9p client
> > on kernel side in the first place, because the kernel's 9p client already
> > has a dynamic runtime option 'msize' and that hard coded enforced limit
> > (500k) is a performance bottleneck like I said.
> 
> We could probably set it at init time through virtio_max_dma_size(vdev)
> like virtio_blk does (I just tried and get 2^64 so we can probably
> expect virtually no limit there)
> 
> I'm not too familiar with virtio, feel free to try and if it works send
> me a patch -- the size drop from 512 to 500k is old enough that things
> probably have changed in the background since then.

Yes, agreed. I'm neither too familiar with virtio, nor with the Linux 9p
client code yet. For that reason I consider a minimal invasive change as a
first step at least. AFAICS a "split virtqueue" setup is currently used:

https://docs.oasis-open.org/virtio/virtio/v1.1/cs01/virtio-v1.1-cs01.html#x1-240006

Right now the client uses a hard coded amount of 128 elements. So what about
replacing VIRTQUEUE_NUM by a variable which is initialized with a value
according to the user's requested 'msize' option at init time?

According to the virtio specs the max. amount of elements in a virtqueue is
32768. So 32768 * 4k = 128M as new upper limit would already be a significant
improvement and would not require too many changes to the client code, right?

> On the 9p side itself, unrelated to virtio, we don't want to make it
> *too* big as the client code doesn't use any scatter-gather and will
> want to allocate upfront contiguous buffers of the size that got
> negotiated -- that can get ugly quite fast, but we can leave it up to
> users to decide.

With ugly you just mean that it's occupying this memory for good as long as
the driver is loaded, or is there some runtime performance penalty as well to
be aware of?

> One of my very-long-term goal would be to tend to that, if someone has
> cycles to work on it I'd gladly review any patch in that area.
> A possible implementation path would be to have transport define
> themselves if they support it or not and handle it accordingly until all
> transports migrated, so one wouldn't need to care about e.g. rdma or xen
> if you don't have hardware to test in the short term.

Sounds like something that Greg suggested before for a slightly different,
even though related issue: right now the default 'msize' on Linux client side
is 8k, which really hurts performance wise as virtually all 9p messages have
to be split into a huge number of request and response messages. OTOH you
don't want to set this default value too high. So Greg noted that virtio could
suggest a default msize, i.e. a value that would suit host's storage hardware
appropriately.

> The next best thing would be David's netfs helpers and sending
> concurrent requests if you use cache, but that's not merged yet either
> so it'll be a few cycles as well.

So right now the Linux client is always just handling one request at a time;
it sends a 9p request and waits for its response before processing the next
request?

If so, is there a reason to limit the planned concurrent request handling
feature to one of the cached modes? I mean ordering of requests is already
handled on 9p server side, so client could just pass all messages in a
lite-weight way and assume server takes care of it.

Best regards,
Christian Schoenebeck



