Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15A542DE121
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 11:36:18 +0100 (CET)
Received: from localhost ([::1]:52634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqD7R-00029M-4o
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 05:36:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kqCwD-0003lS-4H
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 05:24:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36779)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kqCwA-0007CL-JO
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 05:24:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608287077;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cMsBVF6hQU9ElF9E60RD6eVSlcq6qODHHKnSKi715os=;
 b=SSbUG5AC0SyZ094ADComIKMPtngaPPaww0V+U/iVXwYddUmUoWR8KLt08jx15LOIYtGxNY
 Os9w+T7+Ad6CD5HmZgVWUzTzVW5pDjkyjw+ivFzOlNlEWhyvzi9PP3TdpLeRO4RAHYpXVp
 cVgdlNQ0valFbEEAZ79/E9v11Wnc5iQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-273-R7OKXlq7NrGix-9u7kueGg-1; Fri, 18 Dec 2020 05:24:34 -0500
X-MC-Unique: R7OKXlq7NrGix-9u7kueGg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 54B291005C83;
 Fri, 18 Dec 2020 10:24:31 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-115-34.ams2.redhat.com [10.36.115.34])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 852345D9D2;
 Fri, 18 Dec 2020 10:24:30 +0000 (UTC)
Date: Fri, 18 Dec 2020 11:24:29 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Max Reitz <mreitz@redhat.com>
Subject: Re: [PATCH v2 0/2] Fix _send_qemu_cmd with bash 5.1
Message-ID: <20201218102429.GD9596@merkur.fritz.box>
References: <20201217153803.101231-1-mreitz@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201217153803.101231-1-mreitz@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 17.12.2020 um 16:38 hat Max Reitz geschrieben:
> Hi,
> 
> See patch 2 for what’s changed in bash 5.1 that makes this series
> necessary, and what we need to do.  (tl;dr: Bash presumably fixed a bug
> for array slices, and that now breaks nearly all iotests that use
> _send_qemu_cmd – but we don’t even need an array slice there.)
> 
> Patch 1 fixes a bug in 102 in how it calls _send_qemu_cmd.  (This
> becomes really visible with the change in patch 2.)
> 
> Comparing patch 2 to v1 (“iotests: Quote $cmd in _send_qemu_cmd”), the
> reference output diffs haven’t changed, only the common.qemu hunk is
> different.

Reviewed-by: Kevin Wolf <kwolf@redhat.com>


