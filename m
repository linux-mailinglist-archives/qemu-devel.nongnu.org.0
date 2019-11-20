Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F9CA1037A0
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Nov 2019 11:33:36 +0100 (CET)
Received: from localhost ([::1]:55818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iXNIl-0001bb-I3
	for lists+qemu-devel@lfdr.de; Wed, 20 Nov 2019 05:33:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56315)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <cohuck@redhat.com>) id 1iXNGt-0000fs-Vi
 for qemu-devel@nongnu.org; Wed, 20 Nov 2019 05:31:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cohuck@redhat.com>) id 1iXNGn-0001hm-IH
 for qemu-devel@nongnu.org; Wed, 20 Nov 2019 05:31:36 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:60617
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <cohuck@redhat.com>) id 1iXNGl-0001cs-IC
 for qemu-devel@nongnu.org; Wed, 20 Nov 2019 05:31:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574245889;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HctpOGaPTv4ArStVDPuNzEF36HpWqXOc690DtET5++I=;
 b=DUFwtsXXAXYfgDAg9/v2T7wIWU6TuVewSVuvwwgs+A0yv0qvFa4FipaSkcUq1vNuq3AFhh
 wTFRK8k8UVTaEW2Qt6XR4kQbT+FJXYCIlxBgnb1Qw1CLuXQqaxLLJg+w4bmjCWEFFyMoyj
 oNJwD98XClH5jfIquJtVbtYqZ0lZNw4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-66-DP2k84pEN_GURYZNZVujYw-1; Wed, 20 Nov 2019 05:31:25 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9C3971034B37;
 Wed, 20 Nov 2019 10:31:24 +0000 (UTC)
Received: from gondolin (dhcp-192-218.str.redhat.com [10.33.192.218])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6C0D36B8F1;
 Wed, 20 Nov 2019 10:31:23 +0000 (UTC)
Date: Wed, 20 Nov 2019 11:31:21 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Eric Farman <farman@linux.ibm.com>
Subject: Re: [RFC PATCH v1 4/8] vfio-ccw: Refactor cleanup of regions
Message-ID: <20191120113121.1b1e8937.cohuck@redhat.com>
In-Reply-To: <20191115033437.37926-5-farman@linux.ibm.com>
References: <20191115033437.37926-1-farman@linux.ibm.com>
 <20191115033437.37926-5-farman@linux.ibm.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: DP2k84pEN_GURYZNZVujYw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
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
Cc: Halil Pasic <pasic@linux.ibm.com>, Jason Herne <jjherne@linux.ibm.com>,
 qemu-s390x@nongnu.org, qemu-devel@nongnu.org,
 Jared Rossi <jrossi@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 15 Nov 2019 04:34:33 +0100
Eric Farman <farman@linux.ibm.com> wrote:

> While we're at it, add a g_free() for the async_cmd_region that
> is the last thing currently created.  g_free() knows how to handle
> NULL pointers, so this makes it easier to remember what cleanups
> need to be performed when new regions are added.
>=20
> Signed-off-by: Eric Farman <farman@linux.ibm.com>
> ---
>  hw/vfio/ccw.c | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)

Reviewed-by: Cornelia Huck <cohuck@redhat.com>


