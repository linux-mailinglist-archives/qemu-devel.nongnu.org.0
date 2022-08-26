Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC0355A2B60
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 17:37:26 +0200 (CEST)
Received: from localhost ([::1]:51166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRbOf-00042h-DP
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 11:37:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oRasO-0003uQ-Mb
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 11:04:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55268)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oRasK-0003oU-Pg
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 11:04:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661526238;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5DqPf1oIw24ZxJvF2ll9Wx0aUe3/d7GTNZzfFzxv83E=;
 b=X7yotN/pUGY2adYqC2/ewA1Q8s+hcWhHz9H3kpcEjldlhzfYE4Oidpq54bm1g3CMboXI20
 PNl00cSctlFMU49lrlpe3ND75+9QGrCO0X1jQMGCBsbML0fqKus6+KH7nxL7vrOynw1XUm
 gS0CucMIuh3DQ3nu6ParyB3i+HGesQk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-321-7As3IssTPu28A68HCFTPHQ-1; Fri, 26 Aug 2022 11:03:53 -0400
X-MC-Unique: 7As3IssTPu28A68HCFTPHQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5C922280EA34;
 Fri, 26 Aug 2022 15:03:52 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.138])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DD0261121314;
 Fri, 26 Aug 2022 15:03:50 +0000 (UTC)
Date: Fri, 26 Aug 2022 16:03:42 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Sebelev, Vladimir" <vladimir.sebelev@auriga.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Drap Anton <drapas86@gmail.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "Drap, Anton" <anton.drap@auriga.com>,
 Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v3] Loading new machines and devices from external modules
Message-ID: <YwjgzkVoMQmU2Cvi@redhat.com>
References: <20220822085041.127776-1-anton.drap@auriga.com>
 <CAFEAcA-C87Qgyvc_yqtiecA9EBE50J9CZgQY5FiAqDm+pQx67Q@mail.gmail.com>
 <8b584a6fb2cf48c6ac28a9d6ea488dcf@auriga.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8b584a6fb2cf48c6ac28a9d6ea488dcf@auriga.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Aug 26, 2022 at 07:51:20AM +0000, Sebelev, Vladimir wrote:
> Hi Peter,
> 
> Anton previously sent explanation of our position. Nobody commented.
> Could you please comment on it? It's necessary for us to better
> understand your position. From our point of view technical ban of
> external modules loading doesn't solve any of mentioned problems,
> but makes VP developer life harder.

In addition to what Peter just said, I'd like to quote the commit
message itself

[quote]
Moreover different people interested in different parts of QEMU.
QEMU core developers not interested in supporting and maintaining
tons of platforms available on the market. Virtual platform developers
not interested and usually don’t have resources to merge their changes
upstream. So we have a lots of abandoned QEMU forks for different
platforms
[/quote]

This is essentially saying that there are lots of people (often
working for commercial companies) using QEMU and they are not
interested in contributing upstream. At the same time complaining
it is too hard to maintain their forked code. The proposal is then
asking QEMU upstream to change its architecture & support public
API for plugins in order to make it easier for these people to
use QEMU while /still/ not contributing anything back to upstream.

That is not exactly giving a compelling story of the benefits for
the QEMU community. The benefit is all about people who are
intentionally outside the community and wish to remain that way,
while giving QEMU contributors an extra maint burden to support
external plugins indefinitely.

As for the point about the technical limitations and interactions
with licensing not being perfect, and people already likely ignoring
the licensing rules. That is very true, but at the same time, that is
not a reason to abandon the community's licensing goals/intent. Again
this is focusing on benefits to people who want to use QEMU without
contributing back.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


