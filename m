Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D576B191406
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Mar 2020 16:17:50 +0100 (CET)
Received: from localhost ([::1]:50596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jGlJN-0002SY-UI
	for lists+qemu-devel@lfdr.de; Tue, 24 Mar 2020 11:17:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36390)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berto@igalia.com>) id 1jGlFG-0005QJ-31
 for qemu-devel@nongnu.org; Tue, 24 Mar 2020 11:13:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berto@igalia.com>) id 1jGlFE-0006jI-QQ
 for qemu-devel@nongnu.org; Tue, 24 Mar 2020 11:13:33 -0400
Received: from fanzine.igalia.com ([178.60.130.6]:42606)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <berto@igalia.com>)
 id 1jGlFE-0006Ua-7i; Tue, 24 Mar 2020 11:13:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From;
 bh=o1TQnhA2qzJWrCryFG7EklrPIwymMvBZoTRVvWT/iNs=; 
 b=mbihsu/pWm7KeMkzfSKE0Tg9O4vtTRu0kW91gHWnkmtmTgbMDsquPOMSF+DVz+ScM2z5A0CG5mSVuRZe1BWHY26nmkwZLNA/5iGOtBXVLPBHkDWOvqW3PY9ehtvAj5KZqgv0sL40SFdrvIPrCDpkWhZnzpCSO6FRVqSsbiOGNBgA9Re1BGYQ6ZXXUimr+o5oamlEeSyM3WrEt9dAc50zFvkxTehuEKAvWjvS5e465PIzp4QfeZ1VdlJL9vkYdNt121XxgWqtMwn3bDtmzYOrXQxI8E69LrrTCWc7j+DfrzBDHqovbo2EmG/PzYhpE+Wsmd1RPsWrUSZyjsx83cwDjA==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine.igalia.com with esmtps 
 (Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
 id 1jGlEw-0004uV-H4; Tue, 24 Mar 2020 16:13:14 +0100
Received: from berto by mail.igalia.com with local (Exim)
 id 1jGlEw-0007TU-7l; Tue, 24 Mar 2020 16:13:14 +0100
From: Alberto Garcia <berto@igalia.com>
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH] qcow2: Forbid discard in qcow2 v2 images with backing
 files
In-Reply-To: <5bcf1bf6-4375-afe6-bd6c-dedbd06d136d@redhat.com>
References: <20200323194429.1717-1-berto@igalia.com>
 <5bcf1bf6-4375-afe6-bd6c-dedbd06d136d@redhat.com>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
 (i586-pc-linux-gnu)
Date: Tue, 24 Mar 2020 16:13:14 +0100
Message-ID: <w51h7ydlrat.fsf@maestria.local.igalia.com>
MIME-Version: 1.0
Content-Type: text/plain
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
 =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue 24 Mar 2020 03:46:07 PM CET, Eric Blake wrote:
>> -$QEMU_IO -c 'discard 0k 64k' "$TEST_IMG" | _filter_qemu_io
>> +poke_file "$TEST_IMG" '262144' "\x00\x00\x00\x00\x00\x00\x00\x00" # 0x40000 - L2 entry
>> +poke_file "$TEST_IMG" '131082' "\x00\x00" # 0x2000a - Refcount entry
>
> Instead of writing '262144' ... # 0x40000, you could write
> $((0x40000)) in-place.  Similarly for 131082 vs. 0x2000a.

The exiting poke_file line in that test was using base 10 so I decided
to use it too for consistency.

I actually realized that $rb_offset and $l2_offset are defined, so I
could use those too.

> Also, Max has pending patches for adding poke_file_be; if those land
> first, this becomes simpler as:
>
> poke_file_be "$TEST_IMG" $((0x40000)) 8 0 # L2 entry
> poke_file_be "$TEST_IMG" $((0x2000a)) 2 0 # Refcount entry

I'm fine if those lines are changed when the patch is committed.

Berto

