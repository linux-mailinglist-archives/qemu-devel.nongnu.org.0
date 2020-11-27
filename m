Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB06F2C6A3A
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 17:55:06 +0100 (CET)
Received: from localhost ([::1]:33602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kih1V-0007PY-Sd
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 11:55:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kigym-0005sY-Ky
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 11:52:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22830)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kigyl-0005i4-23
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 11:52:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606495934;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DiUuRAyQSrXuXR4HGr/YYGc+2YlTngLCaGo//bLNbI4=;
 b=FTSUA8ZBTUL82Q1qUr9n9m5PvxCpdbNqU24p1bjCQ3/7XMwjSwz3uqpahn1W53VUi85Ify
 J2s3y2A0kmmTCvSo63lYTrxfLoZAK3gdF3utJRU0YoeLX7I6YxIvSVMVoi3Myhh2DfnWHM
 iWqfrUhf421nftN6jFHyifF8JwJM3yI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-385-B0wyfFGUMzSodlgAQXGIKg-1; Fri, 27 Nov 2020 11:52:12 -0500
X-MC-Unique: B0wyfFGUMzSodlgAQXGIKg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E3993180E470;
 Fri, 27 Nov 2020 16:52:10 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B561D189B4;
 Fri, 27 Nov 2020 16:52:10 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 4CB62113864E; Fri, 27 Nov 2020 17:52:09 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: ImageInfo oddities regarding compression
References: <87r1ofru4z.fsf@dusky.pond.sub.org>
 <20201127101405.GA1596141@redhat.com>
 <20201127103216.GA4736@merkur.fritz.box>
 <87ft4vq9c1.fsf@dusky.pond.sub.org>
 <20201127152534.GC4736@merkur.fritz.box>
Date: Fri, 27 Nov 2020 17:52:09 +0100
In-Reply-To: <20201127152534.GC4736@merkur.fritz.box> (Kevin Wolf's message of
 "Fri, 27 Nov 2020 16:25:34 +0100")
Message-ID: <87eeken3nq.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Denis Plotnikov <dplotnikov@virtuozzo.com>,
 "Daniel P. =?utf-8?Q?Berra?= =?utf-8?Q?ng=C3=A9?=" <berrange@redhat.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Kevin Wolf <kwolf@redhat.com> writes:

> Am 27.11.2020 um 13:21 hat Markus Armbruster geschrieben:
>> >> I fell down this (thankfully shallow) rabbit hole because we also have
>> >> 
>> >>     { 'enum': 'MultiFDCompression',
>> >>       'data': [ 'none', 'zlib',
>> >>                 { 'name': 'zstd', 'if': 'defined(CONFIG_ZSTD)' } ] }
>> >> 
>> >> I wonder whether we could merge them into a common type.
>> 
>> Looks like we could: current code would never report the additional
>> value 'none'.  Introspection would show it, though.  Seems unlikely to
>> cause trouble.  Observation, not demand.
>
> Forgot to comment on this one...
>
> Technically we could probably, but would it make sense? Support for
> compression formats has to be implemented separately for both cases, so
> that they currently happen to support the same list is more of a
> coincidence.
>
> If we ever add a third compression format to qcow2, would we add the
> same format to migration, too, or would we split the schema into two
> types again?

I figure if a compression method is worth adding to one, it's probably
worth adding to the other.

Having two separate enums isn't too bad.  A third has been proposed[*],
but I hope we can reuse migration's existing enum there.


[*] [PATCH 1/6] migration: Add multi-thread compress method


