Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F407231425C
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 22:55:07 +0100 (CET)
Received: from localhost ([::1]:47934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9EUt-0001Aa-0H
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 16:55:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l99fi-0008My-Dw
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 11:45:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27445)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l99fV-00068m-2g
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 11:45:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612802742;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7Nrf+H5C3SUm9QqX+jcA/JZhGMHMJ//sy1WRNOeat2A=;
 b=BiB4FMkNOHdyqeZTbgc6xtcF+wIPscWsVfNGdwr1Ie+anu3Y/hDKgN2ofUaJffLKGvNUBF
 T03JBr6/Y4+ZrZ96hI+XxtIGzfmuzpnTEscNTJNVZuknAvBpDNgF7wG5aYD8q0uXAs8M6e
 QjmKRqVT7WGw381jlHYc61TtIntJYFU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-335-t2kcsIlNOni2b3hzkTDrig-1; Mon, 08 Feb 2021 11:45:24 -0500
X-MC-Unique: t2kcsIlNOni2b3hzkTDrig-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BB1A61005501;
 Mon,  8 Feb 2021 16:45:23 +0000 (UTC)
Received: from [10.3.114.150] (ovpn-114-150.phx2.redhat.com [10.3.114.150])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4B4615D743;
 Mon,  8 Feb 2021 16:45:23 +0000 (UTC)
Subject: Re: [PATCH v2] qemu-nbd: Use SOMAXCONN for socket listen() backlog
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20210205185705.1502071-1-eblake@redhat.com>
 <20210208100004.GD1141037@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <d9771d16-dca1-b9bc-df24-2fb11568a825@redhat.com>
Date: Mon, 8 Feb 2021 10:45:22 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210208100004.GD1141037@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.265, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, rjones@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/8/21 4:00 AM, Daniel P. Berrangé wrote:
> On Fri, Feb 05, 2021 at 12:57:05PM -0600, Eric Blake wrote:
>> Our default of a backlog of 1 connection is rather puny, particularly
>> for scenarios where we expect multiple listeners to connect (such as
>> qemu-nbd -e X).  This is especially important for Unix sockets, as a
>> definite benefit to clients: at least on Linux, a client trying to
>> connect to a Unix socket with a backlog gets an EAGAIN failure with no
>> way to poll() for when the backlog is no longer present short of
>> sleeping an arbitrary amount of time before retrying.
>>
>> See https://bugzilla.redhat.com/1925045 for a demonstration of where
>> our low backlog prevents libnbd from connecting as many parallel
>> clients as it wants.
>>
>> Reported-by: Richard W.M. Jones <rjones@redhat.com>
>> Signed-off-by: Eric Blake <eblake@redhat.com>
>> ---
>>
>> v2: target the correct API used by qemu-nbd, rather than an unrelated
>> legacy wrapper [Dan]
>>
>>  qemu-nbd.c | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/qemu-nbd.c b/qemu-nbd.c
>> index 608c63e82a25..cd20ee73be19 100644
>> --- a/qemu-nbd.c
>> +++ b/qemu-nbd.c
>> @@ -965,7 +965,8 @@ int main(int argc, char **argv)
>>      server = qio_net_listener_new();
>>      if (socket_activation == 0) {
>>          saddr = nbd_build_socket_address(sockpath, bindto, port);
>> -        if (qio_net_listener_open_sync(server, saddr, 1, &local_err) < 0) {
>> +        if (qio_net_listener_open_sync(server, saddr, SOMAXCONN,
>> +                                       &local_err) < 0) {
> 
> This addresses qemu-nbd, but surely we want to be consistent with the
> QMP  nbd-server-start impl too, in blockdev-nbd.c
> 

Good point, I'll send v3.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


