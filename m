Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0BD81355F3
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jan 2020 10:40:30 +0100 (CET)
Received: from localhost ([::1]:57430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ipUIn-0004Pe-AK
	for lists+qemu-devel@lfdr.de; Thu, 09 Jan 2020 04:40:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49739)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <quintela@redhat.com>) id 1ipUHw-0003td-LM
 for qemu-devel@nongnu.org; Thu, 09 Jan 2020 04:39:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1ipUHt-0008Of-Sf
 for qemu-devel@nongnu.org; Thu, 09 Jan 2020 04:39:34 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:32299
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1ipUHt-0008Hk-9S
 for qemu-devel@nongnu.org; Thu, 09 Jan 2020 04:39:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578562772;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8rue+wooxEPA251PGo2zyVGDqBiTcv60b/Y8XLxfNjE=;
 b=CCyLiG8D70R95AyiorQEMS/BFXJ6ZpS+NrZHTTiukAkyAWo5fJfIhJFxFhr3zY0KnlVEWI
 iuQTutrgN5HG4i+DBYFvfUWsNjwZCAHEzzzgeMXvA3bGA0RHFwUtxC3JibJGWgYgycPs73
 58cbUQiEFcmBV0DD2mA7x/T8slfKSTY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-182-3PWOc2_YNV-R7EWevUa1uA-1; Thu, 09 Jan 2020 04:39:29 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1C0418024D1;
 Thu,  9 Jan 2020 09:39:28 +0000 (UTC)
Received: from redhat.com (ovpn-116-22.ams2.redhat.com [10.36.116.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8A72819C69;
 Thu,  9 Jan 2020 09:39:27 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: Wei Yang <richardw.yang@linux.intel.com>
Subject: Re: [Patch v2 1/6] migration/postcopy: reduce memset when it is zero
 page and matches_target_page_size
In-Reply-To: <20191107123907.29791-2-richardw.yang@linux.intel.com> (Wei
 Yang's message of "Thu, 7 Nov 2019 20:39:02 +0800")
References: <20191107123907.29791-1-richardw.yang@linux.intel.com>
 <20191107123907.29791-2-richardw.yang@linux.intel.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
Date: Thu, 09 Jan 2020 10:39:25 +0100
Message-ID: <87lfqh0y0i.fsf@secure.laptop>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: 3PWOc2_YNV-R7EWevUa1uA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
Reply-To: quintela@redhat.com
Cc: dgilbert@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Wei Yang <richardw.yang@linux.intel.com> wrote:
> In this case, page_buffer content would not be used.
>
> Skip this to save some time.
>
> Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

Acked-by: Juan Quintela <quintela@redhat.com>


