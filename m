Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 151313C158D
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 16:58:57 +0200 (CEST)
Received: from localhost ([::1]:49772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1VUO-0003e7-3D
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 10:58:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1m1VSF-0000DT-De
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 10:56:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22850)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1m1VSC-00015C-4S
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 10:56:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625756199;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rlhQYxcegNFp3YGNxTiYlLa80ewIdvgAKiVYN2QRzYA=;
 b=axRJBQOvL8Dp04z1oDbl08fnh2qORvA0rsszHuMLjDB5RFXNlfA7JT2I8nLMt45OMIm/91
 DEMWfqlgGXqvKffYpRKkxPloIkyAFF8Eehvf3zbCHnkzirz6GgWYvX2eKlMTbbe34TOPh6
 h7qSuA6N4E4xocVFBNqNrdidJYyTzi0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-378-bbTM7aa8Ny6k0oRNELIgdw-1; Thu, 08 Jul 2021 10:56:36 -0400
X-MC-Unique: bbTM7aa8Ny6k0oRNELIgdw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C8D0A939
 for <qemu-devel@nongnu.org>; Thu,  8 Jul 2021 14:56:35 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-104.ams2.redhat.com
 [10.36.112.104])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4754C60C13;
 Thu,  8 Jul 2021 14:56:32 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id D55D91132B52; Thu,  8 Jul 2021 16:56:29 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [RFC PATCH] audio: Make the AudiodevDriver enum conditional
References: <20210624183716.515721-1-thuth@redhat.com>
 <YNWUGh2XmQ7eXtmQ@redhat.com>
 <4c27da0d-ef3c-c1da-0d80-d8496292b85c@redhat.com>
Date: Thu, 08 Jul 2021 16:56:29 +0200
In-Reply-To: <4c27da0d-ef3c-c1da-0d80-d8496292b85c@redhat.com> (Thomas Huth's
 message of "Fri, 25 Jun 2021 10:45:44 +0200")
Message-ID: <87v95kdfc2.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.45,
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
Cc: Eric Blake <eblake@redhat.com>,
 "Daniel P. =?utf-8?Q?Berrang=C3=A9?=" <berrange@redhat.com>,
 qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Thomas Huth <thuth@redhat.com> writes:

> On 25/06/2021 10.30, Daniel P. Berrang=C3=A9 wrote:
>> On Thu, Jun 24, 2021 at 08:37:16PM +0200, Thomas Huth wrote:
>>> This way, the upper layers like libvirt could have the possibility
>>> to use QAPI to find out which audio drivers have been enabled during
>>> compile-time of QEMU.
>>>
>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>> ---
>>>   Note: Marked as RFC since it's quite a lot of ifdef'ing here...
>>>         not sure whether I really like it...
>> Same as my patch here:
>>    https://lists.gnu.org/archive/html/qemu-devel/2021-03/msg00654.html
>
> Oh, nice, I guess it means that it's not such a bad idea to introduce
> all those #ifdefs here :-)
>
> Anyway, looks like my patch was incomplete anyway (I just hacked it
> together after my corresponding DisplayType patch - see=20
> https://lists.gnu.org/archive/html/qemu-devel/2021-06/msg06529.html),
> since it lacks the wiring via a qapi command, so please disregard this
> RFC PATCH. Are you going to respin your series from March, Daniel?

I reviewed Daniel's series back then, and pointed out a few minor
issues, mostly in commit messages.  I hope that wasn't the reason for it
getting stuck :)


