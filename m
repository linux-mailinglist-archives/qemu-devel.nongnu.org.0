Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 422416BED6C
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Mar 2023 16:56:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pdCQr-00036V-5L; Fri, 17 Mar 2023 11:55:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pdCQn-00034s-T0
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 11:55:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pdCQm-00089a-8u
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 11:55:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679068547;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nWx9MbfP6OgPvrdPS3SNZz+FNirgS/HNmlAdI9k6A+o=;
 b=NVVM7sFtm1HXztW4F763IpXvTFmLy+9YtIVMeWYWmbYCd1o8ZC+5/UIOSCkio7tzX3CJIB
 uOpuKOjKn8f6F90rrXaa312bY8KIfTNPGJOg5DJo8AiaYhWOZnFywe00IkOUTXieKWA9uT
 skfiOef07wOevCUVs+Bt72N7ItxPcn8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-318-I7l4vlmVNlauXXUs6e7GWw-1; Fri, 17 Mar 2023 11:55:46 -0400
X-MC-Unique: I7l4vlmVNlauXXUs6e7GWw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 045B0185A790;
 Fri, 17 Mar 2023 15:55:46 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.52])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D48E540C6E67;
 Fri, 17 Mar 2023 15:55:45 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id D59C721E6806; Fri, 17 Mar 2023 16:55:44 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org,  Eric Blake <eblake@redhat.com>,  Michael Roth
 <michael.roth@amd.com>,  Het Gala <het.gala@nutanix.com>
Subject: Re: [PATCH v2 0/3] qapi: allow unions to contain further unions
References: <20230223134027.2294640-1-berrange@redhat.com>
Date: Fri, 17 Mar 2023 16:55:44 +0100
In-Reply-To: <20230223134027.2294640-1-berrange@redhat.com> ("Daniel
 P. =?utf-8?Q?Berrang=C3=A9=22's?= message of "Thu, 23 Feb 2023 13:40:24
 +0000")
Message-ID: <87v8ize5j3.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
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

Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> Currently it is not possible for a union type to contain a
> further union as one (or more) of its branches. This relaxes
> that restriction and adds the calls needed to validate field
> name uniqueness as unions are flattened.

I apologize for the long delay.  Sick child, sick me, much snot, little
sleep.

PATCH 1 is wrong, but I was able to figure out what's going on there,
and suggested a patch that hopefully works.

PATCH 2 is okay.  I suggested a few tweaks.  I'd put it first, but
that's up to you.

PATCH 3 looks good.

Looking forward to v3.


