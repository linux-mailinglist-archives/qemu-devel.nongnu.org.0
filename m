Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7C0B322D1F
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 16:07:38 +0100 (CET)
Received: from localhost ([::1]:44658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEZHl-0001EN-S1
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 10:07:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lhenriques@suse.de>)
 id 1lEZEb-0006QO-Ev
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 10:04:21 -0500
Received: from mx2.suse.de ([195.135.220.15]:33578)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lhenriques@suse.de>)
 id 1lEZEZ-0001Fh-KL
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 10:04:21 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9B3E7AE07;
 Tue, 23 Feb 2021 15:04:15 +0000 (UTC)
Received: from localhost (brahms [local])
 by brahms (OpenSMTPD) with ESMTPA id d6e60cab;
 Tue, 23 Feb 2021 15:05:21 +0000 (UTC)
Date: Tue, 23 Feb 2021 15:05:21 +0000
From: Luis Henriques <lhenriques@suse.de>
To: Vivek Goyal <vgoyal@redhat.com>
Subject: Re: [PATCH v2 0/3] virtiofsd: Add options to enable/disable posix acl
Message-ID: <YDUZsfDCnAw98Pym@suse.de>
References: <20210217233046.81418-1-vgoyal@redhat.com> <87pn0wgtsx.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87pn0wgtsx.fsf@suse.de>
Received-SPF: pass client-ip=195.135.220.15; envelope-from=lhenriques@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
Cc: virtio-fs@redhat.com, miklos@szeredi.hu, qemu-devel@nongnu.org,
 stefanha@redhat.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Feb 19, 2021 at 11:50:54AM +0000, Luis Henriques wrote:
> Vivek Goyal <vgoyal@redhat.com> writes:
> 
> > Hi,
> >
> > This is V2 of the patches. Changes since v1 are.
> >
> > - Rebased on top of latest master.
> > - Took care of Miklos's comments to block acl xattrs if user
> >   explicitly disabled posix acl.
> >
> > Luis Henriques reported that fstest generic/099 fails with virtiofs.
> > Little debugging showed that we don't enable acl support. So this
> > patch series provides option to enable/disable posix acl support. By
> > default it is disabled.
> >
> > I have run blogbench and pjdfstests with posix acl enabled and
> > things work fine.
> >
> > Luis, can you please apply these patches, and run virtiofsd with
> > "-o posix_acl" and see if it fixes the failure you are seeing. I
> > ran the steps you provided manually and it fixes the issue for
> > me.
> 
> Sorry for the delay.  I've finally tested these patches and they indeed
> fix the problem I reported.  My only question about this fix is why is
> this option not enabled by default, since this is the documented behavior
> in acl(5) and umask(2)?  In fact, why is this an option at all? 

Ah!  An obvious thing that's missing: change tools/virtiofsd/helper.c to
include the new option (and also the manpage) ;-)

Cheers,
--
Luís

