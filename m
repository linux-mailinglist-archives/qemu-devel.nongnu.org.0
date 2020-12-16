Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DD8B2DC546
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 18:26:50 +0100 (CET)
Received: from localhost ([::1]:50000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpaZd-0005Rd-96
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 12:26:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kpaJ3-0001p5-5j
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 12:09:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:49030)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kpaIz-0006Gk-Q1
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 12:09:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608138576;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TCAI+yWNSusm4cgpcRi0EPZMut+Vj5YKqhcyhCW2PTE=;
 b=LQQLTVAYKr/DuPqHpnVkPi2CwgHnxZ64Lhb9/46Ueu0oGKAwd5jILhJVLPdVpzKc7TQ10v
 uTINaeQjOW24STVkRWtq21PbKlyPDyKYaH+aicDj4C2dGP/Cosf+NHYA5gmctizby6s8TZ
 ED3omGv7yZGI3b5HT/E5G/c08VbO5Cw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-164-LK77ymi6O1qDUR5TNZuHnA-1; Wed, 16 Dec 2020 12:09:35 -0500
X-MC-Unique: LK77ymi6O1qDUR5TNZuHnA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1C9C3107ACE4;
 Wed, 16 Dec 2020 17:09:34 +0000 (UTC)
Received: from gondolin (ovpn-113-163.ams2.redhat.com [10.36.113.163])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F2CD519934;
 Wed, 16 Dec 2020 17:09:29 +0000 (UTC)
Date: Wed, 16 Dec 2020 18:09:27 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v3 0/4] target/s390x: Improve carry computation
Message-ID: <20201216180927.54f57458.cohuck@redhat.com>
In-Reply-To: <20201214221356.68039-1-richard.henderson@linaro.org>
References: <20201214221356.68039-1-richard.henderson@linaro.org>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel@nongnu.org, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 14 Dec 2020 16:13:52 -0600
Richard Henderson <richard.henderson@linaro.org> wrote:

> While testing the float128_muladd changes for s390x host,
> emulating under x86_64 of course, I noticed that the code
> we generate for strings of ALCGR and SLBGR is pretty awful.
> 
> I realized that we were missing a trick: the output cc is
> based only on the output (result and carry) and so we don't
> need to save the inputs.  And once we do that, we can use
> the output carry as a direct input to the next insn.
> 
> Changes for v3:
>   * Rebased.
> Changes for v2:
>   * Add a few more comments, and enhance the patch descriptions.
> 
> 
> r~
> 
> Richard Henderson (4):
>   target/s390x: Improve cc computation for ADD LOGICAL
>   target/s390x: Improve ADD LOGICAL WITH CARRY
>   target/s390x: Improve cc computation for SUBTRACT LOGICAL
>   target/s390x: Improve SUB LOGICAL WITH BORROW
> 
>  target/s390x/internal.h    |  11 +-
>  target/s390x/cc_helper.c   | 123 +++-------------
>  target/s390x/helper.c      |  10 +-
>  target/s390x/translate.c   | 289 ++++++++++++++++++++-----------------
>  target/s390x/insn-data.def |  76 +++++-----
>  5 files changed, 216 insertions(+), 293 deletions(-)
> 

Thanks, applied.


