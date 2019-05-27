Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A2672BA47
	for <lists+qemu-devel@lfdr.de>; Mon, 27 May 2019 20:40:15 +0200 (CEST)
Received: from localhost ([127.0.0.1]:49372 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hVKXe-0004pZ-0Y
	for lists+qemu-devel@lfdr.de; Mon, 27 May 2019 14:40:14 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36839)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1hVKWW-0004SY-Hk
	for qemu-devel@nongnu.org; Mon, 27 May 2019 14:39:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1hVKWV-0005pq-Mw
	for qemu-devel@nongnu.org; Mon, 27 May 2019 14:39:04 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53560)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>) id 1hVKWV-0005pQ-Ip
	for qemu-devel@nongnu.org; Mon, 27 May 2019 14:39:03 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id F3F5E3087930
	for <qemu-devel@nongnu.org>; Mon, 27 May 2019 18:39:01 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-117-250.ams2.redhat.com
	[10.36.117.250])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9520D7940D;
	Mon, 27 May 2019 18:38:58 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 435431138648; Mon, 27 May 2019 20:38:57 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
References: <1558079119-320634-1-git-send-email-imammedo@redhat.com>
	<1558079119-320634-5-git-send-email-imammedo@redhat.com>
Date: Mon, 27 May 2019 20:38:57 +0200
In-Reply-To: <1558079119-320634-5-git-send-email-imammedo@redhat.com> (Igor
	Mammedov's message of "Fri, 17 May 2019 09:45:17 +0200")
Message-ID: <87woibhhdq.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.45]);
	Mon, 27 May 2019 18:39:02 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v3 4/6] numa: introduce
 "numa-mem-supported" machine property
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: libvir-list@redhat.com, pbonzini@redhat.com, berrange@redhat.com,
	qemu-devel@nongnu.org, ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Igor Mammedov <imammedo@redhat.com> writes:

> '-numa mem' option has a number of issues and mgmt often defaults
> to it. Unfortunately it's no possible to replace it with an alternative
> '-numa memdev' without breaking migration compatibility.

To be precise: -numa node,mem=... and -numa node,memdev=...  Correct?

>                                                          What's possible
> though is to deprecate it, keeping option working with old machine types.
> Once deprecation period expires, QEMU will disable '-numa mem' option,
> usage on new machine types and when the last machine type that supported
> it is removed we would be able to remove '-numa mem' with associated code.
>
> In order to help mgmt to find out if being deprecated CLI option
> '-numa mem=SZ' is still supported by particular machine type, expose
> this information via "numa-mem-supported" machine property.
>
> Users can use "qom-list-properties" QMP command to list machine type
> properties including initial proprety values (when probing for supported
> machine types with '-machine none') or at runtime at preconfig time
> before numa mapping is configured and decide if they should used legacy
> '-numa mem' or alternative '-numa memdev' option.

This sentence is impenetrable, I'm afraid :)

If we only want to convey whether a machine type supports -numa
node,mem=..., then adding a flag to query-machines suffices.  Since I'm
pretty sure you'd have figured that out yourself, I suspect I'm missing
something.  Can you give me some examples of intended usage?

