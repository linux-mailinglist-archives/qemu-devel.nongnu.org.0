Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B9626D591D
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Apr 2023 09:05:01 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjaiG-0006gr-6l; Tue, 04 Apr 2023 03:04:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1pjai9-0006gK-Qg
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 03:04:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1pjai4-0002xk-6g
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 03:04:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680591843;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hy57sumu87jyvNlniSXS6rUxLH9YqhNX/N3I5sRLToE=;
 b=Xw1SP2K+YDF3f83ACyUZmL+9qNSqkCY4muJXWfF2DMx+JstGj+tq0lZaGgiVNySb7CWOc1
 hWKDACogIpQN6kuLGI3dGDGVltTlRW8wL4Mn04HrEpGwyOjqldWRIJP7H1AJ37rua/UAQ+
 Obya8C5D3jFkCn7xO2jmwq85ChE6eV8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-554-tXJZSsllO7KF2L2r90meqg-1; Tue, 04 Apr 2023 03:04:01 -0400
X-MC-Unique: tXJZSsllO7KF2L2r90meqg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AB80B38221D1
 for <qemu-devel@nongnu.org>; Tue,  4 Apr 2023 07:04:01 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.237])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 688E0FD6E;
 Tue,  4 Apr 2023 07:04:01 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id BC22218014B5; Tue,  4 Apr 2023 09:03:59 +0200 (CEST)
Date: Tue, 4 Apr 2023 09:03:59 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org, 
 anisinha@redhat.com, jusual@redhat.com, pbonzini@redhat.com
Subject: Re: [PATCH] acpi: pcihp: make pending delete expire in 5sec
Message-ID: <qdzi3oh24okot23eccd6d453wehyagbxhldoss4bup2whfohfo@hkzr2p3fq6na>
References: <20230403161618.1344414-1-imammedo@redhat.com>
 <20230403131833-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230403131833-mutt-send-email-mst@kernel.org>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
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

  Hi,

> > Allowing pending delete expire brings ACPI PCI hotplug on par
> > with native PCIe unplug behavior [1] which in its turn refers
> > back to ACPI PCI hotplug ability to repeat unplug requests.

> A bit concerned about how this interacts with failover,
> and 5sec is a lot of time that I hoped we'd avoid with acpi.
> Any better ideas of catching such misbehaving guests?

The 5sec are coming from the pcie spec: The hot-unplug request can be
canceled within 5 seconds by pressing the button again. The problem here
is that both hotplug and hot-unplug use the same signaling path, so we
really have to wait the 5 seconds to avoid the OS mis-interpreting the
button press as 'cancel' event.

ACPI hotplug hasn't this problem.  A unplug request is a unplug request,
period.  And it can't be canceled.  So it should be possible to use a
shorter period.  Possibly even no delay at all.

take care,
  Gerd


