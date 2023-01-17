Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1499F66DDE3
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 13:44:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHlJJ-0003oc-5I; Tue, 17 Jan 2023 07:43:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1pHlJD-0003nv-QY
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 07:43:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1pHlJ9-0000rK-WB
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 07:43:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673959398;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bXq9NEsGbaAhNzmZDTkBgBlindDixsDBZCSTFun0mFw=;
 b=PZ/zW8Vb44fDlLolzQBZgsiEFgA3uM9CMJPrfvh4LOk4q+ffsKFnuHQIWFedIqFM1woUW+
 95aKRNOeiVnQ8XqTJY67t118gzrmxzMwS19CyjulkCScagsxOL1nanQWL6nYK3Y/SpvqZ9
 MsrwSxQHLbRA8wdlDuZWqmU9gU1Nbck=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-435-R2AeWNAyMXqhaxS-OH2Qzw-1; Tue, 17 Jan 2023 07:43:15 -0500
X-MC-Unique: R2AeWNAyMXqhaxS-OH2Qzw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 97096280604D;
 Tue, 17 Jan 2023 12:43:14 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.124])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 518D540C2064;
 Tue, 17 Jan 2023 12:43:14 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 88B271800097; Tue, 17 Jan 2023 13:43:12 +0100 (CET)
Date: Tue, 17 Jan 2023 13:43:12 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Laurent Vivier <laurent@vivier.eu>
Cc: Pierre-Yves Ritschard <pyr@spootnik.org>, qemu-devel@nongnu.org,
 "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>
Subject: Re: [PATCH] ui/vnc.c: Allow websocket connections over AF_UNIX sockets
Message-ID: <20230117124312.ebe4qpp6p3hjew32@sirius.home.kraxel.org>
References: <20221202151202.24851-1-pyr@spootnik.org>
 <45ba2636-bf79-560e-e22b-f9b56823658e@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <45ba2636-bf79-560e-e22b-f9b56823658e@vivier.eu>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
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

On Mon, Jan 16, 2023 at 07:15:08PM +0100, Laurent Vivier wrote:
> Hi Gerd,
> 
> If this patch is correct I can queue it via trivial branch.

proxying tcp websocket connections to a unix socket looks like
a reasonable use case to me.

Acked-by: Gerd Hoffmann <kraxel@redhat.com>


