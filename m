Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D44F2ADE0E
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 19:18:56 +0100 (CET)
Received: from localhost ([::1]:34436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcYEJ-0007Qy-5d
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 13:18:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kcYBp-000656-DP
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 13:16:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21566)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kcYBm-00069t-LP
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 13:16:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605032177;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ptHYTpYQZypLNhBm0oDTrtUslwTstUy4XlCQpOnXrOQ=;
 b=dQw2nOuVG/q6Xg6LSO6OynESffmaZeg2Rh+19sLmUt8vrGJ4ws2xUbJk37HFQqokalkmny
 CYBM9q7hxu8Hv0DcHUCeneb4iIAPNe9mqRFOBCBmHpdqONJ5HUbdiX28K64ePES2b71APF
 ofRIHcXQDP6kF/fLpc+PsSuu4d/29Dk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-413-5KVeTehtNGqMV7tW58KyHw-1; Tue, 10 Nov 2020 13:16:15 -0500
X-MC-Unique: 5KVeTehtNGqMV7tW58KyHw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2EE13804753
 for <qemu-devel@nongnu.org>; Tue, 10 Nov 2020 18:16:14 +0000 (UTC)
Received: from localhost (ovpn-114-68.rdu2.redhat.com [10.10.114.68])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E301C1002C32;
 Tue, 10 Nov 2020 18:16:13 +0000 (UTC)
Date: Tue, 10 Nov 2020 13:16:13 -0500
From: Eduardo Habkost <ehabkost@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 0/8] qom: Use qlit to represent property defaults
Message-ID: <20201110181613.GK5733@habkost.net>
References: <20201109212556.3934583-1-ehabkost@redhat.com>
 <0156a49d-a22b-f741-b0db-d2cda4d6ca36@redhat.com>
MIME-Version: 1.0
In-Reply-To: <0156a49d-a22b-f741-b0db-d2cda4d6ca36@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/10 02:00:53
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
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
Cc: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Nov 10, 2020 at 05:39:08PM +0100, Paolo Bonzini wrote:
> On 09/11/20 22:25, Eduardo Habkost wrote:
> > Based-on: 20201104160021.2342108-1-ehabkost@redhat.com
> > Git branch: https://gitlab.com/ehabkost/qemu/-/commits/work/qdev-qlit-defaults
> > 
> > This extend qlit.h to support all QNum types (signed int,
> > unsigned int, and double), and use QLitObject to represent field
> > property defaults.
> > 
> > It allows us to get rid of most type-specific .set_default_value
> > functions for QOM property types.
> > 
> > Eduardo Habkost (8):
> >    qobject: Include API docs in docs/devel/qobject.html
> >    qnum: Make qnum_get_double() get const pointer
> >    qnum: QNumValue type for QNum value literals
> >    qnum: qnum_value_is_equal() function
> >    qlit: Support all types of QNums
> >    qlit: qlit_type() function
> >    qom: Make object_property_set_default() public
> >    qom: Use qlit to represent property defaults
> > 
> >   docs/devel/index.rst                  |   1 +
> >   docs/devel/qobject.rst                |  11 +++
> >   include/hw/qdev-properties-system.h   |   2 +-
> >   include/qapi/qmp/qlit.h               |  16 +++-
> >   include/qapi/qmp/qnum.h               |  47 ++++++++++-
> >   include/qapi/qmp/qobject.h            |  48 +++++++----
> >   include/qom/field-property-internal.h |   4 -
> >   include/qom/field-property.h          |  26 +++---
> >   include/qom/object.h                  |  11 +++
> >   include/qom/property-types.h          |  21 ++---
> >   hw/core/qdev-properties-system.c      |   8 --
> >   qobject/qlit.c                        |   4 +-
> >   qobject/qnum.c                        | 116 +++++++++++++++-----------
> >   qom/field-property.c                  |  27 ++++--
> >   qom/object.c                          |   2 +-
> >   qom/property-types.c                  |  36 ++------
> >   tests/check-qjson.c                   |  72 ++++++++++++++--
> >   17 files changed, 295 insertions(+), 157 deletions(-)
> >   create mode 100644 docs/devel/qobject.rst
> > 
> 
> Acked-by: Paolo Bonzini <pbonzini@redhat.com>

Thanks!

It looks like I broke some unit tests in this series.  I will
submit v2 after submitting v3 of the field property series.

-- 
Eduardo


