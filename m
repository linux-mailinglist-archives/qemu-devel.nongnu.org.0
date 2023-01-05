Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 991C365F0B6
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 17:03:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDSgo-0004l4-T9; Thu, 05 Jan 2023 11:01:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1pDSgk-0004iv-DR
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 11:01:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1pDSgj-0003XV-1U
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 11:01:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672934512;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oLP1MLbZcfDM2IqFAVbcP+iRkfXTmTC+VOqb01qWSI8=;
 b=F9br7F2bJf/ozcRSDXPnOvVaRukw3N/a5S73Xyeo9wDFgdKGQEsa5X20WnFT7Fa1En1hyV
 WRHVMMkuGDPrHKLmoUC7MqvK42BNU42GTvmdvXtcAYMJrfbyPI7u4gyDDZocUELx5kf50/
 dNQ4eObVxRfrJ9mCS1WDXtzCRvZ0U40=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-136-6Gpn6jtKMO23wO074JsgVQ-1; Thu, 05 Jan 2023 11:01:48 -0500
X-MC-Unique: 6Gpn6jtKMO23wO074JsgVQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6E2AE85CBE6;
 Thu,  5 Jan 2023 16:01:48 +0000 (UTC)
Received: from [10.39.192.44] (unknown [10.39.192.44])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D17A7C15BA0;
 Thu,  5 Jan 2023 16:01:46 +0000 (UTC)
Message-ID: <c773af84-a36f-181c-6e0e-50124230289e@redhat.com>
Date: Thu, 5 Jan 2023 17:01:44 +0100
MIME-Version: 1.0
Subject: Re: [PULL 50/51] acpi: cpuhp: fix guest-visible maximum access size
 to the legacy reg block
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Ani Sinha <ani@anisinha.ca>,
 Ard Biesheuvel <ardb@kernel.org>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-stable@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
References: <20230105091310.263867-1-mst@redhat.com>
 <20230105091310.263867-51-mst@redhat.com>
 <20230105045544-mutt-send-email-mst@kernel.org>
From: Laszlo Ersek <lersek@redhat.com>
In-Reply-To: <20230105045544-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lersek@redhat.com;
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

On 1/5/23 10:56, Michael S. Tsirkin wrote:
> On Thu, Jan 05, 2023 at 04:17:06AM -0500, Michael S. Tsirkin wrote:
>> From: Laszlo Ersek <lersek@redhat.com>
> 
> I noticed v2 is forthcoming. dropped now.
> 

Yes, thanks.

I'm picking up the "Reviewed-by: Michael S. Tsirkin <mst@redhat.com>"
tag from your commit message. I'm not taking the "Fixes:" tag,
originally suggested by Phil, because we've agreed that that was not
correct. The other tags (from Igor, Phil and Ard) I've picked up
already, and I've updated the commit message too. I'll post v2 soon.

Thanks!
Laszlo


