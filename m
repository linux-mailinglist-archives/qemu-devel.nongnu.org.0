Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF8CC327905
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 09:17:09 +0100 (CET)
Received: from localhost ([::1]:47176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGdjo-0007SH-Qf
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 03:17:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lGdia-0006vT-Gd
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 03:15:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:27335)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lGdiZ-0001C5-08
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 03:15:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614586550;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3GFNHKn64mxYIbxzqo3dXkRWfGA75vZnISv7ix2de4k=;
 b=ApI+DaD1LJIKoP2UECIHjcElY8Q1GQRMSqYh/Mt/KgLoQnaqZ1TZBelMwVMcBOC1nHqSRG
 d/o6dnDW79dF3Z4a4blex4/jDNU+Ls3qdMc/TdZM1/8TRtE1hI8hCZ2cVcbmII2yeq9fb3
 4pC9Z/jiKtF3mXi/EnAx7f5emxgzjuM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-358-s_KVhGwUPYSgCEFQ8G2inw-1; Mon, 01 Mar 2021 03:15:46 -0500
X-MC-Unique: s_KVhGwUPYSgCEFQ8G2inw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 46DAACC624;
 Mon,  1 Mar 2021 08:15:45 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-115-79.ams2.redhat.com
 [10.36.115.79])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EFB801A87C;
 Mon,  1 Mar 2021 08:15:44 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 847EA113860F; Mon,  1 Mar 2021 09:15:43 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Samuel Thibault <samuel.thibault@gnu.org>
Subject: Re: [PATCH v4 2/4] util/qemu-sockets.c: Split host:port parsing out
 of inet_parse
References: <20210228213957.xkc4cceh5o6rgd5n@begin>
Date: Mon, 01 Mar 2021 09:15:41 +0100
In-Reply-To: <20210228213957.xkc4cceh5o6rgd5n@begin> (Samuel Thibault's
 message of "Sun, 28 Feb 2021 22:39:57 +0100")
Message-ID: <87lfb7l26q.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>,
 "Daniel P. =?utf-8?Q?Berrang=C3=A9?=" <berrange@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Doug Evans <dje@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Samuel Thibault <samuel.thibault@gnu.org> writes:

> Hello,
>
> Daniel P. Berrang=C3=A9, le lun. 22 f=C3=A9vr. 2021 09:39:41 +0000, a ecr=
it:
>> In general callers shouldn't care about which format was parsed. The use
>> of [] is just a mechanism to reliably separate the port from the address=
.
>> Once you have the address part getaddrinfo() will reliably parse the
>> address into a sockaddr struct on its own.
>
> Agreed.
>
>> The is_v6 flag is only needed
>> for the legacy compat needs in slirp, even that is only if we want to=20
>> have strict equivalence with historical behaviour, as opposed to changin=
g
>> empty string to mean to listen on both IPv4+6 concurrently..
>
> I would say that empty address meaning ipv4+6 looks better to me.
>
> Doug Evans, le lun. 22 f=C3=A9vr. 2021 09:55:09 -0800, a ecrit:
>> Hi guys. I think before I submit yet another patchset in this series I n=
eed
>> someone with authority to define the user API for ipv6 host forwarding.
>> Since the hostfwd syntax is parsed in net/slirp.c, Samuel I think that m=
eans
>> you (based on what I'm reading in MAINTAINERS).
>
> Well, I'm not maintainer of the user API actually. That'd rather be
> Markus Armbruster, now Cc-ed, who devises the command-line options,
> QAPI, etc.

I rarely devise, I just try to keep things sane by reviewing and
advising, with the help of others.

>> Based on what Maxim originally wrote I was going with addresses wrapped =
in []
>> mean ipv6, but Daniel does not want that.
>
> Specifying [127.0.0.1] would be odd, but for instance=20
>
> ssh localhost -D '[127.0.0.1]':23456
>
> happens to listen on 127.0.0.1. So I would say that common practice
> really is that [] only matters for syntax, and not semantic.

I believe common syntactic practice is to use [brackets] only around
numeric IPv6 addresses.  E.g. socat(1):

       IP address
              An IPv4 address in numbers-and-dots notation, an IPv6 address=
 in
              hex notation enclosed in brackets, or a hostname  that  resol=
ves
              to an IPv4 or an IPv6 address.
              Examples: 127.0.0.1, [::1], www.dest-unreach.org, dns1

[...]


