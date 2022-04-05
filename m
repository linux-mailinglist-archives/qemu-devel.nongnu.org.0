Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 011114F350A
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Apr 2022 15:43:05 +0200 (CEST)
Received: from localhost ([::1]:46818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbjSZ-0008Ff-MG
	for lists+qemu-devel@lfdr.de; Tue, 05 Apr 2022 09:43:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nbjRa-0007Yk-0H
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 09:42:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28278)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nbjRW-0003nW-LF
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 09:42:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649166117;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9SMf3YY1I3dUwlFz96C1rsqKlIAyO743R5VQnaSrKUs=;
 b=Nq8OwFL9wFzxsPTHjFAVUi8aD7XHl1X0rtIeXOhULJlxTJpijHhalMi+2hY7CA6orHsbiF
 KhQFjCkQGKUeAf5MF4NSN3yYhL/Nh6E36DO9VFS4FoxunMnMx0ygxFLDPZoT1CJirL6Ehi
 mITQAo/xTZWKJscgJ5+mkDQstKJIDGo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-449-L-PbSyqDMum_KoabL6A9lg-1; Tue, 05 Apr 2022 09:41:54 -0400
X-MC-Unique: L-PbSyqDMum_KoabL6A9lg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4224985A5A8;
 Tue,  5 Apr 2022 13:41:53 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C70F540CFD05;
 Tue,  5 Apr 2022 13:41:52 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id A34A721E6906; Tue,  5 Apr 2022 15:41:51 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: Re: [PATCH v9 27/45] hw/cxl/host: Add support for CXL Fixed Memory
 Windows.
References: <20220404151445.10955-1-Jonathan.Cameron@huawei.com>
 <20220404151445.10955-28-Jonathan.Cameron@huawei.com>
Date: Tue, 05 Apr 2022 15:41:51 +0200
In-Reply-To: <20220404151445.10955-28-Jonathan.Cameron@huawei.com> (Jonathan
 Cameron's message of "Mon, 4 Apr 2022 16:14:27 +0100")
Message-ID: <87v8vn4pgg.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alison Schofield <alison.schofield@intel.com>, "Michael
 S . Tsirkin" <mst@redhat.com>, Samarth Saxena <samarths@cadence.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, linuxarm@huawei.com,
 linux-cxl@vger.kernel.org, Adam Manzanares <a.manzanares@samsung.com>,
 dave@stgolabs.net, David Hildenbrand <david@redhat.com>,
 Marcel Apfelbaum <marcel@redhat.com>, Tong Zhang <t.zhang2@samsung.com>,
 Chris Browy <cbrowy@avery-design.com>, Saransh Gupta1 <saransh@ibm.com>,
 qemu-devel@nongnu.org, Shreyas Shah <shreyas.shah@elastics.cloud>,
 Peter Xu <peterx@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Alex =?utf-8?Q?Benn?= =?utf-8?Q?=C3=A9e?= <alex.bennee@linaro.org>,
 Ben Widawsky <ben.widawsky@intel.com>,
 "k . jensen @ samsung . com" <k.jensen@samsung.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Jonathan Cameron <Jonathan.Cameron@huawei.com> writes:

> From: Jonathan Cameron <jonathan.cameron@huawei.com>
>
> The concept of these is introduced in [1] in terms of the
> description the CEDT ACPI table. The principal is more general.
> Unlike once traffic hits the CXL root bridges, the host system
> memory address routing is implementation defined and effectively
> static once observable by standard / generic system software.
> Each CXL Fixed Memory Windows (CFMW) is a region of PA space
> which has fixed system dependent routing configured so that
> accesses can be routed to the CXL devices below a set of target
> root bridges. The accesses may be interleaved across multiple
> root bridges.
>
> For QEMU we could have fully specified these regions in terms
> of a base PA + size, but as the absolute address does not matter
> it is simpler to let individual platforms place the memory regions.
>
> ExampleS:
> -cxl-fixed-memory-window targets.0=cxl.0,size=128G
> -cxl-fixed-memory-window targets.0=cxl.1,size=128G
> -cxl-fixed-memory-window targets.0=cxl0,targets.1=cxl.1,size=256G,interleave-granularity=2k
>
> Specifies
> * 2x 128G regions not interleaved across root bridges, one for each of
>   the root bridges with ids cxl.0 and cxl.1
> * 256G region interleaved across root bridges with ids cxl.0 and cxl.1
> with a 2k interleave granularity.
>
> When system software enumerates the devices below a given root bridge
> it can then decide which CFMW to use. If non interleave is desired
> (or possible) it can use the appropriate CFMW for the root bridge in
> question.  If there are suitable devices to interleave across the
> two root bridges then it may use the 3rd CFMS.
>
> A number of other designs were considered but the following constraints
> made it hard to adapt existing QEMU approaches to this particular problem.
> 1) The size must be known before a specific architecture / board brings
>    up it's PA memory map.  We need to set up an appropriate region.
> 2) Using links to the host bridges provides a clean command line interface
>    but these links cannot be established until command line devices have
>    been added.
>
> Hence the two step process used here of first establishing the size,
> interleave-ways and granularity + caching the ids of the host bridges
> and then, once available finding the actual host bridges so they can
> be used later to support interleave decoding.
>
> [1] CXL 2.0 ECN: CEDT CFMWS & QTG DSM (computeexpresslink.org / specifications)
>
> Signed-off-by: Jonathan Cameron <jonathan.cameron@huawei.com>

QAPI schema
Acked-by: Markus Armbruster <armbru@redhat.com>


