Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 350C62963AC
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Oct 2020 19:26:07 +0200 (CEST)
Received: from localhost ([::1]:54610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kVeLl-0004rj-Ob
	for lists+qemu-devel@lfdr.de; Thu, 22 Oct 2020 13:26:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1kVeKT-0003yK-2l
 for qemu-devel@nongnu.org; Thu, 22 Oct 2020 13:24:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:36770)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1kVeKP-0004Je-CO
 for qemu-devel@nongnu.org; Thu, 22 Oct 2020 13:24:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603387479;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CFEwJAl6F2E2IntXa34cDrTGWVOa6p1qUB+e/ohSt+Y=;
 b=QiI3ucNH6E8u4U8Q9LTML4w0P0A9K6yOoiFBmxT8c4HeC8pWb5yDq3z4eLMJdjkc/uzHFz
 kzC84NtFOcyU7iH7huoWKJ9CFtfiiJ0UYrDVQhj6iZAco/ycsSaiY8DamTl2A9V/m0JHtn
 XDkF8qZ+dD1vHEH9aHIKyZOM6FdSvnI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-262-FWxOEknoNGSRcrA1oK-VhA-1; Thu, 22 Oct 2020 13:24:35 -0400
X-MC-Unique: FWxOEknoNGSRcrA1oK-VhA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 09BEE107ACF8;
 Thu, 22 Oct 2020 17:24:34 +0000 (UTC)
Received: from [10.3.114.232] (ovpn-114-232.phx2.redhat.com [10.3.114.232])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 875956EF42;
 Thu, 22 Oct 2020 17:24:29 +0000 (UTC)
Subject: Re: [RFC] Using gitlab for upstream qemu repo?
To: Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>
References: <672b8aa0-2128-23e1-b778-01a4d96b209d@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <9f6c63c6-599b-ac15-42e2-b9c1991fc7ee@redhat.com>
Date: Thu, 22 Oct 2020 12:24:28 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <672b8aa0-2128-23e1-b778-01a4d96b209d@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/22 08:09:01
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.107, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/22/20 11:47 AM, Paolo Bonzini wrote:
> Hi all,
> 
> now that Gitlab is the primary CI infrastructure for QEMU, and that all
> QEMU git repositories (including mirrors) are available on Gitlab, I
> would like to propose that committers use Gitlab when merging commits to
> QEMU repositories.
> 

> Nothing would change for developers, who would still have access to all
> three sets of repositories (git.qemu.org, gitlab.com and github.com).
> Committers however would need to have an account on the
> https://gitlab.com/qemu-project organization with access to the
> repositories they care about.  They would also lose write access to
> /srv/git on qemu.org.

For clarification, I'm assuming the set of committers is rather small,
and not the same as the set of subsystem maintainers who send pull
requests for a committer to then merge in.  Does this proposal mean that
pull requests would have to switch to gitlab merge requests, or would
there be a transition period where submaintainers still send pull
requests via whichever means desired (mail or gitlab merge request), but
the eventual committer repackages that as a gitlab merge request before
it is upstream?

> 
> Of course this is just starting a discussion, so I'm not even proposing
> a date for the switch.

I'm hoping that as part of the consideration that we make sure that
command line tooling can still drive everything; there is a difference
between requiring a web page to initiate a merge request, vs. proper
command line tooling one to leave the web page as an optional part of
the workflow for only those who want it.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


