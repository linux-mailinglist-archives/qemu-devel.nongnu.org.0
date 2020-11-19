Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F6592B92AC
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 13:42:05 +0100 (CET)
Received: from localhost ([::1]:39778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfjGG-0007Ug-8X
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 07:42:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kfjEF-0006wa-OF
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 07:39:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31326)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kfjED-0001Le-6L
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 07:39:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605789595;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Z5GU1QXTyHfTqYU+v/xM6BFuQ9mVsyqwLbe8tqOz9h8=;
 b=AO5/QckL+gHrl97TWyiTPHO3nY9KcW2BFTQYOLG8/c50GQS1fdzUn9p7J8hmKuwfmIK2ev
 zGq+9S/5BTaM8ZlKzZr23K7Xkt735vYXIVCjzH25nKyiLhUW+2qwDVYeMkc3CEUfXthbTs
 /3RUBPOeaS+uwZemy26Z+b5Dmyx9sws=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-95--9Cg_Qn3Pu-AJh8zTDZsHQ-1; Thu, 19 Nov 2020 07:39:53 -0500
X-MC-Unique: -9Cg_Qn3Pu-AJh8zTDZsHQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3B20F106F6F8
 for <qemu-devel@nongnu.org>; Thu, 19 Nov 2020 12:39:52 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0D2391F0;
 Thu, 19 Nov 2020 12:39:51 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 7F0AF11358BA; Thu, 19 Nov 2020 13:39:50 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH v2 0/8] qom: Use qlit to represent property defaults
References: <20201116224143.1284278-1-ehabkost@redhat.com>
Date: Thu, 19 Nov 2020 13:39:50 +0100
In-Reply-To: <20201116224143.1284278-1-ehabkost@redhat.com> (Eduardo Habkost's
 message of "Mon, 16 Nov 2020 17:41:35 -0500")
Message-ID: <87eekpbjvt.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/19 03:44:58
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 "Daniel P. =?utf-8?Q?Berrang=C3=A9?=" <berrange@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Eduardo Habkost <ehabkost@redhat.com> writes:

> Based-on: 20201104160021.2342108-1-ehabkost@redhat.com
> Git branch: https://gitlab.com/ehabkost/qemu/-/commits/work/qdev-qlit-defaults
>
> This extend qlit.h to support all QNum types (signed int,
> unsigned int, and double), and use QLitObject to represent field
> property defaults.
>
> It allows us to get rid of most type-specific .set_default_value
> functions for QOM property types.

What's left?

I'm asking because if you create a new way to get rid of most of an old
way, you're still left with two ways, which may or may not be an
improvement.

Moving defaults from code to data sounds attractive to me.  Data is
easier to reason about than code.  For QAPI, we've been talking about
defining defaults in the schema for a long time, but nobody has gotten
around to finish an implementation.


