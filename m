Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81ADA1BBE7D
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Apr 2020 15:05:32 +0200 (CEST)
Received: from localhost ([::1]:56486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jTPvX-00015i-ID
	for lists+qemu-devel@lfdr.de; Tue, 28 Apr 2020 09:05:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59348)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1jTPs2-0006Rm-V8
 for qemu-devel@nongnu.org; Tue, 28 Apr 2020 09:04:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1jTPrk-0003FO-2C
 for qemu-devel@nongnu.org; Tue, 28 Apr 2020 09:01:54 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:41993
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1jTPrj-0003BH-Gi
 for qemu-devel@nongnu.org; Tue, 28 Apr 2020 09:01:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588078894;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/saheUupy4JS+Wf8jzA6mU8Bnj27WJa88vjlTv36O/E=;
 b=CYCrXM8o6hAqMpB3k5hhK/MCXotcvyaL7F6AZoDACv2czKiUGcHQnLxrk3wzhaKc7ufGM6
 r6waDIkIDVMnuZC34H4LWqmHIZAH2tPBqMfwKpK5UWBiijcpMuQvkuWzT314o1Cjoct0E2
 uW8lCTgFlNzIrrDEjfpcoC5KgC1qiC0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-26-Jq-kqYI4PZysMwR_u2ga1Q-1; Tue, 28 Apr 2020 09:01:31 -0400
X-MC-Unique: Jq-kqYI4PZysMwR_u2ga1Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D6DD5EC1A0;
 Tue, 28 Apr 2020 13:01:22 +0000 (UTC)
Received: from [10.10.116.80] (ovpn-116-80.rdu2.redhat.com [10.10.116.80])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6FB2F27CDF;
 Tue, 28 Apr 2020 13:01:21 +0000 (UTC)
Subject: Re: [PATCH v20 4/4] iotests: 287: add qcow2 compression type test
To: Max Reitz <mreitz@redhat.com>, Denis Plotnikov
 <dplotnikov@virtuozzo.com>, qemu-devel@nongnu.org
References: <20200421081117.7595-1-dplotnikov@virtuozzo.com>
 <20200421081117.7595-5-dplotnikov@virtuozzo.com>
 <c0fdc097-dabd-4661-fce9-a63a24a8d792@redhat.com>
 <64471c60-6bdd-fc7a-2dec-ff480137fec8@virtuozzo.com>
 <f96f8020-2c39-3676-3bff-d35038f6e3df@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <639fc953-3e01-6ff8-460e-5f571ffca48f@redhat.com>
Date: Tue, 28 Apr 2020 08:01:20 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <f96f8020-2c39-3676-3bff-d35038f6e3df@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=WINDOWS-1252; format=flowed
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=205.139.110.120; envelope-from=eblake@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/28 02:16:38
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, berto@igalia.com,
 qemu-block@nongnu.org, armbru@redhat.com, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/28/20 7:55 AM, Max Reitz wrote:

>>>> +# This tests qocw2-specific low-level functionality
>>>> +_supported_fmt qcow2
>>>> +_supported_proto file
>>>> +_supported_os Linux
>>> This test doesn=92t work with compat=3D0.10 (because we can=92t store a
>>> non-default compression type there) or data_file (because those don=92t
>>> support compression), so those options should be marked as unsupported.
>>>
>>> (It does seem to work with any refcount_bits, though.)
>>
>> Could I ask how to achieve that?
>> I can't find any _supported_* related.
>=20
>=20
> It=92s _unsupported_imgopts.

Test 036 is an example of this.


--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


