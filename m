Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8519458A754
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 09:43:17 +0200 (CEST)
Received: from localhost ([::1]:43532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJrzH-0007N2-6b
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 03:43:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fweimer@redhat.com>)
 id 1oJrqO-000225-Ux
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 03:34:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44602)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fweimer@redhat.com>)
 id 1oJrqL-0006W9-Gi
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 03:34:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659684840;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PkiwGD+by89uJt4yS1yALGsmSGPSaiOMjbOzhzIgUL8=;
 b=NeEjILg5vVumuvhLtTzSg7AT7Z0Wd060fMeLVYurztn8nfrU/0n4Ri7auGlwg/+m1YT/h1
 Euo/HPgom3yVaAX8kPpU5tUj/+7NbDjnH/2rNlu79n8PWw73J7TYcnNxshGWSE4tGWLvRt
 Tlz79nduxozeqxdOxep8naJALOKeg3c=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-433-dJkw0XeiMYmsyp-yEEr0lA-1; Fri, 05 Aug 2022 03:33:59 -0400
X-MC-Unique: dJkw0XeiMYmsyp-yEEr0lA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B20973C02192;
 Fri,  5 Aug 2022 07:33:58 +0000 (UTC)
Received: from oldenburg.str.redhat.com (unknown [10.39.192.51])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CBCFD2166B26;
 Fri,  5 Aug 2022 07:33:57 +0000 (UTC)
From: Florian Weimer <fweimer@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org,  Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PATCH for 7.1] linux-user: fix compat with glibc >= 2.36
 sys/mount.h
References: <20220802164134.1851910-1-berrange@redhat.com>
 <Yuo/nbb2Gnse0323@redhat.com>
Date: Fri, 05 Aug 2022 09:33:55 +0200
In-Reply-To: <Yuo/nbb2Gnse0323@redhat.com> ("Daniel P. =?utf-8?Q?Berrang?=
 =?utf-8?Q?=C3=A9=22's?= message of
 "Wed, 3 Aug 2022 10:27:57 +0100")
Message-ID: <87k07n2lgc.fsf@oldenburg.str.redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=fweimer@redhat.com;
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

* Daniel P. Berrang=C3=A9:

> CC'ing Florian to get the POV of a glibc maintainer on what we've
> had to do to work around this compatibility brekage.

Meh, that's really not great. 8-(

I'll see if I can add a similar workaround to the glibc headers.
Unfortunately I'm busy with other stuff right now, so it's going to be a
few weeks until I can work on this (probably).

Thanks,
Florian


