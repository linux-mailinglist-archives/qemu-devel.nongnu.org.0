Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D6CA2782B0
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Sep 2020 10:24:53 +0200 (CEST)
Received: from localhost ([::1]:58336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kLj2C-00015C-ON
	for lists+qemu-devel@lfdr.de; Fri, 25 Sep 2020 04:24:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kLj13-0000Iy-Jg
 for qemu-devel@nongnu.org; Fri, 25 Sep 2020 04:23:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:25163)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kLj11-0001jm-Rw
 for qemu-devel@nongnu.org; Fri, 25 Sep 2020 04:23:41 -0400
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601022218;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UtXRWly4z00a+rc2tQhxkPUayqZ/GavTKLo+zBVF61Y=;
 b=YER2oWbKHEBrNf37OUuUCjrltYLClijCsSHFj78l6yaJZnsZSek35yO1AcuWzsf0UTFJ+0
 hHZiUYaOMIiL9ceaYSArA8MyxSocB7dSVWv6XL1fXQ/xj4CoCqHngGulUkEtt3sTNTng41
 vG/5qRdS/sBcNFzhTJWKn9wvlpCfmVg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-536-OkKinK37MrW2nukCpUAG5w-1; Fri, 25 Sep 2020 04:23:36 -0400
X-MC-Unique: OkKinK37MrW2nukCpUAG5w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 969A91DE19;
 Fri, 25 Sep 2020 08:23:35 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-85.ams2.redhat.com
 [10.36.112.85])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F149B60C04;
 Fri, 25 Sep 2020 08:23:31 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 18B5716E0A; Fri, 25 Sep 2020 10:23:31 +0200 (CEST)
Date: Fri, 25 Sep 2020 10:23:31 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Laszlo Ersek <lersek@redhat.com>
Subject: Re: [PATCH v4] hw/i386/pc: add max combined fw size as machine
 configuration option
Message-ID: <20200925082331.wdb5y7cju4cuogmx@sirius.home.kraxel.org>
References: <20200923131829.3849-1-erich.mcmillan@hp.com>
 <de343c71-f446-c68b-d0bc-5f9db97b5a00@redhat.com>
MIME-Version: 1.0
In-Reply-To: <de343c71-f446-c68b-d0bc-5f9db97b5a00@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/25 01:07:33
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: mst@redhat.com, qemu-devel@nongnu.org, dgilbert@redhat.com,
 Erich Mcmillan <erich.mcmillan@hp.com>, imammedo@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> > +    pcms->max_fw_size = 8 * MiB; /* use default */

[ ... ]

> All I'm saying is that the "/* use default */" comment should not be
> copied from "max_ram_below_4g" to "max_fw_size", because the (assumed)
> meaning of the original comment does not apply to the new field.

Fully agree.

take care,
  Gerd


