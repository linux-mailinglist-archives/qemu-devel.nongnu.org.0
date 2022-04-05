Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F106C4F29A2
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Apr 2022 11:52:33 +0200 (CEST)
Received: from localhost ([::1]:53920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbfrU-0000YG-6m
	for lists+qemu-devel@lfdr.de; Tue, 05 Apr 2022 05:52:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nbfkN-000694-9f
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 05:45:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31486)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nbfkK-00034D-Qj
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 05:45:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649151906;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Laj5u9CPwXc98ThrzwO1zqTtpi5dXzhm9mlTh/hOVu8=;
 b=X+OrNuXtYfqFaCGwMgFY3n2ITuj6LtbcpswgbACCvVU6KkPzkmT5MlhRvWt5hi8XJ5EvoV
 xCBe/Wtr3auLm39eGzzqocax7VElMvWKlUFNL24mXP5ceA8wu40JoSz1z1/xFnqzq407HP
 Y3+TbwGHf6xbnT+BA/FaWu8TY7gBoHs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-255-8NcOx2d6MqSJq1b8ykV6ow-1; Tue, 05 Apr 2022 05:45:05 -0400
X-MC-Unique: 8NcOx2d6MqSJq1b8ykV6ow-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 69F04811E75;
 Tue,  5 Apr 2022 09:45:05 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 470BF40E250D;
 Tue,  5 Apr 2022 09:45:05 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 2CC5321E6906; Tue,  5 Apr 2022 11:45:04 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Damien Hedde <damien.hedde@greensocs.com>
Subject: Re: [RFC PATCH] python: add qmp-send program to send raw qmp
 commands to qemu
References: <20220316095455.6473-1-damien.hedde@greensocs.com>
 <CAFn=p-bBExx6yKmRSvg2FJP74TP+7bB3w4xTZSJmj8RdkJiqdw@mail.gmail.com>
 <3d52da6c-124d-4de6-432d-be9e0bb16dfe@greensocs.com>
Date: Tue, 05 Apr 2022 11:45:04 +0200
In-Reply-To: <3d52da6c-124d-4de6-432d-be9e0bb16dfe@greensocs.com> (Damien
 Hedde's message of "Tue, 5 Apr 2022 11:02:47 +0200")
Message-ID: <87y20j984f.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Daniel Berrange <berrange@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 John Snow <jsnow@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Damien Hedde <damien.hedde@greensocs.com> writes:

> On 4/4/22 22:34, John Snow wrote:
>> On Wed, Mar 16, 2022 at 5:55 AM Damien Hedde <damien.hedde@greensocs.com> wrote:

[...]

>> I recommend putting this in qemu/util/qmp_send.py instead.
>> I'm in the process of pulling out the AQMP lib and hosting it
>> separately. Scripts like this I think should stay in the QEMU tree, so
>> moving it to util instead is probably best. Otherwise, I'll *really*
>> have to commit to the syntax, and that's probably a bigger hurdle than
>> you want to deal with.
>
> If it stays in QEMU tree, what licensing should I use ? LGPL does not
> hurt, no ?

GPLv2+ is the default, and for a reason.

[...]


