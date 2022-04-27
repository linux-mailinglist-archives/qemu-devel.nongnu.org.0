Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B926511C46
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 18:13:39 +0200 (CEST)
Received: from localhost ([::1]:57344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njkIM-00029d-Go
	for lists+qemu-devel@lfdr.de; Wed, 27 Apr 2022 12:13:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1njkAj-00021N-JU
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 12:05:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51250)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1njkAg-00062j-OV
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 12:05:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651075542;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1NjJqv6ImhofR4h6mItDP8C4Zka1Nf7Nm3gNYXsIMws=;
 b=fHVU+JN+LO6pV4z0srBGtIIhscO5RTNyJCuADD2q+yALgZO7BNfHtyUIlzFe0VKj/jX3qF
 C6HAyRWqFNMEI9emzBRoJu8aoi0t7Rh5EhFIMahpL+gNB/iWWjClLFqHLnCpdS9qTs+qr8
 bW+xIbYVNQRC9qdN1FSEAMq0TAW5s/Y=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-516-at7dwll0OiCrsrjRYlNFqA-1; Wed, 27 Apr 2022 12:05:38 -0400
X-MC-Unique: at7dwll0OiCrsrjRYlNFqA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1D13F801005;
 Wed, 27 Apr 2022 16:05:38 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.52])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 45B2E401A992;
 Wed, 27 Apr 2022 16:05:37 +0000 (UTC)
Date: Wed, 27 Apr 2022 18:05:35 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Hanna Reitz <hreitz@redhat.com>
Subject: Re: [PATCH 2/4] qcow2: Do not reopen data_file in invalidate_cache
Message-ID: <Ymlpz3Vyh7vTi4JS@redhat.com>
References: <20220427114057.36651-1-hreitz@redhat.com>
 <20220427114057.36651-3-hreitz@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220427114057.36651-3-hreitz@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 27.04.2022 um 13:40 hat Hanna Reitz geschrieben:
> qcow2_co_invalidate_cache() closes and opens the qcow2 file, by calling
> qcow2_close() and qcow2_do_open().  These two functions must thus be
> usable from both a global-state and an I/O context.
> 
> As they are, they are not safe to call in an I/O context, because they
> use bdrv_unref_child() and bdrv_open_child() to close/open the data_file
> child, respectively, both of which are global-state functions.  When
> used from qcow2_co_invalidate_cache(), we do not need to close/open the
> data_file child, though (we do not do this for bs->file or bs->backing
> either), and so we should skip it in the qcow2_co_invalidate_cache()
> path.
> 
> To do so, add a parameter to qcow2_do_open() and qcow2_close() to make
> them skip handling s->data_file, and have qcow2_co_invalidate_cache()
> exempt it from the memset() on the BDRVQcow2State.
> 
> (Note that the QED driver similarly closes/opens the QED image by
> invoking bdrv_qed_close()+bdrv_qed_do_open(), but both functions seem
> safe to use in an I/O context.)
> 
> Fixes: https://gitlab.com/qemu-project/qemu/-/issues/945
> Signed-off-by: Hanna Reitz <hreitz@redhat.com>

This feels a bit like a hack, and we'll have to change it again if we
ever want to allow changing the data_file with reopen. But it should do
the job for now.

Kevin


