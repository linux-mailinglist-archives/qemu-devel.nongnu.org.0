Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 057213DEBAD
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 13:24:30 +0200 (CEST)
Received: from localhost ([::1]:39706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAsX7-0000jo-3R
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 07:24:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mAsW6-0008Sf-Lb
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 07:23:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58579)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mAsW5-0004um-B1
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 07:23:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627989804;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wdmMKJmhZ3o019HCAhdacaIzYBNMYC4i357sNbfRLDM=;
 b=da0M6JOThRGdm0kV7LpXOvxWVg0o8jOv4Fch7Pe1wrPIzcpzIQsVprdNoJ7Rt2kfbqCumD
 u9d2SpLAgs926rVYhPEdQEaz+laWEVgfMDtmxCi7h1JsnXw5ZCdOAPk+yKgEmjvfEuwW4n
 EqUciptcgBFGdLbCp+Z1cR7jj5z8zYs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-4-1iAcMGPCPw6l52ms9LwFkw-1; Tue, 03 Aug 2021 07:23:23 -0400
X-MC-Unique: 1iAcMGPCPw6l52ms9LwFkw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 94923875047
 for <qemu-devel@nongnu.org>; Tue,  3 Aug 2021 11:23:22 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-12.ams2.redhat.com
 [10.36.112.12])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3967C5DEFB;
 Tue,  3 Aug 2021 11:23:15 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id B456911380A0; Tue,  3 Aug 2021 13:23:13 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: marcandre.lureau@redhat.com
Subject: Re: [PATCH v6 05/11] qapi: introduce QAPISchemaIfCond.cgen()
References: <20210618102507.3761128-1-marcandre.lureau@redhat.com>
 <20210618102507.3761128-6-marcandre.lureau@redhat.com>
 <87pmuvoqek.fsf@dusky.pond.sub.org>
 <87a6lyu65c.fsf@dusky.pond.sub.org>
 <875ywmu645.fsf@dusky.pond.sub.org>
Date: Tue, 03 Aug 2021 13:23:13 +0200
In-Reply-To: <875ywmu645.fsf@dusky.pond.sub.org> (Markus Armbruster's message
 of "Tue, 03 Aug 2021 13:20:42 +0200")
Message-ID: <871r7au5zy.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: Eric Blake <eblake@redhat.com>, jsnow@redhat.com, qemu-devel@nongnu.org,
 stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Markus Armbruster <armbru@redhat.com> writes:

> Markus Armbruster <armbru@redhat.com> writes:
>
> [...]
>
>>> Avoiding the redundant pair of parenthesis takes another special case.
>>> Let's do it.
>>
>> Looks like PATCH 07 does it.  Avoiding the temporary change would be
>> nice, but isn't required.
>
> Make that PATCH 08.

Scratch that, it's 07.  Sorry for the noise.


