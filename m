Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6801C5B1414
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Sep 2022 07:34:57 +0200 (CEST)
Received: from localhost ([::1]:43896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWABj-00083J-SZ
	for lists+qemu-devel@lfdr.de; Thu, 08 Sep 2022 01:34:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oWA6P-000537-TE
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 01:29:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32583)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oWA5r-0008A4-9o
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 01:29:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662614930;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3PK91NmpNqtFuTE7/v2nvYkQOd2hbkWhDMCLzG39j3Y=;
 b=FsOAFwRNZHOOJ1GSnB86ErkGpQudOuoVVKbkOxlk7sdBwENZS5xD3d9ptV9UEuYQsJRqHE
 949VT/+FyJGHohGSltdcd3lukeaNB5DdoaARFW/XSFaLlifr7yLyCJ1Z4qaBE9Cz/SiCBi
 WUqx6sRUgwSoHCGdxdaAaEnEkom2ZIw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-440-AFA7UDdaNfSru7II_xgyXQ-1; Thu, 08 Sep 2022 01:28:46 -0400
X-MC-Unique: AFA7UDdaNfSru7II_xgyXQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 870B5811E80;
 Thu,  8 Sep 2022 05:28:45 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.166])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1F8EA4C816;
 Thu,  8 Sep 2022 05:28:44 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id EE82221E6900; Thu,  8 Sep 2022 07:28:42 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: "Denis V. Lunev" <den@virtuozzo.com>
Cc: qemu-block@nongnu.org,  qemu-devel@nongnu.org,  Peter Krempa
 <pkrempa@redhat.com>,  John Snow <jsnow@redhat.com>,  Kevin Wolf
 <kwolf@redhat.com>,  Hanna Reitz <hreitz@redhat.com>,  Vladimir
 Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Subject: Re: [PATCH v5 0/2] block: add missed block_acct_setup with new
 block device init procedure
References: <20220824095044.166009-1-den@openvz.org>
 <3812f98f-9afc-9e0f-9839-916b083cfc77@virtuozzo.com>
Date: Thu, 08 Sep 2022 07:28:42 +0200
In-Reply-To: <3812f98f-9afc-9e0f-9839-916b083cfc77@virtuozzo.com> (Denis
 V. Lunev's message of "Wed, 7 Sep 2022 19:25:57 +0200")
Message-ID: <871qsmigdx.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

"Denis V. Lunev" <den@virtuozzo.com> writes:

> On 8/24/22 11:50, Denis V. Lunev wrote:
>> Commit 5f76a7aac156ca75680dad5df4a385fd0b58f6b1 is looking harmless from
>> the first glance, but it has changed things a lot. 'libvirt' uses it to
>> detect that it should follow new initialization way and this changes
>> things considerably. With this procedure followed, blockdev_init() is
>> not called anymore and thus block_acct_setup() helper is not called.
>>
>> This means in particular that defaults for block accounting statistics
>> are changed and account_invalid/account_failed are actually initialized
>> as false instead of true originally.
>>
>> This commit changes things to match original world. There are the following
>> constraints:
>> * new default value in block_acct_init() is set to true
>> * block_acct_setup() inside blockdev_init() is called before
>>    blkconf_apply_backend_options()
>> * thus newly created option in block device properties has precedence if
>>    specified
>>
>> Changes from v4:
>> * removed hunk to QAPI which was used to test old initialization path
>> * added R-b: Vladimir
>>
>> Changes from v3:
>> * fixed accidentally wrong submission. Contains changes which should be
>>    sent as v3
>>
>> Changes from v2:
>> * called bool_from_onoffauto(account_..., true) in the first patch to
>>    preserve original semantics before patch 2
>>
>> Changes from v1:
>> * set account_invalid/account_failed to true by default
>> * pass OnOffAuto to block_acct_init() to handle double initialization (patch 1)
>> * changed properties on BLK device to OnOffAuto
>>
>> Signed-off-by: Denis V. Lunev <den@openvz.org>
>> CC: Peter Krempa <pkrempa@redhat.com>
>> CC: Markus Armbruster <armbru@redhat.com>
>> CC: John Snow <jsnow@redhat.com>
>> CC: Kevin Wolf <kwolf@redhat.com>
>> CC: Hanna Reitz <hreitz@redhat.com>
>> CC: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
>>
>>
> ping

Can't find this series anymore.  Care to resend?


