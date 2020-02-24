Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EDE016AB1E
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Feb 2020 17:15:18 +0100 (CET)
Received: from localhost ([::1]:38606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j6GO5-0001M1-3x
	for lists+qemu-devel@lfdr.de; Mon, 24 Feb 2020 11:15:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38673)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1j6GNL-0000pP-Lx
 for qemu-devel@nongnu.org; Mon, 24 Feb 2020 11:14:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1j6GNJ-0007da-P3
 for qemu-devel@nongnu.org; Mon, 24 Feb 2020 11:14:31 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:24042
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>) id 1j6GNJ-0007dB-CQ
 for qemu-devel@nongnu.org; Mon, 24 Feb 2020 11:14:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582560868;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u3P01IwPpH+zD32MMHqt10pP4f8QJr01GaPAm1hisr0=;
 b=VpIrKcNeq/pUyg3oa+V9rgCY0atMGqyWsFg2ZrRrdeYclp7MJCUbtiRwVWcKlAudmWb3cN
 xuy7vTPCfFDjzR36DbzSTerwN7jxUjE5RU3orIlpPqagebMQ9I9iQ6uivIHchUqRW7Oiq6
 BMt0uJSDVb6uiEUkuRShxHLJG/LNeGI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-242-GfHQxzwEMM-FEqXZl78sSA-1; Mon, 24 Feb 2020 11:14:26 -0500
X-MC-Unique: GfHQxzwEMM-FEqXZl78sSA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8DDD31005F7B;
 Mon, 24 Feb 2020 16:14:25 +0000 (UTC)
Received: from [10.3.116.90] (ovpn-116-90.phx2.redhat.com [10.3.116.90])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B4C4A1001B30;
 Mon, 24 Feb 2020 16:14:22 +0000 (UTC)
Subject: Re: [PATCH 0/3] Tighten qemu-img rules on missing backing format
To: Peter Krempa <pkrempa@redhat.com>
References: <20200222112341.4170045-1-eblake@redhat.com>
 <20200224110145.GB3296@andariel.pipo.sk>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <5ddf0595-843d-5a60-fea3-fe4f9bfac87c@redhat.com>
Date: Mon, 24 Feb 2020 10:14:22 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200224110145.GB3296@andariel.pipo.sk>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
Cc: libvir-list@redhat.com, qemu-devel@nongnu.org, qemu-block@nongnu.org,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/24/20 5:01 AM, Peter Krempa wrote:
> On Sat, Feb 22, 2020 at 05:23:38 -0600, Eric Blake wrote:
>> In the past, we have had CVEs caused by qemu probing one image type
>> when an image started out as another but the guest was able to modify
>> content.  The solution to those CVEs was to encode backing format
>> information into qcow2, to ensure that once we make a decision, we
>> don't have to probe any further.  However, we failed to enforce this
>> at the time.  And now that libvirt is switching to -blockdev, it has
>> come back to bite us: with -block, libvirt had no easy way (other than
> 
> s/-block/-drive/ ?

Whoops, yes.

> 
>> json:{} pseudoprotocol) to force a backing file, but with -blockdev,
> 
> "json:{}" is basically -blockdev with extra steps. Old -drive usage
> didn't have any way to do that apart from rewriting the image. Which is
> basically the same since json:{} also needs to be recorded in the image
> to take effect.

Discussed in my other reply (it looks like I'll need to distinguish 
between json: pointing to just a protocol as the backing layer, vs. the 
more typical json: pointing to a format as the backing layer).

> 
>> libvirt HAS to use blockdev-open on the backing chain and supply a
>> backing format there, and thus has to probe images.  If libvirt ever
>> probes differently than qemu, we are back to the potential
>> guest-visible data corruption or potential host CVEs.
> 
> As I've elaborated in [1] I disagree with the host CVE part. The
> insecure part is not probing the format itself, but probing format AND
> using the backing file of the image if we probed format.
> 
> I agree that mis-probing format leads to data corruption though.

Your argument that there are other means at hand to prevent CVE when 
probing does occur is valid, however, my point is that CVEs due to 
probing were historically possible if the rest of the toolchain is not 
careful.  It is more of a burden-shifting problem: when qemu is not 
preventing probing, then other applications like libvirt have to take on 
extra measures to ensure libvirt does not have a CVE (the fact that we 
haven't had any in a few years is a good sign that we are at least aware 
of the problem and have worked hard to remain safe, even if it has 
required duplicated effort across multiple tools); whereas if qemu takes 
a hard-line stance on probing (which is the goal of the deprecation 
introduced in this series), now qemu has ensured safety whether or not 
the other layers also take measures to avoid any CVE.

> 
>> It's time to deprecate images without backing formats.  This patch
>> series does two things: 1. record an implicit backing format where one
>> is learned (although sadly, not all qemu-img commands are able to
>> learn a format), 2. warn to the user any time a probe had ambiguous
>> results or a backing format is omitted from an image.  All previous
>> images without a backing format are still usable, but hopefully the
>> warnings (along with libvirt's complaints about images without a
>> backing format) help us pinpoint remaining applications that are
> 
> It is not a warning in libvirt though. We just refuse it now because we
> don't do probing. Previously we allowed qemu to probe the format and the
> only thing that prevented host CVEs was if the host used selinux or any
> other security approach which would prevent opening the backing file.
> 
>> creating images on their own without recording a backing format.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


