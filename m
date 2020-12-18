Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2883E2DE1CB
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 12:10:23 +0100 (CET)
Received: from localhost ([::1]:46544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqDeQ-0004gr-6A
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 06:10:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kqDEL-0004us-3q
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 05:43:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32681)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kqDE9-000518-Q2
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 05:43:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608288193;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ty12XQiB9e/9ADZp+g0zrruC6hv/fCkJoIRGqramgg8=;
 b=GLdgCEAra2WVbFpI/dDeOEQgg1aVrn5sw/AGIP1JA2UIO0zxRRXub6tJHWwF1Ub/SGU8Iq
 iSDN7kAk8ob1kq5iQWNMi/RPRrzP3YbZnSm6FEHboof8WcnqWvMjVOsnSFRhNaOd9yfBaR
 AgIoXVNGjpgp1qz013ti5fMwT7RZfbA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-43-r8eGkjJZOfSyoTyQj3TvOQ-1; Fri, 18 Dec 2020 05:43:11 -0500
X-MC-Unique: r8eGkjJZOfSyoTyQj3TvOQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 52AEB107ACE3;
 Fri, 18 Dec 2020 10:43:10 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-115-34.ams2.redhat.com [10.36.115.34])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 210FF18993;
 Fri, 18 Dec 2020 10:43:08 +0000 (UTC)
Date: Fri, 18 Dec 2020 11:43:07 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH 0/9] block/vpc: Clean up some buffer abuse
Message-ID: <20201218104307.GE9596@merkur.fritz.box>
References: <20201217162003.1102738-1-armbru@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201217162003.1102738-1-armbru@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: mrezanin@redhat.com, qemu-devel@nongnu.org, qemu-block@nongnu.org,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 17.12.2020 um 17:19 hat Markus Armbruster geschrieben:
> Markus Armbruster (9):
>   block/vpc: Make vpc_open() read the full dynamic header
>   block/vpc: Don't abuse the footer buffer as BAT sector buffer
>   block/vpc: Don't abuse the footer buffer for dynamic header
>   block/vpc: Make vpc_checksum() take void *
>   block/vpc: Pad VHDDynDiskHeader, replace uint8_t[] buffers
>   block/vpc: Use sizeof() instead of 1024 for dynamic header size
>   block/vpc: Pad VHDFooter, replace uint8_t[] buffers
>   block/vpc: Pass footer buffers as VHDFooter * instead of uint8_t *
>   block/vpc: Use sizeof() instead of HEADER_SIZE for footer size

Thanks, applied to the block branch.

Kevin


