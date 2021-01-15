Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7DFB2F7691
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 11:24:17 +0100 (CET)
Received: from localhost ([::1]:58788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0MHA-000263-T6
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 05:24:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mrezanin@redhat.com>)
 id 1l0MFa-00012a-0n
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 05:22:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:60962)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mrezanin@redhat.com>)
 id 1l0MFY-0006m9-1q
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 05:22:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610706155;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nz/swLVfv2YE7f1lr8PMXc7r7AYHu4U2Ct5YnvTJFWI=;
 b=WNSuie7/IC9+8v4WXULWfVqvHLTsRX4dTZ0IcHvDbtEXHfCRN7FJULYOVq1erv+K/qMkQ/
 V/IJMqsv1cxpvKQq8+VFe47TFS6Pn2CnlwraqPeVx2aEejdcSWjZ+xFoQHquitOy7yHGZz
 IPK0Qh75mvqEDGcvaJVRtMz0XX+DCmM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-470-LrWKmdFUM8mnFzcME1FsbA-1; Fri, 15 Jan 2021 05:22:31 -0500
X-MC-Unique: LrWKmdFUM8mnFzcME1FsbA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B2E59806660;
 Fri, 15 Jan 2021 10:22:30 +0000 (UTC)
Received: from lws.brq.redhat.com (unknown [10.40.195.31])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3DE8A63622;
 Fri, 15 Jan 2021 10:22:27 +0000 (UTC)
Date: Fri, 15 Jan 2021 11:22:24 +0100
From: Miroslav Rezanina <mrezanin@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH 0/2] net/eth: Fix stack-buffer-overflow in
 _eth_get_rss_ex_dst_addr()
Message-ID: <20210115102224.m45wqozaekvepbkk@lws.brq.redhat.com>
References: <20210114145041.2865440-1-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210114145041.2865440-1-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mrezanin@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mrezanin@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>, qemu-devel@nongnu.org,
 Prasad J Pandit <ppandit@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jan 14, 2021 at 03:50:39PM +0100, Philippe Mathieu-Daudé wrote:
> I had a look at the patch from Miroslav trying to silence a
> compiler warning which in fact is a nasty bug. Here is a fix.
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg772735.html
> 
> Philippe Mathieu-Daudé (2):
>   net/eth: Simplify _eth_get_rss_ex_dst_addr()
>   net/eth: Fix stack-buffer-overflow in _eth_get_rss_ex_dst_addr()
> 
>  net/eth.c | 37 +++++++++++++++++--------------------
>  1 file changed, 17 insertions(+), 20 deletions(-)
> 
> -- 
> 2.26.2
> 
> 
> 

With qtest chunk included:

Reviewed-by: Miroslav Rezanina <mrezanin@redhat.com>


