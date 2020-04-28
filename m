Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A5781BC7D3
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Apr 2020 20:27:15 +0200 (CEST)
Received: from localhost ([::1]:44088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jTUws-00014i-6b
	for lists+qemu-devel@lfdr.de; Tue, 28 Apr 2020 14:27:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50044)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1jTUva-000860-Cs
 for qemu-devel@nongnu.org; Tue, 28 Apr 2020 14:25:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1jTUuu-0001Yk-OD
 for qemu-devel@nongnu.org; Tue, 28 Apr 2020 14:25:53 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:23753
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1jTUuu-0001OH-4N
 for qemu-devel@nongnu.org; Tue, 28 Apr 2020 14:25:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588098310;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JCZum5Eapqxzj6ZZ7jeP6T7MDJ7gtDKiOjeyTdiqgNg=;
 b=OhyS3S+4KJOwRGNUYL6CQLwG+FQ0uFwMKyn2GqScXo9ucPyRwEFj4WwwUx9SMXbSFtROG6
 ykobl1ZW3QODv2wpp3UftJp2ijD63rcb/MXY/bc81Qf29AwP3qapQNStrP20ryUVaIc7eo
 qAo1jld4BqhV99rk8/Jed8Bs6JGwGxY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-27-NxLKgoqDNxGYIrOnkyX7qw-1; Tue, 28 Apr 2020 14:25:03 -0400
X-MC-Unique: NxLKgoqDNxGYIrOnkyX7qw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9B63D468;
 Tue, 28 Apr 2020 18:25:02 +0000 (UTC)
Received: from [10.10.116.80] (ovpn-116-80.rdu2.redhat.com [10.10.116.80])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A5286600E5;
 Tue, 28 Apr 2020 18:24:59 +0000 (UTC)
Subject: Re: [PATCH v3 0/3] qcow2: Allow resize of images with internal
 snapshots
To: Max Reitz <mreitz@redhat.com>, qemu-devel@nongnu.org
References: <20200424190903.522087-1-eblake@redhat.com>
 <376620d9-353f-e91a-e95e-d542990ba773@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <8262b943-ab23-0eac-535b-3ef2d5d33465@redhat.com>
Date: Tue, 28 Apr 2020 13:24:58 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <376620d9-353f-e91a-e95e-d542990ba773@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=207.211.31.120; envelope-from=eblake@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/28 04:15:05
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
Cc: stefanha@redhat.com, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/28/20 7:59 AM, Max Reitz wrote:
> On 24.04.20 21:09, Eric Blake wrote:
>> In v3:
>> - patch 1: fix error returns [patchew, Max], R-b dropped
>> - patch 2,3: unchanged, so add R-b
>>
>> Eric Blake (3):
>>    block: Add blk_new_with_bs() helper
>>    qcow2: Allow resize of images with internal snapshots
>>    qcow2: Tweak comment about bitmaps vs. resize
>=20
> Thanks, I=E2=80=99ve squashed the diff into patch 1 and applied the serie=
s to my
> block-next branch:
>=20
> https://git.xanclic.moe/XanClic/qemu/commits/branch/block-next

This series has not only a merge conflict, but a semantic conflict, with=20
the current state of Kevin's block-next branch.  I think I'll go ahead=20
and post a v4 based on Kevin's branch to spare you the efforts of having=20
to repeat my merge resolution.

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


