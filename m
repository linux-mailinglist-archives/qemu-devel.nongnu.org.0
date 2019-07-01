Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA9262DBD6
	for <lists+qemu-devel@lfdr.de>; Wed, 29 May 2019 13:27:40 +0200 (CEST)
Received: from localhost ([127.0.0.1]:52063 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hVwk8-0006Kh-5P
	for lists+qemu-devel@lfdr.de; Wed, 29 May 2019 07:27:40 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46068)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dovgaluk@ispras.ru>) id 1hVwjB-00063V-DM
	for qemu-devel@nongnu.org; Wed, 29 May 2019 07:26:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dovgaluk@ispras.ru>) id 1hVwj9-0007OF-VY
	for qemu-devel@nongnu.org; Wed, 29 May 2019 07:26:41 -0400
Received: from mail.ispras.ru ([83.149.199.45]:47878)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dovgaluk@ispras.ru>) id 1hVwj9-0007CX-KE
	for qemu-devel@nongnu.org; Wed, 29 May 2019 07:26:39 -0400
Received: from PASHAISP (unknown [85.142.117.226])
	by mail.ispras.ru (Postfix) with ESMTPSA id 1CEB5540089;
	Wed, 29 May 2019 14:26:36 +0300 (MSK)
From: "Pavel Dovgalyuk" <dovgaluk@ispras.ru>
To: <qemu-devel@nongnu.org>, <pbonzini@redhat.com>, <rth@twiddle.net>,
	<ehabkost@redhat.com>, <quintela@redhat.com>, <dgilbert@redhat.com>
Date: Wed, 29 May 2019 14:26:39 +0300
Message-ID: <003a01d51611$6251a2b0$26f4e810$@ru>
MIME-Version: 1.0
X-Mailer: Microsoft Office Outlook 12.0
Thread-Index: AdUWEWIIHtVTtE6DS5KeQtA2/pLkfw==
Content-Language: ru
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 83.149.199.45
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Content-Filtered-By: Mailman/MimeDel 2.1.21
Subject: [Qemu-devel] i386: EFER vs 32-bit CPU
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello!

 

I found this while debugging the inconsistent saved/restored state of the virtual machine.

 

i386 (32 bit) emulation uses this register (in wrmsr and in MMU fault processing).

But it does not included in VMState, because "efer" field is disabled with #ifdef TARGET_X86_64

 

I think that efer should be saved for i386 too, but how it should be made to preserve the backward
compatibility?

Should we add a section for i386, which duplicates efer, or just version_id of the main VMSD should
be updated?

 

Pavel Dovgalyuk

 

