Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FF6A2B2098
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Nov 2020 17:37:32 +0100 (CET)
Received: from localhost ([::1]:49206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdc4p-0002k7-FL
	for lists+qemu-devel@lfdr.de; Fri, 13 Nov 2020 11:37:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kdc3R-0002BN-SO
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 11:36:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43919)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kdc3O-00069F-Dv
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 11:36:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605285361;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cUiGeABRLOEHEmNTolIVpg7jOaKnbVyF769LKLe6KEc=;
 b=DqtPtk3jTtHLYbpPSpqFddLl/a824Pzfh+NUc7OPkGySjqxJ/9DlvMm5Lw1zNHlC/2u2Z8
 YomZ2TMpj+1pyzRortz3kYDjLjxCSK7xaGAkV+Jsoj+9Hb7ljSwLEASBledxgPUlJYjPrh
 g09SiEJ/k2rWGQaL3d9sK1h1pkZ6TlE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-399-uFTT1fKVOeCCEYhFZga3mA-1; Fri, 13 Nov 2020 11:35:59 -0500
X-MC-Unique: uFTT1fKVOeCCEYhFZga3mA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 22790805EFC;
 Fri, 13 Nov 2020 16:35:57 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-114-96.ams2.redhat.com
 [10.36.114.96])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EDF4A5C1C7;
 Fri, 13 Nov 2020 16:35:55 +0000 (UTC)
Subject: Re: [PATCH v3 2/2] quorum: Implement bdrv_co_pwrite_zeroes()
To: Alberto Garcia <berto@igalia.com>, qemu-devel@nongnu.org
References: <cover.1605111801.git.berto@igalia.com>
 <2faad461e6bffc4a50547547b8c20c39e0f544e8.1605111801.git.berto@igalia.com>
 <5b5e73f3-a045-268d-e82a-f652668a8f02@redhat.com>
 <w51a6vlfdf1.fsf@maestria.local.igalia.com>
 <552f29f1-5b6a-82d3-a55f-100b460bcc6a@redhat.com>
 <w517dqpfckl.fsf@maestria.local.igalia.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <9a429c8a-c053-79fa-dc7f-e8650f1cdb77@redhat.com>
Date: Fri, 13 Nov 2020 17:35:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <w517dqpfckl.fsf@maestria.local.igalia.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 08:00:44
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Tao Xu <tao3.xu@intel.com>,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 13.11.20 17:26, Alberto Garcia wrote:
> On Fri 13 Nov 2020 05:11:20 PM CET, Max Reitz wrote:
> 
>>> We could set all supported_zero_flags as long as all children support
>>> them, right?
>>
>> Sure, I was just thinking that we could set these regardless of
>> whether the children support them, because (on zero-writes) the block
>> layer will figure out for us whether the child nodes support them. O:)
> 
> But it can happen that one child supports e.g. BDRV_REQ_NO_FALLBACK but
> the rest don't. In this case I think the block layer should return
> -ENOTSUP earlier without writing to the child(ren) that do support that
> flag.

That’s true.

> So Quorum's supported_zero_flags would be the logical and of all of its
> children's flags, right?

Yes.  (And so it would need to be recalculated whenever a child is added 
or removed.)

> I'm unsure about BDRV_REQ_WRITE_UNCHANGED, many filters set that on top
> of the other flags, but when would a BDS not support this flag?

The WRITE_UNCHANGED flag is basically just a hint for the permission 
system that for such a write, the WRITE_UNCHANGED permission is 
sufficient.  So drivers that can pass through *all* WRITE_UNCHANGED 
requests as they are (i.e., filter drivers) can support this write/zero 
flag and then pass that flag on.  This way, they are safe not to take 
the WRITE permission on their child unless their parent has taken the 
WRITE permission on them.

(Otherwise, they’d also have to take the WRITE permission if the parent 
only holds the WRITE_UNCHANGED permission.)

Supporting this flag doesn’t make sense for drivers that won’t be able 
to pass it on all the time.  For example, qcow2 generally cannot pass it 
on, because it still needs to perform WRITE_UNCHANGED requests as normal 
writes.  (WRITE_UNCHANGED comes from copy-on-read; the data will read 
the same, hence the _UNCHANGED, but it still needs to be allocated on 
the receiving format layer.)

(Technically, qcow2 could figure out whether the requests it generates 
from a WRITE_UNCHANGED request still result in unchanging writes in the 
protocol layer, but there is no reason to.  It needs the WRITE 
permission anyway, because there are going to be some non-unchanging 
writes it has to perform.  And if it holds the WRITE permission, there 
is no need to bother with the WRITE_UNCHANGED flag.)

>>> pwrite_zeroes() does this additionaly:
>>>
>>>       if (!(child->bs->open_flags & BDRV_O_UNMAP)) {
>>>           flags &= ~BDRV_REQ_MAY_UNMAP;
>>>       }
>>
>> Interesting.  Technically, Quorum doesn’t support that flag (in
>> supported_zero_flags O:))), so it shouldn’t appear, but, er, well
>> then.
> 
> It would with the change that I'm proposing above.

Yes, I know.  Hence the “O:)”. O:)

Max


