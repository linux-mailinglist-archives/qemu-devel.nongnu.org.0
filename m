Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADA2D32B56A
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 08:17:16 +0100 (CET)
Received: from localhost ([::1]:57948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHLkx-0004Q6-Po
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 02:17:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lHLh5-0002OH-3K
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 02:13:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:52781)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lHLh3-0002HR-Lx
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 02:13:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614755593;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+2PvFiSdCbH77naJi31OwgjT5vxPTvuzAQB8sflD6Dg=;
 b=iMfJdXivN3lVqhZinuP6jPAK7Zg+lFEo5ro3GdaEKo/ZMtu65S2H9hFGMXK4jcr3EhGxfs
 aeG3hxvYt1TGTgOnU8fVNC9+3W0zaMbqvGmnPvHWVg90lKr8uVeO1o6LpqeJFYNBYT3GYl
 AzH9j3hXamLT0xR57WLMK/ThjukwCHo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-146-NY0NnZgKNuilcfZu4XtDmA-1; Wed, 03 Mar 2021 02:13:10 -0500
X-MC-Unique: NY0NnZgKNuilcfZu4XtDmA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 758CB1936B60;
 Wed,  3 Mar 2021 07:13:09 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-154.ams2.redhat.com
 [10.36.112.154])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D407B1F473;
 Wed,  3 Mar 2021 07:13:08 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 91D8518000A7; Wed,  3 Mar 2021 08:13:06 +0100 (CET)
Date: Wed, 3 Mar 2021 08:13:06 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: [PATCH v2] Autoconnect jack ports by default
Message-ID: <20210303071306.h6nmeoau447w4j4b@sirius.home.kraxel.org>
References: <20210224191927.19271-1-koalinux@gmail.com>
 <31652865.Htn8XJslzA@silver>
 <20210225084855.lfyv6ybkcctgulo7@sirius.home.kraxel.org>
 <5436901.4e4U2xeZI5@silver>
MIME-Version: 1.0
In-Reply-To: <5436901.4e4U2xeZI5@silver>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
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
Cc: Geoffrey McRae <geoff@hostfission.com>, qemu-devel@nongnu.org,
 =?utf-8?B?Sm9zw6k=?= Pekkarinen <koalinux@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> JACK clients with consumer purpose often auto connect to system ports by 
> default because their users mostly use JACK just as a consumer desktop sound 
> server. And I assume this applies to José as well.

Hmm, ok.  I'd suggest to simply change the default for connect-ports
then, that'll allow the user to easily change the behavior by setting
connect-ports to something else (including the empty string to disable
autoconnect).

take care,
  Gerd


