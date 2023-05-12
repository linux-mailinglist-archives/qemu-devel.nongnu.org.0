Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 408067007D7
	for <lists+qemu-devel@lfdr.de>; Fri, 12 May 2023 14:26:47 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxRpV-0000xI-LK; Fri, 12 May 2023 08:25:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pxRpS-0000x7-N8
 for qemu-devel@nongnu.org; Fri, 12 May 2023 08:24:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pxRpQ-0000GA-TG
 for qemu-devel@nongnu.org; Fri, 12 May 2023 08:24:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683894295;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/eYwVNIvKVi1IRHNrIc8SKtLHpjAXmuWQ1eOlTtDoJk=;
 b=GKRD9Ig+B6Nmpu8MC23PwdqUg7EwMAwBF7VexFJLreJnP9z3YpNcje0XA/0d4H8l/7ZNgu
 I8QF+E6+pGoxcorlZnjY0+SzIhFgp738dnI7lAKMqz1l7nu63mcryE/onT2dpni2EXqd/d
 U9/alJuwz79W+wj2Bnmocgbb1bZjpnM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-300-5zZXb_-lM7W5K-PlbaFswA-1; Fri, 12 May 2023 08:24:53 -0400
X-MC-Unique: 5zZXb_-lM7W5K-PlbaFswA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7B07D185A78B;
 Fri, 12 May 2023 12:24:53 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.49])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 187AC40C2076;
 Fri, 12 May 2023 12:24:53 +0000 (UTC)
Date: Fri, 12 May 2023 07:24:51 -0500
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Cc: hreitz@redhat.com, armbru@redhat.com, richard.henderson@linaro.org
Subject: Re: [PATCH v2 00/19] Fix qemu_strtosz() read-out-of-bounds
Message-ID: <qh7n3rd7ykpvpczp72omzysht2tcaybmypqmmp6scjxyyqz3d6@74viadsteikq>
References: <20230512021033.1378730-1-eblake@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230512021033.1378730-1-eblake@redhat.com>
User-Agent: NeoMutt/20230407
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Thu, May 11, 2023 at 09:10:14PM -0500, Eric Blake wrote:
> v1 was here:
> https://lists.gnu.org/archive/html/qemu-devel/2023-05/msg01988.html
> 
> since then:
> - make parse_uint easier to use, then use it in qemu_strtosz
> - add even more unit tests
> - fix a bug in qemu_strtoui
> - avoid dereferencing randome memory during unit tests [Hanna]
> - other cleanups as I found them
> - compress the strtosz unit tests (the major cause of the large
>   interdiff statistics)
> 
> backport-diff looks like:
> 
> 001/19:[----] [--] 'test-cutils: Avoid g_assert in unit tests'
> 002/19:[----] [--] 'test-cutils: Use g_assert_cmpuint where appropriate'
> 003/19:[----] [--] 'test-cutils: Test integral qemu_strto* value on failures'
> 004/19:[down] 'test-cutils: Test more integer corner cases'
> 005/19:[down] 'cutils: Fix wraparound parsing in qemu_strtoui'
> 006/19:[down] 'cutils: Document differences between parse_uint and qemu_strtou64'
> 007/19:[down] 'cutils: Adjust signature of parse_uint[_full]'
> 008/19:[down] 'cutils: Allow NULL endptr in parse_uint()'
> 009/19:[0147] [FC] 'test-cutils: Add coverage of qemu_strtod'
> 010/19:[----] [--] 'test-cutils: Prepare for upcoming semantic change in qemu_strtosz'
> 011/19:[down] 'test-cutils: Refactor qemu_strtosz tests for less boilerplate'
> 012/19:[down] 'cutils: Allow NULL str in qemu_strtosz'
> 013/19:[----] [--] 'numa: Check for qemu_strtosz_MiB error'
> 014/19:[down] 'test-cutils: Add more coverage to qemu_strtosz11;rgb:1e1e/1e1e/1e1e'

Not sure how I managed to corrupt that subject line while rebasing
(looks like a read race on /dev/tty where my editor intercepted bytes
intended to go to the shell's terminal); a corrected version is now
available at:

git fetch https://repo.or.cz/qemu/ericb.git strtosz
https://repo.or.cz/qemu/ericb.git/tree/refs/heads/strtosz

and with that fixed, this line changes to:

014/18:[0335] [FC] 'test-cutils: Add more coverage to qemu_strtosz'

> 015/19:[0178] [FC] 'cutils: Set value in all qemu_strtosz* error paths'
> 016/19:[----] [--] 'cutils: Set value in all integral qemu_strto* error paths'
> 017/19:[down] 'cutils: Use parse_uint in qemu_strtosz for negative rejection'
> 018/19:[0018] [FC] 'cutils: Improve qemu_strtod* error paths'
> 019/19:[0107] [FC] 'cutils: Improve qemu_strtosz handling of fractions'
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


