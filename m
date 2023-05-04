Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 693E46F6999
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 13:13:00 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puWtA-0004by-4W; Thu, 04 May 2023 07:12:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1puWt7-0004ac-R3
 for qemu-devel@nongnu.org; Thu, 04 May 2023 07:12:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1puWt6-0007at-1h
 for qemu-devel@nongnu.org; Thu, 04 May 2023 07:12:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683198758;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qIDcdb6rbPrSKQNwVwAxTqdzlxUmYOK5illOjORUXZo=;
 b=djBCiDDXBPkZo5QTvM51HKAv1eIRnCdPVp9NQeLLfloWN21rzPitSzk1Dseif73tPCXkqa
 s247HHfmcbxoLXtcaIRYXo1451bwB1f/f1mzbW1Jb8eTI9I0Jl5nWW7ShncM++LQR12+N5
 XynnhXjGZGE9W3QQdvqcboq4CaV8nIU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-325-FNzcQpmBNJKM9ZM6Jn1RvQ-1; Thu, 04 May 2023 07:12:35 -0400
X-MC-Unique: FNzcQpmBNJKM9ZM6Jn1RvQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C35D41C09503;
 Thu,  4 May 2023 11:12:34 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.84])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C20CE1410F24;
 Thu,  4 May 2023 11:12:33 +0000 (UTC)
Date: Thu, 4 May 2023 13:12:32 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Eric Blake <eblake@redhat.com>
Cc: qemu-block@nongnu.org, stefanha@redhat.com, pbonzini@redhat.com,
 eesposit@redhat.com, qemu-devel@nongnu.org
Subject: Re: [PATCH 15/20] block: Mark bdrv_co_debug_event() GRAPH_RDLOCK
Message-ID: <ZFOTIDFhXlhoG/cS@redhat.com>
References: <20230425173158.574203-1-kwolf@redhat.com>
 <20230425173158.574203-16-kwolf@redhat.com>
 <wbaypoi2ezaiuvetxttpp2mn7j3wdcxxt7ob77g4jss4wujl6y@fsnjs2fynuk4>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <wbaypoi2ezaiuvetxttpp2mn7j3wdcxxt7ob77g4jss4wujl6y@fsnjs2fynuk4>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Am 25.04.2023 um 23:14 hat Eric Blake geschrieben:
> On Tue, Apr 25, 2023 at 07:31:53PM +0200, Kevin Wolf wrote:
> > From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> > 
> > This adds GRAPH_RDLOCK annotations to declare that callers of
> > bdrv_co_debug_event() need to hold a reader lock for the graph.
> > 
> > Unfortunately we cannot use a co_wrapper_bdrv_rdlock, because the
> > function is called by mixed functions that run both in coroutine and
> > non-coroutine context (for example blkdebug_open).
> 
> Is this statement still true after 8/20?

You're right, 8/20 is newer than this commit message and actually made
the example wrong. The problem still exists, though. I'll point to the
qcow2 cluster/refcount functions instead, which are still mixed.

Kevin


