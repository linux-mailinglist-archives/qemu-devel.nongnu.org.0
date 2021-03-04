Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C200932D3FA
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 14:14:41 +0100 (CET)
Received: from localhost ([::1]:56392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHnoO-00072F-Cz
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 08:14:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lHnmq-0006X2-F2
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 08:13:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47558)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lHnmn-000694-EQ
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 08:13:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614863579;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lX/LCenfh0+QY+2ppMAh1oGqoEnHsU45hW5oYsMopZA=;
 b=YTWXW4Vt0dKaUK/nmocegBX5YJTUC6X0HRhbYYNJhfRcett4mK6yZguIHQw+nTvRtcfUiT
 QAc8tmLvVS4Lb04QjNYZkxEv0CkeQj+aIVEljRmwb2ADmwfIpTAuNN7LpUJDqH8G1Yuj9d
 hDq9C2W77cFMtCiw5ArILr31t0xXvVg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-195-Df6ZCMDDMQCMuwQ4WQu_WQ-1; Thu, 04 Mar 2021 08:12:56 -0500
X-MC-Unique: Df6ZCMDDMQCMuwQ4WQu_WQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C487492500;
 Thu,  4 Mar 2021 13:12:54 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-115-129.ams2.redhat.com
 [10.36.115.129])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7336410013D6;
 Thu,  4 Mar 2021 13:12:54 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id EF4E718000A7; Thu,  4 Mar 2021 14:12:52 +0100 (CET)
Date: Thu, 4 Mar 2021 14:12:52 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Subject: Re: [PATCH v2] Autoconnect jack ports by default
Message-ID: <20210304131252.k4emi3oazylshacp@sirius.home.kraxel.org>
References: <20210224191927.19271-1-koalinux@gmail.com>
 <5436901.4e4U2xeZI5@silver>
 <20210303071306.h6nmeoau447w4j4b@sirius.home.kraxel.org>
 <1992957.OTMv4WkKIP@silver> <YEDK58TwwX+nnZm3@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YEDK58TwwX+nnZm3@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Geoffrey McRae <geoff@hostfission.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org,
 =?utf-8?B?Sm9zw6k=?= Pekkarinen <koalinux@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> I'd suggest a "auto-connect-ports" boolean option, which defaults to
> enabled.
> 
>  - auto-connect-ports == true,  connect-ports= <unset>
> 
>     => use the proposed default regex for connect ports
> 
>  - auto-connect-ports == true, connect-ports = regex
> 
>     => use the connect-ports regex
> 
>  - auto-connect-ports == false, connect-ports= <unset>
> 
>    => don't auto connect at all
> 
>  - auto-connect-ports == false, connect-ports=regex
> 
>    => logically inconsistent config, report an error

Well, we need two options then, and have one inconsistent variant.
Can't we just get along with connect-ports alone, by using the empty
string for "do not auto connect" ?

take care,
  Gerd


