Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ECBC195B20
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Mar 2020 17:32:51 +0100 (CET)
Received: from localhost ([::1]:44220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jHrub-0006re-VJ
	for lists+qemu-devel@lfdr.de; Fri, 27 Mar 2020 12:32:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43462)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berto@igalia.com>) id 1jHrtU-0006Jl-HE
 for qemu-devel@nongnu.org; Fri, 27 Mar 2020 12:31:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berto@igalia.com>) id 1jHrtT-00063I-5c
 for qemu-devel@nongnu.org; Fri, 27 Mar 2020 12:31:40 -0400
Received: from fanzine.igalia.com ([178.60.130.6]:37476)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <berto@igalia.com>)
 id 1jHrtS-0005Kt-Ie; Fri, 27 Mar 2020 12:31:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From;
 bh=ZCCG9kSP0SJrJBQZPPPQeWt8eczXan67QrBQ5iUFrzU=; 
 b=ZvqfkxDGrIEvQjakAmIN4IaeHLB2dEDPf8uvWZVQfn1+OVFhu3DfQ2YZfnhYPNVNq/1EpGVoWoCimI14VLXYmbqlGuwxDUFcNy+/2AuG5O0lz11gE4G+W5uu1c6XoxXS4sXkTYiVob0I2SI58hAui+YekfrrkQ9wSwycJRioE1krn2A/2K5A8z8V0Vc9x4khkTkRwvm5YmYHMCin6QDzN/NzCBEJdTOCWFnaweY7gifHQ9k6+CD+/Qt2xvl3k6/vA5AqeiF2gye3xBD9WJigxlmTmYf9MaxWeZa0n9Ofd+xpCFpJH9sQFuX9AzHJY74HfY9atYmwk6/onS0wv1upWg==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine.igalia.com with esmtps 
 (Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
 id 1jHrt9-0007qI-H2; Fri, 27 Mar 2020 17:31:19 +0100
Received: from berto by mail.igalia.com with local (Exim)
 id 1jHrt9-00044G-6P; Fri, 27 Mar 2020 17:31:19 +0100
From: Alberto Garcia <berto@igalia.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH v2] qcow2: Forbid discard in qcow2 v2 images with backing
 files
In-Reply-To: <20200327141442.GA6901@linux.fritz.box>
References: <20200324121636.24136-1-berto@igalia.com>
 <20200327141442.GA6901@linux.fritz.box>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
 (i586-pc-linux-gnu)
Date: Fri, 27 Mar 2020 17:31:19 +0100
Message-ID: <w51h7y9hi94.fsf@maestria.local.igalia.com>
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
Cc: =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri 27 Mar 2020 03:14:42 PM CET, Kevin Wolf wrote:
>> +echo "# Create a backing image and fill it with data"
>> +BACKING_IMG="$TEST_IMG.base"
>> +TEST_IMG="$BACKING_IMG" _make_test_img 128k
>> +$QEMU_IO -c 'write -P 0xff 0 128k' "$BACKING_IMG" | _filter_qemu_io
>> +
>> +for qcow2_compat in 0.10 1.1; do
>> +    echo "# Create an image with compat=$qcow2_compat and a backing file"
>> +    _make_test_img -o "compat=$qcow2_compat" -b "$BACKING_IMG"
>
> I would write some non-zero data to the backing file so that you can
> later distinguish zero clusters from unallocated clusters.

I'm doing that already (immediately before the 'for' loop).

I'll add the output of qemu-img map in v3.

Berto

