Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33557311198
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 20:57:23 +0100 (CET)
Received: from localhost ([::1]:43736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l87EH-0000xi-P1
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 14:57:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsoffer@redhat.com>)
 id 1l87DE-0000G5-7q
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 14:56:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:44536)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <nsoffer@redhat.com>)
 id 1l87DA-0003wQ-7y
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 14:56:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612554969;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aZYdnYmJZaMqNP1TEGs2zdSXFtP4Utflgs/so9LdSA4=;
 b=bKKp5xcbOz7tzAkMfwhyraSSr5ijvij/Ti4IjRw8EArw6QgCt6Ji0aI/soO8woTTuF8OFk
 tlgMadq1yFULs+HjlwaIEUhbu18/hlv0X+gbusuVR3n7caNgSY3fftNQ/ztyQ8SuSKO9VB
 4eZhwGafebUuk8sQfwmNC88MEuOiIU8=
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com
 [209.85.161.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-468-uRw4JuCfMeCFyQIT934IzQ-1; Fri, 05 Feb 2021 14:56:07 -0500
X-MC-Unique: uRw4JuCfMeCFyQIT934IzQ-1
Received: by mail-oo1-f70.google.com with SMTP id g190so4166864oob.13
 for <qemu-devel@nongnu.org>; Fri, 05 Feb 2021 11:56:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aZYdnYmJZaMqNP1TEGs2zdSXFtP4Utflgs/so9LdSA4=;
 b=fFNsA5V4/59Mzs0i4BhTQIfehtyDniyOxFRZRszWPaRfHrhT3TQZyo2dHvS67iPE32
 4rlc1pmLvSDxHVd0NDKivcBlcADp0TqyscOx61juG7LVOML9L3iGXeHK83ADpFgbWp3Z
 WDBqRdWV3LPBq62jgIDKXklGnqzwxbaKuNJkOmjx2Cv17nD4/PkqDNIs+gQ0fdwYgOp2
 jFKHYug9BSFJ9prBX6PkvJPNHBLTDa24pkSj8L7Na4HcEOCzAsQAd8DBFp+Yer5rTYW+
 2rkgcLXxTt3Nlw/cl0ZB2NXYPenk4KwVAxt71HsAk1sjcWC4U37/iomFqUib+4FEympF
 5ABA==
X-Gm-Message-State: AOAM532iyLOhWvAANveRF1XStwDgker7+oDKNN18GbUoMPJF1E9gEg6A
 V26YSNjTANQ1Q77XnCydF1WwJAYC8qvX4ei3FyfaBmcjIHBOGEWrRiZ4+vy1tDQ6YU37SB4Wqfg
 DmqC3nvhMoV0LVWcPbwX1LB8qngfbim0=
X-Received: by 2002:a54:4706:: with SMTP id k6mr4198613oik.56.1612554967005;
 Fri, 05 Feb 2021 11:56:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwY7QFYMC9qCOUTA9W1InvIkqSvZ6fhaYhcCmAe4Uc9x5TSl0mCpaf5Z5YraU8yXLfSpCiUcxOIDSenn5aYwFo=
X-Received: by 2002:a54:4706:: with SMTP id k6mr4198602oik.56.1612554966834;
 Fri, 05 Feb 2021 11:56:06 -0800 (PST)
MIME-Version: 1.0
References: <20210205185705.1502071-1-eblake@redhat.com>
In-Reply-To: <20210205185705.1502071-1-eblake@redhat.com>
From: Nir Soffer <nsoffer@redhat.com>
Date: Fri, 5 Feb 2021 21:55:50 +0200
Message-ID: <CAMRbyysEy9_qfLFHt-Q9H7DSc6v_hWuGWS0LD+uR7FyEvTbUew@mail.gmail.com>
Subject: Re: [PATCH v2] qemu-nbd: Use SOMAXCONN for socket listen() backlog
To: Eric Blake <eblake@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=nsoffer@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=nsoffer@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.352,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Daniel Berrange <berrange@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-block <qemu-block@nongnu.org>,
 Richard Jones <rjones@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Feb 5, 2021 at 8:57 PM Eric Blake <eblake@redhat.com> wrote:
>
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

Shouldn't we use value based on --shared=N?

Using maximum value makes sense for generic server expecting to handle many
connections from different clients. qemu-nbd is typically used by one
client, and we
need to make it possible to connect a known number of connections quickly.

> +                                       &local_err) < 0) {
>              object_unref(OBJECT(server));
>              error_report_err(local_err);
>              exit(EXIT_FAILURE);
> --
> 2.30.0
>
>


