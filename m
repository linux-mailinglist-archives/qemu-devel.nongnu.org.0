Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 536E358FDAD
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Aug 2022 15:49:33 +0200 (CEST)
Received: from localhost ([::1]:47818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oM8Z2-0000Wn-80
	for lists+qemu-devel@lfdr.de; Thu, 11 Aug 2022 09:49:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nborisov@suse.com>) id 1oM8Wi-0006yV-Nx
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 09:47:08 -0400
Received: from smtp-out1.suse.de ([2001:67c:2178:6::1c]:56786)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nborisov@suse.com>) id 1oM8Wf-0000PG-Mt
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 09:47:07 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 0C7E938BE2;
 Thu, 11 Aug 2022 13:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1660225622; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=6qnl32qaB6LFO9J+e4QBiiH0en0bgXE8GQSLby+pMuI=;
 b=hcfs3++y61iIeUpZXivl6541bJKueRBBsr4nzLVvu2vxnkLd4M7kICwm7jIF9waRHEy0Te
 5TQLkqk/nbIEB39Hr0V5uEUjyiP3d/39/kc5XA4yAKL5YDzLSBr4IORaT997B13idxhGif
 XywtD2oGLX/fDhZK5qx1vOFOipOCFic=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CC5731342A;
 Thu, 11 Aug 2022 13:47:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 35sgL1UI9WKJbgAAMHmgww
 (envelope-from <nborisov@suse.com>); Thu, 11 Aug 2022 13:47:01 +0000
Message-ID: <b727f0da-8051-2ce5-b1ab-a57452d2b0c3@suse.com>
Date: Thu, 11 Aug 2022 16:47:01 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: Claudio Fontana <Claudio.Fontana@suse.com>, Jim Fehlig <jfehlig@suse.com>
From: Nikolay Borisov <nborisov@suse.com>
Subject: towards a workable O_DIRECT outmigration to a file
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:67c:2178:6::1c;
 envelope-from=nborisov@suse.com; helo=smtp-out1.suse.de
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

Hello,

I'm currently looking into implementing a 'file:' uri for migration save 
in qemu. Ideally the solution will be O_DIRECT compatible. I'm aware of 
the branch https://gitlab.com/berrange/qemu/-/tree/mig-file. In the 
process of brainstorming how a solution would like the a couple of 
questions transpired that I think warrant wider discussion in the community.

First, implementing a solution which is self-contained within qemu would 
be easy enough( famous last words) but the gist is one  has to only care 
about the format within qemu. However, I'm being told that what libvirt 
does is prepend its own custom header to the resulting saved file, then 
slipstreams the migration stream from qemu. Now with the solution that I 
envision I intend to keep all write-related logic inside qemu, this 
means there's no way to incorporate the logic of libvirt. The reason I'd 
like to keep the write process within qemu is to avoid an extra copy of 
data between the two processes (qemu outging migration and libvirt), 
with the current fd approach qemu is passed an fd, data is copied 
between qemu/libvirt and finally the libvirt_iohelper writes the data. 
So the question which remains to be answered is how would libvirt make 
use of this new functionality in qemu? I was thinking something along 
the lines of :

1. Qemu writes its migration stream to a file, ideally on a filesystem 
which supports reflink - xfs/btrfs

2. Libvirt writes it's header to a separate file
2.1 Reflinks the qemu's stream right after its header
2.2 Writes its trailer

3. Unlink() qemu's file, now only libvirt's file remains on-disk.

I wouldn't call this solution hacky though it definitely leaves some 
bitter aftertaste.


Another solution would be to extend the 'fd:' protocol to allow multiple 
descriptors (for multifd) support to be passed in. The reason dup() 
can't be used is because in order for multifd to be supported it's 
required to be able to write to multiple, non-overlapping regions of the 
file. And duplicated fd's share their offsets etc. But that really seems 
more or less hacky. Alternatively it's possible that pwrite() are used 
to write to non-overlapping regions in the file. Any feedback is welcomed.


Regards,
Nikolay

