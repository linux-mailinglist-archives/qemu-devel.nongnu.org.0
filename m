Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D4512F5E80
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 11:18:34 +0100 (CET)
Received: from localhost ([::1]:39866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzzi5-0007DL-If
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 05:18:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kzzg7-0006Iw-Gk
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 05:16:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48958)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kzzg5-00068W-An
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 05:16:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610619387;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dUTPZXWcvMp9XnLo8mE1LGIuab27+S+cSZFnP+6Qwrs=;
 b=HRowXiLn5DgufpKmeeie/7oJZnLXbempNPnEL2QodFlLWUdxKpu4TACEgowvdO0SlLh0Sc
 O/y/k4PLHbVFuDxrJn7eoT/bwoA9wz0XFihsfvhGW8A9FAIbQuZn0yvefII9YAOPktIRLJ
 YYxxSkdLINoDNgmGt80Ce50A+5rBVB0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-539-UlmYAYHDPNKa2zaGCDTX9A-1; Thu, 14 Jan 2021 05:16:25 -0500
X-MC-Unique: UlmYAYHDPNKa2zaGCDTX9A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 903541005D4D;
 Thu, 14 Jan 2021 10:16:24 +0000 (UTC)
Received: from gondolin (ovpn-114-65.ams2.redhat.com [10.36.114.65])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 71C726F44E;
 Thu, 14 Jan 2021 10:16:23 +0000 (UTC)
Date: Thu, 14 Jan 2021 11:16:20 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Miroslav Rezanina <mrezanin@redhat.com>
Subject: Re: [PATCH v3 2/2] s390x: Use strpadcpy for copying vm name
Message-ID: <20210114111620.31435df3.cohuck@redhat.com>
In-Reply-To: <6f86915755219cf6a671788075da4809b57f7d7b.1610607906.git.mrezanin@redhat.com>
References: <cover.1610607906.git.mrezanin@redhat.com>
 <6f86915755219cf6a671788075da4809b57f7d7b.1610607906.git.mrezanin@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 14 Jan 2021 08:07:36 +0100
Miroslav Rezanina <mrezanin@redhat.com> wrote:

> Using strncpy with length equal to the size of target array, GCC 11
> reports following warning:
> 
>   warning: '__builtin_strncpy' specified bound 256 equals destination size [-Wstringop-truncation]
> 
> We can prevent this warning by using strpadcpy that copies string
> up to specified length, zeroes target array after copied string
> and does not raise warning when length is equal to target array
> size (and ending '\0' is discarded).
> 
> Signed-off-by: Miroslav Rezanina <mrezanin@redhat.com>
> ---
>  target/s390x/kvm.c         | 12 +++++-------
>  target/s390x/misc_helper.c |  7 +++++--
>  2 files changed, 10 insertions(+), 9 deletions(-)

Thanks, applied.


