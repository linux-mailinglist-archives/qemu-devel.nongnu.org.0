Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 062251DAE03
	for <lists+qemu-devel@lfdr.de>; Wed, 20 May 2020 10:51:49 +0200 (CEST)
Received: from localhost ([::1]:41310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jbKS4-0001rM-4b
	for lists+qemu-devel@lfdr.de; Wed, 20 May 2020 04:51:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jbKMs-0000Fq-2S
 for qemu-devel@nongnu.org; Wed, 20 May 2020 04:46:26 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:50345
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jbKMr-00073W-B5
 for qemu-devel@nongnu.org; Wed, 20 May 2020 04:46:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589964384;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8hsm4WknYem/AzFrwf7XPoppYuACnCy9HtomwRPISd0=;
 b=T3/hHzKj5zcPDxhsD6YYrZlNqDcnlbyI0XWkgbtLNfVH1nfQ5kQ9XhJcTiewWilewXvlro
 aG8i8TpHxSfSSgzOEjOQoR+deO/s6aws5EypUpUjdIAGbDgdyi6+Z1ENX9vLNDIKO9UgbR
 w12DczamWahpo012jYwJPw8aLgofs94=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-124-SqWfFPiIOWGfa-5uJpPd4Q-1; Wed, 20 May 2020 04:46:22 -0400
X-MC-Unique: SqWfFPiIOWGfa-5uJpPd4Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 288BB8014D7
 for <qemu-devel@nongnu.org>; Wed, 20 May 2020 08:46:22 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-50.ams2.redhat.com
 [10.36.113.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D78296F7F9;
 Wed, 20 May 2020 08:46:21 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id C3FE19D54; Wed, 20 May 2020 10:46:20 +0200 (CEST)
Date: Wed, 20 May 2020 10:46:20 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH 28/55] usb: Eliminate usb_try_create_simple()
Message-ID: <20200520084620.qpcjgl6th762e5fq@sirius.home.kraxel.org>
References: <20200519145551.22836-1-armbru@redhat.com>
 <20200519145551.22836-29-armbru@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200519145551.22836-29-armbru@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.61; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/20 02:22:41
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: pbonzini@redhat.com, berrange@redhat.com, qemu-devel@nongnu.org,
 ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, May 19, 2020 at 04:55:24PM +0200, Markus Armbruster wrote:
> usb_try_create_simple() is qdev_try_new() and qdev_realize_and_unref()
> with more verbose error messages.  Of its two users, one ignores
> errors, and the other asserts they are impossible.
> 
> Make them use qdev_try_new() and qdev_realize_and_unref() directly,
> and eliminate usb_try_create_simple

Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>


