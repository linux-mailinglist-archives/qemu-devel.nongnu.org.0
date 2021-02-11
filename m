Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6846D3195F7
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 23:43:16 +0100 (CET)
Received: from localhost ([::1]:56936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAKg7-00069Q-1h
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 17:43:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lAKeQ-0005bE-QZ
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 17:41:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54069)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lAKeN-00061k-O7
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 17:41:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613083286;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bltqq03oXUl2UDKpTQtfsJYgMvM8ZdhS9euo3ibewSA=;
 b=C0MMsr2jpWYVJapK/dJSmijm9x+hSB6FPEE3Jas9Capd45iZf2dS4NyPx60ySX39aGtdh1
 8eJp+4Shw94fDIGe1jhMVadaF18wUOINhWuFkaandARBGVDv+YClmdN6bh9tRn2CVCvu0j
 nj5F7mKABRuI+WF4nVdyPF5En7BU1sI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-245-yS6hTftcNvGzdE5rYw-xIA-1; Thu, 11 Feb 2021 17:41:22 -0500
X-MC-Unique: yS6hTftcNvGzdE5rYw-xIA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1AB65192CC40;
 Thu, 11 Feb 2021 22:41:21 +0000 (UTC)
Received: from [10.3.114.150] (ovpn-114-150.phx2.redhat.com [10.3.114.150])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EEB9D6B8DF;
 Thu, 11 Feb 2021 22:40:55 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210211142656.3818078-1-philmd@redhat.com>
 <20210211142656.3818078-2-philmd@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Subject: Re: [PATCH v2 1/2] block: Explicit null-co uses 'read-zeroes=false'
Message-ID: <40f42cc8-521f-5090-63cf-b4549be43905@redhat.com>
Date: Thu, 11 Feb 2021 16:40:50 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210211142656.3818078-2-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.119, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 Bandan Das <bsd@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/11/21 8:26 AM, Philippe Mathieu-Daudé wrote:
> We are going to switch the 'null-co' default 'read-zeroes' value
> from FALSE to TRUE in the next commit. First explicit the FALSE
> value when it is not set.

Grammar suggestion, along with a suggestion for an additional sentence
to make the intent of this commit clearer:

As a first step, request an explicit FALSE value rather than relying on
the defaults.  This is intended to be a purely mechanical adjustment for
no performance behavior in the tests; later patches may then flip or
elide the explicit choice for tests where performance does not matter.

> 
> Suggested-by: Eric Blake <eblake@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
> - Missing: 056 & 155. I couldn't figure out the proper syntax,
>   any help welcomed...

056 - looks like just one line:
        self.vm =
iotests.VM().add_drive_raw("file=blkdebug::null-co://,id=drive0,align=65536,driver=blkdebug")

the best way to add it here would be rewriting that line to use blockdev
syntax rather than blkdebug: URI syntax.  The other question is whether
it is a noticeable time difference when the default is flipped in 2/2.

155 - looks like several uses such as:

class TestBlockdevMirrorForcedBacking(MirrorBaseClass):
    cmd = 'blockdev-mirror'
    existing = True
    target_backing = None
    target_blockdev_backing = { 'driver': 'null-co' }
    target_real_backing = 'null-co://'


> - I'm unsure about 162, this doesn't seem to use the null-co
>   driver but rather testing global syntax.

Concur; I don't see any reason to worry about this one (but mentioning
it in the commit message can't hurt in case someone asks later)

# blkdebug expects all of its arguments to be strings, but its
# bdrv_refresh_filename() implementation should not assume that they
have been
# passed as strings in the original options QDict.
# So this should emit blkdebug:42:null-co:// as the filename:
touch 42
$QEMU_IMG info 'json:{"driver": "blkdebug", "config": 42,
                      "image.driver": "null-co"}' \


> ---
>  docs/devel/testing.rst                     | 14 +++++++-------
>  tests/qtest/fuzz/generic_fuzz_configs.h    | 11 ++++++-----
>  tests/test-bdrv-drain.c                    | 10 ++++++++--
>  tests/acceptance/virtio_check_params.py    |  2 +-
>  tests/perf/block/qcow2/convert-blockstatus |  6 +++---
>  tests/qemu-iotests/040                     |  2 +-

You did a pretty good hunt for culprits!

>  tests/qemu-iotests/041                     | 12 ++++++++----
>  tests/qemu-iotests/051                     |  2 +-
>  tests/qemu-iotests/051.out                 |  2 +-
>  tests/qemu-iotests/051.pc.out              |  4 ++--

and for the fallout to the iotests.

I did not audit for which tests are easy candidates for dropping the
explicit read-zeroes=false (that is, where the extra time in allowing
the flipped default doesn't penalize the test), but am okay giving this
patch:

Reviewed-by: Eric Blake <eblake@redhat.com>


-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


