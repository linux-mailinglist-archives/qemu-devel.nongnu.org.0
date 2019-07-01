Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1EDF2DBE5
	for <lists+qemu-devel@lfdr.de>; Wed, 29 May 2019 13:32:21 +0200 (CEST)
Received: from localhost ([127.0.0.1]:52101 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hVwof-0007Fg-3R
	for lists+qemu-devel@lfdr.de; Wed, 29 May 2019 07:32:21 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46730)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1hVwnJ-0006uW-IE
	for qemu-devel@nongnu.org; Wed, 29 May 2019 07:30:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1hVwnI-0002xr-LS
	for qemu-devel@nongnu.org; Wed, 29 May 2019 07:30:57 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35810)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1hVwnI-0002xe-Gk
	for qemu-devel@nongnu.org; Wed, 29 May 2019 07:30:56 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BDBC330C543E;
	Wed, 29 May 2019 11:30:50 +0000 (UTC)
Received: from work-vm (unknown [10.36.118.28])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6BCFA5D9E1;
	Wed, 29 May 2019 11:30:48 +0000 (UTC)
Date: Wed, 29 May 2019 12:30:46 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Pavel Dovgalyuk <dovgaluk@ispras.ru>
Message-ID: <20190529113045.GE2882@work-vm>
References: <003a01d51611$6251a2b0$26f4e810$@ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <003a01d51611$6251a2b0$26f4e810$@ru>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.46]);
	Wed, 29 May 2019 11:30:50 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] i386: EFER vs 32-bit CPU
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: pbonzini@redhat.com, quintela@redhat.com, qemu-devel@nongnu.org,
	ehabkost@redhat.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Pavel Dovgalyuk (dovgaluk@ispras.ru) wrote:
> Hello!
> 
>  
> 
> I found this while debugging the inconsistent saved/restored state of the virtual machine.
> 
>  
> 
> i386 (32 bit) emulation uses this register (in wrmsr and in MMU fault processing).
> 
> But it does not included in VMState, because "efer" field is disabled with #ifdef TARGET_X86_64
> 
>  
> 
> I think that efer should be saved for i386 too, but how it should be made to preserve the backward
> compatibility?
> 
> Should we add a section for i386, which duplicates efer, or just version_id of the main VMSD should
> be updated?

You could do:

#ifdef TARGET_X86_64
        VMSTATE_UINT64(env.efer, X86CPU),
        VMSTATE_UINT64(env.star, X86CPU),
...

to become:

        VMSTATE_UINT64_TEST(env.efer, X86CPU, efer_needed)
#ifdef TARGET_X86_64
        VMSTATE_UINT64(env.star, X86CPU),


and then make efer_needed a function that returns true if
TARGET_X86_64 or it's a new machine type that knows about whatever
you're going to do with it.

Dave

>  
> 
> Pavel Dovgalyuk
> 
>  
> 
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

