Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3CF4198E5D
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Mar 2020 10:28:27 +0200 (CEST)
Received: from localhost ([::1]:33902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jJCG3-0002PK-2f
	for lists+qemu-devel@lfdr.de; Tue, 31 Mar 2020 04:28:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56955)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <quintela@redhat.com>) id 1jJCEc-0001Yi-51
 for qemu-devel@nongnu.org; Tue, 31 Mar 2020 04:26:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1jJCEX-0004bg-7e
 for qemu-devel@nongnu.org; Tue, 31 Mar 2020 04:26:58 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:30497
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1jJCEX-0004b2-4Z
 for qemu-devel@nongnu.org; Tue, 31 Mar 2020 04:26:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585643212;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=awS7GLzhSeY846diA6M1a4+PKoAp4C6vJpx6PC/yzgw=;
 b=XEG2/XilbBhcear9W5w1+tXCbb42wOmJWi78dZx3F1SghFO+Xe9d9VueqwShF4KCY8MhDe
 6hI0Y7qDsgCZg4Kk/gTQ8AJ0+NdrdkbI3/YqmD21tgXjFQWKsp5GxGIZ4I7BLDWn8STMpd
 3gyCXCknIG0g6L30k6QsMhQr2eyVnnI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-465-4GgGVWS3NPO_GIm6-3HAPg-1; Tue, 31 Mar 2020 04:26:50 -0400
X-MC-Unique: 4GgGVWS3NPO_GIm6-3HAPg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 80E57800D6C;
 Tue, 31 Mar 2020 08:26:44 +0000 (UTC)
Received: from redhat.com (ovpn-112-10.ams2.redhat.com [10.36.112.10])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4784419C58;
 Tue, 31 Mar 2020 08:26:43 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: Mao Zhongyi <maozhongyi@cmss.chinamobile.com>
Subject: Re: [PATCH v2 1/3] migration/migration: improve error reporting for
 migrate parameters
In-Reply-To: <4ce71da4a5f98ad6ead0806ec71043473dcb4c07.1585641083.git.maozhongyi@cmss.chinamobile.com>
 (Mao Zhongyi's message of "Tue, 31 Mar 2020 16:22:05 +0800")
References: <cover.1585641083.git.maozhongyi@cmss.chinamobile.com>
 <cover.1585641083.git.maozhongyi@cmss.chinamobile.com>
 <4ce71da4a5f98ad6ead0806ec71043473dcb4c07.1585641083.git.maozhongyi@cmss.chinamobile.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
Date: Tue, 31 Mar 2020 10:26:41 +0200
Message-ID: <87sghpj5fi.fsf@secure.laptop>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: qemu-devel@nongnu.org, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Mao Zhongyi <maozhongyi@cmss.chinamobile.com> wrote:
> use QERR_INVALID_PARAMETER_VALUE instead of
> "Parameter '%s' expects" for consistency.
>
> Signed-off-by: Mao Zhongyi <maozhongyi@cmss.chinamobile.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>


