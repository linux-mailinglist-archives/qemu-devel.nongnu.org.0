Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86DE169DAAF
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 07:43:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUMMd-0002xB-8x; Tue, 21 Feb 2023 01:42:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pUMMb-0002wv-5P
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 01:42:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pUMMZ-0006Ba-Fy
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 01:42:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676961773;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mSvQUxZSoeaqqkJRX/SKyzrQibgaxyHABYxWMeAI7NM=;
 b=BZSBL3cEOIvjPkgnYDJmQrNRIBt51gmdSrJv+CMeLpQoUm6Wae4XzeCtWx6AMuis+MTgVQ
 IOLFXBYBcqSE2y6+6XuG8nKfxPblLSInmr4D/u0JLFxxHm1CC/fQjPk35+OrCAbQTAq8iR
 /B6ovTinLZJ6LE2+obuOYrQC0rP6L64=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-237-As7g5shtMDOOzyJ3dr6J-g-1; Tue, 21 Feb 2023 01:42:49 -0500
X-MC-Unique: As7g5shtMDOOzyJ3dr6J-g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 28AB62A59572;
 Tue, 21 Feb 2023 06:42:49 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 03025440D9;
 Tue, 21 Feb 2023 06:42:49 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id DE28621E6A1F; Tue, 21 Feb 2023 07:42:47 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Cc: qemu-devel@nongnu.org,  Michael Roth <michael.roth@amd.com>
Subject: Re: [PATCH v4 0/6] qapi: static typing conversion, pt5c
References: <20230215000011.1725012-1-jsnow@redhat.com>
 <878rgz82v9.fsf@pond.sub.org>
 <CAFn=p-ZAnqRr7SYVO8n_DaFDUavFykNYwaQy4fCWubTx686kJg@mail.gmail.com>
Date: Tue, 21 Feb 2023 07:42:47 +0100
In-Reply-To: <CAFn=p-ZAnqRr7SYVO8n_DaFDUavFykNYwaQy4fCWubTx686kJg@mail.gmail.com>
 (John Snow's message of "Mon, 20 Feb 2023 20:26:21 -0500")
Message-ID: <87sfezzfh4.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
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

John Snow <jsnow@redhat.com> writes:

> On Wed, Feb 15, 2023 at 8:39 AM Markus Armbruster <armbru@redhat.com> wrote:
>>
>> I had a few suggestions, but none of them requires a respin.  Let's
>> discuss them, and then I merge.
>
> Hiya, I lost track of things a little due to the other Python
> discussion. Who is waiting for whom?

Just two questions remain:

* PATCH 3: Dumb down check_keys() argument all the way to List[str]?

* PATCH 4: Suggested commit message addition okay?

We settle them, and then I'll take it from there.


