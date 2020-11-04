Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA9D32A62D5
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Nov 2020 12:02:30 +0100 (CET)
Received: from localhost ([::1]:55880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kaGYg-0004o4-0E
	for lists+qemu-devel@lfdr.de; Wed, 04 Nov 2020 06:02:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kaGWO-0003Jg-Tn
 for qemu-devel@nongnu.org; Wed, 04 Nov 2020 06:00:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:43910)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kaGWK-0006d0-Lm
 for qemu-devel@nongnu.org; Wed, 04 Nov 2020 06:00:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604487602;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Sz9CYoyiWphorNJl/pBIX2tCdGGzxwSjvo/7Ll0V5UQ=;
 b=W6AJzIzOd8cQ5CezHvJhrDjmzuQL/1AZWWLKgkPyglUnaqPzDbo5u8ckKFSgT52LmGM8pX
 4rmnLXt7zVC0weerQqyWgCcK6GxaIC/i46F3EOSEm+zH5DJzjKajYVxYvkWcDSw94/K3cd
 XtM1wpvfO2EzyE98OmTWfJj6qKctdv4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-456-m4jW20BbM5mm83iI8zgFTA-1; Wed, 04 Nov 2020 05:59:59 -0500
X-MC-Unique: m4jW20BbM5mm83iI8zgFTA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B305818B9F08;
 Wed,  4 Nov 2020 10:59:57 +0000 (UTC)
Received: from dresden.str.redhat.com (unknown [10.40.194.145])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A5B0E1007501;
 Wed,  4 Nov 2020 10:59:55 +0000 (UTC)
Subject: Re: [PATCH for-5.2 3/3] hw/block/nvme: fix free of array-typed value
To: Klaus Jensen <its@irrelevant.dk>, qemu-devel@nongnu.org
References: <20201104102248.32168-1-its@irrelevant.dk>
 <20201104102248.32168-4-its@irrelevant.dk>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <6b54b9a6-a6f8-3009-b3a9-99aecad6fb3b@redhat.com>
Date: Wed, 4 Nov 2020 11:59:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201104102248.32168-4-its@irrelevant.dk>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/03 22:09:52
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-block@nongnu.org, Dmitry Fomichev <dmitry.fomichev@wdc.com>,
 Klaus Jensen <k.jensen@samsung.com>, Minwoo Im <minwoo.im.dev@gmail.com>,
 Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 04.11.20 11:22, Klaus Jensen wrote:
> From: Klaus Jensen <k.jensen@samsung.com>
> 
> Since 7f0f1acedf15 ("hw/block/nvme: support multiple namespaces"), the
> namespaces member of NvmeCtrl is no longer a dynamically allocated
> array. Remove the free.
> 
> Fixes: 7f0f1acedf15 ("hw/block/nvme: support multiple namespaces")
> Reported-by: Coverity (CID 1436131)
> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> ---
>  hw/block/nvme.c | 1 -
>  1 file changed, 1 deletion(-)

Thanks! :)

Reviewed-by: Max Reitz <mreitz@redhat.com>


