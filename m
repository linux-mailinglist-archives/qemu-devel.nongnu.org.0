Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F050E42BA0C
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 10:17:43 +0200 (CEST)
Received: from localhost ([::1]:51460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maZSI-0005Ix-Bi
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 04:17:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1maZP9-0003GR-Rh
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 04:14:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31615)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1maZP3-0006kj-RF
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 04:14:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634112859;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zeOsbGqHS5RaWIdHXTvCqN+ZJd7wNlPQ8j2OjC7LlNM=;
 b=CCbUsZ7YxTsGpmXXkFJXV2XHWZ6OSHwis0IOozDhzRgf4BbH8ZPZd67RKGQHXpMDwMlOB4
 7CrwX31pa3RGvisUGBUznKQJDJmP4mhdlysGUDlT5s901vtWmKPz4tICbasQe31J2HHc5a
 /ua2d84yxLEhIjZfT9nCyc2flSWObMs=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-108-_SdeNyhtNxOWm3YVYWeUYA-1; Wed, 13 Oct 2021 04:14:18 -0400
X-MC-Unique: _SdeNyhtNxOWm3YVYWeUYA-1
Received: by mail-ed1-f69.google.com with SMTP id
 d3-20020a056402516300b003db863a248eso1505349ede.16
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 01:14:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=zeOsbGqHS5RaWIdHXTvCqN+ZJd7wNlPQ8j2OjC7LlNM=;
 b=z45AcoHta+daalSMG6J0n2VHN8t35jcULtB3iOm7HXLG7rsDork3v147r1+ufec+7k
 zFmqFLThYwtdgcXru6pVRWrgusOrgZVk7XMAyWGuvzUUJnrJdcKaWe3PFsJzmLnElod0
 fWR523MlED4LQRM3KTt09j1ptFbnhgNDuYYAMQhcbt/VLYCgIB7ram3Wi99kqimda2Wk
 9m4slQ+UquQYPtJmhwthu2/xrc6m/Mu7UMM/sB45DZODOLwv0IYt9mQAlGvg6bN1pGG5
 +eZueiXk4c4WtVbg7w5DNv8n0peG8whdeDi0FN0m1l5Hyq9+eqYXNL2mRqUcinlGsyoC
 3log==
X-Gm-Message-State: AOAM530rXpMkK+WIAej1nY/+xwrEI+Ashz/N5T3FHqtDumE/rs0Pcnl4
 7TelWaPRl4H9QaBNLGEoVMixswsT8rxFAteQBB/KhxQ/AKWnk5G3BhwQPcMOA6i7lszx/v+oG5B
 1GT3mzo6xoHkk2AM=
X-Received: by 2002:a17:906:c252:: with SMTP id
 bl18mr37784804ejb.519.1634112857166; 
 Wed, 13 Oct 2021 01:14:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyzUiLOTWYGd0Zsy1LknoMS11MgcCP5hQRRX2i2F7Q1iTEleOqDbyZ0LtOXnpynixJhyTdH0w==
X-Received: by 2002:a17:906:c252:: with SMTP id
 bl18mr37784777ejb.519.1634112856962; 
 Wed, 13 Oct 2021 01:14:16 -0700 (PDT)
Received: from gator.home (cst2-174-28.cust.vodafone.cz. [31.30.174.28])
 by smtp.gmail.com with ESMTPSA id s3sm6254730ejm.49.2021.10.13.01.14.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Oct 2021 01:14:16 -0700 (PDT)
Date: Wed, 13 Oct 2021 10:14:15 +0200
From: Andrew Jones <drjones@redhat.com>
To: Yanan Wang <wangyanan55@huawei.com>
Subject: Re: [PATCH v2 1/2] hw/core/machine: Split out the smp parsing code
Message-ID: <20211013081415.dxrkyvrflcmw3cuk@gator.home>
References: <20211013074119.23028-1-wangyanan55@huawei.com>
 <20211013074119.23028-2-wangyanan55@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20211013074119.23028-2-wangyanan55@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Pierre Morel <pmorel@linux.ibm.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 wanghaibin.wang@huawei.com, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Oct 13, 2021 at 03:41:18PM +0800, Yanan Wang wrote:
> We are going to introduce an unit test for the parser smp_parse()
> in hw/core/machine.c, but now machine.c is only built in softmmu.
> 
> In order to solve the build dependency on the smp parsing code and
> avoid building unrelated stuff for the unit tests, move the tested
> code from machine.c into a separate file, i.e., machine-smp.c and
> build it in common field.
> 
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> ---
>  MAINTAINERS           |   1 +
>  hw/core/machine-smp.c | 181 ++++++++++++++++++++++++++++++++++++++++++
>  hw/core/machine.c     | 159 -------------------------------------
>  hw/core/meson.build   |   2 +
>  include/hw/boards.h   |   1 +
>  5 files changed, 185 insertions(+), 159 deletions(-)
>  create mode 100644 hw/core/machine-smp.c

Reviewed-by: Andrew Jones <drjones@redhat.com>


