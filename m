Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9511F686B38
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 17:11:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNFgt-0008SW-Cl; Wed, 01 Feb 2023 11:10:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pNFgk-0008R4-O9
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 11:10:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pNFgf-0007g7-Ch
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 11:10:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675267815;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wOTNJx5WI6Wit4VB+7pbs9T4NqXqlhP40cuIIK7nTCg=;
 b=R7RQ6wxn2oprRRVmETYrC45hhNhpvDK5FOwlL19bfrsMD5HeshH7tO6N9wFJgZd75ifs6i
 9tdBuWdMK4/OcEGbxPQc+/SkzsUnzlfPwD8e4Uh60PvBxsU/qxf7MGHy9REnTFcWDJZwPb
 1DtPsa3jNVjS7vkcJqbevhYMCAVxDck=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-220-1_kXdODYNuSpTt-QR02mTw-1; Wed, 01 Feb 2023 11:10:12 -0500
X-MC-Unique: 1_kXdODYNuSpTt-QR02mTw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C67F818E0046;
 Wed,  1 Feb 2023 16:10:10 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A1CFAC16020;
 Wed,  1 Feb 2023 16:10:10 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 850FC21E6A1F; Wed,  1 Feb 2023 17:10:09 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
Cc: Jonathan Cameron via <qemu-devel@nongnu.org>,  Michael Tsirkin
 <mst@redhat.com>,  Ben Widawsky <bwidawsk@kernel.org>,
 <linux-cxl@vger.kernel.org>,  <linuxarm@huawei.com>,  Ira Weiny
 <ira.weiny@intel.com>,  Alison Schofield <alison.schofield@intel.com>
Subject: Re: [RFC PATCH v2 1/3] hw/cxl: QMP based poison injection support
References: <20230201100350.23263-1-Jonathan.Cameron@huawei.com>
 <20230201100350.23263-2-Jonathan.Cameron@huawei.com>
 <87k011y44x.fsf@pond.sub.org> <20230201144512.00007b64@Huawei.com>
Date: Wed, 01 Feb 2023 17:10:09 +0100
In-Reply-To: <20230201144512.00007b64@Huawei.com> (Jonathan Cameron's message
 of "Wed, 1 Feb 2023 14:45:12 +0000")
Message-ID: <87zg9xs6xq.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Jonathan Cameron <Jonathan.Cameron@Huawei.com> writes:

> On Wed, 01 Feb 2023 13:14:06 +0100
> Markus Armbruster <armbru@redhat.com> wrote:

[...]

>> Both commit message and doc comment are rather terse.
>> 
>> The commit message should make the case for the feature: why do we want
>> it?  This typically involves explaining the problem(s) it solves.
>> 
>> The doc comment ideally explains intended use.
>
> OK. I'll expand on this. It'll be a bit of fuzzy text that
> boils down to we emulate so we can test the OS does the right thing
> when it gets poison related events. I can add some generic fluff on
> why a real device might implement this in the first place though
> I'm not sure that will even matter to anyone reading these docs.

Use your judgement :)


