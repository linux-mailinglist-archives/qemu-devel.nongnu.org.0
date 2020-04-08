Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D25851A27F8
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Apr 2020 19:30:34 +0200 (CEST)
Received: from localhost ([::1]:39050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jMEX3-0001kk-Cm
	for lists+qemu-devel@lfdr.de; Wed, 08 Apr 2020 13:30:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50338)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berto@igalia.com>) id 1jMEW0-00012h-Nb
 for qemu-devel@nongnu.org; Wed, 08 Apr 2020 13:29:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berto@igalia.com>) id 1jMEVz-0007Zc-J9
 for qemu-devel@nongnu.org; Wed, 08 Apr 2020 13:29:28 -0400
Received: from fanzine.igalia.com ([178.60.130.6]:58026)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <berto@igalia.com>)
 id 1jMEVz-0007F7-1y; Wed, 08 Apr 2020 13:29:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From;
 bh=D+Waiksr+Ld8zVoAHvNaG7ieSfN/LEHqEsnOTmdYolA=; 
 b=ZNeEvGJ+qiqaheTQlBPkyvX2AWq0oSFIyHeNQynxnC+G+655jUreoXsCjRdBGdFBbZ+F4ufMZgcoudIaeNueQamnujOXZwmsGVTCVB6rc0X6dV226gheDAjsEHdATTtbsPbvDrAqFxfE3rb+V+58BFrxEH+cl2c/4rLskpPSmBqLgoOy9LQYfJFy28lw85QKti+6Wz/0rBFSeus1k+VAfpW/FdHx/pPulo4xj68vjCjZtjnHOh4cjW7mP6QQKj4wRl3xioibvkRKtGDLhMw1iNP0w3hGEKVTKbkMfaLluP8EtGuscCa4qWSbnKy3mJ0Vn3nkJmCKahAm68Qg2NuIjA==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine.igalia.com with esmtps 
 (Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
 id 1jMEVf-0004c0-Gg; Wed, 08 Apr 2020 19:29:07 +0200
Received: from berto by mail.igalia.com with local (Exim)
 id 1jMEVf-0005Qu-6b; Wed, 08 Apr 2020 19:29:07 +0200
From: Alberto Garcia <berto@igalia.com>
To: Max Reitz <mreitz@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH v4 02/30] qcow2: Convert qcow2_get_cluster_offset() into
 qcow2_get_host_offset()
In-Reply-To: <2f8f3cba-d4e4-49f2-722f-fc6cc96bdd65@redhat.com>
References: <cover.1584468723.git.berto@igalia.com>
 <65243debd4a41e1ebd13877c2e6c665759c37b38.1584468723.git.berto@igalia.com>
 <2f8f3cba-d4e4-49f2-722f-fc6cc96bdd65@redhat.com>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
 (i586-pc-linux-gnu)
Date: Wed, 08 Apr 2020 19:29:07 +0200
Message-ID: <w51zhblubrw.fsf@maestria.local.igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
 timestamps) [generic] [fuzzy]
X-Received-From: 178.60.130.6
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
Cc: Kevin Wolf <kwolf@redhat.com>, Anton Nefedov <anton.nefedov@virtuozzo.com>,
 qemu-block@nongnu.org, Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "Denis V . Lunev" <den@openvz.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed 08 Apr 2020 12:51:24 PM CEST, Max Reitz wrote:
>> -        if (has_data_file(bs) && *cluster_offset !=3D offset - offset_i=
n_cluster)
>> +        if (has_data_file(bs) && *host_offset !=3D offset - offset_in_c=
luster)
>>          {
>
> (1) The { should be moved to the preceding line;
>
> (2) I think it makes more sense to move the
> =E2=80=9C*host_offset +=3D offset_in_cluster=E2=80=9D before this conditi=
on, so it becomes
> =E2=80=9C... && *host_offset !=3D offset=E2=80=9D.
>
>>              qcow2_signal_corruption(bs, true, -1, -1,
>>                                      "External data file host cluster of=
fset %#"
>
> (Maybe we then need to drop the =E2=80=9Ccluster=E2=80=9D from this line,=
 but other than
> that, it would fit with this error message.)

The reason why I have =E2=80=9C*host_offset +=3D offset_in_cluster=E2=80=9D=
 after the
condition is precisely to keep the cluster-aligned offset in the error
message. But of course I could also use start_of_cluster() or similar in
the error message.

Berto

