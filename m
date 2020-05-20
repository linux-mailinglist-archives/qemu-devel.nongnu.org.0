Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C9B41DADFB
	for <lists+qemu-devel@lfdr.de>; Wed, 20 May 2020 10:50:37 +0200 (CEST)
Received: from localhost ([::1]:36042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jbKQu-00082w-Ls
	for lists+qemu-devel@lfdr.de; Wed, 20 May 2020 04:50:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jbKMI-0007F1-M4
 for qemu-devel@nongnu.org; Wed, 20 May 2020 04:45:50 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:22494
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jbKMH-0006yr-Th
 for qemu-devel@nongnu.org; Wed, 20 May 2020 04:45:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589964349;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ug9eLCurCvOPoQPc0EAmR2pqw3iF1yxq3Sat6WzrwF0=;
 b=YtnsCd7rV2Yun1uaTjCN6dj2m/rNGKX9L5C/LvY/hXrixoLsz86vPhpu7acrsvcxDSIudE
 mnk7NVgrRdF1RCFqzPtcjTYGV7bPxCyx+QfMBkhztYbXSX4ZNGQ25UnVgDAeMGndsq1TLx
 5SZmRzPvKGCu7bsATedqNWq37+p27q4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-249-t-WboLnnPHOCuVDcCJw4OA-1; Wed, 20 May 2020 04:45:47 -0400
X-MC-Unique: t-WboLnnPHOCuVDcCJw4OA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7DC308014D7
 for <qemu-devel@nongnu.org>; Wed, 20 May 2020 08:45:46 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-50.ams2.redhat.com
 [10.36.113.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 362FE60C05;
 Wed, 20 May 2020 08:45:46 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 24E149D54; Wed, 20 May 2020 10:45:45 +0200 (CEST)
Date: Wed, 20 May 2020 10:45:45 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH 26/55] usb: Convert uses of usb_create()
Message-ID: <20200520084545.p3npzuosfnghnyw4@sirius.home.kraxel.org>
References: <20200519145551.22836-1-armbru@redhat.com>
 <20200519145551.22836-27-armbru@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200519145551.22836-27-armbru@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.81; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/20 04:09:34
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

On Tue, May 19, 2020 at 04:55:22PM +0200, Markus Armbruster wrote:
> Replace
> 
>     dev = usb_create(bus, type_name);
>     ...
>     object_property_set_bool(OBJECT(dev), true, "realized", &err);
> 
> by
> 
>     dev = isa_new(type_name);
>     ...
>     usb_realize_and_unref(dev, bus, &err);
> 
> Recent commit "qdev: New qdev_new(), qdev_realize(), etc." explains
> why.
> 
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>


