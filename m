Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D2B031538B
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 17:15:02 +0100 (CET)
Received: from localhost ([::1]:41918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9VfI-00025b-Td
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 11:15:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l9Vcw-0000Rv-04
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 11:12:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:54488)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l9Vct-0006Pu-2R
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 11:12:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612887150;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gl8LCDm44x9Y0C5OIt1reKyHwfmhQWB2XzQqpetO8X0=;
 b=OrkJBXQJecVtjWYS9nMbAR8Kd5pZmyaFXwrba704fnVMg+SuLlBkuTk/y11eLApFb/kg36
 BAXUvsOKewFNYnHMMofudMxMDnmZELqJvQudVYh4fOpwolljvlS/M6B377ZGDlAqraBNta
 MciPqkcO4KP+5kwlhRDIPbuD64/bHCc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-548-V6LETS3aOB-HsWjxPUsTgw-1; Tue, 09 Feb 2021 11:12:25 -0500
X-MC-Unique: V6LETS3aOB-HsWjxPUsTgw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 03213803F4A;
 Tue,  9 Feb 2021 16:12:24 +0000 (UTC)
Received: from [10.3.114.150] (ovpn-114-150.phx2.redhat.com [10.3.114.150])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 606B5101E679;
 Tue,  9 Feb 2021 16:12:23 +0000 (UTC)
Subject: Re: [PATCH v3 1/2] qemu-nbd: Use SOMAXCONN for socket listen() backlog
To: "Richard W.M. Jones" <rjones@redhat.com>
References: <20210209152759.209074-1-eblake@redhat.com>
 <20210209152759.209074-2-eblake@redhat.com>
 <20210209160851.GA30079@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <c90479e6-e4cb-c6d6-97ac-4500829f747a@redhat.com>
Date: Tue, 9 Feb 2021 10:12:22 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210209160851.GA30079@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.265, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, berrange@redhat.com, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, qemu-stable@nongnu.org, nsoffer@redhat.com,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/9/21 10:08 AM, Richard W.M. Jones wrote:
> On Tue, Feb 09, 2021 at 09:27:58AM -0600, Eric Blake wrote:
>> Our default of a backlog of 1 connection is rather puny; it gets in
>> the way when we are explicitly allowing multiple clients (such as
>> qemu-nbd -e N [--shared], or nbd-server-start with its default
>> "max-connections":0 for unlimited), but is even a problem when we
>> stick to qemu-nbd's default of only 1 active client but use -t
>> [--persistent] where a second client can start using the server once
>> the first finishes.  While the effects are less noticeable on TCP
>> sockets (since the client can poll() to learn when the server is ready
>> again), it is definitely observable on Unix sockets, where on Unix, a

s/where on Unix/where on Linux/

>> client will fail with EAGAIN and no recourse but to sleep an arbitrary
>> amount of time before retrying if the server backlog is already full.
>>
>> Since QMP nbd-server-start is always persistent, it now always
>> requests a backlog of SOMAXCONN; meanwhile, qemu-nbd will request
>> SOMAXCONN if persistent, otherwise its backlog should be based on the
>> expected number of clients.
>>
>> See https://bugzilla.redhat.com/1925045 for a demonstration of where
>> our low backlog prevents libnbd from connecting as many parallel
>> clients as it wants.
>>
>> Reported-by: Richard W.M. Jones <rjones@redhat.com>
>> Signed-off-by: Eric Blake <eblake@redhat.com>
>> CC: qemu-stable@nongnu.org
>> ---
>>  blockdev-nbd.c |  7 ++++++-
>>  qemu-nbd.c     | 10 +++++++++-
>>  2 files changed, 15 insertions(+), 2 deletions(-)
>>

> 
> Works fine here, so:
> 
> Tested-by: Richard W.M. Jones <rjones@redhat.com>
> 

Thanks for testing.

> Rich.
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


