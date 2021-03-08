Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15355331928
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 22:14:09 +0100 (CET)
Received: from localhost ([::1]:55074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJNCZ-0001A4-Hq
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 16:14:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lJNBZ-0000fq-P6
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 16:13:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:53424)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lJNBW-0002Pu-Hx
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 16:13:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615237979;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4Ty4nRCWvqYXhGVSONPzQzi6Ad4QIW4aMIUZ74t56Ys=;
 b=ecDzq/4ARKedtmrw4puz4CmzlIov9QCaLyUKKfePENH3p8snIl1PZPzM6YiwnbCgf3opmO
 Moy3FCgFGYpNmAV5nsENKr1XXRAo4/quSIp9t7Xe1rLuQ+SzIaHP/sua9blU4lyZ0sFlsj
 zt8xdxcZq4jGOeE8j3Jw7t5u/CZptew=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-250-RH9Xc_75NayIENOb8nyz9w-1; Mon, 08 Mar 2021 16:12:58 -0500
X-MC-Unique: RH9Xc_75NayIENOb8nyz9w-1
Received: by mail-qv1-f71.google.com with SMTP id t18so8625501qva.6
 for <qemu-devel@nongnu.org>; Mon, 08 Mar 2021 13:12:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=4Ty4nRCWvqYXhGVSONPzQzi6Ad4QIW4aMIUZ74t56Ys=;
 b=Y8h5W7ls1Fg3o5wIzj4Z1RX7eFOmH5EqwmevpdhiMN1egatpgx1JKNiEN4s+c5fNxb
 w0cKr9DKtM/qHuDwPH7QJTu7H6yQKvEyeSc7sfVunqR9t3PvGNQs58A+uCJUVT1Hvk64
 0iQlwWlJ2I1amOx44Xng1ch9twMHxBN2AfO5/+mYyTkPBwVenO5K1MEQa26L5uDm29vE
 hvArpwL+B5s/dpSBXuK5ymQLXRL1DIFXV89mGjnc5E3c6Ro7mPqyrSRW5aQuH6qQVfmh
 uYznBP7l6QxmFaHXNi7baL3vK5dkuF4o5yiEL7owlu38UbVn+SflMaYT8bJMmovxOTM6
 CmMA==
X-Gm-Message-State: AOAM531o0XWzDqTcmucnaxE2UwEGu9+AqBRWO+yVhpNKeQAFJWs2RxAY
 Wn5ui7tXSvyKMbqaGRRh/MIEXW0gRCEwCMWTGbS0ISONqvV0k8mxLlP58e9ylMtG9AyLDD9USN9
 xTEqaKyuUSMj5GaE=
X-Received: by 2002:a37:2749:: with SMTP id n70mr22474175qkn.105.1615237977590; 
 Mon, 08 Mar 2021 13:12:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyBu+64BKKt1cmMOGyy0eiQqRgVXIbXW4gVVxx+hcs+iDJ7gKu/IN/AR0eURbDKjxxFikuz8Q==
X-Received: by 2002:a37:2749:: with SMTP id n70mr22474146qkn.105.1615237977328; 
 Mon, 08 Mar 2021 13:12:57 -0800 (PST)
Received: from xz-x1
 (bras-vprn-toroon474qw-lp130-25-174-95-95-253.dsl.bell.ca. [174.95.95.253])
 by smtp.gmail.com with ESMTPSA id h11sm8432548qkj.135.2021.03.08.13.12.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Mar 2021 13:12:56 -0800 (PST)
Date: Mon, 8 Mar 2021 16:12:55 -0500
From: Peter Xu <peterx@redhat.com>
To: Kunkun Jiang <jiangkunkun@huawei.com>
Subject: Re: [PATCH v3 2/3] migration/ram: Reduce unnecessary rate limiting
Message-ID: <20210308211255.GL397383@xz-x1>
References: <20210305075035.1852-1-jiangkunkun@huawei.com>
 <20210305075035.1852-3-jiangkunkun@huawei.com>
 <20210305142250.GE397383@xz-x1>
 <a4c34c08-b686-8ec1-8e8d-2770e26e38c5@huawei.com>
MIME-Version: 1.0
In-Reply-To: <a4c34c08-b686-8ec1-8e8d-2770e26e38c5@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Juan Quintela <quintela@redhat.com>, David Edmondson <dme@dme.org>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 Alexey Romko <nevilad@yahoo.com>, Zenghui Yu <yuzenghui@huawei.com>,
 wanghaibin.wang@huawei.com, Keqian Zhu <zhukeqian1@huawei.com>,
 Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Mar 08, 2021 at 06:34:58PM +0800, Kunkun Jiang wrote:
> Hi,
> 
> On 2021/3/5 22:22, Peter Xu wrote:
> > Kunkun,
> > 
> > On Fri, Mar 05, 2021 at 03:50:34PM +0800, Kunkun Jiang wrote:
> > > When the host page is a huge page and something is sent in the
> > > current iteration, the migration_rate_limit() should be executed.
> > > If not, this function can be omitted to save time.
> > > 
> > > Rename tmppages to pages_this_iteration to express its meaning
> > > more clearly.
> > > 
> > > Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
> > > Signed-off-by: Kunkun Jiang <jiangkunkun@huawei.com>
> > > ---
> > >   migration/ram.c | 21 ++++++++++++++-------
> > >   1 file changed, 14 insertions(+), 7 deletions(-)
> > > 
> > > diff --git a/migration/ram.c b/migration/ram.c
> > > index a168da5cdd..9fc5b2997c 100644
> > > --- a/migration/ram.c
> > > +++ b/migration/ram.c
> > > @@ -1988,7 +1988,7 @@ static int ram_save_target_page(RAMState *rs, PageSearchStatus *pss,
> > >   static int ram_save_host_page(RAMState *rs, PageSearchStatus *pss,
> > >                                 bool last_stage)
> > >   {
> > > -    int tmppages, pages = 0;
> > > +    int pages = 0;
> > >       size_t pagesize_bits =
> > >           qemu_ram_pagesize(pss->block) >> TARGET_PAGE_BITS;
> > >       unsigned long start_page = pss->page;
> > > @@ -2000,21 +2000,28 @@ static int ram_save_host_page(RAMState *rs, PageSearchStatus *pss,
> > >       }
> > >       do {
> > > +        int pages_this_iteration = 0;
> > > +
> > >           /* Check if the page is dirty and send it if it is */
> > >           if (!migration_bitmap_clear_dirty(rs, pss->block, pss->page)) {
> > >               pss->page++;
> > >               continue;
> > >           }
> > > -        tmppages = ram_save_target_page(rs, pss, last_stage);
> > > -        if (tmppages < 0) {
> > > -            return tmppages;
> > > +        pages_this_iteration = ram_save_target_page(rs, pss, last_stage);
> > > +        if (pages_this_iteration < 0) {
> > > +            return pages_this_iteration;
> > >           }
> > > -        pages += tmppages;
> > > +        pages += pages_this_iteration;
> > To me, both names are okay, it's just that the new name doesn't really provide
> > a lot more new information, while it's even longer...
> > 
> > Since you seem to prefer cleaning up tmppages, I'm actually thinking whether
> > it should be called as "pages" at all since ram_save_target_page() majorly only
> > returns either 1 if succeeded or <0 if error.  There's only one very corner
> > case of xbzrle where it can return 0 in save_xbzrle_page():
> > 
> >      if (encoded_len == 0) {
> >          trace_save_xbzrle_page_skipping();
> >          return 0;
> >      }
> > 
> > I think it means the page didn't change at all, then I'm also wondering maybe
> > it can also return 1 showing one page migrated (though actually skipped!) which
> > should still be fine for the callers, e.g., ram_find_and_save_block() who will
> > finally check this "pages" value.
> > 
> > So I think _maybe_ that's a nicer cleanup to change that "return 0" to "return
> > 1", then another patch to make the return value to be (1) return 0 if page
> > saved, or (2) return <0 if error.  Then here in ram_save_host_page() tmppages
> > can be renamed to "ret" or "succeed".
> Thanks for your advice.
> change "return 0" to "return 1" would have a slight effect on
> 'rs->target_page_count += pages'
> in ram_save_iterate(). This may lead to consider more complex situations.
> What do you think of
> this?

I don't think we should change the meaning of ram_save_host_page()'s return
value, but only ram_save_target_page(); ram_save_host_page() could return >1
for huge pages.  Thanks,

-- 
Peter Xu


