Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 899456A5A91
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 15:08:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pX0dJ-0000Tw-Qw; Tue, 28 Feb 2023 09:07:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pX0dH-0000Tf-NV
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 09:07:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pX0dF-0007zO-IF
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 09:07:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677593222;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VpK675oz/S2Ufef+1fjpGUHJskOdY4++ssqC+GdF9Wc=;
 b=hk5SazuObbeh+a/Qvt1lDxSC4sDjIyGWR7F1rX7diNRQXkh8p0eOqvR8LyoZQyPLahxwRD
 UOH3TBglXrTyDND+dgzV1MCt3/6TcPOj/zm7Y2glDJvZxTv7WQG360iOfoK0pp7VrSzsGV
 h8i3KBrhn/EKnBIgFx9VQhKluzWW68I=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-627-3CVkzvjzOKKUJWVLWvoHgw-1; Tue, 28 Feb 2023 09:06:46 -0500
X-MC-Unique: 3CVkzvjzOKKUJWVLWvoHgw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EC7F11C06902;
 Tue, 28 Feb 2023 14:06:31 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.92])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A8A4B43FBA;
 Tue, 28 Feb 2023 14:06:31 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 9978021E6A1F; Tue, 28 Feb 2023 15:06:30 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>,  zhenwei pi
 <pizhenwei@bytedance.com>,  arei.gonglei@huawei.com,  dgilbert@redhat.com,
 pbonzini@redhat.com,  qemu-devel@nongnu.org
Subject: Re: [PATCH v4 11/12] cryptodev: Support query-stats QMP command
References: <20230129025747.682282-1-pizhenwei@bytedance.com>
 <20230129025747.682282-12-pizhenwei@bytedance.com>
 <20230228075511-mutt-send-email-mst@kernel.org>
 <Y/3/AJqXD4aDdtrP@redhat.com>
Date: Tue, 28 Feb 2023 15:06:30 +0100
In-Reply-To: <Y/3/AJqXD4aDdtrP@redhat.com> ("Daniel P. =?utf-8?Q?Berrang?=
 =?utf-8?Q?=C3=A9=22's?= message of
 "Tue, 28 Feb 2023 13:17:52 +0000")
Message-ID: <87v8jlg9zt.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> On Tue, Feb 28, 2023 at 07:56:14AM -0500, Michael S. Tsirkin wrote:
>> I assume since this has been out a long time and no
>> comments by maintainers it's ok from QAPI POV.
>
> I'm not the QAPI maintainer, but I think this worked out
> pretty nicely compared to the previous versions of the
> series which didn't use query-stats.. just a minor point
> below.

I'm sorry, but I can't keep up with the amount of patches touching the
QAPI schema.  Happy to rely on Daniel's judgement!

[...]


