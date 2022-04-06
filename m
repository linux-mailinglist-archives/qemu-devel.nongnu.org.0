Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 343114F547E
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Apr 2022 07:19:43 +0200 (CEST)
Received: from localhost ([::1]:35026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nby4z-0004g3-RU
	for lists+qemu-devel@lfdr.de; Wed, 06 Apr 2022 01:19:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nby47-0003vU-DK
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 01:18:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31157)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nby44-0007PW-OR
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 01:18:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649222323;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zOQabAnp3/wHshlfjDJwzaYMHmwEVnW2nYvSuUtN49s=;
 b=XiBlrsYpOD07mnNhxCxS17E7U06srzVaAcU8FVxZXrW8ckaUuANhjON9BvePsFysiYOJLT
 ltt1b5jOU0+mVY3C4G5RKkv82Hsqzii9pbz8i+22XzISja0DyhSi6EpyRWZ5j787KswEs1
 +PzmxXda9ivxeEALzH1MviUdI7RO8Pc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-176-fmNzcWBHNdGhN71Gg7UQAw-1; Wed, 06 Apr 2022 01:18:42 -0400
X-MC-Unique: fmNzcWBHNdGhN71Gg7UQAw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E6D021C05AC7;
 Wed,  6 Apr 2022 05:18:41 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BBCB9C27D98;
 Wed,  6 Apr 2022 05:18:41 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 6F9E821E6A00; Wed,  6 Apr 2022 07:18:40 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [RFC PATCH] python: add qmp-send program to send raw qmp
 commands to qemu
References: <20220316095455.6473-1-damien.hedde@greensocs.com>
 <CAFn=p-bBExx6yKmRSvg2FJP74TP+7bB3w4xTZSJmj8RdkJiqdw@mail.gmail.com>
 <3d52da6c-124d-4de6-432d-be9e0bb16dfe@greensocs.com>
 <CAFn=p-Y=sTkeMDiht-TCrQKq8WOvbayXjSKiitJkVqUGL6MQNw@mail.gmail.com>
Date: Wed, 06 Apr 2022 07:18:40 +0200
In-Reply-To: <CAFn=p-Y=sTkeMDiht-TCrQKq8WOvbayXjSKiitJkVqUGL6MQNw@mail.gmail.com>
 (John Snow's message of "Tue, 5 Apr 2022 14:08:11 -0400")
Message-ID: <87tub623in.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Damien Hedde <damien.hedde@greensocs.com>, Beraldo Leal <bleal@redhat.com>,
 Daniel Berrange <berrange@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

John Snow <jsnow@redhat.com> writes:

> On Tue, Apr 5, 2022, 5:03 AM Damien Hedde <damien.hedde@greensocs.com>
> wrote:

[...]

>> If it stays in QEMU tree, what licensing should I use ? LGPL does not
>> hurt, no ?
>>
>
> Whichever you please. GPLv2+ would be convenient and harmonizes well with
> other tools. LGPL is only something I started doing so that the "qemu.qmp"
> package would be LGPL. Licensing the tools as LGPL was just a sin of
> convenience so I could claim a single license for the whole wheel/egg/tgz.
>
> (I didn't want to make separate qmp and qmp-tools packages.)
>
> Go with what you feel is best.

Any license other than GPLv2+ needs justification in the commit message.

[...]


