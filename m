Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3283B2CD47A
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Dec 2020 12:23:45 +0100 (CET)
Received: from localhost ([::1]:40164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkmi8-0002qv-7o
	for lists+qemu-devel@lfdr.de; Thu, 03 Dec 2020 06:23:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kkmeJ-0008Vt-58
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 06:19:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33210)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kkmeB-00021S-3d
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 06:19:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606994377;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=j1IcZ5ir8xjDgN5Rumt581vVyCKhstWEA5/08SXcYGg=;
 b=dERtkHLZtQOYF+1waBlBZJ+eLKi6Is1lUYuuM8UdDP4q2vS2gwWYhKVIiHH/x6SOmVsiLQ
 I2aEA+yhq/eX40cBAuVKypTchpIC2Y0O9DSrEvxOkLbCfDpbRhwzwTI45949yzgHhbZtia
 fWxz6x/uJhLILoI5kiJY0tKr/vNuXP0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-15-getjtz6MPK-uy6WvJO3BPA-1; Thu, 03 Dec 2020 06:19:36 -0500
X-MC-Unique: getjtz6MPK-uy6WvJO3BPA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E01A981C478;
 Thu,  3 Dec 2020 11:19:34 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-94.ams2.redhat.com
 [10.36.112.94])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 993D25C1B4;
 Thu,  3 Dec 2020 11:19:34 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id AF98211AB8; Thu,  3 Dec 2020 12:19:33 +0100 (CET)
Date: Thu, 3 Dec 2020 12:19:33 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v3 01/12] [testing] disable xhci msix
Message-ID: <20201203111933.4b5a2eeaxo64dpf5@sirius.home.kraxel.org>
References: <20201203105423.10431-1-kraxel@redhat.com>
 <20201203105423.10431-2-kraxel@redhat.com>
 <20201203060034-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20201203060034-mutt-send-email-mst@kernel.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.495,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Dec 03, 2020 at 06:00:54AM -0500, Michael S. Tsirkin wrote:
> On Thu, Dec 03, 2020 at 11:54:12AM +0100, Gerd Hoffmann wrote:
> > Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> 
> A bit more context on why you are doing this?

Scratch the patch, I just forgot to pass in --base so git publish skips
this one when mailing the series.

I'm using it to have a pcie device without msi support so I can check
whenever pci link interrupts are working properly.

take care,
  Gerd


