Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 682222B9224
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 13:12:39 +0100 (CET)
Received: from localhost ([::1]:58754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfinl-0001vo-MX
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 07:12:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kfiZu-00025R-9X
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 06:58:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55756)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kfiZs-0003c6-J6
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 06:58:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605787095;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4uWQbsmxKcc/f+Ay/cQIZJmPhGp/NFlCsmHhPfw9qYA=;
 b=ROTmMdnl3LouZ6owaldOlSm8tI3lrqhpffOtyCgGDmalwOoW7AbqP+gFWEvScxOkfaOdvM
 jhXBFMwuSXU3BKL2vWzb/ndlGHQq5x4fnISIkJTq4txJmFlnQYK6W7LJ8lcLlCerxZLo56
 H8emvrvnShtTZ8sQc1J4TnT8McoKmYM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-563-nQjcp8mwMG20wDhQsJiIsw-1; Thu, 19 Nov 2020 06:58:14 -0500
X-MC-Unique: nQjcp8mwMG20wDhQsJiIsw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E958384E240;
 Thu, 19 Nov 2020 11:58:12 +0000 (UTC)
Received: from gondolin (ovpn-113-214.ams2.redhat.com [10.36.113.214])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A5B6F10016FE;
 Thu, 19 Nov 2020 11:58:08 +0000 (UTC)
Date: Thu, 19 Nov 2020 12:58:06 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Eric Farman <farman@linux.ibm.com>
Subject: Re: [RFC PATCH 2/2] vfio-ccw: Connect the device request notifier
Message-ID: <20201119125806.5985885c.cohuck@redhat.com>
In-Reply-To: <20201117032605.56831-3-farman@linux.ibm.com>
References: <20201117032605.56831-1-farman@linux.ibm.com>
 <20201117032605.56831-3-farman@linux.ibm.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/19 03:44:58
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-s390x@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 17 Nov 2020 04:26:05 +0100
Eric Farman <farman@linux.ibm.com> wrote:

> Now that the vfio-ccw code has a notifier interface to request that
> a device be unplugged, let's wire that together.
> 
> Signed-off-by: Eric Farman <farman@linux.ibm.com>
> ---
>  hw/vfio/ccw.c | 40 ++++++++++++++++++++++++++++++++++++----
>  1 file changed, 36 insertions(+), 4 deletions(-)

This looks good to me.

Reviewed-by: Cornelia Huck <cohuck@redhat.com>


