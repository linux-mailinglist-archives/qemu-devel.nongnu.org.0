Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E5244A5D47
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 14:14:06 +0100 (CET)
Received: from localhost ([::1]:60162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEsyy-0003au-Vy
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 08:14:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nEsQT-0007Pk-4l
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 07:38:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56447)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nEsQH-0001bl-9D
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 07:38:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643719092;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F+8qjBExh07PdaGsbBKGSrjT3Jcux7yhSByZBdtxc4M=;
 b=bEWLnqStq2w+wqupxYZ3cUG41MOq2D7/ut7pDoVhDKRThUnDHrv3gQSmfiN2CYF5snb4J5
 lG6+kiyrTc8lwPz77/Ca/unfRsZcxrIsPq1FYzyJGsx51VbB3Ykpfx6IA/Ji8iR0KurCdk
 2pFmRQkMMsRzK/Kz79wQXV4Z19bUkyE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-281-oavn7zkhPmGmaZfBdByq4g-1; Tue, 01 Feb 2022 07:38:07 -0500
X-MC-Unique: oavn7zkhPmGmaZfBdByq4g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ACF428519E6;
 Tue,  1 Feb 2022 12:38:05 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.45])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 96CE31091ED9;
 Tue,  1 Feb 2022 12:37:58 +0000 (UTC)
Date: Tue, 1 Feb 2022 13:37:57 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH v3 0/2] block/export/fuse: Fix build failure on FreeBSD
Message-ID: <YfkppT5WasGkYuzq@redhat.com>
References: <20220201112655.344373-1-f4bug@amsat.org>
MIME-Version: 1.0
In-Reply-To: <20220201112655.344373-1-f4bug@amsat.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.081,
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
Cc: Ed Maste <emaste@freebsd.org>, qemu-block@nongnu.org,
 Kyle Evans <kevans@freebsd.org>, qemu-devel@nongnu.org,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, Hanna Reitz <hreitz@redhat.com>,
 Li-Wen Hsu <lwhsu@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 01.02.2022 um 12:26 hat Philippe Mathieu-Daudé geschrieben:
> Since v2:
> - Rearrange if-else-if ladder first (Kevin)
> 
> Philippe Mathieu-Daudé (2):
>   block/export/fuse: Rearrange if-else-if ladder in fuse_fallocate()
>   block/export/fuse: Fix build failure on FreeBSD

Thanks, applied to the block branch.

Kevin


