Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B954358D3A2
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Aug 2022 08:19:45 +0200 (CEST)
Received: from localhost ([::1]:54100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLIae-00047m-9q
	for lists+qemu-devel@lfdr.de; Tue, 09 Aug 2022 02:19:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oLIWa-0002Mz-7m
 for qemu-devel@nongnu.org; Tue, 09 Aug 2022 02:15:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51474)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oLIWW-00058y-Lz
 for qemu-devel@nongnu.org; Tue, 09 Aug 2022 02:15:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660025726;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=orPDrzkHdW/2Vr1UEhJzL3W5+i92eDNjEkFHqQNi45o=;
 b=NUqnfDmiaOfEDCQxHSJdqBNKlT7lrdPH40aJYGLCBxDU7dHapC+jYQ3UTXOE4BBfFfxfAG
 bCL1m9qBisXeMq9E0PlIARN/mrIgqcss2nOJazJ/o6SsSeW19FANQ7sEkjOpaWyP/rvNvx
 /dpvYGdlirbJ27d7jKfwz8ieGCUFrQQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-395-5pavtEAQPSunczc636ASxA-1; Tue, 09 Aug 2022 02:15:22 -0400
X-MC-Unique: 5pavtEAQPSunczc636ASxA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 581BF380450D;
 Tue,  9 Aug 2022 06:15:22 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.194.81])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2D3242166B26;
 Tue,  9 Aug 2022 06:15:22 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 0866D21E675E; Tue,  9 Aug 2022 08:15:21 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,  QEMU Developers
 <qemu-devel@nongnu.org>,  Alex =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>,  "Daniel
 P. Berrange" <berrange@redhat.com>,  Richard Henderson
 <richard.henderson@linaro.org>
Subject: Re: how long do we need to retain gitlab CI job stdout logs?
References: <CAFEAcA_Y=ugD=Oh=fJhi=9GE73zpWnp0YC9dOoJazHg1PgXu=w@mail.gmail.com>
 <536c6605-fd29-dbca-8633-944656e6dc8e@redhat.com>
Date: Tue, 09 Aug 2022 08:15:21 +0200
In-Reply-To: <536c6605-fd29-dbca-8633-944656e6dc8e@redhat.com> (Thomas Huth's
 message of "Mon, 8 Aug 2022 20:42:28 +0200")
Message-ID: <87leryj62u.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
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

> On 08/08/2022 19.47, Peter Maydell wrote:
>> Hi; I just reduced QEMU's storage usage on gitlab by 130GB (no typo!)
>> using https://gitlab.com/eskultety/gitlab_cleaner, which Dan helpfully
>> pointed me at. This script removes old pipelines, which take up a
>> lot of storage space for QEMU because they include the stdout logs
>> for all the CI jobs in the pipeline. (Gitlab doesn't expire these,
>> either by default or configurably -- you have to either manually delete
>> the pipeline in the UI or else use the API, as this script does.)
>> I somewhat conservatively only blew away pipelines from before the
>> 1st January 2022. I feel like we don't really even need 6 months worth
>> of CI job logs, though -- any views on whether we should be pruning
>> them more aggressively ?
>
> I'd say we should at least keep the logs of the last 4 to 5 months, i.e. the logs for one release cycle, so we can check these logs in case we introduced 
> a new bug in the current release cycle.

If this takes too much space, consider keeping every n-th log after a
month.


