Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED6F12B9A8D
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 19:25:16 +0100 (CET)
Received: from localhost ([::1]:36496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfocN-0006UR-DZ
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 13:25:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kfobK-0005ex-2k
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 13:24:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:36792)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kfobI-0002xk-8w
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 13:24:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605810247;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uWGDS7vXquk67imgvmnajtOVlKNIv+qtu2gIhMtUIFU=;
 b=Jdm3fFR7/rJJcPsT540yDrFuI+PDbJijW84KsN2OOuXxm0jLz4SNkfXhyMr7wZn8gBXdyi
 3Yu/R+3UD41990SQ19L8kwDW+p0d8R6yeVkZuevHpc97Hhj/od5df8e5ZsxfZIgwEq6yRJ
 20WByxUvJKnlhgQISMJo93rCszp0PAY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-546-hWohihCfN1SD7rSCNYCryg-1; Thu, 19 Nov 2020 13:24:05 -0500
X-MC-Unique: hWohihCfN1SD7rSCNYCryg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E557D9CC05
 for <qemu-devel@nongnu.org>; Thu, 19 Nov 2020 18:24:04 +0000 (UTC)
Received: from localhost (ovpn-115-101.rdu2.redhat.com [10.10.115.101])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8068760BE2;
 Thu, 19 Nov 2020 18:24:04 +0000 (UTC)
Date: Thu, 19 Nov 2020 13:24:03 -0500
From: Eduardo Habkost <ehabkost@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v2 4/8] qnum: qnum_value_is_equal() function
Message-ID: <20201119182403.GY1509407@habkost.net>
References: <20201116224143.1284278-1-ehabkost@redhat.com>
 <20201116224143.1284278-5-ehabkost@redhat.com>
 <87ima1d4kj.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <87ima1d4kj.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Nov 19, 2020 at 11:27:40AM +0100, Markus Armbruster wrote:
[...]
> > +bool qnum_is_equal(const QObject *x, const QObject *y)
> > +{
> > +    const QNum *qnum_x = qobject_to(QNum, x);
> > +    const QNum *qnum_y = qobject_to(QNum, y);
> 
> Humor me: blank line between declarations and statements, please.

I can do it.  But why do you prefer it that way?

> 
> > +    return qnum_value_is_equal(&qnum_x->value, &qnum_y->value);
> > +}
> > +
> >  /**
> >   * qnum_destroy_obj(): Free all memory allocated by a QNum object
> >   *

-- 
Eduardo


