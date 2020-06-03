Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5749D1ECC25
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Jun 2020 11:05:48 +0200 (CEST)
Received: from localhost ([::1]:55244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jgPLH-0001oG-Ei
	for lists+qemu-devel@lfdr.de; Wed, 03 Jun 2020 05:05:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1jgPKK-0001GT-Pj
 for qemu-devel@nongnu.org; Wed, 03 Jun 2020 05:04:48 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:35455
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1jgPKI-0002Nb-Qe
 for qemu-devel@nongnu.org; Wed, 03 Jun 2020 05:04:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591175085;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rjxhJF8NeETuyELWeAN0TaSu36jHcK+I+8GXx0fYDJY=;
 b=D8hO91oN3aMhjnG6qe+Mder/Wq5YSDqs0hnJBE2P0CWRyBtpVxkEJgCpACGQJfFOgDhkbE
 /VUXKuTpUU3UU3RzxuXCQSwcjGDdJNzQwrI/SyLLweKjLV0+PXLL66TBBAG3qdawrX5+Ry
 0AfkXx1lFRA2T89taAa1Za5Ksxk3IoE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-270-85l374xcNCq9LUq3mbVWGw-1; Wed, 03 Jun 2020 05:04:42 -0400
X-MC-Unique: 85l374xcNCq9LUq3mbVWGw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1C0B5835B41;
 Wed,  3 Jun 2020 09:04:41 +0000 (UTC)
Received: from linux.fritz.box (ovpn-112-187.ams2.redhat.com [10.36.112.187])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2F87D7F0B0;
 Wed,  3 Jun 2020 09:04:39 +0000 (UTC)
Date: Wed, 3 Jun 2020 11:04:37 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH] hw/block/nvme: Verify msix_vector_use() returned value
Message-ID: <20200603090437.GC5127@linux.fritz.box>
References: <20200602155709.9776-1-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200602155709.9776-1-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.120; envelope-from=kwolf@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/03 01:04:35
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 02.06.2020 um 17:57 hat Philippe Mathieu-Daudé geschrieben:
> msix_vector_use() returns -EINVAL on error. Assert it won't.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
> Notes taken while reviewing:
> https://www.mail-archive.com/qemu-block@nongnu.org/msg66831.html
> Based-on: <20200514044611.734782-1-its@irrelevant.dk>

Thanks, applied to the block branch.

Kevin


