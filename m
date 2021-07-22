Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAC073D276F
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 18:16:53 +0200 (CEST)
Received: from localhost ([::1]:56876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6bNV-0004QT-1s
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 12:16:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1m6bLz-0003fW-Ep
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 12:15:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56221)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1m6bLx-0003gU-AC
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 12:15:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626970514;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dKt79wpTtanpoysgQeYh7fQG+GbcDMwaQMGRTYmtxq4=;
 b=Gj8LWq5hS9iRfhj2tMGlnHZW/IL5v58qr0cvV0VBf7HY9URkzYwuPwYIFspBOonnclFKo5
 iUNGiTlrX5/b1lkHjnU55gW2Ejj6zdp6AaTIArxp3fd2uJ11PlUHoHlP+UqK3JtSTWKzQf
 +Z0n0vPT316U4MZXX/PchcmF7ZOYwqE=
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-567--onQsBZEO9mqpTP7883tjQ-1; Thu, 22 Jul 2021 12:15:13 -0400
X-MC-Unique: -onQsBZEO9mqpTP7883tjQ-1
Received: by mail-il1-f198.google.com with SMTP id
 e16-20020a056e0204b0b029020c886c9370so3792550ils.10
 for <qemu-devel@nongnu.org>; Thu, 22 Jul 2021 09:15:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=dKt79wpTtanpoysgQeYh7fQG+GbcDMwaQMGRTYmtxq4=;
 b=Qk7s0IvPLs6H/v4E6gayu8KIaZDR1jcRM2T3Gh/P6sJ9LqL7ipe1eSUe+Ih6cLKHBK
 o2E/lxoiayth+KaOTJV0urTa5EluV0h2oeScyjIF9IwE41H0ZEJZk7ujdTaJ4rPmHo6d
 P10xbheOZLA6eJ9abZaycxeRE4yqU19wky7TJz5cbKNzYfLdZVoQXGPBDOukC++fgHYU
 qhM3C2bnDYQjSeE6A6JbLoTPsu/BC+rnH8M2H4vleJnGtM68dMYKnR8HSpzt6/Eu5S8r
 6PW2s3Yb47dCquH3t7V+8Pq+mIgwynR4d3o9qglujnNn/6aBRuxB07ocMhNNQSolEK7B
 V5sA==
X-Gm-Message-State: AOAM533EWHWP61R57X9zrd6cmmD5sD7NsObKjPwe9RdPZked13i+0dre
 ineLyBOI1Bp+kNbn8Q1BQg5YvAb0gUGwOUvm/sL5k63ByJXdeFKYXAtiWuN6e5t9M8kL0iLwYBX
 zr4O4k3tN5dvbmK4=
X-Received: by 2002:a92:c805:: with SMTP id v5mr359089iln.293.1626970513019;
 Thu, 22 Jul 2021 09:15:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxbVe0WztdJWjbsdt6vnBLN3qRBMwkvuaEPk4EXzeCudJeJPS8jEJ2v/63kLP//yYDPjHDLLA==
X-Received: by 2002:a92:c805:: with SMTP id v5mr359077iln.293.1626970512797;
 Thu, 22 Jul 2021 09:15:12 -0700 (PDT)
Received: from gator ([140.82.166.162])
 by smtp.gmail.com with ESMTPSA id z18sm14657239ilp.68.2021.07.22.09.15.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jul 2021 09:15:12 -0700 (PDT)
Date: Thu, 22 Jul 2021 18:15:10 +0200
From: Andrew Jones <drjones@redhat.com>
To: Yanan Wang <wangyanan55@huawei.com>
Subject: Re: [PATCH for-6.1 v2] machine: Disallow specifying topology
 parameters as zero
Message-ID: <20210722161510.2k2ro6hnmisekofc@gator>
References: <20210722154326.1464-1-wangyanan55@huawei.com>
 <20210722154326.1464-2-wangyanan55@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20210722154326.1464-2-wangyanan55@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) DKIMWL_WL_HIGH=-1.472, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Pierre Morel <pmorel@linux.ibm.com>,
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>, Cornelia Huck <cohuck@redhat.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 wanghaibin.wang@huawei.com, yuzenghui@huawei.com,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jul 22, 2021 at 11:43:26PM +0800, Yanan Wang wrote:
> In the SMP configuration, we should either specify a topology
> parameter with a reasonable value (equal to or greater than 1)
> or just leave it omitted and QEMU will calculate its value.
> Configurations which explicitly specify the topology parameters
> as zero like "sockets=0" are meaningless, so disallow them.
> 
> However, the commit 1e63fe685804d
> (machine: pass QAPI struct to mc->smp_parse) has documented that
> '0' has the same semantics as omitting a parameter in the qapi
> comment for SMPConfiguration. So this patch fixes the doc and
> also adds the corresponding sanity check in the smp parsers.
> 
> Suggested-by: Andrew Jones <drjones@redhat.com>
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> ---
>  hw/core/machine.c | 14 ++++++++++++++
>  qapi/machine.json |  6 +++---
>  qemu-options.hx   | 12 +++++++-----
>  3 files changed, 24 insertions(+), 8 deletions(-)

With Daniel's suggested changes for v3

Reviewed-by: Andrew Jones <drjones@redhat.com>


