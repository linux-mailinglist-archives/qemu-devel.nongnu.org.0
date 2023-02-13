Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB5426943C7
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 12:04:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRWcN-0005br-Dt; Mon, 13 Feb 2023 06:03:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pRWcG-0005YW-IO
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 06:03:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pRWcF-00057f-7c
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 06:03:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676286202;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BPj3xa+ZDjPkW9L8mj8KtiP0Qh8wlZzZeI+WZ/kLXXw=;
 b=DOdrC3Tn+7serQ52piEUTk07fTWzg7E0xVzrRkh6/QSUdgi9BFHCJjseLYcFfCqcihUWYU
 3NY1dfRFbI3j4yfYY9Qc2P341UbYSLQS9X6q0wW1iqQuIhIrkGoxKT+6H9B/FFoyqwtddk
 GVit1qCntm1mtvtjZtWw2dEo4nR9olM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-212-miX9xSO4NiCfAw5a9BtsRQ-1; Mon, 13 Feb 2023 06:03:19 -0500
X-MC-Unique: miX9xSO4NiCfAw5a9BtsRQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EF0322999B28;
 Mon, 13 Feb 2023 11:03:18 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.95])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1F14F18EC5;
 Mon, 13 Feb 2023 11:03:17 +0000 (UTC)
Date: Mon, 13 Feb 2023 12:03:16 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Hanna Czenczek <hreitz@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Daniel P =?iso-8859-1?Q?=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [PATCH] curl: Fix error path in curl_open()
Message-ID: <Y+oY9P+LlUalr/R8@redhat.com>
References: <20230206132949.92917-1-hreitz@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230206132949.92917-1-hreitz@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
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

Am 06.02.2023 um 14:29 hat Hanna Czenczek geschrieben:
> g_hash_table_destroy() and g_hash_table_foreach_remove() (called by
> curl_drop_all_sockets()) both require the table to be non-NULL, or will
> print assertion failures (just print, no abort).
> 
> There are several paths in curl_open() that can lead to the out_noclean
> label without s->sockets being allocated, so clean it only if it has
> been allocated.
> 
> Example reproducer:
> $ qemu-img info -f http ''
> qemu-img: GLib: g_hash_table_foreach_remove: assertion 'hash_table != NULL' failed
> qemu-img: GLib: g_hash_table_destroy: assertion 'hash_table != NULL' failed
> qemu-img: Could not open '': http curl driver cannot handle the URL '' (does not start with 'http://')
> 
> Closes: https://gitlab.com/qemu-project/qemu/-/issues/1475
> Suggested-by: Daniel P. Berrangé <berrange@redhat.com>
> Signed-off-by: Hanna Czenczek <hreitz@redhat.com>

Thanks, applied to the block branch.

Kevin


