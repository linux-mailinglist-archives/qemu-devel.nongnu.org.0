Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 588EC3F60F1
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 16:50:46 +0200 (CEST)
Received: from localhost ([::1]:40816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIXlF-0005jj-7G
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 10:50:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mIXg1-0004xA-PS
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 10:45:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42499)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mIXfy-0002Q5-UH
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 10:45:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629816316;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=eEniwmsCVf/WkZzvCWanA1UhGlN2hV3Vd0v9sL7CUh0=;
 b=g9kdlY4FVmnLX1sAlbVjPItu0MU/8BZVPMpkv3OMgQT+mL9dRQFs+PXwr4jc4J53eozZPq
 9vq9MmZ8L1lMp9dZQmtsEM21ODFZirQwazvTn8LIKus8rem6Ytpy5g28o3ec1UIY6cMz7v
 azK2aOrYwXsFVAVwH+y5j0bMYlHGqro=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-577-3LRUvnrBMX6No48katsK1w-1; Tue, 24 Aug 2021 10:45:15 -0400
X-MC-Unique: 3LRUvnrBMX6No48katsK1w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7295894EE7;
 Tue, 24 Aug 2021 14:45:14 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-4.ams2.redhat.com [10.36.112.4])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 461EE60E1C;
 Tue, 24 Aug 2021 14:45:14 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id D375511380A9; Tue, 24 Aug 2021 16:45:12 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: [PATCH v2 1/5] qemu/qarray.h: introduce QArray
References: <cover.1629638507.git.qemu_oss@crudebyte.com>
 <42e8b7fec3f03487e322be42ef5ca0e09fd9edea.1629638507.git.qemu_oss@crudebyte.com>
 <87eeajnter.fsf@dusky.pond.sub.org> <15979909.kkRmxpahtA@silver>
Date: Tue, 24 Aug 2021 16:45:12 +0200
In-Reply-To: <15979909.kkRmxpahtA@silver> (Christian Schoenebeck's message of
 "Tue, 24 Aug 2021 13:51:13 +0200")
Message-ID: <8735qydhqf.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.747,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Christian Schoenebeck <qemu_oss@crudebyte.com> writes:

> On Dienstag, 24. August 2021 10:22:52 CEST Markus Armbruster wrote:

[...]

>> Please use GPLv2+ unless you have a compelling reason not to.
>> 
>> [...]
>
> Is that a requirement?
>
> It is just my personal license preference. AFAICS there are numerous sources 
> in QEMU released under MIT license as well.

The licensing situation is a mess.

The only hard requirement is "compatible with GPLv2+".  We prefer GPLv2+
for new code, except as detailed in ./LICENSE.  We're stuck with a
sizable body of existing code that is GPLv2 (no +), but decided to put
limits to that madness.  Again, see ./LICENSE for details.

I'm asking you to help with limiting the madness by sticking to GPLv2+
whenever possible.


