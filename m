Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D15017FB3A
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Mar 2020 14:11:59 +0100 (CET)
Received: from localhost ([::1]:60738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jBefu-0002W0-Ka
	for lists+qemu-devel@lfdr.de; Tue, 10 Mar 2020 09:11:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50351)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pkrempa@redhat.com>) id 1jBeed-00016M-QJ
 for qemu-devel@nongnu.org; Tue, 10 Mar 2020 09:10:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pkrempa@redhat.com>) id 1jBeec-0001Bn-BN
 for qemu-devel@nongnu.org; Tue, 10 Mar 2020 09:10:39 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:22619
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pkrempa@redhat.com>) id 1jBeec-00019b-6w
 for qemu-devel@nongnu.org; Tue, 10 Mar 2020 09:10:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583845837;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2wAaOXKfz2yj60A6ELvAk3KpehwmaVhXiHg311+v0cA=;
 b=gq98u7VYaAoCcfeGgsWTDtH7OjVxFWNmqzjKTwKDhwkjgKch8EmltLrD9CZM4xZYrTltr4
 kV5nVAENbEHrblT5y9cNolMbYCRZTFtzf9PXu2VLy4jCU4sfEgADVH1MCRSveB0VHlxooQ
 egT8jWar7CYjMsNJRG8wxh6AulcPtmI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-292-82dkg3DqOKWKR7yl8xb2Lg-1; Tue, 10 Mar 2020 09:10:35 -0400
X-MC-Unique: 82dkg3DqOKWKR7yl8xb2Lg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5A171107B7D8;
 Tue, 10 Mar 2020 13:10:34 +0000 (UTC)
Received: from angien.pipo.sk (unknown [10.43.2.48])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 58E0B91D74;
 Tue, 10 Mar 2020 13:10:33 +0000 (UTC)
Date: Tue, 10 Mar 2020 14:10:30 +0100
From: Peter Krempa <pkrempa@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH v2 1/7] block: Make bdrv_get_cumulative_perm() public
Message-ID: <20200310131030.GY1320660@angien.pipo.sk>
References: <20200310113831.27293-1-kwolf@redhat.com>
 <20200310113831.27293-2-kwolf@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200310113831.27293-2-kwolf@redhat.com>
X-PGP-Key-ID: 0xD018682B
X-PGP-Key-Fingerprint: D294 FF38 A6A2 BF40 6C75  5DEF 36EC 16AC D018 682B
User-Agent: Mutt/1.13.3 (2020-01-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
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
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 10, 2020 at 12:38:25 +0100, Kevin Wolf wrote:
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>  include/block/block_int.h | 3 +++
>  block.c                   | 6 ++----
>  2 files changed, 5 insertions(+), 4 deletions(-)

Reviewed-by: Peter Krempa <pkrempa@redhat.com>


