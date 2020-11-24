Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BB572C2AD8
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Nov 2020 16:07:41 +0100 (CET)
Received: from localhost ([::1]:36214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khZuu-0006Ry-Ep
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 10:07:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1khZtp-0005ui-T9
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 10:06:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:27583)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1khZtn-0002bI-7j
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 10:06:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606230390;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eg/lYfgSKVFMjXsngwPi2NZccuhNLTSwjke8S4Jt5q8=;
 b=ZT2WC5VbN4Q2Ab4FLGZZP0b5wo6NaN480hTq4aJSvh0ofbM42i/rooQMcQ6ZzVONMYWZ96
 if/hMXha9VnmovDN1Km35jwi3xZi/wxieq7mc+UreIFlaZdFSGTSmu1zw0baq8faYz7qYb
 +GmJyrB4x29r64ENPdnA1Vio3KZuPEk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-340-xXXgUkhjPheRo_jT1Od_sA-1; Tue, 24 Nov 2020 10:06:28 -0500
X-MC-Unique: xXXgUkhjPheRo_jT1Od_sA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A47F98030CE;
 Tue, 24 Nov 2020 15:06:27 +0000 (UTC)
Received: from localhost (unknown [10.10.67.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 776F65D6AB;
 Tue, 24 Nov 2020 15:06:24 +0000 (UTC)
Date: Tue, 24 Nov 2020 10:06:23 -0500
From: Eduardo Habkost <ehabkost@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH for-5.2] Revert "hw/core/qdev-properties: Use
 qemu_strtoul() in set_pci_host_devaddr()"
Message-ID: <20201124150623.GP2271382@habkost.net>
References: <20201120130409.956956-1-mst@redhat.com>
 <f328f4c0-04b9-49e7-46f8-1435f8564042@redhat.com>
 <5b9724ca-cc73-e89f-0026-805b61f7cad9@redhat.com>
MIME-Version: 1.0
In-Reply-To: <5b9724ca-cc73-e89f-0026-805b61f7cad9@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ehabkost@redhat.com;
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
Cc: Geoffrey McRae <geoff@hostfission.com>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Klaus Herman <kherman@inbox.lv>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Nov 24, 2020 at 03:13:14PM +0100, Philippe Mathieu-Daudé wrote:
> On 11/20/20 2:10 PM, Paolo Bonzini wrote:
> > On 20/11/20 14:04, Michael S. Tsirkin wrote:
> >> This reverts commit bccb20c49df1bd683248a366021973901c11982f as it
> >> introduced a regression blocking bus addresses > 0x1f or higher.
> >> Legal bus numbers go up to 0xff.
> >>
> >> Cc: "Philippe Mathieu-Daudé" <philmd@redhat.com>
> >> Fixes: bccb20c49df ("Use qemu_strtoul() in set_pci_host_devaddr()")
> >> Reported-by: Klaus Herman <kherman@inbox.lv>
> >> Reported-by: Geoffrey McRae <geoff@hostfission.com>
> >> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> >> ---
> >>
> >> checkpatch will complain since it does not like strtoul but
> >> we had it for years so should be ok for 5.2, right?
> > 
> > Yes, of course.
> > 
> > Paolo
> 
> Which tree is going to merge this patch?

Sorry, I was expecting Michael to merge it, as it's PCI-specific
but it looks like people were waiting for me to merge it.

I'll merge it and submit a pull request ASAP.

-- 
Eduardo


