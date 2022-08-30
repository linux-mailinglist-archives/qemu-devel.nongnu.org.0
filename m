Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C99BB5A610D
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Aug 2022 12:47:58 +0200 (CEST)
Received: from localhost ([::1]:55864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oSymj-0005nT-Uu
	for lists+qemu-devel@lfdr.de; Tue, 30 Aug 2022 06:47:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oSyiQ-0002vi-Ts
 for qemu-devel@nongnu.org; Tue, 30 Aug 2022 06:43:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49402)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oSyiO-0007U8-M4
 for qemu-devel@nongnu.org; Tue, 30 Aug 2022 06:43:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661856208;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GSDlrqQX2m0SYwMrQixVicOX4kQkhMgAjwbu4ZcBEB8=;
 b=cxxqYl/cQ0DPa7yyopsWyfi/5qMoNVJF+bGsDjmyxELlQ+Y0XbeBjg5ZgPIineUqyTta4i
 2zgaVltY04ot9I8s4r+uVZ9KFz0gTvC+I9APNQXRyE4s4BiegxG0eQLYnLiWrk0VQXiQax
 1dbZbiCJlboAfbNru29fCYvHInm8WzE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-632-55gUnCCVP12xNSDI--i-BQ-1; Tue, 30 Aug 2022 06:43:25 -0400
X-MC-Unique: 55gUnCCVP12xNSDI--i-BQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 91D19185A7B2;
 Tue, 30 Aug 2022 10:43:24 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.166])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6CB771410F37;
 Tue, 30 Aug 2022 10:43:24 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 54F4521E6900; Tue, 30 Aug 2022 12:43:23 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: David Gibson <david@gibson.dropbear.id.au>
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,  qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org,  clg@kaod.org,  alistair.francis@wdc.com,  "Dr .
 David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH for-7.2 v4 15/21] qmp/hmp, device_tree.c: introduce
 'info fdt' command
References: <20220826141150.7201-1-danielhb413@gmail.com>
 <20220826141150.7201-16-danielhb413@gmail.com>
 <YwwzyxSCB8rP/usi@yekko>
 <45bd4519-1529-c147-cd99-c68e1045d2f2@gmail.com>
 <Yw1s6A3zCa8hjFAl@yekko>
Date: Tue, 30 Aug 2022 12:43:23 +0200
In-Reply-To: <Yw1s6A3zCa8hjFAl@yekko> (David Gibson's message of "Tue, 30 Aug
 2022 11:50:32 +1000")
Message-ID: <877d2qj9kk.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

David Gibson <david@gibson.dropbear.id.au> writes:

> On Mon, Aug 29, 2022 at 07:00:55PM -0300, Daniel Henrique Barboza wrote:
>> 
>> 
>> On 8/29/22 00:34, David Gibson wrote:
>> > On Fri, Aug 26, 2022 at 11:11:44AM -0300, Daniel Henrique Barboza wrote:
>> > > Reading the FDT requires that the user saves the fdt_blob and then use
>> > > 'dtc' to read the contents. Saving the file and using 'dtc' is a strong
>> > > use case when we need to compare two FDTs, but it's a lot of steps if
>> > > you want to do quick check on a certain node or property.
>> > > 
>> > > 'info fdt' retrieves FDT nodes (and properties, later on) and print it
>> > > to the user. This can be used to check the FDT on running machines
>> > > without having to save the blob and use 'dtc'.
>> > > 
>> > > The implementation is based on the premise that the machine thas a FDT
>> > > created using libfdt and pointed by 'machine->fdt'. As long as this
>> > > pre-requisite is met the machine should be able to support it.
>> > > 
>> > > For now we're going to add the required QMP/HMP boilerplate and the
>> > > capability of printing the name of the properties of a given node. Next
>> > > patches will extend 'info fdt' to be able to print nodes recursively,
>> > > and then individual properties.
>> > > 
>> > > This command will always be executed in-band (i.e. holding BQL),
>> > > avoiding potential race conditions with machines that might change the
>> > > FDT during runtime (e.g. PowerPC 'pseries' machine).
>> > > 
>> > > 'info fdt' is not something that we expect to be used aside from debugging,
>> > > so we're implementing it in QMP as 'x-query-fdt'.
>> > > 
>> > > This is an example of 'info fdt' fetching the '/chosen' node of the
>> > > pSeries machine:
>> > > 
>> > > (qemu) info fdt /chosen
>> > > chosen {
>> > >      ibm,architecture-vec-5;
>> > >      rng-seed;
>> > >      ibm,arch-vec-5-platform-support;
>> > >      linux,pci-probe-only;
>> > >      stdout-path;
>> > >      linux,stdout-path;
>> > >      qemu,graphic-depth;
>> > >      qemu,graphic-height;
>> > >      qemu,graphic-width;
>> > > };
>> > > 
>> > > And the same node for the aarch64 'virt' machine:
>> > > 
>> > > (qemu) info fdt /chosen
>> > > chosen {
>> > >      stdout-path;
>> > >      rng-seed;
>> > >      kaslr-seed;
>> > > };
>> > 
>> > So, I'm reasonably convinced allowing dumping the whole dtb from
>> > qmp/hmp is useful.  I'm less convined that info fdt is worth the
>> > additional complexity it incurs.  Note that as well as being able to
>> > decompile a whole dtb using dtc, you can also extract and list
>> > specific properties from a dtb blob using the 'fdtget' tool which is
>> > part of the dtc tree.
>> 
>> What's your opinion on patch 21/21, where 'dumpdtb' can write a formatted
>> FDT in a file with an extra option? That was possible because of the
>> format helpers introduced for 'info fdt'. The idea is that since we're
>> able to format a FDT in DTS format, we can also write the FDT in text
>> format without relying on DTC to decode it.
>
> Since it's mostly the same code, I think it's reasonable to throw in
> if the info fdt stuff is there, but I don't think it's worth including
> without that.  As a whole, I remain dubious that (info fdt + dumpdts)
> is worth the complexity cost.

How much code does it take, and who's going to maintain it?

> People with more practical experience debugging the embedded ARM
> platforms might have a different opinion if they thing info fdt would
> be really useful though.

They better speak up then :)

>> If we think that this 'dumpdtb' capability is worth having, I can respin
>> the patches without 'info fdt' but adding these helpers to enable this
>> 'dumpdtb' support. If not, then we can just remove patches 15-21 and
>> be done with it.
>> 
>> 
>> Thanks,
>> 
>> 
>> Daniel


