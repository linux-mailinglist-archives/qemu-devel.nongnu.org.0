Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BDE763A767
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Nov 2022 12:52:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozcgF-0001pB-JU; Mon, 28 Nov 2022 06:52:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ozcgD-0001os-Kl
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 06:52:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ozcgC-0003Gb-7b
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 06:52:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669636327;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tKCkm2+74gkSKCpWBjwSEHiT4HWAHowkypFjL8SGvCg=;
 b=iTD3333KxC9WWrYt7tmB/W8Kl1F7CC3N2rAFq24G1NzgteRZCatVuDF40f42QAx1QWIg5K
 rU8/5Tw7RYLUhQog5mDcJRyOTuNM18Z+kNFY261w6AySU8/aaw2G/P5zHLq0G3xy5t+FI+
 KFkxlDdUKHgsBnEIBHUU1S2b/N9V/nA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-503-Ek_s7K0QOUesd1XdtHDokA-1; Mon, 28 Nov 2022 06:52:04 -0500
X-MC-Unique: Ek_s7K0QOUesd1XdtHDokA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9F7691C05ACA;
 Mon, 28 Nov 2022 11:52:03 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7149B1415100;
 Mon, 28 Nov 2022 11:52:03 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 5F78521E6921; Mon, 28 Nov 2022 12:52:00 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org,  marcel.apfelbaum@gmail.com,  dgilbert@redhat.com
Subject: Re: [PATCH 00/12] pci: Move and clean up monitor command code
References: <20221128080202.2570543-1-armbru@redhat.com>
 <20221128042502-mutt-send-email-mst@kernel.org>
Date: Mon, 28 Nov 2022 12:52:00 +0100
In-Reply-To: <20221128042502-mutt-send-email-mst@kernel.org> (Michael
 S. Tsirkin's message of "Mon, 28 Nov 2022 04:25:18 -0500")
Message-ID: <87lenvthy7.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

"Michael S. Tsirkin" <mst@redhat.com> writes:

> On Mon, Nov 28, 2022 at 09:01:50AM +0100, Markus Armbruster wrote:
>> This is mainly about splitting off monitor-related code.  There's also
>> a few UI fixes to HMP command pcie_aer_inject_error.  One UI issue
>> remains: when the second argument is symbolic (found in table
>> pcie_aer_error_list[]), then any -c is silently ignored.  Should it be
>> rejected?  Should it override the value from the table?
>
> Rejected I'd say.

If this is consensus, I'll cook up a patch.

Thanks!


