Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2DCD362E76
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Apr 2021 10:07:02 +0200 (CEST)
Received: from localhost ([::1]:45868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXfyo-0004UE-1E
	for lists+qemu-devel@lfdr.de; Sat, 17 Apr 2021 04:07:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lXfx9-0003yU-8L
 for qemu-devel@nongnu.org; Sat, 17 Apr 2021 04:05:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:50269)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lXfx7-0004B8-HS
 for qemu-devel@nongnu.org; Sat, 17 Apr 2021 04:05:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618646716;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2Kgd83JMznXscN0N4/8q1GnG9K86l2l9MVPdOkN/aHM=;
 b=F89Q13JEGGMyEjqNgD1T8v4aYGm7qztLSIr04SV58qsKD+pkbObXzvoW7mPZKANJOzptS6
 ACJqHtPjGk3JbFM0McDHWyubeCYjZR44zXCGLGE/iiimCWAmgWrFqEWJBJRIuMCriClYUI
 n1MrPM4gqKU3JeTSuVyILf/EiEQw1B0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-564-6G8EebKoO6OKbG_ccNE-3A-1; Sat, 17 Apr 2021 04:05:14 -0400
X-MC-Unique: 6G8EebKoO6OKbG_ccNE-3A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C3BCA64092;
 Sat, 17 Apr 2021 08:05:13 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 692C25D9C0;
 Sat, 17 Apr 2021 08:05:10 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id BD6C9113525D; Sat, 17 Apr 2021 10:05:08 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Li Zhang <zhlcindy@gmail.com>
Subject: Re: [PATCHv2 1/1] Support monitor chardev hotswap with QMP
References: <20210413213459.629963-1-li.zhang@cloud.ionos.com>
 <875z0m4733.fsf@dusky.pond.sub.org>
 <CAD8of+ouCK6gd5ur6Eq23EJy_y3a_OV9wkBDBivp+tOkbzagTQ@mail.gmail.com>
Date: Sat, 17 Apr 2021 10:05:08 +0200
In-Reply-To: <CAD8of+ouCK6gd5ur6Eq23EJy_y3a_OV9wkBDBivp+tOkbzagTQ@mail.gmail.com>
 (Li Zhang's message of "Fri, 16 Apr 2021 17:20:44 +0200")
Message-ID: <877dl12v63.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: marcandre.lureau@redhat.com, Li Zhang <li.zhang@cloud.ionos.com>,
 qemu-devel@nongnu.org, Pankaj Gupta <pankaj.gupta@ionos.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Li Zhang <zhlcindy@gmail.com> writes:

> On Fri, Apr 16, 2021 at 4:50 PM Markus Armbruster <armbru@redhat.com> wrote:

[...]

>> As I wrote in my review of v1, this function copies from
>> monitor_data_init(), monitor_init_qmp(), and monitor_flush_locked().
>> Feels like a refactoring would be in order.  Doing it on top might be
>> easier.
>
>  I may misunderstand what you mean. What's the meaning of "doing it on
> top" exactly?

As a separate patch on top of this one.  Sorry for the jargon :)

[...]


