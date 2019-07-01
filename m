Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7A0E2DC40
	for <lists+qemu-devel@lfdr.de>; Wed, 29 May 2019 13:55:51 +0200 (CEST)
Received: from localhost ([127.0.0.1]:52384 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hVxBO-0002VC-SP
	for lists+qemu-devel@lfdr.de; Wed, 29 May 2019 07:55:50 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51285)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dovgaluk@ispras.ru>) id 1hVx8q-0001DR-9X
	for qemu-devel@nongnu.org; Wed, 29 May 2019 07:53:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dovgaluk@ispras.ru>) id 1hVx8p-0004Ef-F4
	for qemu-devel@nongnu.org; Wed, 29 May 2019 07:53:12 -0400
Received: from mail.ispras.ru ([83.149.199.45]:50912)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dovgaluk@ispras.ru>) id 1hVx8o-0004By-73
	for qemu-devel@nongnu.org; Wed, 29 May 2019 07:53:10 -0400
Received: from PASHAISP (unknown [85.142.117.226])
	by mail.ispras.ru (Postfix) with ESMTPSA id 4A1AD540089;
	Wed, 29 May 2019 14:53:06 +0300 (MSK)
From: "Pavel Dovgalyuk" <dovgaluk@ispras.ru>
To: "'Paolo Bonzini'" <pbonzini@redhat.com>,
	"'Dr. David Alan Gilbert'" <dgilbert@redhat.com>
References: <003a01d51611$6251a2b0$26f4e810$@ru>
	<20190529113045.GE2882@work-vm>
	<5c55c39b-694b-5d4e-d420-5df0feabc1e8@redhat.com>
In-Reply-To: <5c55c39b-694b-5d4e-d420-5df0feabc1e8@redhat.com>
Date: Wed, 29 May 2019 14:53:09 +0300
Message-ID: <003f01d51615$16270d40$427527c0$@ru>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Office Outlook 12.0
Thread-Index: AdUWEzI3x2DKEh8sTUie0k1otpZbgwAAdTSw
Content-Language: ru
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 83.149.199.45
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
Cc: quintela@redhat.com, qemu-devel@nongnu.org, ehabkost@redhat.com,
	rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> From: Paolo Bonzini [mailto:pbonzini@redhat.com]
> On 29/05/19 13:30, Dr. David Alan Gilbert wrote:
> >> Should we add a section for i386, which duplicates efer, or just version_id of the main
> VMSD should
> >> be updated?
> >
> > You could do:
> >
> > #ifdef TARGET_X86_64
> >         VMSTATE_UINT64(env.efer, X86CPU),
> >         VMSTATE_UINT64(env.star, X86CPU),
> > ...
> >
> > to become:
> >
> >         VMSTATE_UINT64_TEST(env.efer, X86CPU, efer_needed)
> > #ifdef TARGET_X86_64
> >         VMSTATE_UINT64(env.star, X86CPU),
> >
> >
> > and then make efer_needed a function that returns true if
> > TARGET_X86_64 or it's a new machine type that knows about whatever
> > you're going to do with it.
> 
> I prefer adding a subsection for 32-bit, so that EFER is saved/restored
> if nonzero.

The question is: should we remove EFER from the original VMSD?

Pavel Dovgalyuk


