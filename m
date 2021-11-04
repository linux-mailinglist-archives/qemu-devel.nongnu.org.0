Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B072444E90
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Nov 2021 06:57:19 +0100 (CET)
Received: from localhost ([::1]:35790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miVkT-0001y6-Ls
	for lists+qemu-devel@lfdr.de; Thu, 04 Nov 2021 01:57:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1miVdC-0006XM-S3
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 01:49:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50610)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1miVdA-0004bu-MV
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 01:49:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636004983;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SgG6h23Cn3xbYq25l2nnhPvbIlPSMTEWPMT13+CsEwU=;
 b=gumZZjdIlUkopsNKTsnodEdXVYq/gjg9h700EM2YP0qBlA3MuL2uAvAxHkYtJyRGxxWMoM
 4oevwk1OlX9+7qF3RMarVQePZM3dqwFoz4FCzJ7NhD62vF5u7mtC6s1eQGU8iIns89GoLH
 XHnO0mjZD/Mtr4AQEnWzlBf/a9+bS8k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-292-TZ9LfsRePNOJb75V2odwzA-1; Thu, 04 Nov 2021 01:49:40 -0400
X-MC-Unique: TZ9LfsRePNOJb75V2odwzA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0D71810A8E00;
 Thu,  4 Nov 2021 05:49:39 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8B1415F4ED;
 Thu,  4 Nov 2021 05:49:38 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 1811A11380A7; Thu,  4 Nov 2021 06:49:37 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v4 5/5] block: Deprecate transaction type drive-backup
References: <20211025042405.3762351-1-armbru@redhat.com>
 <20211025042405.3762351-6-armbru@redhat.com>
 <c505d2d8-955d-7c64-b769-80ed40428ed5@virtuozzo.com>
Date: Thu, 04 Nov 2021 06:49:37 +0100
In-Reply-To: <c505d2d8-955d-7c64-b769-80ed40428ed5@virtuozzo.com> (Vladimir
 Sementsov-Ogievskiy's message of "Wed, 3 Nov 2021 16:40:00 +0300")
Message-ID: <87ee7wh3m6.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, pkrempa@redhat.com, berrange@redhat.com,
 libvir-list@redhat.com, eblake@redhat.com, mdroth@linux.vnet.ibm.com,
 qemu-devel@nongnu.org, marcandre.lureau@redhat.com, jsnow@redhat.com,
 libguestfs@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> writes:

> 25.10.2021 07:24, Markus Armbruster wrote:
>> Several moons ago, Vladimir posted
>> 
>>      Subject: [PATCH v2 3/3] qapi: deprecate drive-backup
>>      Date: Wed,  5 May 2021 16:58:03 +0300
>>      Message-Id:<20210505135803.67896-4-vsementsov@virtuozzo.com>
>>      https://lists.gnu.org/archive/html/qemu-devel/2021-05/msg01394.html
>> 
>> with this
>> 
>>      TODO: We also need to deprecate drive-backup transaction action..
>>      But union members in QAPI doesn't support 'deprecated' feature. I tried
>>      to dig a bit, but failed :/ Markus, could you please help with it? At
>>      least by advice?
>> 
>> This is one way to resolve it.  Sorry it took so long.
>> 
>> John explored another way, namely adding feature flags to union
>> branches.  Could also be useful, say to add different features to
>> branches in multiple unions sharing the same tag enum.
>> 
>> Signed-off-by: Markus Armbruster<armbru@redhat.com>
>
> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>
> (with simplified commit message of course :)

Your "[PATCH v2 0/3] qapi & doc: deprecate drive-backup" series contains

  docs/block-replication: use blockdev-backup
  docs/interop/bitmaps: use blockdev-backup
  qapi: deprecate drive-backup

I figure proper deprecation needs all that, i.e. we need to merge my RFC
patch into your 3/3.  Could you take care of that?


