Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72A6069435D
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 11:46:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRWKL-0008Lf-Dh; Mon, 13 Feb 2023 05:44:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pRWKJ-0008KD-6X
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 05:44:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pRWKH-0008CZ-90
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 05:44:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676285087;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ziLjCOJgEDf0tULa8l2ZDPX+dJ/uuePOBzXFfE2NoLQ=;
 b=K2RjXHGChU7ny7c6ZnuORellaKTZj/kKwBbdugdTls08SNmj54MWKWPZe6g+w3Oiw//4/p
 pgHKgzQJTHeQoK9s5db33uHC22XPUj+ti5vQvjD4zvRXP2MtYAmlANNgS/DfgjIXI+kiVA
 DGu8Cjp6N1lqLVaUt5otIZy+WSMgByY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-315-IXnZgaQlN0elMttBhc4p-A-1; Mon, 13 Feb 2023 05:44:43 -0500
X-MC-Unique: IXnZgaQlN0elMttBhc4p-A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 07BFD100F906;
 Mon, 13 Feb 2023 10:44:43 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.95])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 48C4C18EC5;
 Mon, 13 Feb 2023 10:44:39 +0000 (UTC)
Date: Mon, 13 Feb 2023 11:44:37 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Cc: qemu-devel@nongnu.org, Warner Losh <imp@bsdimp.com>,
 Kyle Evans <kevans@freebsd.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 0/3]  TSA: make sure QEMU compiles when using clang TSA
Message-ID: <Y+oUlQrpTCut8L8Y@redhat.com>
References: <20230117135203.3049709-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230117135203.3049709-1-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
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

Am 17.01.2023 um 14:52 hat Emanuele Giuseppe Esposito geschrieben:
> This serie aims to enable clang Thread Safety Analysis (TSA) in QEMU.
> The goal is to use it for our multiqueue project aiming to replace the
> block layer AioContext lock with a rwlock and make sure the lock is taken
> correctly everywhere [1].
> 
> By default, TSA covers pthread mutexes, therefore when added in QEMU it
> immediately detects some wrappers using pthread_mutex_lock/unlock without
> using the proper TSA macros. Since adding such macro requires scanning all
> possible callers of the affected wrapper, simply use TSA_NO_TSA to suppress
> the warnings.
> 
> [1] = https://lists.gnu.org/archive/html/qemu-devel/2022-12/msg00903.html

Thanks, changed the commit messages as discussed and applied to my block
branch.

Kevin


