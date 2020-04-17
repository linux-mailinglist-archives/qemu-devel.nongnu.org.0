Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FF7A1ADC3C
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Apr 2020 13:33:59 +0200 (CEST)
Received: from localhost ([::1]:45900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jPPFu-0000xz-5j
	for lists+qemu-devel@lfdr.de; Fri, 17 Apr 2020 07:33:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46968)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1jPPEp-0000Se-EA
 for qemu-devel@nongnu.org; Fri, 17 Apr 2020 07:32:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1jPPEo-0000qr-HW
 for qemu-devel@nongnu.org; Fri, 17 Apr 2020 07:32:51 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:22054
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>) id 1jPPEo-0000pc-EW
 for qemu-devel@nongnu.org; Fri, 17 Apr 2020 07:32:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587123168;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mp9DmdTsAS5X8X4KJnPXwrWc3tdswrrllpXX0swlxzk=;
 b=ajEhbPlShdhwETBgbY1/6bcbPMDz5AOT3fbwMdAJ3AVIrE3QMuz5wRibspQJ9rExdvwpAO
 4DgPh25B1cWIr8kBSrYFwU+1KhQ8ci/wMCSJ5dCvDWR67Sl6l9WW8LNDhnbXh4QDwrk7z4
 c2XMiOkkeo+YUzTc1vXToVg7eQQ+XDg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-435-rJ0u1S7oN7KsC-1IZjnsiQ-1; Fri, 17 Apr 2020 07:32:47 -0400
X-MC-Unique: rJ0u1S7oN7KsC-1IZjnsiQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 058368017F3;
 Fri, 17 Apr 2020 11:32:46 +0000 (UTC)
Received: from linux.fritz.box (ovpn-113-114.ams2.redhat.com [10.36.113.114])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CD0FF97B19;
 Fri, 17 Apr 2020 11:32:44 +0000 (UTC)
Date: Fri, 17 Apr 2020 13:32:43 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH for 5.0] qemu-iotests: allow qcow2 external discarded
 clusters to contain stale data
Message-ID: <20200417113243.GB5573@linux.fritz.box>
References: <20200409191006.24429-1-pbonzini@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200409191006.24429-1-pbonzini@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
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
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 09.04.2020 um 21:10 hat Paolo Bonzini geschrieben:
> Test 244 checks the expected behavior of qcow2 external data files
> with respect to zero and discarded clusters.  Filesystems however
> are free to ignore discard requests, and this seems to be the
> case for overlayfs.  Relax the tests to skip checks on the
> external data file for discarded areas, which implies not using
> qemu-img compare in the data_file_raw=3Don case.
>=20
> This fixes docker tests on RHEL8.
>=20
> Cc: Kevin Wolf <kwolf@redhat.com>
> Cc: qemu-block@nongnu.org
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Thanks, applied to the block branch.

Kevin


