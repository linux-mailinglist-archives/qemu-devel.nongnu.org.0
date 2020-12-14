Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A622E2D9680
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 11:43:58 +0100 (CET)
Received: from localhost ([::1]:37304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kolKf-0000uB-N5
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 05:43:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kolIc-0008I4-9q
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 05:41:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:44329)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kolIZ-0003WT-Mk
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 05:41:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607942505;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RHjwazuik+gZsm9eV06wjTU+B2fXIkCcYJJ/tFKFMtk=;
 b=EWs+y6Jh3CaeeM9JZATsnk8UuWn9MOK+J7OmCpuTOC+4igaK0lmxGq2Wfl6HIAD4nY3Yqd
 CXX7Xtec74Fm3XwFTq2bdBj5gT9E5rmd+of0kBe4sxEhDn/twQ6MFh0K5xrTNwCP5iOjyK
 kzm7wgEAcGRM2K7OldetC4R4gwVajdI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-528-Cc05R7gkOyW9CMzA8qYXkA-1; Mon, 14 Dec 2020 05:41:44 -0500
X-MC-Unique: Cc05R7gkOyW9CMzA8qYXkA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BE1B510054FF;
 Mon, 14 Dec 2020 10:41:42 +0000 (UTC)
Received: from gondolin (ovpn-113-171.ams2.redhat.com [10.36.113.171])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C3D326268D;
 Mon, 14 Dec 2020 10:41:32 +0000 (UTC)
Date: Mon, 14 Dec 2020 11:41:30 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH v4 18/32] qdev: Get just property name at
 error_set_from_qdev_prop_error()
Message-ID: <20201214114130.113c93da.cohuck@redhat.com>
In-Reply-To: <20201211220529.2290218-19-ehabkost@redhat.com>
References: <20201211220529.2290218-1-ehabkost@redhat.com>
 <20201211220529.2290218-19-ehabkost@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>, "Daniel
 P. Berrange" <berrange@redhat.com>, David Hildenbrand <david@redhat.com>,
 John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau <marcandre.lureau@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVk?= =?UTF-8?B?w6k=?= <philmd@redhat.com>,
 Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 11 Dec 2020 17:05:15 -0500
Eduardo Habkost <ehabkost@redhat.com> wrote:

> Replace `Property *prop` parameter with `char *name`, to reduce
> dependency of getter and setter functions on the Property struct
> (which will be changed in following patches).
>=20
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> ---
> This is a new patch added in series v2
> ---
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: "Daniel P. Berrang=C3=A9" <berrange@redhat.com>
> Cc: Eduardo Habkost <ehabkost@redhat.com>
> Cc: Cornelia Huck <cohuck@redhat.com>
> Cc: Halil Pasic <pasic@linux.ibm.com>
> Cc: Christian Borntraeger <borntraeger@de.ibm.com>
> Cc: Thomas Huth <thuth@redhat.com>
> Cc: Richard Henderson <rth@twiddle.net>
> Cc: David Hildenbrand <david@redhat.com>
> Cc: qemu-devel@nongnu.org
> Cc: qemu-s390x@nongnu.org
> ---
>  include/hw/qdev-properties.h     |  2 +-
>  hw/core/qdev-properties-system.c | 12 ++++++------
>  hw/core/qdev-properties.c        |  8 ++++----
>  hw/s390x/css.c                   |  2 +-
>  4 files changed, 12 insertions(+), 12 deletions(-)

Reviewed-by: Cornelia Huck <cohuck@redhat.com>


