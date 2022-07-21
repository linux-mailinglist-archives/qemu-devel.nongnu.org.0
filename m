Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D22DB57C96D
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jul 2022 12:59:06 +0200 (CEST)
Received: from localhost ([::1]:54720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oETtZ-0000vv-Vn
	for lists+qemu-devel@lfdr.de; Thu, 21 Jul 2022 06:59:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oETsA-0007zk-Fm
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 06:57:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41137)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oETs7-0004YM-Ba
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 06:57:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658401054;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sRaxa/LQqKPJdL/ewH1chTS5hjgggIRju+d+Tqv9zXw=;
 b=Es9ae5clia+z2l58FqSwfLa2QXojkT694JdoeU7/8ipFedt0vMiTbwGTgszVnkDiza2DGY
 MkruixlMlamKlEbTTa1AwypK22Krx60WNPTHNtjX+0O67hiFvGYyY6NHcBFF7deBb9o04V
 T87wO/mdOTX0RRzn7ohc2+vPmvDhbA4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-412-o--eJciKNaGkQKNg82fKZg-1; Thu, 21 Jul 2022 06:57:25 -0400
X-MC-Unique: o--eJciKNaGkQKNg82fKZg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E95EA85A585;
 Thu, 21 Jul 2022 10:57:24 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.194.81])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C0A972026D64;
 Thu, 21 Jul 2022 10:57:24 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 6897221E690D; Thu, 21 Jul 2022 12:57:23 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Cc: Hogan Wang <hogan.wang@huawei.com>,  qemu-devel@nongnu.org,
 marcandre.lureau@redhat.com,  wangxinxin.wang@huawei.com
Subject: Re: [PATCH] dump: introduce dump-cancel QMP command
References: <20220721062118.2015-1-hogan.wang@huawei.com>
 <YtkKwf7K6oev/3CP@redhat.com>
Date: Thu, 21 Jul 2022 12:57:23 +0200
In-Reply-To: <YtkKwf7K6oev/3CP@redhat.com> ("Daniel P. =?utf-8?Q?Berrang?=
 =?utf-8?Q?=C3=A9=22's?= message of
 "Thu, 21 Jul 2022 09:13:53 +0100")
Message-ID: <87v8rqensc.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> On Thu, Jul 21, 2022 at 02:21:18PM +0800, Hogan Wang via wrote:
>> There's no way to cancel the current executing dump process, lead to the
>> virtual machine manager daemon((e.g. libvirtd) cannot restore the dump
>> job after daemon restart.
>>=20
>> Add the 'cancelling' and 'cancelled' dump states.
>>=20
>> Use 'dump-cancel' qmp command Set the dump state as 'cancelling'.
>> The dump process check the 'cancelling' state and break loops.=20
>> The 'cancelled' state mark the dump process cancelled success.
>
> On the one hand this patch is fairly simple which is obviously
> desirable.
>
> On the other hand though, this feels like it is further re-inventing
> the jobs concept.
>
> IMHO ideally the 'dump' command probably ought to get a 'job-id'
> parameter, and integrate with the generic background jobs  framework.
> This would unlock the ability to use existing commands like
> 'job-cancel', 'job-pause', 'job-resume', 'queyr-jobs' to interact
> with it.

Seconded.

Hogan Wang, would you be interested in rebasing the dump feature onto
the jobs infrastructure?


