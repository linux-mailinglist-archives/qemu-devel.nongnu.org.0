Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF0263887D0
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 08:52:53 +0200 (CEST)
Received: from localhost ([::1]:51958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljG4a-0003gB-L3
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 02:52:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ljG3M-0002vq-Rf
 for qemu-devel@nongnu.org; Wed, 19 May 2021 02:51:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56954)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ljG3G-0005Aw-VY
 for qemu-devel@nongnu.org; Wed, 19 May 2021 02:51:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621407090;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fSWgNInZ2gQCvKirbZLFJRzt8vGLuY12u6rDi64EnKg=;
 b=aa4qHbAB+x2ZVU/B0zPxqxunLf7o7VyTifZ+NsY0c+93eN34/N5T700y2rgiQk3s4eGNdS
 Y5Pj3GlMd8LL3Q702qOcnDewIVU9Mafm4bc0xpWh8jSLrmVZLUhkvgCfkXva8HpFkSWBdF
 fdz1zvee0DjfOegdxkeMF5OfyqDzTcw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-422-dh9-SG4lMqagrtPbJEB-7A-1; Wed, 19 May 2021 02:51:27 -0400
X-MC-Unique: dh9-SG4lMqagrtPbJEB-7A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D0EB21083E93;
 Wed, 19 May 2021 06:51:26 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8D2CC1037EAE;
 Wed, 19 May 2021 06:51:26 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 1781B113861E; Wed, 19 May 2021 08:51:25 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v2 01/21] qapi/parser: Don't try to handle file errors
References: <20210511220601.2110055-1-jsnow@redhat.com>
 <20210511220601.2110055-2-jsnow@redhat.com>
 <87wnrw5r2q.fsf@dusky.pond.sub.org>
 <343e4162-004b-e5c1-e9bd-d90cef240fcb@redhat.com>
Date: Wed, 19 May 2021 08:51:25 +0200
In-Reply-To: <343e4162-004b-e5c1-e9bd-d90cef240fcb@redhat.com> (John Snow's
 message of "Tue, 18 May 2021 15:01:10 -0400")
Message-ID: <87cztn1aj6.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Michael Roth <michael.roth@amd.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

John Snow <jsnow@redhat.com> writes:

> On 5/18/21 5:28 AM, Markus Armbruster wrote:
>> QAPIError not having .info don't actually exist before this patch.
>
> It's defined by QAPISourceError now, I just missed this spot in
> test-qapi. It isn't used in practice until now, however.

I had QAPIError mentally filed under abstract types / didn't bother to
formally make it one with decorators.  Just as well, because it's not
staying abstract: this patch creates instances.


