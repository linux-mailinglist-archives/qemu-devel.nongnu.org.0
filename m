Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75614435E4A
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 11:50:17 +0200 (CEST)
Received: from localhost ([::1]:39068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdUiG-0005KU-07
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 05:50:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mdUgM-0004SL-Mp
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 05:48:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55555)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mdUgJ-0007QP-M0
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 05:48:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634809693;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LEKjVkKc3uq9wZfGouy61MY11ZpI5eeIlVJOHGA1as0=;
 b=eOMHpnmvooXGbYRai2g3Kl4Aks8BedFGypHHih9PXeL2y/cnoEfa2uWjWHlCgKP4SufkXf
 BL56rprjzhyugI25pqx+InjX7J5Qbt9bePXif+9hZIWJzRZJQiCcg/OieqvqbPeX2dnSDn
 02re8CfVoFL3/UWpDdjH/+YwM14fiSY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-487-rW-z7TptOLeoLncyo_LWLg-1; Thu, 21 Oct 2021 05:48:10 -0400
X-MC-Unique: rW-z7TptOLeoLncyo_LWLg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1E543802682;
 Thu, 21 Oct 2021 09:48:09 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 629FD196AE;
 Thu, 21 Oct 2021 09:47:30 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id CCB6011380A7; Thu, 21 Oct 2021 11:47:28 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH RFC v2 5/5] block: Deprecate transaction type drive-backup
References: <20211009120944.2858887-1-armbru@redhat.com>
 <20211009120944.2858887-6-armbru@redhat.com>
 <20211011185817.czv4tmlsxiyhuqrp@redhat.com>
 <YWVpCp1VcsnfYVkF@redhat.com>
Date: Thu, 21 Oct 2021 11:47:28 +0200
In-Reply-To: <YWVpCp1VcsnfYVkF@redhat.com> (Kevin Wolf's message of "Tue, 12
 Oct 2021 12:52:58 +0200")
Message-ID: <874k9aemkv.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: vsementsov@virtuozzo.com, berrange@redhat.com, libvir-list@redhat.com,
 Eric Blake <eblake@redhat.com>, mdroth@linux.vnet.ibm.com,
 qemu-devel@nongnu.org, pkrempa@redhat.com, marcandre.lureau@redhat.com,
 jsnow@redhat.com, libguestfs@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Kevin Wolf <kwolf@redhat.com> writes:

> Am 11.10.2021 um 20:58 hat Eric Blake geschrieben:
>> On Sat, Oct 09, 2021 at 02:09:44PM +0200, Markus Armbruster wrote:
>> > Several moons ago, Vladimir posted
>> > 
>> >     Subject: [PATCH v2 3/3] qapi: deprecate drive-backup
>> >     Date: Wed,  5 May 2021 16:58:03 +0300
>> >     Message-Id: <20210505135803.67896-4-vsementsov@virtuozzo.com>
>> >     https://lists.gnu.org/archive/html/qemu-devel/2021-05/msg01394.html
>> > 
>> > with this
>> > 
>> >     TODO: We also need to deprecate drive-backup transaction action..
>> >     But union members in QAPI doesn't support 'deprecated' feature. I tried
>> >     to dig a bit, but failed :/ Markus, could you please help with it? At
>> >     least by advice?
>> > 
>> > This is one way to resolve it.  Sorry it took so long.
>> > 
>> > John explored another way, namely adding feature flags to union
>> > branches.  Could also be useful, say to add different features to
>> > branches in multiple unions sharing the same tag enum.
>> > 
>> > Signed-off-by: Markus Armbruster <armbru@redhat.com>
>> > ---
>> >  qapi/transaction.json | 5 ++++-
>> >  1 file changed, 4 insertions(+), 1 deletion(-)
>> > 
>> > diff --git a/qapi/transaction.json b/qapi/transaction.json
>> > index d175b5f863..0564a893b3 100644
>> > --- a/qapi/transaction.json
>> > +++ b/qapi/transaction.json
>> > @@ -54,6 +54,9 @@
>> >  # @blockdev-snapshot-sync: since 1.1
>> >  # @drive-backup: Since 1.6
>> >  #
>> > +# Features:
>> > +# @deprecated: Member @drive-backup is deprecated.  Use FIXME instead.
>> 
>> Obviously, we'd need to flesh this out ("'blockdev-backup' with proper
>> node names"? something else?) before dropping RFC on this patch.
>
> What does 'blockdev-backup' with improper node names look like?
>
> I think it's sufficient to say "Use @blockdev-backup instead", which is
> already documented to take a node/device name instead of a file name.

Sold!

>> And we'd want to edit docs/about/deprecated.rst to match.
>
> Yes.

My patch makes sense only together with Vladimir's patch to deprecate
the drive-backup command.  That one updates deprecated.rst.  The
combination of the two might need further tweaking, but let's not worry
about that now.


