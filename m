Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B61967435A
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 21:13:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIbHG-0001GE-Ob; Thu, 19 Jan 2023 15:12:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pIbHE-0001Fm-LG
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 15:12:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pIbHC-0003gw-Ak
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 15:12:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674159164;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RB1HoZWFdxBmsbPS/jfORKHF0nuZ+TFQkgGiFgVXw5g=;
 b=CS9wlXVzV6M52ViJMkVPZ4vA/+66KaLQ+1mF6+Bi+v9Cl5bibps+GIWdfzZOM5iOhGQ/4T
 xwipUWYPbTaJ+estNzxZbDfotQV43uNiHBi5Ygeu0kFr1slhNR4FWPDIwFcabJRiQgbFRw
 TMumgGjWwgXLH8rbcgv1kjwPoS5RNKE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-635-JOLyOpVgPHOC2XFq0aCZ4g-1; Thu, 19 Jan 2023 15:12:41 -0500
X-MC-Unique: JOLyOpVgPHOC2XFq0aCZ4g-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0B8748533DB;
 Thu, 19 Jan 2023 20:12:41 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.126])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1F13E492B03;
 Thu, 19 Jan 2023 20:12:39 +0000 (UTC)
Date: Thu, 19 Jan 2023 21:12:38 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Hanna Reitz <hreitz@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v2 00/12] qemu-img info: Show protocol-level information
Message-ID: <Y8mkNvXmgKjSXZSt@redhat.com>
References: <20220620162704.80987-1-hreitz@redhat.com>
 <7c2c9623-c865-91a3-01b7-0e7f90fde278@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7c2c9623-c865-91a3-01b7-0e7f90fde278@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Am 08.12.2022 um 13:24 hat Hanna Reitz geschrieben:
> On 20.06.22 18:26, Hanna Reitz wrote:
> > Hi,
> > 
> > This series is a v2 to:
> > 
> > https://lists.nongnu.org/archive/html/qemu-block/2022-05/msg00042.html
> 
> Ping, it looks like this still applies (to the master branch and kevin’s
> block-next branch at least).

Not any more. :-)

But the conflicts seemed obvious enough, so I rebased it (including
changing the "Since: 7.1" occurrences to 8.0) and applied it to my block
branch. Thanks!

Kevin


