Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3E6C525EDC
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 12:06:44 +0200 (CEST)
Received: from localhost ([::1]:37878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npSC4-00081Z-2a
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 06:06:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fweimer@redhat.com>)
 id 1npS5y-00005K-QC
 for qemu-devel@nongnu.org; Fri, 13 May 2022 06:00:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54514)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fweimer@redhat.com>)
 id 1npS5t-00075C-T9
 for qemu-devel@nongnu.org; Fri, 13 May 2022 06:00:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652436018;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type;
 bh=k9rU5wyMgrkt2hOOpl/7uNBhB/nIMMuiSw7ffSLudho=;
 b=T94QW26xpgFwsqpBRyNx+6+0Td1IqSPYvqMayPJzJvr65qDgRM297W9tGRIUVFQK6YZvRY
 kMzELKtdDiW87F4hQgenaqM+qSHlOd71cbMBLTAG+COwkiLJU82WJOuMTevC8tb4gfycuJ
 VL+m2ARKv+MifgpFZebTP4jTe0NNhmw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-574-ev5xSy0nOEiQn2U1XuYQ2A-1; Fri, 13 May 2022 06:00:17 -0400
X-MC-Unique: ev5xSy0nOEiQn2U1XuYQ2A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1855E803792
 for <qemu-devel@nongnu.org>; Fri, 13 May 2022 10:00:17 +0000 (UTC)
Received: from oldenburg.str.redhat.com (unknown [10.39.192.147])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 71CF040D2820
 for <qemu-devel@nongnu.org>; Fri, 13 May 2022 10:00:16 +0000 (UTC)
From: Florian Weimer <fweimer@redhat.com>
To: qemu-devel@nongnu.org
Subject: Emulating CPUs with larger atomic accesses
Date: Fri, 13 May 2022 12:00:14 +0200
Message-ID: <87k0apeor5.fsf@oldenburg.str.redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=fweimer@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

What's QEMU's approach to emulating CPU instructions that atomatically
operate on values larger than what is supported by the host CPU?

I assume that for full system emulation, this is not a problem, but
qemu-user will not achieve atomic behavior on shared memory mappings.
How much of a problem is this in practice?

Thanks,
Florian


