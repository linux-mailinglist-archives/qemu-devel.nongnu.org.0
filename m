Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEBCA30B1C0
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 21:54:49 +0100 (CET)
Received: from localhost ([::1]:41640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6gDg-0007Uy-LH
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 15:54:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1l6gCZ-00070M-MR
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 15:53:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:49152)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1l6gCX-0005p2-F7
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 15:53:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612212815;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gQx91cDuSX3lp32gilMHxqOywrHyT3iLhAzEU4Fg9Ls=;
 b=PNNueK8b0Te7d17MndxMpESnEdVcFSi2yxflQc/gr15lIjn4sssU69KARWxIJcM4/EdVXS
 t/zePVKoxALKB2wqZMSSTTkAFjcGlRXBY+/mLvUa6EiIGBlRmKnQAbxrY8WrHB52yIMBaq
 ArDzlIF/VNfPQq3dL35SBwF0685KRHM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-464-L53rmzGvMzmIm2o5BAIyFA-1; Mon, 01 Feb 2021 15:53:31 -0500
X-MC-Unique: L53rmzGvMzmIm2o5BAIyFA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ACAFA1842140;
 Mon,  1 Feb 2021 20:53:30 +0000 (UTC)
Received: from localhost (ovpn-114-98.ams2.redhat.com [10.36.114.98])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 62F121346F;
 Mon,  1 Feb 2021 20:53:29 +0000 (UTC)
Date: Mon, 1 Feb 2021 20:53:28 +0000
From: "Richard W.M. Jones" <rjones@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PULL 11/24] tcg/optimize: Use tcg_constant_internal with
 constant folding
Message-ID: <20210201205328.GE2673@redhat.com>
References: <20210114021654.647242-1-richard.henderson@linaro.org>
 <20210114021654.647242-12-richard.henderson@linaro.org>
 <20210201204547.GD2673@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210201204547.GD2673@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=rjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=rjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Feb 01, 2021 at 08:45:47PM +0000, Richard W.M. Jones wrote:
> This commit breaks running certain s390x binaries, at least
> the "mount" command (or a library it uses) breaks.
> 
> More details in this BZ:
> 
> https://bugzilla.redhat.com/show_bug.cgi?id=1922248
> 
> Could we revert this change since it seems to have caused other
> problems as well?

BTW I think the problem I am seeing is a bit different from the other
ones that were reported.  This commit causes the guest binary to
malfunction.  qemu itself does not emit any warning, nor crash.

Rich.

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
virt-p2v converts physical machines to virtual machines.  Boot with a
live CD or over the network (PXE) and turn machines into KVM guests.
http://libguestfs.org/virt-v2v


