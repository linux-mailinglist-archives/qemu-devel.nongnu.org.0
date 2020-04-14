Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53AD11A8705
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Apr 2020 19:09:00 +0200 (CEST)
Received: from localhost ([::1]:35712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jOP3T-0001TL-Ak
	for lists+qemu-devel@lfdr.de; Tue, 14 Apr 2020 13:08:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40371)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1jOOy9-00020o-UL
 for qemu-devel@nongnu.org; Tue, 14 Apr 2020 13:03:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1jOOy8-00041t-P8
 for qemu-devel@nongnu.org; Tue, 14 Apr 2020 13:03:29 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:25405)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>) id 1jON3P-00037s-TC
 for qemu-devel@nongnu.org; Tue, 14 Apr 2020 11:00:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586876447;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WyAUYt4L1plAb7f5jDAYmaD9SqzTXV5lpQp/1rOfuV8=;
 b=ScRzyo5ICIFdiEixXB/JIjRXn/qsQQ2owTjYRrN3JWM5NrQzd6IrtOG4ZD9cIbANyxmTSw
 fUsdWNSEaUCJIMw++Wp4FG5X90PHmyH3ism9zCI18mKeUKTBioN5QNSdKmLTPIr4k2sKX+
 J8vE9J/cT8Y1qS9REQHEWJO8yVOkfwE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-1-tDVDQA3pNRaIvP2tXsibzw-1; Tue, 14 Apr 2020 11:00:46 -0400
X-MC-Unique: tDVDQA3pNRaIvP2tXsibzw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 05A86192296D;
 Tue, 14 Apr 2020 15:00:45 +0000 (UTC)
Received: from linux.fritz.box (ovpn-114-1.ams2.redhat.com [10.36.114.1])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DFB891001281;
 Tue, 14 Apr 2020 15:00:43 +0000 (UTC)
Date: Tue, 14 Apr 2020 17:00:42 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH for-5.1 7/8] qemu-img: Factor out accumulate_options()
 helper
Message-ID: <20200414150042.GL7747@linux.fritz.box>
References: <20200409153041.17576-1-armbru@redhat.com>
 <20200409153041.17576-8-armbru@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200409153041.17576-8-armbru@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
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
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 09.04.2020 um 17:30 hat Markus Armbruster geschrieben:
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

Reviewed-by: Kevin Wolf <kwolf@redhat.com>


