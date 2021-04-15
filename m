Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA653360216
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Apr 2021 07:58:55 +0200 (CEST)
Received: from localhost ([::1]:40990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWv1i-0000PU-HG
	for lists+qemu-devel@lfdr.de; Thu, 15 Apr 2021 01:58:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lWv0l-0008Jp-Te
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 01:57:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21854)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lWv0W-0007x6-E2
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 01:57:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618466257;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AgJzPMB38URAwnufKApG2Du7riFKW9GITVtrU56VbR8=;
 b=XUfOL9EA9U7mteoik71kl6C65DjGzCNho2uFfouRsvIZce0C2BZ2Lu4x/XVnQ4ybXc06Wg
 v8iQQ0gZidINZvG1lv2FSm9pIZdBnn41zDsVRlpGcDUKpkVg+7JPzmQUcDkmTcYI7wOTnc
 KMR+v6bpHLXv0+LsHHcN4C8B4Z4o0Rw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-543-dYSVJbSePQ-KkLLRZM6AUw-1; Thu, 15 Apr 2021 01:57:34 -0400
X-MC-Unique: dYSVJbSePQ-KkLLRZM6AUw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DB8C087A826;
 Thu, 15 Apr 2021 05:57:33 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 82FEB6C32D;
 Thu, 15 Apr 2021 05:57:33 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 04E95113525D; Thu, 15 Apr 2021 07:57:32 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PULL v2 0/3] osdep.h + QOM changes for QEMU 6.0-rc3
References: <20210413160850.240064-1-pbonzini@redhat.com>
 <CAFEAcA8vf5Ra0MxwunQPGsahnHgaSCE9QYS86xY7tkKEVSO+TA@mail.gmail.com>
Date: Thu, 15 Apr 2021 07:57:31 +0200
In-Reply-To: <CAFEAcA8vf5Ra0MxwunQPGsahnHgaSCE9QYS86xY7tkKEVSO+TA@mail.gmail.com>
 (Peter Maydell's message of "Wed, 14 Apr 2021 19:22:25 +0100")
Message-ID: <87r1jcgkdw.fsf@dusky.pond.sub.org>
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
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Peter Maydell <peter.maydell@linaro.org> writes:

> On Tue, 13 Apr 2021 at 17:18, Paolo Bonzini <pbonzini@redhat.com> wrote:
>>
>> The following changes since commit c1e90def01bdb8fcbdbebd9d1eaa8e4827ece620:
>>
>>   Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-20210412' into staging (2021-04-12 12:12:09 +0100)
>>
>> are available in the Git repository at:
>>
>>   https://gitlab.com/bonzini/qemu.git tags/for-upstream
>>
>> for you to fetch changes up to 1a0b186eaf3d1ce63dc7bf608d618b9ca62b6241:
>>
>>   qapi/qom.json: Do not use CONFIG_VIRTIO_CRYPTO in common code (2021-04-13 18:04:23 +0200)
>>
>> ----------------------------------------------------------------
>> * Fix C++ compilation of qemu/osdep.h.
>> * Fix -object cryptodev-vhost-user
>>
>> ----------------------------------------------------------------
>> Paolo Bonzini (2):
>>       osdep: include glib-compat.h before other QEMU headers
>>       osdep: protect qemu/osdep.h with extern "C"
>>
>> Thomas Huth (1):
>>       qapi/qom.json: Do not use CONFIG_VIRTIO_CRYPTO in common code
>
> Given Dan's review, I think that the osdep patches need another
> revision. So my plan is to cherry-pick the CONFIG_VIRTIO_CRYPTO
> patch here and tag rc3 with just that. If we need an rc4 (which

Uh, I had a question on that one:

Message-ID: <87tuo9j7hw.fsf@dusky.pond.sub.org>
https://lists.gnu.org/archive/html/qemu-devel/2021-04/msg02341.html

> on our current track record is not unlikely) we can put in some
> version of the osdep patches; if not, this isn't a regression
> since 5.2 so I'm happy releasing 6.0 with it still present.
>
> thanks
> -- PMM


