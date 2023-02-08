Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7746D68ED5C
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 11:54:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPi4e-0008JE-CS; Wed, 08 Feb 2023 05:53:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pPi4c-0008J3-43
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 05:53:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pPi4a-0002by-C6
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 05:53:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675853587;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zYLeNtFtsRFq4tnktZ7N+WKzsmH2XmH1ZY3h3DNx+BY=;
 b=N0RL5GN06xyZzhsih5jFMfOf7vtTbGP8krs0zftLmKHxEbMrUw1b866BcJ+2KtBatMCdw3
 yF8fc55IPvJuNztaOiqUlNIW8UOF0VRrXFKjVqIvT7w5/cM0Cd2hrerxWaknr/8X7X4N4o
 JH0RE5yj2pbYomZByqUfii+4jNgeMTM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-452-A99GeCBbNgKXz_9nFfu1KA-1; Wed, 08 Feb 2023 05:53:05 -0500
X-MC-Unique: A99GeCBbNgKXz_9nFfu1KA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7FF3B85A588;
 Wed,  8 Feb 2023 10:53:05 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.101])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 57CFC140EBF6;
 Wed,  8 Feb 2023 10:53:05 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 26BAE21E6A1F; Wed,  8 Feb 2023 11:53:04 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org,  peter.maydell@linaro.org
Subject: Re: [PULL 09/35] readline: Extract readline_add_completion_of()
 from monitor
References: <20230203084549.2622302-1-armbru@redhat.com>
 <20230203084549.2622302-10-armbru@redhat.com>
 <7fbb3bfa-8cb3-73ab-bf03-81585f9024e1@linaro.org>
Date: Wed, 08 Feb 2023 11:53:04 +0100
In-Reply-To: <7fbb3bfa-8cb3-73ab-bf03-81585f9024e1@linaro.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Wed, 8 Feb 2023 09:44:45
 +0100")
Message-ID: <875yccl97z.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
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

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> On 3/2/23 09:45, Markus Armbruster wrote:
>> monitor/misc.h has static add_completion_option().  It's useful
>> elsewhere in the monitor.  Since it's not monitor-specific, move it to
>> util/readline.c renamed to readline_add_completion_of(), and put it to
>> use.
>
> 52f50b1e9f8fd410d4293a211d549ec61b902728 is the first bad commit
>
> This commit broke monitor autocomplete feature.
>
> Before:
>
> (qemu) <tab>
> ?                                announce_self
> balloon                          block_job_cancel
> block_job_complete               block_job_pause
> block_job_resume                 block_job_set_speed
> [...]
>
> After:
>
> (qemu) <tab>
> [no autocomplete]

I'll look into it.  Thanks!


