Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69B603A9606
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 11:24:42 +0200 (CEST)
Received: from localhost ([::1]:46102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltRmr-0001MD-H6
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 05:24:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ltRfP-0001qy-G7
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 05:16:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41910)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ltRfN-0006ao-Vq
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 05:16:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623835017;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sR3lTKuRWxr2VrI/iKE8IHH+4hHB8pYySEauWnX3C4M=;
 b=U/JWe0u861VQMopZcTaM9znQnQnCtpNAI9QvCYNZcLNmaRDGwnZLn8Le8NrHrcO6zvOpoB
 V145rW7Tif6Tf5KCg8dqMvBTdYcgP6IiqqJqtllsjU00XLHOobhWqmNe9pdOlUGkOpZIiV
 FTsw6dGuOYQ/gGJ93UJrbK4Zrpn2NLA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-478-YZP_zPR6Oe2jWv3COtRNMQ-1; Wed, 16 Jun 2021 05:16:55 -0400
X-MC-Unique: YZP_zPR6Oe2jWv3COtRNMQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CB84E185060D;
 Wed, 16 Jun 2021 09:16:54 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-38.ams2.redhat.com
 [10.36.112.38])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7B4DAE73A;
 Wed, 16 Jun 2021 09:16:54 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 1107918000B2; Wed, 16 Jun 2021 11:16:53 +0200 (CEST)
Date: Wed, 16 Jun 2021 11:16:53 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Qiang Liu <cyruscyliu@gmail.com>
Subject: Re: [PATCH] hw/audio/sb16: Avoid assertion by restricting I/O
 sampling rate range
Message-ID: <20210616091653.f5u6ao6p3ytfpstf@sirius.home.kraxel.org>
References: <20210601151813.2059996-1-f4bug@amsat.org>
 <b755adfe-5fbe-affb-cc1b-5b4cb377b715@amsat.org>
 <CAAKa2jnvoSqQhpcbgpfXHhdPkERD+92DP4zjKAYCQih-cOrxTA@mail.gmail.com>
 <7c9dcdde-2919-c8ee-bccd-91ff110454f4@amsat.org>
 <CAAKa2j=Uc=oDMLD6z+mPUcAQQ6Hbvox4AwuFGun_Ukj8EopXHA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAAKa2j=Uc=oDMLD6z+mPUcAQQ6Hbvox4AwuFGun_Ukj8EopXHA@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
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
Cc: Alexander Bulekov <alxndr@bu.edu>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> Should I send this patch with tag V2?

Yes, please.

thanks,
  Gerd


