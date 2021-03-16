Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B761033D4F2
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 14:36:47 +0100 (CET)
Received: from localhost ([::1]:36612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lM9sM-0005ap-QW
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 09:36:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lM9r5-0004wm-GV
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 09:35:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60407)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lM9r3-0006PM-NH
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 09:35:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615901724;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jlJ8NyvbAUZfwlw/NMErheH42YZsz5w2LFZRcHddi14=;
 b=SoRidXJCX89fSDIa0kI/TCmomceD9vBd0gYXtz283vIFOyvy9RHxCVbXUhGhliY83gn3+L
 bseH94F7VPK+EnOxTFoSdtI1Aw2vg0suKLIXZVfvhV6RaoTKw1J/vT1HYFfZFack3seQZu
 MV3yyETQXZrNyQM5DapA/d5H9Vn17mk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-273-OlpRAOw0MTipS9fgAKZiVg-1; Tue, 16 Mar 2021 09:35:22 -0400
X-MC-Unique: OlpRAOw0MTipS9fgAKZiVg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9EF5718D6A36
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 13:35:21 +0000 (UTC)
Received: from [10.3.113.66] (ovpn-113-66.phx2.redhat.com [10.3.113.66])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 012FB5C1A1;
 Tue, 16 Mar 2021 13:35:14 +0000 (UTC)
Subject: Re: [PATCH] sockets: update SOCKET_ADDRESS_TYPE_FD listen(2) backlog
To: Stefan Hajnoczi <stefanha@redhat.com>, kraxel@redhat.com,
 Daniel Berrange <berrange@redhat.com>
References: <20210310173004.420190-1-stefanha@redhat.com>
 <YFB17aYnCZlyp8b4@stefanha-x1.localdomain>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <2e7bb28d-0b3c-ac69-7984-687d4ee487c7@redhat.com>
Date: Tue, 16 Mar 2021 08:35:14 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <YFB17aYnCZlyp8b4@stefanha-x1.localdomain>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 "Richard W . M . Jones" <rjones@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/16/21 4:10 AM, Stefan Hajnoczi wrote:
> On Wed, Mar 10, 2021 at 05:30:04PM +0000, Stefan Hajnoczi wrote:
>> socket_get_fd() fails with the error "socket_get_fd: too many
>> connections" if the given listen backlog value is not 1.
>>
>> Not all callers set the backlog to 1. For example, commit
>> 582d4210eb2f2ab5baac328fe4b479cd86da1647 ("qemu-nbd: Use SOMAXCONN for
>> socket listen() backlog") uses SOMAXCONN. This will always fail with in
>> socket_get_fd().
>>
>> This patch calls listen(2) on the fd to update the backlog value. The
>> socket may already be in the listen state. I have tested that this works
>> on Linux 5.10 and macOS Catalina.
>>
>> As a bonus this allows us to detect when the fd cannot listen. Now we'll
>> be able to catch unbound or connected fds in socket_listen().
>>
>> Drop the num argument from socket_get_fd() since this function is also
>> called by socket_connect() where a listen backlog value does not make
>> sense.
>>
>> Fixes: e5b6353cf25c99c3f08bf51e29933352f7140e8f ("socket: Add backlog parameter to socket_listen")
>> Reported-by: Richard W.M. Jones <rjones@redhat.com>
>> Cc: Juan Quintela <quintela@redhat.com>
>> Cc: Eric Blake <eblake@redhat.com>
>> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
>> ---
>>  util/qemu-sockets.c | 29 ++++++++++++++++++++++-------
>>  1 file changed, 22 insertions(+), 7 deletions(-)
> 
> Dan and Gerd: Can this go via one of your trees?
> 

As it showed up as a regression in qemu-nbd, I can also consider queuing
it in my NBD tree.  However, I claim it counts as a bug fix, so it is
fine for -rc1 even if it misses soft freeze.

I'm fine whichever maintainer takes this, although I've now flagged it
to go through an NBD pull request if it doesn't land elsewhere sooner.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


