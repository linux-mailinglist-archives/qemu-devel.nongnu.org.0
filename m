Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF4CA135603
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jan 2020 10:44:02 +0100 (CET)
Received: from localhost ([::1]:57476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ipUMD-0000yO-Re
	for lists+qemu-devel@lfdr.de; Thu, 09 Jan 2020 04:44:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50627)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <quintela@redhat.com>) id 1ipUL3-0008OO-JB
 for qemu-devel@nongnu.org; Thu, 09 Jan 2020 04:42:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1ipUL2-0003Va-HI
 for qemu-devel@nongnu.org; Thu, 09 Jan 2020 04:42:49 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:44701
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1ipUL2-0003Sw-AU
 for qemu-devel@nongnu.org; Thu, 09 Jan 2020 04:42:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578562967;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PD3DmMY9dXO0zuNQ4qIUSELgJ35Z4wNTPTG7/TZ6WRg=;
 b=Y0/hfU9qZqJ8B2BXIxa9BDdxmYdBGapyHQF00UPdmwPEZRb8ZUyK7xBqWptcspcTM4IgNZ
 8+cpUj6tRpy3X4Tr4CtUrj/witO/2d+NIO8UjXEo1QIoWCjAa9+BeBaGfb6PtqM0PJu8Fe
 Gx88MyadEPrEL2nWsmrPDp86uHLNbEo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-330-8A9iWVWGP62OmBuvnaIksQ-1; Thu, 09 Jan 2020 04:42:43 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EE377184B1EC;
 Thu,  9 Jan 2020 09:42:42 +0000 (UTC)
Received: from redhat.com (ovpn-116-22.ams2.redhat.com [10.36.116.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8538A10027AA;
 Thu,  9 Jan 2020 09:42:42 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: Wei Yang <richardw.yang@linux.intel.com>
Subject: Re: [Patch v2 5/6] migration/postcopy: enable random order target
 page arrival
In-Reply-To: <20191107123907.29791-6-richardw.yang@linux.intel.com> (Wei
 Yang's message of "Thu, 7 Nov 2019 20:39:06 +0800")
References: <20191107123907.29791-1-richardw.yang@linux.intel.com>
 <20191107123907.29791-6-richardw.yang@linux.intel.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
Date: Thu, 09 Jan 2020 10:42:40 +0100
Message-ID: <874kx50xv3.fsf@secure.laptop>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: 8A9iWVWGP62OmBuvnaIksQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
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
Reply-To: quintela@redhat.com
Cc: dgilbert@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Wei Yang <richardw.yang@linux.intel.com> wrote:
> After using number of target page received to track one host page, we
> could have the capability to handle random order target page arrival in
> one host page.
>
> This is a preparation for enabling compress during postcopy.
>
> Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
>
> ---
> v2:
>    * use uintptr_t to calculate place_dest
>    * check target pages belongs to the same host page

Reviewed-by: Juan Quintela <quintela@redhat.com>


