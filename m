Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 242CBE750F
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Oct 2019 16:28:27 +0100 (CET)
Received: from localhost ([::1]:50410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iP6wT-0005Il-Hh
	for lists+qemu-devel@lfdr.de; Mon, 28 Oct 2019 11:28:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47494)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <crosa@redhat.com>) id 1iP6qg-00082I-CH
 for qemu-devel@nongnu.org; Mon, 28 Oct 2019 11:22:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <crosa@redhat.com>) id 1iP6mq-00079L-By
 for qemu-devel@nongnu.org; Mon, 28 Oct 2019 11:18:29 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:22967
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <crosa@redhat.com>) id 1iP6mq-00078h-0f
 for qemu-devel@nongnu.org; Mon, 28 Oct 2019 11:18:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1572275906;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oxXXmzvHbKduzGMgl99pwkdyucKwVDTIqhH6OUilitI=;
 b=YT4fkIEEssVWwr2FnEYwwlcFEXo6Y8GJXLpXMZtRJHf54oyqPG0Ux4+q0NH1ie9UG+wQDN
 wpZifjYgna11/C+AfQnUbSd97Napx4ZDvbIP/i3sMhWR7hfL20X2+n7104N3i8p65+gyvw
 uKyWMb8gdKwHCeaO55ag58hlno+dZkI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-187-e14S_9xPNb-LsRQb05IQ4g-1; Mon, 28 Oct 2019 11:18:24 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2FE761005509;
 Mon, 28 Oct 2019 15:18:22 +0000 (UTC)
Received: from localhost.localdomain (ovpn-123-183.rdu2.redhat.com
 [10.10.123.183])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C449D5C207;
 Mon, 28 Oct 2019 15:18:14 +0000 (UTC)
Date: Mon, 28 Oct 2019 11:18:12 -0400
From: Cleber Rosa <crosa@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH 02/26] Acceptance tests: refactor wait_for_console_pattern
Message-ID: <20191028151812.GC965@localhost.localdomain>
References: <20191028073441.6448-1-philmd@redhat.com>
 <20191028073441.6448-3-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20191028073441.6448-3-philmd@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: e14S_9xPNb-LsRQb05IQ4g-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
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
Cc: Fam Zheng <fam@euphon.net>, Eduardo Habkost <ehabkost@redhat.com>,
 KONRAD Frederic <frederic.konrad@adacore.com>, qemu-devel@nongnu.org,
 Fabien Chouteau <chouteau@adacore.com>, Kamil Rytarowski <kamil@netbsd.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Oct 28, 2019 at 08:34:17AM +0100, Philippe Mathieu-Daud=E9 wrote:
> From: Cleber Rosa <crosa@redhat.com>
>=20
> The same utility method is already present in two different test
> files, so let's consolidate it into a single utility function.
>=20
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> Message-Id: <20190916164011.7653-1-crosa@redhat.com>
> Reviewed-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
> [PMD: failure_message is optional]
> Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
> Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>

Queuing on my python-next branch (and sending shortly in a PR).

Thanks,
- Cleber.


