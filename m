Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB36567E47B
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Jan 2023 13:03:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLNQU-0003DY-Bx; Fri, 27 Jan 2023 07:01:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pLNQS-0003Cu-9b
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 07:01:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pLNQP-0003Xx-7W
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 07:01:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674820903;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZpK5Tc64IDoUl1RuwOVz0IrTQMLUjbCIHprBMNSPciY=;
 b=Vimms4h7pCfUWUpF4USfoPSOZryjGlmN1J5SEqAV+JjqvTKtmp22vyY01oKvN7Djv40Fx/
 K6zz94JyAqK4kMHpRBYLG9aG+o86XAvLgLnKWZu6f05q692UjT58k5jZWuchyo5IhQgMi1
 Z/VW2n4kD++8HaCrl62zC5999V1Cyy8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-648-TEZMbr0WN6Kg4skNhsk8Fw-1; Fri, 27 Jan 2023 07:01:40 -0500
X-MC-Unique: TEZMbr0WN6Kg4skNhsk8Fw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DEAF6857F48;
 Fri, 27 Jan 2023 12:01:39 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 677AC14171C0;
 Fri, 27 Jan 2023 12:01:38 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id A10E221E6A1F; Fri, 27 Jan 2023 13:01:36 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Warner Losh <imp@bsdimp.com>
Cc: qemu-devel@nongnu.org,  richard.henderson@linaro.org,
 pbonzini@redhat.com,  kwolf@redhat.com,  hreitz@redhat.com,
 kevans@freebsd.org,  berrange@redhat.com,  groug@kaod.org,
 qemu_oss@crudebyte.com,  mst@redhat.com,  philmd@linaro.org,
 peter.maydell@linaro.org,  alistair@alistair23.me,  jasowang@redhat.com,
 jonathan.cameron@huawei.com,  kbastian@mail.uni-paderborn.de,
 quintela@redhat.com,  dgilbert@redhat.com,  michael.roth@amd.com,
 kkostiuk@redhat.com,  tsimpson@quicinc.com,  palmer@dabbelt.com,
 bin.meng@windriver.com,  qemu-block@nongnu.org,  qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org
Subject: Re: [PATCH v4 04/19] bsd-user: Clean up includes
References: <20230119065959.3104012-1-armbru@redhat.com>
 <20230119065959.3104012-5-armbru@redhat.com>
 <CANCZdfrU4zVcepMj=B5EVUz-qhCDhMYDs+cYS5yfW1-G01PsbA@mail.gmail.com>
 <87r0vqpjbt.fsf@pond.sub.org>
 <CANCZdfrLF6Lecrd9VLTu-iDGWFCUJRM1veMejE2oX3ZAVEMBjg@mail.gmail.com>
Date: Fri, 27 Jan 2023 13:01:36 +0100
In-Reply-To: <CANCZdfrLF6Lecrd9VLTu-iDGWFCUJRM1veMejE2oX3ZAVEMBjg@mail.gmail.com>
 (Warner Losh's message of "Thu, 19 Jan 2023 10:05:01 -0700")
Message-ID: <87zga42nkv.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
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

Warner Losh <imp@bsdimp.com> writes:

[...]

> So I'm happy with it. Thanks for the cleanup and the time to answer my
> questions.
>
> Reviewed-by: Warner Losh <imp@bsdimp.com>

Thank *you* for reviewing my patch :)


