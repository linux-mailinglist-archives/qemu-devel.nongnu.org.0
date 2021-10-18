Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19A1E43104C
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 08:21:41 +0200 (CEST)
Received: from localhost ([::1]:42192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcM1j-0001XM-9T
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 02:21:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mcLzq-0000kD-V7
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 02:19:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49947)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mcLzn-00066x-Af
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 02:19:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634537977;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qdxDQKW0D6bLyE3ZZBngpUWMk1/jLAFfoe4Av+VM7l4=;
 b=hxk++IuL2mF6XKCOdSsiplYLzBuG0PsSzu7OBgj8HbPVn7dDdUMHP9DU/zYLDIiIOdjKeL
 AXcOhs3Tw435BuBNbiPb4H4nMDgVD/LNulbWnbPAbKZOU5iLtiNMda0dfrikHeGvQemIK7
 twZ6Q9ZzBXCh1npwFU5yTmnvYKU8s+A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-65-Kpfic1yMNWqRw5xSwf6HFg-1; Mon, 18 Oct 2021 02:19:36 -0400
X-MC-Unique: Kpfic1yMNWqRw5xSwf6HFg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 51EE310A8E00;
 Mon, 18 Oct 2021 06:19:34 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6D786101E816;
 Mon, 18 Oct 2021 06:19:33 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id A944C180063D; Mon, 18 Oct 2021 08:19:31 +0200 (CEST)
Date: Mon, 18 Oct 2021 08:19:31 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH 4/4] via-ide: Avoid using isa_get_irq()
Message-ID: <20211018061931.46m4rakdhwyfmc64@sirius.home.kraxel.org>
References: <cover.1634259980.git.balaton@eik.bme.hu>
 <26cb1848c9fc0360df7a57c2c9ba5e03c4a692b5.1634259980.git.balaton@eik.bme.hu>
 <84ff4daf-e04c-9238-ae31-9ddaed9a37dc@amsat.org>
 <2f3756a-a968-2d16-f238-1dd16647cc9@eik.bme.hu>
 <b15cb6c9-7166-02c4-29f4-d1bbd3976f69@amsat.org>
MIME-Version: 1.0
In-Reply-To: <b15cb6c9-7166-02c4-29f4-d1bbd3976f69@amsat.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
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
Cc: Huacai Chen <chenhuacai@kernel.org>, John Snow <jsnow@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> > I can do that but waiting for a decision on how to proceed. Will Gerd
> > take my first series this is based on as is then this should be a
> > separate series doing the clean up using pci_get_function_0 or should
> > these two series be merged? I'd also squash setting user_creatable =
> > false into this patch (and do similar for the usb one) unless you guys
> > think it should be a separate patch?
> 
> I don't know what Gerd will do with the USB patches.

Latest revision of usb patches is fine.  I'll go stick them into the
next usb pull request ...

> Your VIA patches are orthogonal, so I'm queuing them (1, 2, 4
> and extra user_creatable) via mips-next.

.. unless someone else is faster with merging ;)

Feel free to add my "Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>"
to the usb patches and merge the complete pack via mips-next.

take care,
  Gerd


