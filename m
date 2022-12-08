Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3A4F647538
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Dec 2022 18:58:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3L8X-0003Nu-5y; Thu, 08 Dec 2022 12:56:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p3L8U-0003KB-Kx
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 12:56:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p3L8O-0004Iy-Je
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 12:56:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670522195;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6gSgvrdxUnQj0ieNG2M9rESlDYoUpCQMvu+ZNwD2E0Q=;
 b=Qth0Zn1qTvdMtZ1R1Py9J3y62MXAUAIwHISDrTTb1EAiv5IfoX4PiWtjrXnDJCiaCVQIpR
 xtAWkBpw4ajctcV4KwWYkFSGgz2sXaD0fGSBKdcfdnxmpAJvT+8OUhVC8JkPiu4jjaSUSA
 ODtMa58odeoSPNppBgVjj4Go0OfthLg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-376-7onNC9OjMPCYyc0YCpbLlA-1; Thu, 08 Dec 2022 12:56:33 -0500
X-MC-Unique: 7onNC9OjMPCYyc0YCpbLlA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A23FE85A5A6;
 Thu,  8 Dec 2022 17:56:33 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.144])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3178E492CA2;
 Thu,  8 Dec 2022 17:56:33 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 215FF21E6921; Thu,  8 Dec 2022 18:56:30 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Stefan Hajnoczi <stefanha@gmail.com>
Cc: qemu-devel@nongnu.org,  stefanha@redhat.com,  kwolf@redhat.com
Subject: Re: [PATCH 1/4] coroutine: Clean up superfluous inclusion of
 qemu/coroutine.h
References: <20221208142306.2642640-1-armbru@redhat.com>
 <20221208142306.2642640-2-armbru@redhat.com>
 <CAJSP0QXUCDU2kW7WwqQGWQbiv34vUL4F=7capUi8Uj54_YHKig@mail.gmail.com>
Date: Thu, 08 Dec 2022 18:56:30 +0100
In-Reply-To: <CAJSP0QXUCDU2kW7WwqQGWQbiv34vUL4F=7capUi8Uj54_YHKig@mail.gmail.com>
 (Stefan Hajnoczi's message of "Thu, 8 Dec 2022 09:59:45 -0500")
Message-ID: <878rjhixtd.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
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

Stefan Hajnoczi <stefanha@gmail.com> writes:

> Probably because block layer, aio.h, and coroutine_int.h header files
> already include "qemu/coroutine.h"?

Mostly, but not always.  For instance, crypto/block-luks-priv.h compiles
fine without it, and doesn't include it after this patch.

> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

Thanks!


