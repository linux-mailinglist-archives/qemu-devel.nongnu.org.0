Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EC0F5B1BCC
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Sep 2022 13:45:46 +0200 (CEST)
Received: from localhost ([::1]:34082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWFyb-000760-MU
	for lists+qemu-devel@lfdr.de; Thu, 08 Sep 2022 07:45:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oWFsq-0001TL-Vp
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 07:39:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28122)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oWFsn-0006c9-TN
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 07:39:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662637184;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=B4FCX3JJdxrWeMIxB/oXdibY7jRoF9aDKun5yEjm/t0=;
 b=Fp2xHUVTFpiaV3ElLVma3gfUpexoECSNIBi7kjiL1MDOP2Xpg7M29USE3Lg+Pc/qTn/rX0
 s7L04WK0nzqk3Pd2cuxQHQ/srPxE5Vbup1itOyElvX4wKUQWn3ZXraaj5B6TF3o3LeDtHF
 1OpjOw8pTlvnc5O/CUIYdSlOGmNu+jk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-455-5-Gcs9OoNpW4k0pD35Y14w-1; Thu, 08 Sep 2022 07:39:43 -0400
X-MC-Unique: 5-Gcs9OoNpW4k0pD35Y14w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0A70A296A608
 for <qemu-devel@nongnu.org>; Thu,  8 Sep 2022 11:39:43 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.166])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D627B40CF8F0;
 Thu,  8 Sep 2022 11:39:42 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 64B0821E6900; Thu,  8 Sep 2022 13:39:41 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: victortoso@redhat.com
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org, stefanha@redhat.com
Subject: Re: [PULL 00/10] QAPI patches patches for 2022-09-07
References: <20220907150327.538464-1-armbru@redhat.com>
 <YxnK7jFo+g2Ahvf4@redhat.com> <87illydrta.fsf@pond.sub.org>
Date: Thu, 08 Sep 2022 13:39:41 +0200
In-Reply-To: <87illydrta.fsf@pond.sub.org> (Markus Armbruster's message of
 "Thu, 08 Sep 2022 13:33:05 +0200")
Message-ID: <87czc6dria.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Markus Armbruster <armbru@redhat.com> writes:

> Kevin Wolf <kwolf@redhat.com> writes:
>
>> Am 07.09.2022 um 17:03 hat Markus Armbruster geschrieben:
>>> The following changes since commit 946e9bccf12f2bcc3ca471b820738fb22d14fc80:
>>> 
>>>   Merge tag 'samuel-thibault' of https://people.debian.org/~sthibault/qemu into staging (2022-09-06 08:31:24 -0400)
>>> 
>>> are available in the Git repository at:
>>> 
>>>   git://repo.or.cz/qemu/armbru.git tags/pull-qapi-2022-09-07
>>> 
>>> for you to fetch changes up to 6e7a37ffc230d06852f1a8893097331d39df77c9:
>>> 
>>>   qapi: fix examples of events missing timestamp (2022-09-07 15:10:13 +0200)
>>> 
>>> ----------------------------------------------------------------
>>> QAPI patches patches for 2022-09-07
>>> 
>>> ----------------------------------------------------------------
>>> Victor Toso (10):
>>>       qapi: fix example of query-ballon command
>>>       qapi: fix example of query-vnc command
>>>       qapi: fix example of query-dump-guest-memory-capability command
>>>       qapi: fix example of BLOCK_JOB_READY event
>>>       qapi: fix example of NIC_RX_FILTER_CHANGED event
>>>       qapi: fix example of DEVICE_UNPLUG_GUEST_ERROR event
>>>       qapi: fix example of MEM_UNPLUG_ERROR event
>>>       qapi: fix examples of blockdev-add with qcow2
>>
>> NACK, this patch is wrong.
>>
>> 'file' is a required member (defined in BlockdevOptionsGenericFormat),
>> removing it makes the example invalid. 'data-file' is only an additional
>> optional member to be used for external data files (i.e. when the guest
>> data is kept separate from the metadata in the .qcow2 file).
>
> I'll respin with #8 dropped.  Thank you!

Too late, it's already merged.

Victor, could you fix on top?  Or would you like me to revert the patch?


