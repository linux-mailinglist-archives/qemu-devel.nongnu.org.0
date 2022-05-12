Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EBDF524A80
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 12:41:30 +0200 (CEST)
Received: from localhost ([::1]:47020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1np6G9-0001vk-Oa
	for lists+qemu-devel@lfdr.de; Thu, 12 May 2022 06:41:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1np63S-0000T9-9T
 for qemu-devel@nongnu.org; Thu, 12 May 2022 06:28:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44880)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1np63O-0000fz-Mc
 for qemu-devel@nongnu.org; Thu, 12 May 2022 06:28:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652351298;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Jv3DAYYrKmKnjyDMIkvNQBXFzzDnFl+Z1H3fJhHmndU=;
 b=eYD0nNUFpqQO6aiJHKfHm7oMdEq3mz1w3juRIQ0xnxFKmssIgJoupxcBIvNb4M4LrrGATK
 j32GU+dQGL2epEkYD35ns6x6jApyxA2nEc5Sd90d6+K2BUzTFXivj79Bn8nW66jNVDu7qa
 DLEaTPECh/ugH8mCh3bgwCLhcc2x45U=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-581-tPoz8MnEOhCLwBwjAWofqg-1; Thu, 12 May 2022 06:28:14 -0400
X-MC-Unique: tPoz8MnEOhCLwBwjAWofqg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7ED53294EDC0;
 Thu, 12 May 2022 10:28:14 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.111])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0FB4B4010A13;
 Thu, 12 May 2022 10:28:12 +0000 (UTC)
Date: Thu, 12 May 2022 12:28:11 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Beraldo Leal <bleal@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH 0/2] ci: improve debuggability of I/O tests
Message-ID: <YnzhO1kLDjtYrrZ6@redhat.com>
References: <20220509124134.867431-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220509124134.867431-1-berrange@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
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

Am 09.05.2022 um 14:41 hat Daniel P. Berrangé geschrieben:
> Currently with the TAP harness we see essentially no useful information
> about the I/O tests execution. To pick a random job:
> 
>   https://gitlab.com/qemu-project/qemu/-/jobs/2429330423
> 
> All that we get is this:
> 
>   184/204 qemu:block / qemu-iotests qcow2  OK  309.10s   116 subtests passed
> 
> The full details are in a testlog.txt file that isn't accessible. This
> series publishes that as an artifact. It further tweaks the TAP runner
> to print out when it is about to run a test, so we get a record of what
> was running, if the test harness gets terminated abnormally/prematurely

Thanks, applied to the block branch.

Kevin


