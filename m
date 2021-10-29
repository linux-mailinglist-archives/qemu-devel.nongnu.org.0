Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E598440147
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 19:26:11 +0200 (CEST)
Received: from localhost ([::1]:38358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgVdp-0005wp-Tj
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 13:26:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1mgVOd-00070C-4N
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 13:10:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30163)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1mgVOa-0002z7-PV
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 13:10:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635527423;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B9QM7cV0yrwt2F4EKrGVAuQ97NMb1sJcCMC8869T5ww=;
 b=P0xShrmxXbMaa8/LbfGFnLA7VypFoHBMrCvQbH25LowftO6mkDMuqR3lKEGPJeIt1b6yG+
 0moU9m+2qIv2LUQKH5MMXe7ip92v5XSPCfwLn6IYbDbr4kizpf5HaT/0R+V1STRVhrtlT+
 jo1HYjyeRw7CxGz5pa8/wMilQsOW6as=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-153-qR2cZLZ4MLSJ8jNAh4tkpA-1; Fri, 29 Oct 2021 13:10:22 -0400
X-MC-Unique: qR2cZLZ4MLSJ8jNAh4tkpA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0AA40A0BD7;
 Fri, 29 Oct 2021 17:10:21 +0000 (UTC)
Received: from localhost (unused-10-15-17-6.yyz.redhat.com [10.15.17.6])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CD1115B826;
 Fri, 29 Oct 2021 17:10:20 +0000 (UTC)
Date: Fri, 29 Oct 2021 13:10:20 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v4 0/2] hw/core/machine: Add an unit test for smp_parse
Message-ID: <20211029171020.l25aqeubw4mditxd@habkost.net>
References: <20211028150913.1975305-1-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211028150913.1975305-1-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Yanan Wang <wangyanan55@huawei.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Oct 28, 2021 at 05:09:11PM +0200, Philippe Mathieu-Daudé wrote:
> Respin of Yanan Wang v3, based on
> "hw/core: Restrict qdev-hotplug to sysemu"
> 
> Based-on: 20211028150521.1973821-1-philmd@redhat.com
> https://lore.kernel.org/qemu-devel/20211028150521.1973821-1-philmd@redhat.com
> 
> git-backport-diff:
> Key:
> [----] : patches are identical
> [####] : number of functional differences between upstream/downstream patch
> [down] : patch is downstream-only
> The flags [FC] indicate (F)unctional and (C)ontextual differences, respectively
> 
> 001/2:[0001] [FC] 'hw/core/machine: Split out the smp parsing code'
> 002/2:[----] [--] 'tests/unit: Add an unit test for smp parsing'

Acked-by: Eduardo Habkost <ehabkost@redhat.com>

-- 
Eduardo


