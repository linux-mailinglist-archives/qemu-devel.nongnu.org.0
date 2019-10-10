Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 735D4D30F5
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Oct 2019 20:55:11 +0200 (CEST)
Received: from localhost ([::1]:43208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iIdag-0001kc-IR
	for lists+qemu-devel@lfdr.de; Thu, 10 Oct 2019 14:55:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59895)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1iIdZZ-0001KH-O8
 for qemu-devel@nongnu.org; Thu, 10 Oct 2019 14:54:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1iIdZY-0004OK-HR
 for qemu-devel@nongnu.org; Thu, 10 Oct 2019 14:54:01 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39756)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1iIdZY-0004O6-9K
 for qemu-devel@nongnu.org; Thu, 10 Oct 2019 14:54:00 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 7445730860C3;
 Thu, 10 Oct 2019 18:53:59 +0000 (UTC)
Received: from work-vm (unknown [10.36.118.41])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 043B21001B09;
 Thu, 10 Oct 2019 18:53:53 +0000 (UTC)
Date: Thu, 10 Oct 2019 19:53:51 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Auger Eric <eric.auger@redhat.com>
Subject: Re: [PATCH v3] migration: Support gtree migration
Message-ID: <20191010185351.GG3292@work-vm>
References: <20191004112025.28868-1-eric.auger@redhat.com>
 <20191009062852.GB1039@xz-x1>
 <27d37e80-31d8-006a-b2a8-c61c5129c7c4@redhat.com>
 <20191010113541.GG18958@xz-x1>
 <c6f0142b-f325-a12c-433d-b77387c0a8a9@redhat.com>
 <20191010123544.GH18958@xz-x1>
 <7930bbdf-1ada-d25d-dd40-1580d421e42f@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7930bbdf-1ada-d25d-dd40-1580d421e42f@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.44]); Thu, 10 Oct 2019 18:53:59 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: quintela@redhat.com, qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>,
 eric.auger.pro@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Auger Eric (eric.auger@redhat.com) wrote:
> Hi peter,
> 
> On 10/10/19 2:35 PM, Peter Xu wrote:
> > On Thu, Oct 10, 2019 at 02:11:46PM +0200, Auger Eric wrote:
> >>>>> Also, should we avoid using UINT in all cases?  But of course if we
> >>>>> start to use VMSTATE_UINT32_V then we don't have this issue.
> >>>> Depending on the clarification of above point, maybe I can rename
> >>>> VMSTATE_GTREE_DIRECT_KEY_V into VMSTATE_GTREE_DIRECT_UINT_KEY_V
> >>>>
> >>>> direct keys seem to be more common for hash tables actually.
> >>>> https://developer.gnome.org/glib/stable/glib-Hash-Tables.html#g-hash-table-new-full
> >>>>
> >>>> There are stand conversion macros to/from int, uint, size
> >>>> https://developer.gnome.org/glib/stable/glib-Type-Conversion-Macros.html
> >>>
> >>> Yeh it's fine to use direct keys.  Though my question was more about
> >>> "unsigned int" - here when we put, we cast a pointer into unsigned
> >>> int, which can be 2/4 bytes, IIUC.  I'm thinking whether at least we
> >>> should use direct cast (e.g., (uint32_t)ptr) to replace
> >>> GPOINTER_TO_UINT() to make sure it's 4 bytes.  Futher, maybe we should
> >>> start with uint64_t here in the migration stream, otherwise we should
> >>> probably drop the high 32 bits if we migrate a gtree whose key is 64
> >>> bits long (and since we're working with migration we won't be able to
> >>> change that in the future for compatibility reasons...).
> >>>
> >>> Summary:
> >>>
> >>> Maybe we can replace:
> >>>
> >>>     qemu_put_be32(f, GPOINTER_TO_UINT(key)); /* direct key */
> >>>
> >>> To:
> >>>
> >>>     qemu_put_be64(f, (uint64_t)key); /* direct key */
> >>>
> >>> And apply similar thing to get() side?
> >>
> >> This was my first idea as well but I got stuck with a mingw compilation
> >> issues if I remember correctly, trying to cast pointers to a wrong sized
> >> uint. This got removed by using the GPOINTER_TO_UINT conversion functions.
> > 
> > #define GPOINTER_TO_UINT(p) ((guint) (gulong) (p))
> > 
> > Could "(uint64_t)(uintptr_t)pointer" do the work?
> the problem rather is on the get side, when you cast the uint64_t value
> into the pointer. it does not compile with
> 
> make docker-test-mingw@fedora
> 
> 
> /tmp/qemu-test/src/migration/vmstate-types.c:800:19: error: cast to
> pointer from integer of different size [-Werror=int-to-pointer-cast]
>              key = (void *)(uint64_t)qemu_get_be64(f);
> 
> I would be tempted to rename the macro to emphasize the key is an
> uint32. It should cover most of the use cases, no?

Try:
    (void *)(uintptr_t)qemu_get_be64(f)


> 
> Thanks
> 
> Eric
> 
> 
> > 
> > Thanks,
> > 
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

