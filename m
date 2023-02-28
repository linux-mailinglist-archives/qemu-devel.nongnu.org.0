Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49DDD6A5B2C
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 15:57:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pX1OH-0005yB-IG; Tue, 28 Feb 2023 09:55:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1pX1O6-0005uW-45
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 09:55:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1pX1O4-0002Jy-Gh
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 09:55:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677596126;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L8+4WPNblQUax9C3MtAbJrur5wGxlyamVqX4FGlt36g=;
 b=NhYaX4+SEHBeDFEebgEbiEyl4NzzbivywsvZc+rt1SbyW05pu7minUfqyH/u9/YlEx4Wu2
 gdcD8SZoyKGFkj83uw1ZCv4e+O3q3cHt+P7dXXoCps0Pql/+c579S/2WK2nNaI86X+sRK8
 WirVXlVy1faFbWEdO346Q1bzwEM22RM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-58-45pVNnHjPqewj8I7iUFG6g-1; Tue, 28 Feb 2023 09:55:23 -0500
X-MC-Unique: 45pVNnHjPqewj8I7iUFG6g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B262A196EF88;
 Tue, 28 Feb 2023 14:55:22 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.34])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8A3952026D4B;
 Tue, 28 Feb 2023 14:55:22 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 5D620180099A; Tue, 28 Feb 2023 15:55:20 +0100 (CET)
Date: Tue, 28 Feb 2023 15:55:20 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v2 6/7] usb/ohci: Implement resume on connection status
 change
Message-ID: <20230228145520.ie6lfuv6lpcqhhks@sirius.home.kraxel.org>
References: <cover.1676916639.git.balaton@eik.bme.hu>
 <35c4d4ccf2f73e6a87cdbd28fb6a1b33de72ed74.1676916640.git.balaton@eik.bme.hu>
 <9d4b7238-23f4-1ea8-10d9-6b73f4c026ec@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9d4b7238-23f4-1ea8-10d9-6b73f4c026ec@linaro.org>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
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

> > -            /* TODO: CSC is a wakeup event */
> > +            /* CSC is a wakeup event */
> > +            if (ohci_resume(ohci)) {
> > +                ohci_set_interrupt(ohci, OHCI_INTR_RD);
> 
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> 
> Gerd, if you Ack I can queue this.

Looks good to me (whole series).

Acked-by: Gerd Hoffmann <kraxel@redhat.com>

thanks,
  Gerd


