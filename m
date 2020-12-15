Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84A442DB1A2
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 17:38:29 +0100 (CET)
Received: from localhost ([::1]:55566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpDLI-0005hr-5r
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 11:38:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kpDKE-0005FO-Bi
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 11:37:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:46416)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kpDKB-0005bp-16
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 11:37:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608050236;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nl4OLVEjgrllPg65ilIzAyNB1efez8X4Exdt/fS2wxs=;
 b=cSMnmZ41EXpCg4xXnFr2KQBP987xmzYNZs2k5qLWAKbCVLoUF+t+0J/VGUT5OPgS7x2Trf
 CmYDfAjzbVLMe6JjqzSu8+1okYbUIv+TH8sH2KL9yXjYL3AGl2HdKYu21WrL7k7CuIJvLf
 OPIJvtjRTDaKarNQqyHSiANsJM6189Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-428-kyYhCO0_Mf--qpSJF6yhgA-1; Tue, 15 Dec 2020 11:37:12 -0500
X-MC-Unique: kyYhCO0_Mf--qpSJF6yhgA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 42E336D526
 for <qemu-devel@nongnu.org>; Tue, 15 Dec 2020 16:36:15 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-94.ams2.redhat.com
 [10.36.112.94])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0A84B10023AD;
 Tue, 15 Dec 2020 16:36:14 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 2934EA1E2; Tue, 15 Dec 2020 17:36:14 +0100 (CET)
Date: Tue, 15 Dec 2020 17:36:14 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH v2 0/4] [RfC] fix tracing for modules
Message-ID: <20201215163614.i2a3ux6eibftfb2s@sirius.home.kraxel.org>
References: <20201124160255.28111-1-kraxel@redhat.com>
 <20201130165614.GB474479@stefanha-x1.localdomain>
MIME-Version: 1.0
In-Reply-To: <20201130165614.GB474479@stefanha-x1.localdomain>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> One way to solve this is by modifying trace_event_register_group() to
> call into trace/simple.c (maybe with a TraceEventIter initialized to
> iterate over the newly registered trace events group?).

https://git.kraxel.org/cgit/qemu/log/?h=sirius/trace-modules

Not solved yet: -trace "events=qxl*" not working, because
trace_enable_events runs before modules are loaded.

take care,
  Gerd


