Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8B6F6FCC65
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 19:09:27 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwQok-00072P-S8; Tue, 09 May 2023 13:08:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pwQoh-00070V-Ji
 for qemu-devel@nongnu.org; Tue, 09 May 2023 13:07:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pwQof-0006M0-DK
 for qemu-devel@nongnu.org; Tue, 09 May 2023 13:07:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683652075;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=beuoKZb+Bej4piqYBXHfORF9gQXwdUsoY8Fl+1PCpmc=;
 b=HccPFtrgYYOWXjPYvfqIiEpsTZAL7pjfCc8okgjRqD4DNkPG+NzszSFR1Rf6wPD5AAg9cH
 02WYu/n4hOwh8zh9ogJ5qswyG9dY/pbhMQhEFXOgZfHieDJ/s6GL8NTfWrLSTwLb5KB0xH
 28BFz5knxCLHsAYnRDjgAZGTct3qV5w=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-618-eXTk3nYGMbiZv-sga_R6cg-1; Tue, 09 May 2023 13:07:52 -0400
X-MC-Unique: eXTk3nYGMbiZv-sga_R6cg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 13D3385A5B1;
 Tue,  9 May 2023 17:07:52 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.192])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A1B872026D16;
 Tue,  9 May 2023 17:07:50 +0000 (UTC)
Date: Tue, 9 May 2023 19:07:49 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: stefanha@redhat.com, eblake@redhat.com, eesposit@redhat.com,
 pbonzini@redhat.com, qemu-devel@nongnu.org
Subject: Re: [PATCH v2 00/20] Graph locking, part 3 (more block drivers)
Message-ID: <ZFp95ct8J0b5zKaY@redhat.com>
References: <20230504115750.54437-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230504115750.54437-1-kwolf@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Am 04.05.2023 um 13:57 hat Kevin Wolf geschrieben:
> The first few patches in this series fix coroutine correctness problems
> that have existed for a while, but only actually start to make things
> fail in practice with stricter checks that we're going to introduce with
> the graph locking work.
> 
> The rest of the series makes sure that the graph lock is held in more
> block driver functions that access the children or parents list of a
> block node. This is incremental work and more patches are yet to come.
> 
> v2:
> - Rebased on current git master
> - Improved some commit messages
> - Patch 5: Added missing coroutine_fn annotations in test
> - Patch 7: Updated comments, too

Thanks for the review, applied to the block branch.

Kevin


