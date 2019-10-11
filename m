Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0F2DD4A1E
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Oct 2019 23:53:29 +0200 (CEST)
Received: from localhost ([::1]:57432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iJ2qm-0005Dg-PC
	for lists+qemu-devel@lfdr.de; Fri, 11 Oct 2019 17:53:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55582)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1iJ2Sq-00055F-Ux
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 17:28:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1iJ2Sp-0001gv-SC
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 17:28:44 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33104)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>) id 1iJ2Sp-0001gg-LS
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 17:28:43 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id E4FBD30A5404;
 Fri, 11 Oct 2019 21:28:42 +0000 (UTC)
Received: from [10.3.116.168] (ovpn-116-168.phx2.redhat.com [10.3.116.168])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7E9B310018F8;
 Fri, 11 Oct 2019 21:28:42 +0000 (UTC)
To: QEMU <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>
From: Eric Blake <eblake@redhat.com>
Subject: ideas towards requiring VPATH build
Organization: Red Hat, Inc.
Message-ID: <aa953b8f-daa2-e6dc-da4b-b7cb598c2c0e@redhat.com>
Date: Fri, 11 Oct 2019 16:28:41 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.42]); Fri, 11 Oct 2019 21:28:42 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I know we've talked about enforcing a VPATH build, but haven't yet 
flipped the switch.  This week, I've played with using a VPATH build (cd 
qemu; mkdir -p build; cd ./build; ../configure ...; make ...), but find 
my old habits of expecting an in-tree build to just work (cd qemu; make 
...) hard to overcome.  So this is what I've come up with: if you place 
the following file in-tree, then any 'make ...' command you type in-tree 
without using -C will have the same effect as if you had typed the same 
command in the build directory, but without having to manually remember 
to switch to the build directory.

Perhaps this can be a starting point for a patch to actually include 
this file in qemu.git as part of the larger effort to force VPATH 
builds, while still having the convenience of in-tree make working for 
those who were used to it.  (I places an echo and sleep in my file to 
remind myself when I forgot to use the build directory, but that is not 
mandatory if we want GNUmakefile stored in qemu.git).

Presumably, any full switch to force a VPATH build would also include 
creating the build directory as needed (my hack assumes that it already 
exists).

$ cat GNUmakefile
# Hack for redirecting while reminding myself to use distinct builddir
%: force
	@echo 'changing directory to build...'
	@sleep 2
	@$(MAKE) -C build -f Makefile $(MAKECMDGOALS)
force: ;
GNUmakefile: ;

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org

