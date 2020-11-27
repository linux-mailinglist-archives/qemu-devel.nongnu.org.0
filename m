Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63C5B2C6179
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 10:18:15 +0100 (CET)
Received: from localhost ([::1]:48920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiZtO-0006Qj-5p
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 04:18:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kiZoM-0004QX-Gh
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 04:13:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:20706)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kiZoK-0008Qw-7A
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 04:13:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606468379;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iyC0ACxi6jGXnwrxWYfTEXgBbA+AUO2sr1OKy0j+KVk=;
 b=Sr/1Ud0a9KpHazx8njrdYFlKKTWP23IaRtiD6afGmR1q+PTeIygxJCQchjQxKJVDSh5vXq
 LMhRZG9O2HenVBZT95ls7MVvSDG0Co5Iyw23SdSIqEPipsQUTlAaeugh7i2ZWVFk9alIGN
 yY8qhJEARfy2Eefz29OQZHQFjOZmziQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-262--S0MY-JINAuAagJJ0L2XYw-1; Fri, 27 Nov 2020 04:12:57 -0500
X-MC-Unique: -S0MY-JINAuAagJJ0L2XYw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CDCF110060D6;
 Fri, 27 Nov 2020 09:12:55 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A030D5D9CC;
 Fri, 27 Nov 2020 09:12:55 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 2E7D9113864E; Fri, 27 Nov 2020 10:12:54 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH 0/1] net: Fix handling of id in netdev_add and netdev_del
References: <20201125100220.50251-1-armbru@redhat.com>
 <c9730775-08f6-322e-bb41-76ba957858e4@redhat.com>
Date: Fri, 27 Nov 2020 10:12:54 +0100
In-Reply-To: <c9730775-08f6-322e-bb41-76ba957858e4@redhat.com> (Jason Wang's
 message of "Fri, 27 Nov 2020 13:25:51 +0800")
Message-ID: <877dq7tb6x.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
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
Cc: yuri.benditovich@daynix.com, andrew@daynix.com, qemu-devel@nongnu.org,
 peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Jason Wang <jasowang@redhat.com> writes:

> On 2020/11/25 =E4=B8=8B=E5=8D=886:02, Markus Armbruster wrote:
>> This is a regression fix, but the regression is already in 5.0.  I
>> think it's too late for 5.2.  If I'm right, then the issue should be
>> documented in the release notes (I can do that).
>
>
> Please do that and I've queued this for the next release.

Done.  Thanks!


