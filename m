Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DBC81C95BD
	for <lists+qemu-devel@lfdr.de>; Thu,  7 May 2020 17:58:48 +0200 (CEST)
Received: from localhost ([::1]:38916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jWiv9-0007Hh-GD
	for lists+qemu-devel@lfdr.de; Thu, 07 May 2020 11:58:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1jWite-0005MI-LG
 for qemu-devel@nongnu.org; Thu, 07 May 2020 11:57:14 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:44402
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1jWitd-0001eh-UD
 for qemu-devel@nongnu.org; Thu, 07 May 2020 11:57:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588867033;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=346PQ8E1QbOv6V25nMYzOV257SQXFBHA2If1FR1Wu64=;
 b=et/+nqCurznZrMvXfOOJicsGnibtNHB1lE6oYMCXwH2/UJ5CxyFc0If8sAXCNKwXcYtfei
 sSoOPehQ/O3x8CIJneUY0m89OEHqVg00QngfIgeX8CEerZ3UXhsEFrp1wSehTzrO/EVnO9
 Ps5KXDEQfvukYMsVRpK7M5HbBpHX6UY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-99-pi89rYjPN8qo5MGpsTsoKg-1; Thu, 07 May 2020 11:57:09 -0400
X-MC-Unique: pi89rYjPN8qo5MGpsTsoKg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 69F42461;
 Thu,  7 May 2020 15:57:08 +0000 (UTC)
Received: from [10.3.114.73] (ovpn-114-73.phx2.redhat.com [10.3.114.73])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E9AFF60C47;
 Thu,  7 May 2020 15:57:07 +0000 (UTC)
Subject: Re: [PATCH 1/2] block/block-copy: Fix uninitialized variable in
 block_copy_task_entry
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20200507121129.29760-1-philmd@redhat.com>
 <20200507121129.29760-2-philmd@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <b39d671f-f399-c482-851e-c6c77cab94de@redhat.com>
Date: Thu, 7 May 2020 10:57:07 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200507121129.29760-2-philmd@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=207.211.31.120; envelope-from=eblake@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/07 03:56:18
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-trivial@nongnu.org,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/7/20 7:11 AM, Philippe Mathieu-Daud=C3=A9 wrote:
> Fix when building with -Os:
>=20
>      CC      block/block-copy.o
>    block/block-copy.c: In function =E2=80=98block_copy_task_entry=E2=80=
=99:
>    block/block-copy.c:428:38: error: =E2=80=98error_is_read=E2=80=99 may =
be used uninitialized in this function [-Werror=3Dmaybe-uninitialized]
>      428 |         t->call_state->error_is_read =3D error_is_read;
>          |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~
>=20

Looks like -Os triggered different inlining of block_copy_do_copy().  I=20
confirm that block_copy_do_copy does NOT initialize error_is_read except=20
when returning < 0, but similarly block_copy_task_entry() does not read=20
error_is_read except in the same setups.  So it looks like no actual bug=20
was triggered, but we can definitely aid the compiler's analysis by=20
initializing.

> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>   block/block-copy.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Eric Blake <eblake@redhat.com>

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


