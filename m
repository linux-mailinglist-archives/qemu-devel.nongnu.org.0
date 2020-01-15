Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D58E413C8ED
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jan 2020 17:15:09 +0100 (CET)
Received: from localhost ([::1]:56522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1irlK0-0007ou-KJ
	for lists+qemu-devel@lfdr.de; Wed, 15 Jan 2020 11:15:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52291)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1irkZo-0007oM-BO
 for qemu-devel@nongnu.org; Wed, 15 Jan 2020 10:27:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1irkZn-0003N2-Co
 for qemu-devel@nongnu.org; Wed, 15 Jan 2020 10:27:24 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:33076
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>) id 1irkZn-0003Mv-9O
 for qemu-devel@nongnu.org; Wed, 15 Jan 2020 10:27:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579102042;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jZZA8tCcwpwZ5Q+oJ/gffbdRo4/zhlFsl9wW+4+9cKQ=;
 b=cenQ02UZ8f5El/Li7gjpxvo8efcpQiYlqCkEAcsITmPXB3nSM5WVStp/V31GvsiBpx2H4B
 M5O35OadaugVW1nvHBrhemhqSOPH7TfarvbEg+bmB5obKyVnXxgTfs2bkHTdVRQ7YKUand
 8My9oESlccSEXwiV8/cnKMSzc4gt8/o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-326-qZr5jUAZPBix2JloVi_dGA-1; Wed, 15 Jan 2020 10:27:20 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BCBBB101AF6B;
 Wed, 15 Jan 2020 15:27:19 +0000 (UTC)
Received: from linux.fritz.box (ovpn-117-87.ams2.redhat.com [10.36.117.87])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0F0EB5C219;
 Wed, 15 Jan 2020 15:27:12 +0000 (UTC)
Date: Wed, 15 Jan 2020 16:27:11 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Sergio Lopez <slp@redhat.com>
Subject: Re: [PATCH v6 0/8] blockdev: Fix AioContext handling for various
 blockdev actions
Message-ID: <20200115152711.GF5505@linux.fritz.box>
References: <20200108143138.129909-1-slp@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200108143138.129909-1-slp@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: qZr5jUAZPBix2JloVi_dGA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=us-ascii
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
Cc: Markus Armbruster <armbru@redhat.com>, John Snow <jsnow@redhat.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 08.01.2020 um 15:31 hat Sergio Lopez geschrieben:
> This patch series includes fixes for various issues related to
> AioContext mismanagement for various blockdev-initiated actions.
>=20
> It also adds tests for those actions when executed on drives running
> on an IOThread AioContext.

Thanks, fixed up indentation in patch 6 and applied to the block branch.

Kevin


