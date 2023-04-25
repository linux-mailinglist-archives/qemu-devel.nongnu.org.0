Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D2796EE8E4
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 22:11:46 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prP0G-0003Pj-To; Tue, 25 Apr 2023 16:11:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1prP0E-0003Oz-R2
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 16:11:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1prP0D-0005jR-8w
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 16:11:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682453464;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=h8Icss+s1ga5DVgfzuIseXB1yszTAQ1GzknViRxs9IE=;
 b=Mxw8LUeeDMoA++7iL0YtLnm5fmXBtBs9D9tPb46k2sVC7SAGj70hgmSAi9mJVHxv2As9C4
 gm4SGvdN2rMVpIt69kz3dMTyTVvEtd41sp2SSVIMY7PodVOCmJmuz70AfJN4ZVYpWNI5Yz
 EbAqhw1CW7aYcljXoCyftM+3PQcghXM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-145-uogNNy3vO_OaH-6UsEIGhA-1; Tue, 25 Apr 2023 16:11:00 -0400
X-MC-Unique: uogNNy3vO_OaH-6UsEIGhA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8A5523C0F676;
 Tue, 25 Apr 2023 20:11:00 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.41])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 52C6E492B03;
 Tue, 25 Apr 2023 20:10:59 +0000 (UTC)
Date: Tue, 25 Apr 2023 15:10:57 -0500
From: Eric Blake <eblake@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-block@nongnu.org, stefanha@redhat.com, pbonzini@redhat.com, 
 eesposit@redhat.com, qemu-devel@nongnu.org
Subject: Re: [PATCH 05/20] test-bdrv-drain: Don't modify the graph in
 coroutines
Message-ID: <54oopk63xfdlo7dslqllkxbd32eivntk3xeilvkqvktbktzndh@waukpcqhzst3>
References: <20230425173158.574203-1-kwolf@redhat.com>
 <20230425173158.574203-6-kwolf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230425173158.574203-6-kwolf@redhat.com>
User-Agent: NeoMutt/20230407
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Tue, Apr 25, 2023 at 07:31:43PM +0200, Kevin Wolf wrote:
> test-bdrv-drain contains a few test cases that are run both in coroutine
> and non-coroutine context. Running the entire code including the setup
> and shutdown in coroutines is incorrect because graph modifications can
> generally not happen in coroutines.
> 
> Change the test so that creating and destroying the test nodes and
> BlockBackends always happens outside of coroutine context.
> 
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>  tests/unit/test-bdrv-drain.c | 112 +++++++++++++++++++++++------------
>  1 file changed, 75 insertions(+), 37 deletions(-)
>

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


