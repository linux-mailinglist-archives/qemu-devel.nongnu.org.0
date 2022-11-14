Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C991628D8B
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 00:38:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouiei-0004Ok-18; Mon, 14 Nov 2022 18:14:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ouidw-0001o2-Bd
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 18:13:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1oui9G-0001Ml-6N
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 17:41:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668465708;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type;
 bh=d3fET0rtnvSWynsr5mjLXLuuulKrFHFYfgB7IIbxIYA=;
 b=XiuF41B7DNY4snvDBbsC1xYJ01feBZCS9KvvEt3TKRWVYXn87BYdSo4uvfB1rkWPEy9nMA
 c0a8WVO+aYMN77jj49xlo+kAe4VR++/rrBZcR6HSE6EDBs9FM3jp3ZDuDSKCSHtuImykCO
 kuPJNXHW1GARzoQLP82JpsFnbJwrwUQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-38-T6kK6GdeN2-Wk30QTJDsRw-1; Mon, 14 Nov 2022 17:41:46 -0500
X-MC-Unique: T6kK6GdeN2-Wk30QTJDsRw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D73F085A59D;
 Mon, 14 Nov 2022 22:41:45 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.240])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 60BA41415102;
 Mon, 14 Nov 2022 22:41:45 +0000 (UTC)
Date: Mon, 14 Nov 2022 16:41:41 -0600
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org, qemu-block@nongnu.org, libguestfs@redhat.com,
 nbd@other.debian.org
Subject: [cross-project PATCH v2] NBD 64-bit extensions
Message-ID: <20221114224141.cm5jgyxfmvie5xb5@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: NeoMutt/20220429
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

This is a cover letter for a set of multi-project patch series all
designed to implement 64-bit operations in NBD, and demonstrate
interoperability of the new extension between projects.

v1 of the project was attempted nearly a year ago:
https://lists.nongnu.org/archive/html/qemu-devel/2021-12/msg00453.html

Since then, I've addressed a lot of preliminary cleanups in libnbd to
make it easier to test things, and incorporated review comments issued
on v1, including:

- no orthogonality between simple/structured replies and 64-bit mode:
  once extended headers are negotiated, all transmission traffic (both
  from client to server and server to client) uses just one header
  size

- add support for the client to pass a payload on commands to the
  server, and demonstrate it by further implementing a way to pass a
  flag with NBD_CMD_BLOCK_STATUS that says the client is passing a
  payload to request status of just a subset of the negotiated
  contexts, rather than all possible contexts that were earlier
  negotiated during NBD_OPT_SET_META_CONTEXT

- tweaks to the header layouts: tweak block status to provide 64-bit
  flags values (although "base:allocation" will remain usable with
  just 32-bit flags); reply with offset rather than padding and with
  fields rearranged for maximal sharing between client and server
  layouts

- word-smithing of the NBD proposed protocol; split things into
  several smaller patches, where we can choose how much to take

- more unit tests added in qemu and libnbd

- the series end with RFC patches on whether to support 64-bit hole
  responses to NBD_CMD_READ, even though our current limitations say
  servers don't have to accept more than a 32M read request and
  therefore will never have that big of a hole to read)

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


