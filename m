Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2B0CE755B
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Oct 2019 16:40:57 +0100 (CET)
Received: from localhost ([::1]:52182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iP78Z-0005UF-MN
	for lists+qemu-devel@lfdr.de; Mon, 28 Oct 2019 11:40:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48893)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <crosa@redhat.com>) id 1iP6sX-0002WE-5l
 for qemu-devel@nongnu.org; Mon, 28 Oct 2019 11:24:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <crosa@redhat.com>) id 1iP6sU-0002AK-Ug
 for qemu-devel@nongnu.org; Mon, 28 Oct 2019 11:24:19 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:27101
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <crosa@redhat.com>) id 1iP6sU-00029f-Mk
 for qemu-devel@nongnu.org; Mon, 28 Oct 2019 11:24:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1572276257;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jddaezoX5hXGQFfiT5TwYWKafgMYF2bOuLwLjk0uBHU=;
 b=JhQ29AUCBmsMimNMB6ZUD/9UNdNEkmF0gqj04MvRc+dSyMvTXCNudAAyhpmEUqJWyxXJFH
 kTdZdJ0LrLVDFt0gBc5p+LB2ppjgYEYv+JvzgT9yqBZB83+kZdxqy2YoGCB3QidSMaZ5BL
 rqYEg1LwqzdNjPdDwypPAsn+rz3Bdws=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-324-RGV3QuGbOR-BchgS9It91w-1; Mon, 28 Oct 2019 11:24:14 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ACBC0476;
 Mon, 28 Oct 2019 15:24:11 +0000 (UTC)
Received: from localhost.localdomain (ovpn-123-183.rdu2.redhat.com
 [10.10.123.183])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 84D511001B28;
 Mon, 28 Oct 2019 15:24:04 +0000 (UTC)
Date: Mon, 28 Oct 2019 11:24:02 -0400
From: Cleber Rosa <crosa@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH 03/26] tests/acceptance: Fixe wait_for_console_pattern()
 hangs
Message-ID: <20191028152402.GA3978@localhost.localdomain>
References: <20191028073441.6448-1-philmd@redhat.com>
 <20191028073441.6448-4-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20191028073441.6448-4-philmd@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: RGV3QuGbOR-BchgS9It91w-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
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
Cc: Fam Zheng <fam@euphon.net>, Eduardo Habkost <ehabkost@redhat.com>,
 KONRAD Frederic <frederic.konrad@adacore.com>, qemu-devel@nongnu.org,
 Fabien Chouteau <chouteau@adacore.com>, Kamil Rytarowski <kamil@netbsd.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Oct 28, 2019 at 08:34:18AM +0100, Philippe Mathieu-Daud=E9 wrote:
> Because of a possible deadlock (QEMU waiting for the socket to
> become writable) let's close the console socket as soon as we
> stop to use it.
>=20
> Suggested-by: Cleber Rosa <crosa@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>

Reviewed-by: Cleber Rosa <crosa@redhat.com>

Queuing on my python-next branch (and sending shortly in a PR).

Thanks,
- Cleber.


