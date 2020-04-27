Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 329E81BA603
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Apr 2020 16:13:47 +0200 (CEST)
Received: from localhost ([::1]:47290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jT4W2-0006eW-5K
	for lists+qemu-devel@lfdr.de; Mon, 27 Apr 2020 10:13:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52228)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1jT4Ur-0005Pl-BR
 for qemu-devel@nongnu.org; Mon, 27 Apr 2020 10:12:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1jT4Up-0000bt-9s
 for qemu-devel@nongnu.org; Mon, 27 Apr 2020 10:12:31 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:56914
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1jT4Uo-0000Xd-Rv
 for qemu-devel@nongnu.org; Mon, 27 Apr 2020 10:12:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587996749;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wzwTIdLi9qsZj1mIh+E3/dAWL6VM3d39Ba80JXEGncY=;
 b=LjoZSUJJLJLBVxSZYDj+lPvLu0PpZYasdS90mPIXGrJbq/WdHz0Ftj5BDh6WjgwhqrCCQm
 2MaYqyTOGkr+NK10wFrvGXuq3ZZycUspwSVVM2yrJ1QNPJ6qwWCBZDVkNXRXwZz1hZWMz/
 bKfLy5JZTrQYG0JYuNv767YxPWyPs1A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-203-EikEQtv7Nu-DR72vXf8zsw-1; Mon, 27 Apr 2020 10:12:22 -0400
X-MC-Unique: EikEQtv7Nu-DR72vXf8zsw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DB2A318FE863;
 Mon, 27 Apr 2020 14:12:19 +0000 (UTC)
Received: from [10.10.116.80] (ovpn-116-80.rdu2.redhat.com [10.10.116.80])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E297327CD2;
 Mon, 27 Apr 2020 14:12:13 +0000 (UTC)
Subject: Re: [PATCH v2 01/17] block/throttle-groups:
 throttle_group_co_io_limits_intercept(): 64bit bytes
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20200427082325.10414-1-vsementsov@virtuozzo.com>
 <20200427082325.10414-2-vsementsov@virtuozzo.com>
 <4618c626-b757-f83a-d231-ef08eef9311d@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <9f7404a1-8336-0b5f-ff4c-14749b7a33b5@redhat.com>
Date: Mon, 27 Apr 2020 09:12:12 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <4618c626-b757-f83a-d231-ef08eef9311d@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=WINDOWS-1252; format=flowed
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=207.211.31.120; envelope-from=eblake@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/27 02:05:28
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: kwolf@redhat.com, fam@euphon.net, integration@gluster.org,
 sheepdog@lists.wpkg.org, ronniesahlberg@gmail.com, pavel.dovgaluk@ispras.ru,
 sw@weilnetz.de, pl@kamp.de, qemu-devel@nongnu.org, mreitz@redhat.com,
 den@openvz.org, stefanha@redhat.com, namei.unix@gmail.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/27/20 5:05 AM, Philippe Mathieu-Daud=E9 wrote:
> On 4/27/20 10:23 AM, Vladimir Sementsov-Ogievskiy wrote:
>> The function is called from 64bit io handlers, and bytes is just passed
>> to throttle_account() which is 64bit too (unsigned though). So, let's
>> convert intermediate argument to 64bit too.
>=20
> What is the meaning of negative bytes in this function?

An error.  It is more for consistency, in that we really cannot access=20
more than 63 bits of size information (off_t is signed, and network=20
protocols don't magically add a 64th bit to that underlying inherent=20
limitation of files and block devices).

It may be worth adding assert(bytes >=3D 0), if that makes it easier to=20
prove we are only dealing with positive lengths.

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


