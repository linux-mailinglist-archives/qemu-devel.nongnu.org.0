Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF83E52BDA9
	for <lists+qemu-devel@lfdr.de>; Wed, 18 May 2022 17:07:39 +0200 (CEST)
Received: from localhost ([::1]:38650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrLH0-00063M-CY
	for lists+qemu-devel@lfdr.de; Wed, 18 May 2022 11:07:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nrLDz-00040w-DU
 for qemu-devel@nongnu.org; Wed, 18 May 2022 11:04:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32282)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nrLDw-0001Ip-6B
 for qemu-devel@nongnu.org; Wed, 18 May 2022 11:04:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652886266;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Sl2ZP8NBSE06LUxIjKW7Eltd+z8x6xjrciGrnhXNjho=;
 b=W6Jkgjwd5/wzgLVYORVwK5LqGWU7CUM8vuqKmLuPefzNh9pYXa6UFuzJYYwyvMVoiSB6lX
 6/p4a446x5B+NdzqAyjOsq+qQvVb6y6pUIEJ7aJKNQzy4jJumsO/sRLJmuwsvBRf1HZxCJ
 +s2uul4o49AKNid3rBhrx6OMkTgBdpA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-631-zue_IHOZOh6ZietVd0ZUvw-1; Wed, 18 May 2022 11:04:17 -0400
X-MC-Unique: zue_IHOZOh6ZietVd0ZUvw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C3F0B833963
 for <qemu-devel@nongnu.org>; Wed, 18 May 2022 15:04:16 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.4])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DF3A32026D64;
 Wed, 18 May 2022 15:04:06 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id A23AB21E690D; Wed, 18 May 2022 17:04:05 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org,  Gerd Hoffmann <kraxel@redhat.com>,  Eric Blake
 <eblake@redhat.com>,  Paolo Bonzini <pbonzini@redhat.com>,
 libvir-list@redhat.com,  Daniel P . =?utf-8?Q?Berrang=C3=A9?=
 <berrange@redhat.com>
Subject: Re: [PATCH v2 1/3] ui: Remove deprecated parameters of the
 "-display sdl" option
References: <20220518134446.211632-1-thuth@redhat.com>
 <20220518134446.211632-2-thuth@redhat.com>
Date: Wed, 18 May 2022 17:04:05 +0200
In-Reply-To: <20220518134446.211632-2-thuth@redhat.com> (Thomas Huth's message
 of "Wed, 18 May 2022 15:44:44 +0200")
Message-ID: <87tu9mkhlm.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Thomas Huth <thuth@redhat.com> writes:

> These parameters are in the way for further refactoring (since they
> use an underscore in the name which is forbidden in QAPI), so let's
> remove these now that their deprecation period is over.

Forbidden, but there's an exception mechanism, so this reason isn't
compelling.  I believe the actual reason is they are "too ugly and
inflexible to drag them along into the QAPI world" (your words).

Suggest:

  Dropping these deprecated parameters now simplifies further
  refactoring.

> Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Patch looks good to me, so
Reviewed-by: Markus Armbruster <armbru@redhat.com>


