Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49B56F3642
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Nov 2019 18:53:29 +0100 (CET)
Received: from localhost ([::1]:46626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iSlyK-0006Gb-5C
	for lists+qemu-devel@lfdr.de; Thu, 07 Nov 2019 12:53:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55610)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <ehabkost@redhat.com>) id 1iSlxU-0005pU-Ed
 for qemu-devel@nongnu.org; Thu, 07 Nov 2019 12:52:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ehabkost@redhat.com>) id 1iSlxS-00016d-3M
 for qemu-devel@nongnu.org; Thu, 07 Nov 2019 12:52:35 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:29382
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <ehabkost@redhat.com>) id 1iSlxR-00016J-Vi
 for qemu-devel@nongnu.org; Thu, 07 Nov 2019 12:52:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1573149153;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oK7uou1VT6fXA+Xij2yR1yNE9dApPyM38eHe5oJPLJ0=;
 b=RgIHI9SOZlrFlwJCLyF2Aqn6w84BgBFzrkWfrOHRI6DT88jo8NYQgp5Wqf5BatfAYY9gwv
 7keJsaFG+P5tJwsefv8slsK7PG4P5a1CfgUGgL8dm+Ci/WLLeHEXE65m3rwO7T0n/VMH+J
 CGsFsj8J2Q77o14idBh/xXGIgu3IElk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-280-yHvZug4DOASIK6nKJKfClA-1; Thu, 07 Nov 2019 12:52:30 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6A50F107ACC3;
 Thu,  7 Nov 2019 17:52:28 +0000 (UTC)
Received: from localhost (ovpn-116-57.gru2.redhat.com [10.97.116.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 933155DF2A;
 Thu,  7 Nov 2019 17:52:27 +0000 (UTC)
Date: Thu, 7 Nov 2019 14:52:25 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Tao Xu <tao3.xu@intel.com>
Subject: Re: [PATCH v15 01/12] util/cutils: refactor do_strtosz() to support
 suffixes list
Message-ID: <20191107175225.GT3812@habkost.net>
References: <20191107074511.14304-1-tao3.xu@intel.com>
 <20191107074511.14304-2-tao3.xu@intel.com>
MIME-Version: 1.0
In-Reply-To: <20191107074511.14304-2-tao3.xu@intel.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: yHvZug4DOASIK6nKJKfClA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
Cc: lvivier@redhat.com, thuth@redhat.com, mst@redhat.com, qemu-devel@nongnu.org,
 jingqi.liu@intel.com, fan.du@intel.com, mdroth@linux.vnet.ibm.com,
 armbru@redhat.com, jonathan.cameron@huawei.com, imammedo@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Nov 07, 2019 at 03:45:00PM +0800, Tao Xu wrote:
> Add do_strtomul() to convert string according to different suffixes.
>=20
> Signed-off-by: Tao Xu <tao3.xu@intel.com>

Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>

--=20
Eduardo


