Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB4994A9833
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 12:07:59 +0100 (CET)
Received: from localhost ([::1]:44054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFwRa-0001ju-9P
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 06:07:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nFwPr-0000vv-QR
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 06:06:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21208)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nFwPl-0003dC-Dp
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 06:06:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643972762;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DqNCQoyme6d/S+ebpWepVeDmjCAKttzZhhACHw+J4s4=;
 b=iKj0n85JmzLDQ1HizwMSIcPDh5bRkrCnb1XeBVPN/XJPzjPLhiyXUut3tID8dowOw7RemT
 EWr729MoRIGzzvJ8cfy549UWn20aSNSOVvRiK2FVGgTDeWoM3D4CwDesGhX+kQ7AcHD+ps
 eDN9cqPx79xe29b7v8/WCu8vPsIBuNA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-14-ymBrx1gyO96Hz6mxNP1Bhg-1; Fri, 04 Feb 2022 06:06:01 -0500
X-MC-Unique: ymBrx1gyO96Hz6mxNP1Bhg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7518F83DEA7;
 Fri,  4 Feb 2022 11:06:00 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.47])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 201E1106C0FD;
 Fri,  4 Feb 2022 11:05:59 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 2B3D218000B2; Fri,  4 Feb 2022 12:05:58 +0100 (CET)
Date: Fri, 4 Feb 2022 12:05:58 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH v2] hw/smbios: fix memory corruption for large guests due
 to handle overlap
Message-ID: <20220204110558.h3246jyelrvhto5q@sirius.home.kraxel.org>
References: <20220203130957.2248949-1-ani@anisinha.ca>
 <20220204103423.71ec5c6b@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220204103423.71ec5c6b@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.092,
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
Cc: Ani Sinha <ani@anisinha.ca>, gsomlo@gmail.com, qemu-devel@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> Another question is why we split memory on 16Gb chunks, to begin with.
> Maybe instead of doing so, we should just add 1 type17 entry describing
> whole system RAM size. In which case we don't need this dance around
> handle offsets anymore.

Maybe to make the entries look like they do on physical hardware?
i.e. DIMM size is a power of two?  Also physical 1TB DIMMs just
don't exist?

take care,
  Gerd


