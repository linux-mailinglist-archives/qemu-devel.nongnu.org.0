Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE8C2AF046
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 13:10:03 +0100 (CET)
Received: from localhost ([::1]:44288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcows-0001PI-HZ
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 07:10:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kcov0-0000Uj-Lw
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 07:08:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:59583)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kcoux-0006Gl-99
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 07:08:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605096481;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IfTSs50TkP7vuyCpbQTsTVo/jND90k6rxuL57aTTMlc=;
 b=AEuFU0VsyXTucc8MqJAbJaOnXtCvPBT83DFW7Ho8AjZup9mh4VBWOJKyiejAmAxcwkK1eS
 vM1ANK+pN5KGDL9Ru/zpFvPI6UZNqpFBKxB6OykeanZmIL5yZJoe44V2G9pd1n/0dHieC+
 J3q+H4LYmIslnjxN+4+O8JCe/lSPDNk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-302-VL1zS8cEMGixz5u5WwyRBQ-1; Wed, 11 Nov 2020 07:07:57 -0500
X-MC-Unique: VL1zS8cEMGixz5u5WwyRBQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E4D93100746C
 for <qemu-devel@nongnu.org>; Wed, 11 Nov 2020 12:07:56 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-113-250.ams2.redhat.com
 [10.36.113.250])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B380555760;
 Wed, 11 Nov 2020 12:07:49 +0000 (UTC)
Subject: Re: [PATCH for-5.2] virtiofsd: Announce submounts even without statx()
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <20201103164135.169325-1-mreitz@redhat.com>
 <20201110185749.GH3108@work-vm>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <50b9de71-017f-1253-f912-a1568f733958@redhat.com>
Date: Wed, 11 Nov 2020 13:07:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201110185749.GH3108@work-vm>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/11 01:42:46
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: virtio-fs@redhat.com, Miklos Szeredi <mszeredi@redhat.com>,
 qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10.11.20 19:57, Dr. David Alan Gilbert wrote:
> * Max Reitz (mreitz@redhat.com) wrote:
>> Contrary to what the check (and warning) in lo_init() claims, we can
>> announce submounts just fine even without statx() -- the check is based
>> on comparing both the mount ID and st_dev of parent and child.  Without
>> statx(), we will not have the mount ID; but we always have st_dev.
>>
>> The only problems we have (without statx() and its mount ID) are:
>>
>> (1) Mounting the same device twice may lead to both trees being treated
>>      as exactly the same tree by virtiofsd.  But that is a problem that
>>      is completely independent of mirroring host submounts in the guest.
>>      Both submount roots will still show the FUSE_SUBMOUNT flag, because
>>      their st_dev still differs from their respective parent.
>>
>> (2) There is only one exception to (1), and that is if you mount a
>>      device inside a mount of itself: Then, its st_dev will be the same
>>      as that of its parent, and so without a mount ID, virtiofsd will not
>>      be able to recognize the nested mount's root as a submount.
>>      However, thanks to virtiofsd then treating both trees as exactly the
>>      same tree, it will be caught up in a loop when the guest tries to
>>      examine the nested submount, so the guest will always see nothing
>>      but an ELOOP there.  Therefore, this case is just fully broken
>>      without statx(), whether we check for submounts (based on st_dev) or
>>      not.
>>
>> All in all, checking for submounts works well even without comparing the
>> mount ID (i.e., without statx()).  The only concern is an edge case
>> that, without statx() mount IDs, is utterly broken anyway.
>>
>> Thus, drop said check in lo_init().
>>
>> Reported-by: Miklos Szeredi <mszeredi@redhat.com>
>> Signed-off-by: Max Reitz <mreitz@redhat.com>
> 
> OK, that seems to have been the outcome of the discussion here:
>    https://lists.gnu.org/archive/html/qemu-devel/2020-11/msg00500.html

That’s right.

> so
> 
> 
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

Thanks :)

Max


