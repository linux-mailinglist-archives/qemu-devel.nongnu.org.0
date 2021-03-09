Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B76D332CDB
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 18:08:52 +0100 (CET)
Received: from localhost ([::1]:35238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJfql-0006qi-9Z
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 12:08:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lJf0n-0003kc-Ra
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 11:15:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:34532)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lJf0l-0000gT-G0
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 11:15:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615306506;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BVjKfZtMqaMMl7TOhZ7vRwb/XY64Is3Dc+VnPVS12H4=;
 b=CTH9Vo9QjABluGjThnsl+7GsQl+15NwPvsn8DPh2ErTDeWCv2sMuznZrjqqay30HWh0+Vw
 Hv31l47keRyc/lp6YYGAjfuKETIDF+uATsu1yK797yMYQQ1+9gsF3yQCK1mqnC3aKSngJd
 +QBWNEVMdtXOzSP0P6AApmrCNECQSbI=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-326-MMzivUGxNKGvJZeqdNvtjg-1; Tue, 09 Mar 2021 11:15:04 -0500
X-MC-Unique: MMzivUGxNKGvJZeqdNvtjg-1
Received: by mail-qv1-f70.google.com with SMTP id u6so1521727qvu.11
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 08:15:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=BVjKfZtMqaMMl7TOhZ7vRwb/XY64Is3Dc+VnPVS12H4=;
 b=AKZXQ0NKbZPbjoQb90/FX778CQ5swjcsMauKoNX4si1bNe9vWhiNTvN6lXFbOEhVAN
 QpXMf8bEpdmZ0mIMWfK2H9xWpXDcX/BYP9G6tG+65jLkLSZilV8K8tLX15qpZpu+aWUi
 7L4Z9nAYVE7+GTM4LbO8GvlJTeaZ6mryc+0Ay3UBp73qD0Jd1fqIt93TqmgzotjgfIy5
 3zP2mtbYJW88RG8tjyQZFWaJaB4wezC5zw7Veva+yGBlFWIL44H4bUGFwKYUdJQBN7W8
 CHbi1sEhOwUSSyMCFM1PjjFCoY6Tue6NXhYBJrNFhJsop7l0pPz33jtNl+svTKLLhvqZ
 qdvA==
X-Gm-Message-State: AOAM533f56QOHnxbWPTKtgkyzn01daSedoHhYWGwV0vTHNbu1A3YVq9s
 x18xCpB8Wq+3g51xzkwnBYjvh4sPfOA4v2u1BIabrMh4vHoNdQqGJrAx/40pcH2OsJn5FGK2H6Z
 zMF0bpvGrh/D5tYk=
X-Received: by 2002:a37:a54f:: with SMTP id o76mr26342574qke.95.1615306502605; 
 Tue, 09 Mar 2021 08:15:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyo1DJb7VMSQRqALZn9CM4S6gLXiXQBYyZpV80EZ0nHs3PX8GG8NfDEeSIo+d1/LbgIlpqKMQ==
X-Received: by 2002:a37:a54f:: with SMTP id o76mr26342544qke.95.1615306502266; 
 Tue, 09 Mar 2021 08:15:02 -0800 (PST)
Received: from xz-x1
 (bras-vprn-toroon474qw-lp130-25-174-95-95-253.dsl.bell.ca. [174.95.95.253])
 by smtp.gmail.com with ESMTPSA id j15sm3958143qtr.34.2021.03.09.08.15.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 08:15:01 -0800 (PST)
Date: Tue, 9 Mar 2021 11:15:00 -0500
From: Peter Xu <peterx@redhat.com>
To: Kunkun Jiang <jiangkunkun@huawei.com>
Subject: Re: [PATCH v3 2/3] migration/ram: Reduce unnecessary rate limiting
Message-ID: <20210309161500.GB763132@xz-x1>
References: <20210305075035.1852-1-jiangkunkun@huawei.com>
 <20210305075035.1852-3-jiangkunkun@huawei.com>
 <20210305142250.GE397383@xz-x1>
 <a4c34c08-b686-8ec1-8e8d-2770e26e38c5@huawei.com>
 <20210308211255.GL397383@xz-x1>
 <b426bf66-f5d9-c5ea-fb2f-24b615743075@huawei.com>
MIME-Version: 1.0
In-Reply-To: <b426bf66-f5d9-c5ea-fb2f-24b615743075@huawei.com>
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

On Tue, Mar 09, 2021 at 10:33:04PM +0800, Kunkun Jiang wrote:
> Hi,
> 
> On 2021/3/9 5:12, Peter Xu wrote:
> > On Mon, Mar 08, 2021 at 06:34:58PM +0800, Kunkun Jiang wrote:
> > > Hi,
> > > 
> > > On 2021/3/5 22:22, Peter Xu wrote:
> > > > Kunkun,
> > > > 
> > > > On Fri, Mar 05, 2021 at 03:50:34PM +0800, Kunkun Jiang wrote:
> > > > > When the host page is a huge page and something is sent in the
> > > > > current iteration, the migration_rate_limit() should be executed.
> > > > > If not, this function can be omitted to save time.
> > > > > 
> > > > > Rename tmppages to pages_this_iteration to express its meaning
> > > > > more clearly.
> > > > > 
> > > > > Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
> > > > > Signed-off-by: Kunkun Jiang <jiangkunkun@huawei.com>
> > > > > ---
> > > > >    migration/ram.c | 21 ++++++++++++++-------
> > > > >    1 file changed, 14 insertions(+), 7 deletions(-)
> > > > > 
> > > > > diff --git a/migration/ram.c b/migration/ram.c
> > > > > index a168da5cdd..9fc5b2997c 100644
> > > > > --- a/migration/ram.c
> > > > > +++ b/migration/ram.c
> > > > > @@ -1988,7 +1988,7 @@ static int ram_save_target_page(RAMState *rs, PageSearchStatus *pss,
> > > > >    static int ram_save_host_page(RAMState *rs, PageSearchStatus *pss,
> > > > >                                  bool last_stage)
> > > > >    {
> > > > > -    int tmppages, pages = 0;
> > > > > +    int pages = 0;
> > > > >        size_t pagesize_bits =
> > > > >            qemu_ram_pagesize(pss->block) >> TARGET_PAGE_BITS;
> > > > >        unsigned long start_page = pss->page;
> > > > > @@ -2000,21 +2000,28 @@ static int ram_save_host_page(RAMState *rs, PageSearchStatus *pss,
> > > > >        }
> > > > >        do {
> > > > > +        int pages_this_iteration = 0;
> > > > > +
> > > > >            /* Check if the page is dirty and send it if it is */
> > > > >            if (!migration_bitmap_clear_dirty(rs, pss->block, pss->page)) {
> > > > >                pss->page++;
> > > > >                continue;
> > > > >            }
> > > > > -        tmppages = ram_save_target_page(rs, pss, last_stage);
> > > > > -        if (tmppages < 0) {
> > > > > -            return tmppages;
> > > > > +        pages_this_iteration = ram_save_target_page(rs, pss, last_stage);
> > > > > +        if (pages_this_iteration < 0) {
> > > > > +            return pages_this_iteration;
> > > > >            }
> > > > > -        pages += tmppages;
> > > > > +        pages += pages_this_iteration;
> > > > To me, both names are okay, it's just that the new name doesn't really provide
> > > > a lot more new information, while it's even longer...
> > > > 
> > > > Since you seem to prefer cleaning up tmppages, I'm actually thinking whether
> > > > it should be called as "pages" at all since ram_save_target_page() majorly only
> > > > returns either 1 if succeeded or <0 if error.  There's only one very corner
> > > > case of xbzrle where it can return 0 in save_xbzrle_page():
> > > > 
> > > >       if (encoded_len == 0) {
> > > >           trace_save_xbzrle_page_skipping();
> > > >           return 0;
> > > >       }
> > > > 
> > > > I think it means the page didn't change at all, then I'm also wondering maybe
> > > > it can also return 1 showing one page migrated (though actually skipped!) which
> > > > should still be fine for the callers, e.g., ram_find_and_save_block() who will
> > > > finally check this "pages" value.
> > > > 
> > > > So I think _maybe_ that's a nicer cleanup to change that "return 0" to "return
> > > > 1", then another patch to make the return value to be (1) return 0 if page
> > > > saved, or (2) return <0 if error.  Then here in ram_save_host_page() tmppages
> > > > can be renamed to "ret" or "succeed".
> > > Thanks for your advice.
> > > change "return 0" to "return 1" would have a slight effect on
> > > 'rs->target_page_count += pages'
> > > in ram_save_iterate(). This may lead to consider more complex situations.
> > > What do you think of
> > > this?
> > I don't think we should change the meaning of ram_save_host_page()'s return
> > value, but only ram_save_target_page(); ram_save_host_page() could return >1
> > for huge pages.  Thanks,
> > 
> I am not sure I have got your point. If I change "return 0" to "return 1"
> (actually skipped),
> the "pages" in the ram_save_host_page() will add 1(original add 0). Then it
> will end the
> loop in the ram_find_and_save_block.

Frankly I even think it's a bug - when return 0 it could mean the xbzrle page
is the same as before even if dirty bit set (the page just got written with the
same data, that's why dirty bit set but xbzrle calculated with no diff).
However it shouldn't mean "done==1" which is a sign of "migration complete"
imho..

> And then in the ram_save_iterate(), the
> modify may
> have a effect on "rs->target_page_count += page".
> I haven't done enough research on this part of code. Do you think this
> change will have
> a big impact?

Maybe, but I don't expect it to change anything real.  If to change it we'd
definitely better smoke xbzrle a bit.  It's a pure idea I got in mind to
cleanup the code, but feel free to ignore it too.

For your current series, I think the last patch is the most appealing.  So
maybe we can focus on that first.

Thanks,

-- 
Peter Xu


