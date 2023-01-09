Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 712086624A9
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 12:52:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEqgJ-00028W-Il; Mon, 09 Jan 2023 06:51:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pEqgE-000264-C9
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 06:51:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pEqgC-00054S-Ah
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 06:51:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673265062;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YF3QJTQLzUl11/uOraUtmmPZgUkt+/7HM/lBUXXvtRo=;
 b=Y9/XXjTxS39CCuT4YDEA9lZfDYVlQ2Bz1kpsq8jkFyMFsCVk74gCA/njWeMFX8AjJWS5pW
 J8A6+GJyLUV0mQF/KeMtpL+l7Q6sQEYhhd2t0QL/OdzkNhO1MyHkW7GJ6CHI7vHEiuYlb4
 ZwA4k2nJ1jUDq6WGNUqMPFU/Mcf1KQA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-589-PLb0q8dVNxWbX5B8CGEHew-1; Mon, 09 Jan 2023 06:51:01 -0500
X-MC-Unique: PLb0q8dVNxWbX5B8CGEHew-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ECC6A101A521;
 Mon,  9 Jan 2023 11:51:00 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.78])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BF3622166B26;
 Mon,  9 Jan 2023 11:51:00 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 7E97221E675B; Mon,  9 Jan 2023 12:50:59 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: qemu-devel@nongnu.org,  kraxel@redhat.com,  berrange@redhat.com,
 philmd@linaro.org
Subject: Re: [PATCH v3 02/18] ui: Fix silent truncation of numeric keys in
 HMP sendkey
References: <20221220090645.2844881-1-armbru@redhat.com>
 <20221220090645.2844881-3-armbru@redhat.com>
 <Y7Wm94X4gxl738Fd@work-vm>
Date: Mon, 09 Jan 2023 12:50:59 +0100
In-Reply-To: <Y7Wm94X4gxl738Fd@work-vm> (David Alan Gilbert's message of "Wed, 
 4 Jan 2023 16:19:03 +0000")
Message-ID: <87y1qcorj0.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
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

"Dr. David Alan Gilbert" <dgilbert@redhat.com> writes:

> * Markus Armbruster (armbru@redhat.com) wrote:
>> Keys are int.  HMP sendkey assigns them from the value strtoul(),
>> silently truncating values greater than INT_MAX.  Fix to reject them.
>> 
>> While there, use qemu_strtoul() instead of strtoul() so checkpatch.pl
>> won't complain.
>
> Last time through you said you could switch to qemu_strtoui, but

Did I?  Oh, I did in review of

    [PATCH 08/12] pci: Fix silent truncation of pcie_aer_inject_error argument

but failed to do it here, too.

> I just noticed we've actually got a qemu_strto*i* - that
> would remove the value comparison

Thanks!


