Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FE18317386
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 23:39:45 +0100 (CET)
Received: from localhost ([::1]:49562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9y9A-0006kk-GL
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 17:39:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l9xv8-0003jb-QE
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 17:25:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30720)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l9xuz-0000Fp-OB
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 17:25:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612995900;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=91KhoF4p71S43HANAGrySHcTG/DantubCWzyKbBSEvQ=;
 b=dMvZ+mgVi7geOxcwretSJ9Gc/0/1CBV8RnxaSjkmQpIWUIS2uiSQIA5T2hpwJFQXl69jYi
 jzot1ownzavC0YjiX1iAN4K65fJbTFkz7tW66t1USJJY6j4skUx/w7lpjnW4KESaZH7HNn
 2NV0wkCKyQXcpfmMaCBuuyncsyIVzGM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-453-G_LzrzsJM6-fo7v5hXVVTw-1; Wed, 10 Feb 2021 17:24:55 -0500
X-MC-Unique: G_LzrzsJM6-fo7v5hXVVTw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 516001966320;
 Wed, 10 Feb 2021 22:24:54 +0000 (UTC)
Received: from [10.3.114.150] (ovpn-114-150.phx2.redhat.com [10.3.114.150])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AF69B1A26A;
 Wed, 10 Feb 2021 22:24:53 +0000 (UTC)
Subject: Re: [PATCH v3 1/2] qemu-nbd: Use SOMAXCONN for socket listen() backlog
To: Nir Soffer <nsoffer@redhat.com>
References: <20210209152759.209074-1-eblake@redhat.com>
 <20210209152759.209074-2-eblake@redhat.com>
 <CAMRbyysfzGJdnYq8uieB=7qXz8Xpno1cUF0RJnreiME0opedSA@mail.gmail.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <35c9fb61-e007-035f-1d37-711436326823@redhat.com>
Date: Wed, 10 Feb 2021 16:24:52 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <CAMRbyysfzGJdnYq8uieB=7qXz8Xpno1cUF0RJnreiME0opedSA@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.568,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.211, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Daniel Berrange <berrange@redhat.com>,
 qemu-block <qemu-block@nongnu.org>, Richard Jones <rjones@redhat.com>,
 qemu-stable@nongnu.org, QEMU Developers <qemu-devel@nongnu.org>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/10/21 10:58 AM, Nir Soffer wrote:
> On Tue, Feb 9, 2021 at 5:28 PM Eric Blake <eblake@redhat.com> wrote:
>>
>> Our default of a backlog of 1 connection is rather puny; it gets in
>> the way when we are explicitly allowing multiple clients (such as
>> qemu-nbd -e N [--shared], or nbd-server-start with its default
>> "max-connections":0 for unlimited), but is even a problem when we
>> stick to qemu-nbd's default of only 1 active client but use -t
>> [--persistent] where a second client can start using the server once
>> the first finishes.  While the effects are less noticeable on TCP
>> sockets (since the client can poll() to learn when the server is ready
>> again), it is definitely observable on Unix sockets, where on Unix, a
>> client will fail with EAGAIN and no recourse but to sleep an arbitrary
>> amount of time before retrying if the server backlog is already full.
>>
>> Since QMP nbd-server-start is always persistent, it now always
>> requests a backlog of SOMAXCONN;
> 
> This makes sense since we don't limit the number of connections.
> 
>> meanwhile, qemu-nbd will request
>> SOMAXCONN if persistent, otherwise its backlog should be based on the
>> expected number of clients.
> 
> If --persistent is used without --shared, we allow only one concurrent
> connection, so not clear why we need maximum backlog.

We only allow one active connection, but other clients can queue up to
also take advantage of the server once the first client disconnects.  A
larger backlog allows those additional clients to reach the point where
they can poll() for activity, rather than getting EAGAIN failures.

> 
> I think that separating --persistent and --shared would be easier to
> understand and use. The backlog will always be based on shared value.
> 

>> +++ b/qemu-nbd.c
>> @@ -964,8 +964,16 @@ int main(int argc, char **argv)
>>
>>      server = qio_net_listener_new();
>>      if (socket_activation == 0) {
>> +        int backlog;
>> +
>> +        if (persistent) {
>> +            backlog = SOMAXCONN;
> 
> This increases the backlog, but since default shared is still 1, we will
> not accept more than 1 connection, so not clear why SOMAXCONN
> is better.

While we aren't servicing the next client yet, we are at least allowing
them to make it further in their connection by supporting a backlog.


-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


