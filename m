Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABF2026DEAA
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Sep 2020 16:48:17 +0200 (CEST)
Received: from localhost ([::1]:57396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kIvCq-0004L0-M4
	for lists+qemu-devel@lfdr.de; Thu, 17 Sep 2020 10:48:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kIv8S-0007dF-TW
 for qemu-devel@nongnu.org; Thu, 17 Sep 2020 10:43:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28796)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kIv8Q-0006pJ-VT
 for qemu-devel@nongnu.org; Thu, 17 Sep 2020 10:43:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600353822;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6cb7Exzj80yk3XVZ7UXheZgWElqMcrC3b4Ze7KHR+CA=;
 b=QMMDwDQIHXcKKAjLK0U6LEMQjzRg10Po4205CkFMLRTe9RB5Hmsac9dcLID2u8GqtrPdHe
 ctLj5QF49lf4YScdNUij6tkPirDAG5KXiuLzm9YjNE3Es/sv+YYEFr3/Y+9IlISb8OjcCc
 swStSEkVwbR4V6OhFyMHe/IShNf/7NY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-509-xp-FUJTZPZ63w5bJG1bLeg-1; Thu, 17 Sep 2020 10:43:27 -0400
X-MC-Unique: xp-FUJTZPZ63w5bJG1bLeg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9A51E89077A;
 Thu, 17 Sep 2020 14:42:52 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-66.ams2.redhat.com
 [10.36.114.66])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 677E76FEE6;
 Thu, 17 Sep 2020 14:42:52 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id F0EEB113864A; Thu, 17 Sep 2020 16:42:50 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH 15/37] qapi/common.py: split build_params into new file
References: <20200915224027.2529813-1-jsnow@redhat.com>
 <20200915224027.2529813-16-jsnow@redhat.com>
Date: Thu, 17 Sep 2020 16:42:50 +0200
In-Reply-To: <20200915224027.2529813-16-jsnow@redhat.com> (John Snow's message
 of "Tue, 15 Sep 2020 18:40:05 -0400")
Message-ID: <877dsspiqd.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/17 02:01:40
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.997,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Cleber Rosa <crosa@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

John Snow <jsnow@redhat.com> writes:

> Including it in common.py creates a circular import dependency, because
> schema relies on common.py. To type build_params properly, it needs to
> be moved outside of the chain.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  scripts/qapi/commands.py |  2 +-
>  scripts/qapi/common.py   | 23 -----------------------
>  scripts/qapi/events.py   |  2 +-
>  scripts/qapi/params.py   | 40 ++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 42 insertions(+), 25 deletions(-)
>  create mode 100644 scripts/qapi/params.py

Ugh.

Would moving it gen.py work?


