Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41F2831FD17
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 17:27:51 +0100 (CET)
Received: from localhost ([::1]:52708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD8dC-0000sa-7d
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 11:27:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lhenriques@suse.de>)
 id 1lD8QS-0006Xc-UB
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 11:14:41 -0500
Received: from mx2.suse.de ([195.135.220.15]:40548)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lhenriques@suse.de>)
 id 1lD8QQ-0006YG-2n
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 11:14:40 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B40BCAC6E;
 Fri, 19 Feb 2021 16:14:34 +0000 (UTC)
Received: from localhost (brahms [local])
 by brahms (OpenSMTPD) with ESMTPA id 66cfb798;
 Fri, 19 Feb 2021 16:15:39 +0000 (UTC)
From: Luis Henriques <lhenriques@suse.de>
To: Miklos Szeredi <miklos@szeredi.hu>
Subject: Re: [PATCH v2 0/3] virtiofsd: Add options to enable/disable posix acl
References: <20210217233046.81418-1-vgoyal@redhat.com>
 <87pn0wgtsx.fsf@suse.de> <20210219143403.GA3270@redhat.com>
 <CAJfpeguanq6PEf7jd9Ur_JO7aJ0eoojs65LXb6ukhoGGb_Ccdw@mail.gmail.com>
Date: Fri, 19 Feb 2021 16:15:38 +0000
In-Reply-To: <CAJfpeguanq6PEf7jd9Ur_JO7aJ0eoojs65LXb6ukhoGGb_Ccdw@mail.gmail.com>
 (Miklos Szeredi's message of "Fri, 19 Feb 2021 16:55:06 +0100")
Message-ID: <87im6oghjp.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: virtio-fs-list <virtio-fs@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org,
 Vivek Goyal <vgoyal@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Miklos Szeredi <miklos@szeredi.hu> writes:

> On Fri, Feb 19, 2021 at 3:34 PM Vivek Goyal <vgoyal@redhat.com> wrote:
>>
>> On Fri, Feb 19, 2021 at 11:50:54AM +0000, Luis Henriques wrote:
>> > Vivek Goyal <vgoyal@redhat.com> writes:
>> >
>> > > Hi,
>> > >
>> > > This is V2 of the patches. Changes since v1 are.
>> > >
>> > > - Rebased on top of latest master.
>> > > - Took care of Miklos's comments to block acl xattrs if user
>> > >   explicitly disabled posix acl.
>> > >
>> > > Luis Henriques reported that fstest generic/099 fails with virtiofs.
>> > > Little debugging showed that we don't enable acl support. So this
>> > > patch series provides option to enable/disable posix acl support. By
>> > > default it is disabled.
>> > >
>> > > I have run blogbench and pjdfstests with posix acl enabled and
>> > > things work fine.
>> > >
>> > > Luis, can you please apply these patches, and run virtiofsd with
>> > > "-o posix_acl" and see if it fixes the failure you are seeing. I
>> > > ran the steps you provided manually and it fixes the issue for
>> > > me.
>> >
>> > Sorry for the delay.  I've finally tested these patches and they indeed
>> > fix the problem I reported.  My only question about this fix is why is
>> > this option not enabled by default, since this is the documented behavior
>> > in acl(5) and umask(2)?  In fact, why is this an option at all?
>>
>> You mean why to not enable acl by default?
>>
>> I am concerned about performance drop this can lead to because extra
>> GETXATTR(system.posix_acl_*) messages which will trigger if acls are enabled.
>> And not all users might require these. That's why I preferred to not enable
>> acl by default. Those who need it can enable it explicitly.
>>
>> Another example is xattr support. Due to performance concerns, we don't
>> enable xattrs by default either.
>
> Actually generic xattr is much worse, since there's no caching for
> them currently, as opposed to posix acls, which are cached both when
> positive and negative.
>
> If we enable ACL by default in case xattrs are enabled, we should be
> safe, I think.  Having an option to disable acls still makes sense,
> but it's an optional plus.

Great, thanks for clarifying that the reason for having these options is
really for performance.

Anyway, thanks a lot for looking at this and fixing it.

Cheers,
-- 
Luis

