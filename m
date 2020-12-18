Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 018A52DEAA8
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 22:00:25 +0100 (CET)
Received: from localhost ([::1]:40446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqMrQ-0008K0-16
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 16:00:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kqMpE-0006Tt-TX
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 15:58:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:37651)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kqMpA-0004Mx-8S
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 15:58:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608325083;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=a2rSCmqYnxouTPZAIIX8HoTFNOsVUpqCQJQz18NOLfA=;
 b=EeR0P0Sc/wOmV7HfEUkuvWk0lEkVmm72SMLw3eUPKMkrWJ0iUebFOkVkheNUg+FH7+T3km
 p9+pFmghWU7xxcAJUovrjaNQBZnAemTg7yOm/Ma3PrZIVQCvlT28adSbv+XaWLktBbxYAg
 FqYsuf9TgCmLY+8w65sBuEw/I5T3si4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-298-qhQvSpMKM3Cul9eS7ebIVQ-1; Fri, 18 Dec 2020 15:58:01 -0500
X-MC-Unique: qhQvSpMKM3Cul9eS7ebIVQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EBD1B800D53
 for <qemu-devel@nongnu.org>; Fri, 18 Dec 2020 20:58:00 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9C186614FF;
 Fri, 18 Dec 2020 20:57:57 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 2B4561130358; Fri, 18 Dec 2020 21:57:56 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH 08/12] qapi/schema: make QAPISourceInfo mandatory
References: <20201214235327.1007124-1-jsnow@redhat.com>
 <20201214235327.1007124-9-jsnow@redhat.com>
 <875z52rr3h.fsf@dusky.pond.sub.org>
 <60c5ae45-c1c4-8bac-9617-5366e49dac7e@redhat.com>
 <87pn38lv1d.fsf@dusky.pond.sub.org>
 <e9f43898-1c0b-54e3-59a7-d9064c2d86ea@redhat.com>
 <87mtybd6ut.fsf@dusky.pond.sub.org>
 <e99196f0-8ea7-6627-04c3-e07754321e01@redhat.com>
Date: Fri, 18 Dec 2020 21:57:56 +0100
In-Reply-To: <e99196f0-8ea7-6627-04c3-e07754321e01@redhat.com> (John Snow's
 message of "Fri, 18 Dec 2020 14:17:41 -0500")
Message-ID: <87mtya7rxn.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

John Snow <jsnow@redhat.com> writes:

> On 12/18/20 12:24 AM, Markus Armbruster wrote:
>>> I could conceivably use source line information and stuff, to be
>>> needlessly fancy about it. Nah. I just think singleton patterns are kind
>>> of weird to implement in Python, so I didn't.
>> Stupidest singleton that could possibly work: in __init__,
>> self.singleton = ...
>> 
>
> Yeah, you can make a class variable that has a builtin singleton, then
> make the class method return that class variable.
>
> Feels fancier than my laziness permits. I just put it back to using
> one copy per definition.

Why have a class method around the attribute?  Just use the stoopid
attribute already ;-P


