Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2394F1B1908
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Apr 2020 00:10:00 +0200 (CEST)
Received: from localhost ([::1]:43198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jQec2-0000WI-MS
	for lists+qemu-devel@lfdr.de; Mon, 20 Apr 2020 18:09:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48498)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <ehabkost@redhat.com>) id 1jQeZr-0007WA-Dr
 for qemu-devel@nongnu.org; Mon, 20 Apr 2020 18:07:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <ehabkost@redhat.com>) id 1jQeZp-0006VA-E8
 for qemu-devel@nongnu.org; Mon, 20 Apr 2020 18:07:41 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:41821
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1jQeZo-0006Rb-U9
 for qemu-devel@nongnu.org; Mon, 20 Apr 2020 18:07:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587420459;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Eba6AAaAwPQna7twZ39GzRHBpJVsFHAoPc+eW4Ra8vs=;
 b=PQPUMLVLe44DAgN1XyxLIg6a341wJtTAMpE0lRV2whclMYEYt4I2ruip0GwxK7abVoeJY3
 pc0EPGm3GTRaEVU0ukhWuRWdk7AH3AIdtO+7Y43RLXgIrtfgh6pxFvhG9tX22AUZVf9gRt
 nPB/GwepJ/6VIz4tFey5PIsEzFF5rjg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-339-q36TAyMaPvaLL3C0-4alvg-1; Mon, 20 Apr 2020 18:07:37 -0400
X-MC-Unique: q36TAyMaPvaLL3C0-4alvg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DFBE21005509;
 Mon, 20 Apr 2020 22:07:35 +0000 (UTC)
Received: from localhost (ovpn-112-218.phx2.redhat.com [10.3.112.218])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 151A560C80;
 Mon, 20 Apr 2020 22:07:34 +0000 (UTC)
Date: Mon, 20 Apr 2020 18:07:33 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH 1/2] hax: Fix setting of FD_CLOEXEC
Message-ID: <20200420220733.GH4952@habkost.net>
References: <20200420175309.75894-1-eblake@redhat.com>
 <20200420175309.75894-2-eblake@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200420175309.75894-2-eblake@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.81; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/20 17:42:10
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: peter.maydell@linaro.org, qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
 "open list:X86 HAXM CPUs" <haxm-team@intel.com>, Colin Xu <colin.xu@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Wenchao Wang <wenchao.wang@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Apr 20, 2020 at 12:53:07PM -0500, Eric Blake wrote:
> Blindly setting FD_CLOEXEC without a read-modify-write will
> inadvertently clear any other intentionally-set bits, such as a
> proposed new bit for designating a fd that must behave in 32-bit mode.
> Use our wrapper function instead of an incorrect hand-rolled version.
>=20
> Signed-off-by: Eric Blake <eblake@redhat.com>

Thanks, queued for 5.1.

--=20
Eduardo


