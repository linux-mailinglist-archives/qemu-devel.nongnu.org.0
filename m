Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B03D2C8D7D
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Nov 2020 19:56:31 +0100 (CET)
Received: from localhost ([::1]:39940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjoLe-0002FV-3P
	for lists+qemu-devel@lfdr.de; Mon, 30 Nov 2020 13:56:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1kjoKK-0001RO-6N
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 13:55:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:53346)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1kjoKH-0005zp-Uh
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 13:55:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606762504;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YdpatX/z4s2hmW2/mUmyMhTAKCh5ko4D/hUZvz4jNZs=;
 b=LY+S/h5MrSHg9z0WGKOZAhfBDgdOJa1Jvg0/w64fkiNSfsJqFVuYMl7liFL+MM9dPJwjuQ
 OmIk9W46tte1xpSNjSkG9YdWwT1ELxwX3WJPkausLnw2P2nU7FbuDXWCHD24Kt/AgD0PxD
 XU7euXmedXj8T9UHTrEaqCvw5e77BiA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-588-PoKx2cHXMy2yEZsWn2YTdA-1; Mon, 30 Nov 2020 13:55:00 -0500
X-MC-Unique: PoKx2cHXMy2yEZsWn2YTdA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7F5AC107ACFC;
 Mon, 30 Nov 2020 18:54:58 +0000 (UTC)
Received: from [10.3.113.230] (ovpn-113-230.phx2.redhat.com [10.3.113.230])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0B1211001B2C;
 Mon, 30 Nov 2020 18:54:57 +0000 (UTC)
Subject: Re: [PATCH] qemu-nbd: Fix a memleak in qemu_nbd_client_list()
To: Alex Chen <alex.chen@huawei.com>
References: <20201130123651.17543-1-alex.chen@huawei.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <cc906011-a536-13ee-bd30-77887f919303@redhat.com>
Date: Mon, 30 Nov 2020 12:54:57 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201130123651.17543-1-alex.chen@huawei.com>
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
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.496,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, qemu-block@nongnu.org,
 zhang.zhanghailiang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/30/20 6:36 AM, Alex Chen wrote:
> When the qio_channel_socket_connect_sync() fails
> we should goto 'out' label to free the 'sioc' instead of return.
> 
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Alex Chen <alex.chen@huawei.com>
> ---
>  qemu-nbd.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

A local leak, but the only caller of qemu_nbd_client_list() is main()
which returns the value and thereby exits the program, so it is
inconsequential in the bigger picture.  I'll defer this to 6.0, and pick
it up through my NBD tree once that opens.

> 
> diff --git a/qemu-nbd.c b/qemu-nbd.c
> index a7075c5419..47587a709e 100644
> --- a/qemu-nbd.c
> +++ b/qemu-nbd.c
> @@ -181,7 +181,7 @@ static int qemu_nbd_client_list(SocketAddress *saddr, QCryptoTLSCreds *tls,
>      sioc = qio_channel_socket_new();
>      if (qio_channel_socket_connect_sync(sioc, saddr, &err) < 0) {
>          error_report_err(err);
> -        return EXIT_FAILURE;
> +        goto out;
>      }
>      rc = nbd_receive_export_list(QIO_CHANNEL(sioc), tls, hostname, &list,
>                                   &err);
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


