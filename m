Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FD0530B586
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 03:58:56 +0100 (CET)
Received: from localhost ([::1]:45774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6lu2-0004dD-4V
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 21:58:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l6ls7-00047R-LB
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 21:56:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:59166)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l6ls3-0007jx-Tj
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 21:56:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612234609;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jVxPtTepzlzusweWIdVeq/O0Xy0XGl1Y6s9km7uBv/8=;
 b=UsbgTP22ApuPHi6LAKyxWLYQ+qeyIWh2HhMzpuryyF40/HI7wyyE3h6H1HLXzE4KR0Ic0A
 Hqhip1fo16RKf2/zati1ToghV6l2HWYKZprgNFu5MB04HqDUYKR7Ppdqmyxqxfrfnddsd7
 UbDi3Eec2sdrib80X4465XcqQ+Swa8c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-594-psG4agsTND2NVvqV3VPF5w-1; Mon, 01 Feb 2021 21:56:46 -0500
X-MC-Unique: psG4agsTND2NVvqV3VPF5w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 420121823DCC;
 Tue,  2 Feb 2021 02:56:45 +0000 (UTC)
Received: from [10.3.112.103] (ovpn-112-103.phx2.redhat.com [10.3.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 520795E1A8;
 Tue,  2 Feb 2021 02:56:41 +0000 (UTC)
Subject: Re: [PATCH v4 00/16] 64bit block-layer: part I
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20201211183934.169161-1-vsementsov@virtuozzo.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <81abe7dc-6053-72d2-ddf7-352dc21e75b6@redhat.com>
Date: Mon, 1 Feb 2021 20:56:40 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20201211183934.169161-1-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: fam@euphon.net, kwolf@redhat.com, berto@igalia.com, qemu-devel@nongnu.org,
 mreitz@redhat.com, stefanha@redhat.com, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/11/20 12:39 PM, Vladimir Sementsov-Ogievskiy wrote:
> Hi all!
> 
> We want 64bit write-zeroes, and for this, convert all io functions to
> 64bit.
> 
> We chose signed type, to be consistent with off_t (which is signed) and
> with possibility for signed return type (where negative value means
> error).
> 
> Please refer to initial cover-letter 
>  https://lists.gnu.org/archive/html/qemu-devel/2020-03/msg08723.html
> for more info.
> 
> v4: I found, that some more work is needed for block/block-backend, so
> decided to make partI, converting block/io
> 
> v4 is based on Kevin's block branch ([PULL 00/34] Block layer patches)
>    for BDRV_MAX_LENGTH
> 
> changes:
> 01-05: new
> 06: add Alberto's r-b
> 07: new
> 08-16: rebase, add new-style request check, improve commit-msg, drop r-bs

I had planned to send a pull request for this series today, but ran into
a snag.  Without this series applied, './check -qcow2' fails 030, 185,
and 297.  With it applied, I now also get a failure in 206.  I'm trying
to bisect which patch caused the problem, but here's the failure:

206   fail       [20:54:54] [20:55:01]   6.9s   (last: 6.7s)  output
mismatch (see 206.out.bad)
--- /home/eblake/qemu/tests/qemu-iotests/206.out
+++ 206.out.bad
@@ -180,7 +180,7 @@

 {"execute": "blockdev-create", "arguments": {"job-id": "job0",
"options": {"driver": "qcow2", "file": "node0", "size":
9223372036854775296}}}
 {"return": {}}
-Job failed: Could not resize image: Required too big image size, it
must be not greater than 9223372035781033984
+Job failed: Could not resize image: offset(9223372036854775296) exceeds
maximum(9223372035781033984)
 {"execute": "job-dismiss", "arguments": {"id": "job0"}}
 {"return": {}}

Looks like it is just a changed error message, so I can touch up the
correct patch and then repackage the pull request tomorrow (it's too
late for me today).  Oh, and the 0 exit status of ./check when a test
fails is something I see you already plan on fixing...

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


