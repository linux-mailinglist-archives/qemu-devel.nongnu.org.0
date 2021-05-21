Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6295C38C8A0
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 15:47:51 +0200 (CEST)
Received: from localhost ([::1]:39720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lk5VG-0007Dx-Fv
	for lists+qemu-devel@lfdr.de; Fri, 21 May 2021 09:47:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lk5Te-0005yj-Ks
 for qemu-devel@nongnu.org; Fri, 21 May 2021 09:46:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39586)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lk5TY-0007MJ-H1
 for qemu-devel@nongnu.org; Fri, 21 May 2021 09:46:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621604762;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ke0k0eb6D9bP3OSuhiiusFCXIUvlG3OCnZnUURGvt0g=;
 b=WBPy5HibS7MZjGlZ+O0aEIJUCEJFkHw7DYNyhuH9JMm/j59PLQcTE6KYdl0XRy1j+Ry56l
 18FA83biewJBoVjlCp9v3m6Jeaf7/tm4rvGDYHS5fxRtBnE44DTCnYlWZ56ds8wcoZYJDk
 I/fTxLOs0kX9Qs2rWD14Opm68LLv6Ec=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-518-jdhxQb1oNXeEis9h4Tig5g-1; Fri, 21 May 2021 09:46:00 -0400
X-MC-Unique: jdhxQb1oNXeEis9h4Tig5g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 261F21883525;
 Fri, 21 May 2021 13:46:00 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-84.ams2.redhat.com
 [10.36.112.84])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8D3E110013D6;
 Fri, 21 May 2021 13:45:56 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 7F6451800386; Fri, 21 May 2021 15:45:54 +0200 (CEST)
Date: Fri, 21 May 2021 15:45:54 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>
Subject: Re: [PULL 12/25] virtio-gpu: move virgl realize + properties
Message-ID: <20210521134554.iiqmo4454hsxgcuw@sirius.home.kraxel.org>
References: <20210510132051.2208563-1-kraxel@redhat.com>
 <20210510132051.2208563-13-kraxel@redhat.com>
 <a86e2a07-a803-cd00-849e-96a30e8839d3@redhat.com>
 <CAJ+F1C+_wMw4YsiHdOCX-uX-ULnmJ6OSpERuPWsPjByAQnYxZg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJ+F1C+_wMw4YsiHdOCX-uX-ULnmJ6OSpERuPWsPjByAQnYxZg@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Cc: Michal =?utf-8?B?UHLDrXZvem7DrWs=?= <mprivozn@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, QEMU <qemu-devel@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> (it's not clear to me if virtio-gpu*-device should be user_creatable on x86
> at least)

Yes (microvm uses virtio-mmio).

take care,
  Gerd


