Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A57C31123F
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 21:21:58 +0100 (CET)
Received: from localhost ([::1]:34408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l87c5-0003NK-FF
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 15:21:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1l87aA-00020i-L5
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 15:19:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47358)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1l87a8-0005zV-WC
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 15:19:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612556396;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LLXxOpjbl3RvI1qQFufN6zEpaY8cWmrAGT3wMg1DQGc=;
 b=JPqDbSUqW8A32plnqO/abj+nMKEekhc1d6znyZT6Y637vNb1pNC8wlzBQ7U8MZ8J97Vbzl
 rKyp/1Lharg0XHV95GXg/ygLkiDPISWoC5aIKgf8EcfHw8MQC71hu0f1sL1EeUxCwJlUR/
 zNTDSDfd3yonvdYei+aQvdnDv24s/kc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-459-PK0-xrQ-P_yq2fey4op2ew-1; Fri, 05 Feb 2021 15:19:50 -0500
X-MC-Unique: PK0-xrQ-P_yq2fey4op2ew-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DF8B3107ACC7;
 Fri,  5 Feb 2021 20:19:49 +0000 (UTC)
Received: from localhost (ovpn-114-98.ams2.redhat.com [10.36.114.98])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8C28019727;
 Fri,  5 Feb 2021 20:19:49 +0000 (UTC)
Date: Fri, 5 Feb 2021 20:19:48 +0000
From: "Richard W.M. Jones" <rjones@redhat.com>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH v2] qemu-nbd: Use SOMAXCONN for socket listen() backlog
Message-ID: <20210205201948.GH30079@redhat.com>
References: <20210205185705.1502071-1-eblake@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210205185705.1502071-1-eblake@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=rjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=rjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.352,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: berrange@redhat.com, qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Feb 05, 2021 at 12:57:05PM -0600, Eric Blake wrote:
> Our default of a backlog of 1 connection is rather puny, particularly
> for scenarios where we expect multiple listeners to connect (such as
> qemu-nbd -e X).  This is especially important for Unix sockets, as a
> definite benefit to clients: at least on Linux, a client trying to
> connect to a Unix socket with a backlog gets an EAGAIN failure with no
> way to poll() for when the backlog is no longer present short of
> sleeping an arbitrary amount of time before retrying.
> 
> See https://bugzilla.redhat.com/1925045 for a demonstration of where
> our low backlog prevents libnbd from connecting as many parallel
> clients as it wants.
> 
> Reported-by: Richard W.M. Jones <rjones@redhat.com>
> Signed-off-by: Eric Blake <eblake@redhat.com>
> ---
> 
> v2: target the correct API used by qemu-nbd, rather than an unrelated
> legacy wrapper [Dan]
> 
>  qemu-nbd.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/qemu-nbd.c b/qemu-nbd.c
> index 608c63e82a25..cd20ee73be19 100644
> --- a/qemu-nbd.c
> +++ b/qemu-nbd.c
> @@ -965,7 +965,8 @@ int main(int argc, char **argv)
>      server = qio_net_listener_new();
>      if (socket_activation == 0) {
>          saddr = nbd_build_socket_address(sockpath, bindto, port);
> -        if (qio_net_listener_open_sync(server, saddr, 1, &local_err) < 0) {
> +        if (qio_net_listener_open_sync(server, saddr, SOMAXCONN,
> +                                       &local_err) < 0) {
>              object_unref(OBJECT(server));
>              error_report_err(local_err);
>              exit(EXIT_FAILURE);

This one works:

Tested-by: Richard W.M. Jones <rjones@redhat.com>

Rich.

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
virt-top is 'top' for virtual machines.  Tiny program with many
powerful monitoring features, net stats, disk stats, logging, etc.
http://people.redhat.com/~rjones/virt-top


