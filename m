Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BD7113C38E
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jan 2020 14:51:11 +0100 (CET)
Received: from localhost ([::1]:54418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1irj4f-0003Rd-Vc
	for lists+qemu-devel@lfdr.de; Wed, 15 Jan 2020 08:51:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60366)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berto@igalia.com>) id 1irj3c-0002sa-Ct
 for qemu-devel@nongnu.org; Wed, 15 Jan 2020 08:50:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berto@igalia.com>) id 1irj3Y-0005Pk-Oy
 for qemu-devel@nongnu.org; Wed, 15 Jan 2020 08:50:04 -0500
Received: from fanzine.igalia.com ([178.60.130.6]:49448)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <berto@igalia.com>)
 id 1irj3Q-0005Bn-GU; Wed, 15 Jan 2020 08:49:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From;
 bh=c1o6+WEPo/Z71FRnHFA+tXfK+NPJnp3Zfw8f3kAm/go=; 
 b=YY7d7IETRGygyllgNBswfpQQU0gV8+RqwGchZzhxJSIzUzbSL6Xc7bfFA3Qvk+IyQ/1fK3/I5MZE+4gcfKwFTKbf8JBu4na/Kqz4A/dLUKVrqaiR2JTS/0TvDqEwtfCHYBqJwO7EYFCOCgoYXK6Yc3At9bQL7yJpikgYboUkqhSYIvKWbvzCj1Z9QJujBJq3PkPLShZ7Eb5iBi3sbk8IH4SlURKluqMHFoI3tyzlkL3zYO6bWWNao9RKzEKeaHVkq170s0BMe/f9buc5bI/lwywkCwry/SIPZNfsEUC7Z8OCjjYnyg6r7x8N0SIA5dATmkKvYlbpSBn+kNhANSwXVg==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine.igalia.com with esmtps 
 (Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
 id 1irj33-0008M0-0h; Wed, 15 Jan 2020 14:49:29 +0100
Received: from berto by mail.igalia.com with local (Exim)
 id 1irj32-0006rk-Nd; Wed, 15 Jan 2020 14:49:28 +0100
From: Alberto Garcia <berto@igalia.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH] qcow2: Use a GString in report_unsupported_feature()
In-Reply-To: <87blr5nc6z.fsf@linaro.org>
References: <20200114145437.28382-1-berto@igalia.com>
 <87blr5nc6z.fsf@linaro.org>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
 (i586-pc-linux-gnu)
Date: Wed, 15 Jan 2020 14:49:28 +0100
Message-ID: <w51h80wvnh3.fsf@maestria.local.igalia.com>
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue 14 Jan 2020 07:08:04 PM CET, Alex Benn=C3=A9e wrote:
>        g_autoptr(GString) features =3D g_string_sized_new(60);
>
> will save you the clean-up later.

Ok, will send v2 now.

>> +                if (features->len > 0) {
>> +                    g_string_append(features, ", ");
>> +                }
>> +                g_string_append_printf(features, "%.46s",
>>      table->name);
>
> We have a number of cases of this sort of idiom in the code base. I
> wonder if it calls for a utility function:
>
>        qemu_append_with_sep(features, ", ", "%.46s", table->name)

Maybe it's worth checking. I can have a look once this is applied (there
was another similar one in the queue already).

Berto

