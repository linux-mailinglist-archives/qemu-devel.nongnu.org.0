Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BB652AD2E8
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 10:55:42 +0100 (CET)
Received: from localhost ([::1]:59124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcQNJ-0005Au-Iv
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 04:55:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kcQM0-0004La-0h
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 04:54:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45689)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kcQLy-0002Ga-CV
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 04:54:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605002057;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CUh64FrLZu603F6V7Q6kMvZtzMuEvtCMXzcbUPB4e80=;
 b=N1zF+hlgSJ7wM5aMM698hvL3JMPhJ8k+tGftls25YmGJeQIFjG142QlOHbm8bfQGOlm+/9
 E1t86wKfbr16syVoRZmFF6R/XJQ33Q047oNq9KEpJd9b77x0+Zjv6l2Ot3jSelgWy9wdQY
 mE6mLswRH2ks39O0li14jP0GGzbwf0g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-7-JSJ85NQLMx-LSWfikMIyVA-1; Tue, 10 Nov 2020 04:54:14 -0500
X-MC-Unique: JSJ85NQLMx-LSWfikMIyVA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 15FD1188C12A
 for <qemu-devel@nongnu.org>; Tue, 10 Nov 2020 09:54:13 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D9F8D62A14;
 Tue, 10 Nov 2020 09:54:12 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 532021132BD6; Tue, 10 Nov 2020 10:54:11 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v2 4/6] qemu-option: clean up id vs. list->merge_lists
References: <20201109133931.979563-1-pbonzini@redhat.com>
 <20201109133931.979563-5-pbonzini@redhat.com>
 <87wnyu4gf9.fsf@dusky.pond.sub.org>
 <736a0053-83b9-3510-82ad-99ea59ea00fe@redhat.com>
 <87a6vq4bqj.fsf@dusky.pond.sub.org>
 <e6fbdb7a-c352-bb81-1dad-7f19c704b108@redhat.com>
 <87o8k5zkbc.fsf@dusky.pond.sub.org>
 <e69d4246-8075-8a4e-2709-c3473fe68040@redhat.com>
Date: Tue, 10 Nov 2020 10:54:11 +0100
In-Reply-To: <e69d4246-8075-8a4e-2709-c3473fe68040@redhat.com> (Paolo
 Bonzini's message of "Tue, 10 Nov 2020 09:39:13 +0100")
Message-ID: <87o8k5wn98.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Paolo Bonzini <pbonzini@redhat.com> writes:

> On 10/11/20 09:29, Markus Armbruster wrote:
>> As we will see below, there are exceptions where we reject
>> options that used to work.  Do we want that?
>
> I think that, as long as we gain in consistency, we do.  The special
> casing of "id" is a wart of the current parser and the less it shows 
> that "id" is treated specially, the best.
>
> Deprecating or downright rejecting working combinations is always
> walking a fine line, but here we're almost in https://xkcd.com/1172/ 
> territory.

I find it hard to disagree ;)


