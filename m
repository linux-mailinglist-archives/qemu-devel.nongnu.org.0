Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBDE63D2634
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 16:51:37 +0200 (CEST)
Received: from localhost ([::1]:40978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6a2y-0008CM-W7
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 10:51:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pkrempa@redhat.com>)
 id 1m6a23-0007LT-13
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 10:50:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26460)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pkrempa@redhat.com>)
 id 1m6a21-0006df-Hx
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 10:50:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626965436;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/aGTgprKTqRFr4713FcVAUFWzpDDuk3eLGlWIscRMms=;
 b=IOgTCgeLtZqv6F71X8Fj7NedVqlszOoKbM2WhdM6JO4twlcX2rzCZTvWIhTmVnUxm4hjfs
 DdEH8jKdw1rd4cLaKmIQHPW4s/bKo5iZEpJRhlVTMBDF1GK8BfUfzM/xsyWlMWH0eGTq/1
 oT6JT0o+iMoyxZnh98HNIDnZj6LsJG0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-148-SY_qtQsdOHi7FyKzATk3TQ-1; Thu, 22 Jul 2021 10:50:34 -0400
X-MC-Unique: SY_qtQsdOHi7FyKzATk3TQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F275F18C8C01
 for <qemu-devel@nongnu.org>; Thu, 22 Jul 2021 14:50:33 +0000 (UTC)
Received: from angien.pipo.sk (unknown [10.40.208.38])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 491A35D6D3;
 Thu, 22 Jul 2021 14:50:29 +0000 (UTC)
Date: Thu, 22 Jul 2021 16:50:26 +0200
From: Peter Krempa <pkrempa@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PULL 36/40] vl: switch -M parsing to keyval
Message-ID: <YPmFshXDoVrTdwif@angien.pipo.sk>
References: <20210706100141.303960-1-pbonzini@redhat.com>
 <20210706100141.303960-37-pbonzini@redhat.com>
 <YPkp+PF8kUyK9sy+@angien.pipo.sk>
 <793420c5-ee1a-cf75-2bb6-cb84c9fdb2de@redhat.com>
MIME-Version: 1.0
In-Reply-To: <793420c5-ee1a-cf75-2bb6-cb84c9fdb2de@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pkrempa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pkrempa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
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
Cc: libvir-list@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jul 22, 2021 at 16:39:26 +0200, Paolo Bonzini wrote:
> On 22/07/21 10:19, Peter Krempa wrote:
> > This patch breaks detection of certain machine options features in
> > libvirt which were being detected from 'query-command-line-options'.
> > 
> > I presume the change simply removed this from the output of
> > query-command-line-options due to the historical cruft how the
> > aforementioned command works.
> > 
> > Unfortunately I didn't find any suitable replacement from what we are
> > querying.
> 
> Yep, there is already a patch queued for this.

So the desired state is that the properties stay in
'query-command-line-options'?


