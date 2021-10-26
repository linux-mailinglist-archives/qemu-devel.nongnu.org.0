Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7740A43B04E
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 12:40:20 +0200 (CEST)
Received: from localhost ([::1]:44652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfJsR-0004Z0-Gv
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 06:40:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mfJh3-0007rX-Ej
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 06:28:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34631)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mfJgz-0004ZY-Vs
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 06:28:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635244107;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=08vgZyu/Jp1juWlspf3RLE/aFXs36i35/BgvTgdnwYE=;
 b=XhJ5OEbqPdScPNsL/xY3tzO1x+l9/nLX8E4uyMaiuYntMeP3rXZz42vQlA2u44mqIoRzMv
 AmRSxxy5mi56xAiZ20B3JQaZjNU+23RJ30SogptFcKSzHOvmkPCxyZTUpiosUpGJSDo6fX
 GgHi1HnmoLJmfLTaKDxRRIAy7zZqWcU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-513-GW3SgDWpPqGTmP02vJM95Q-1; Tue, 26 Oct 2021 06:28:24 -0400
X-MC-Unique: GW3SgDWpPqGTmP02vJM95Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 36B8D1884819;
 Tue, 26 Oct 2021 10:28:02 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C43F45D6BA;
 Tue, 26 Oct 2021 10:28:01 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 5155411380A7; Tue, 26 Oct 2021 12:28:00 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH 0/5] trace: inroduce qmp: trace namespace
References: <20210923195451.714796-1-vsementsov@virtuozzo.com>
 <87czoa8nul.fsf@dusky.pond.sub.org>
 <9b6f4ade-7be4-6dd0-7b14-950de92d2cc5@virtuozzo.com>
 <YXai1V5L/lVB3IL0@stefanha-x1.localdomain>
Date: Tue, 26 Oct 2021 12:28:00 +0200
In-Reply-To: <YXai1V5L/lVB3IL0@stefanha-x1.localdomain> (Stefan Hajnoczi's
 message of "Mon, 25 Oct 2021 13:28:05 +0100")
Message-ID: <87wnm02i8f.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 libvir-list@redhat.com, michael.roth@amd.com, qemu-devel@nongnu.org,
 pbonzini@redhat.com, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Stefan Hajnoczi <stefanha@redhat.com> writes:

> On Thu, Oct 14, 2021 at 06:22:32PM +0300, Vladimir Sementsov-Ogievskiy wrote:
>> 12.10.2021 14:49, Markus Armbruster wrote:
>> > Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> writes:

[...]

>> Another possible way is to update QAPI code generator to insert a personal
>> trace point for each qmp command.. That seems more complicated to implement,
>> but I can try.
>
> That's what came to mind when I saw this series too. The QAPI generator
> can create a trace event for each QMP command. That way each command has
> a dedicated trace event that can be enabled/disabled in the usual way
> (e.g. built-in "trace" monitor command, SystemTap scripts, etc) without
> introducing special syntax.

I like how this way stays entirely within the existing interface.  I
couldn't tell you how to implement it, though :)


