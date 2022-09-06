Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACDF05ADEDC
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 07:21:02 +0200 (CEST)
Received: from localhost ([::1]:41122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVR1B-0002e2-7n
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 01:21:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oVQxn-0000eW-Tx
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 01:17:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47502)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oVQxk-0006um-FS
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 01:17:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662441446;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=j6qI7TLJ4ATiwVN904lQ5zQLRlfSXuhf8hAMTM7yLTI=;
 b=DxDzxeNX7HdRcaeiaiQ7ZdaIKfLWCck1lribVYjfnVp/CWmXiLr/tU6QiqhZ89r9k6jmFs
 ui6YSWEMEBDIxM7uXR/SmHRTiLmBvCNXL5ESNG1t9pT2s0Olc/yPwchuBxnKMGs1ZjmQzf
 3qkatTnIAyeEXCzR6eC4BiZnYcEptvc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-142-009LI9wCNMCLMz-UFSgPDA-1; Tue, 06 Sep 2022 01:17:25 -0400
X-MC-Unique: 009LI9wCNMCLMz-UFSgPDA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7470C85A58D
 for <qemu-devel@nongnu.org>; Tue,  6 Sep 2022 05:17:25 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.166])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4EEF2492C3B;
 Tue,  6 Sep 2022 05:17:25 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 10C7B21E6900; Tue,  6 Sep 2022 07:17:24 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org,  armbru@redhat.com
Subject: Re: [PATCH] tests: unit: simplify test-visitor-serialization list
 tests
References: <20220905110013.31308-1-pbonzini@redhat.com>
Date: Tue, 06 Sep 2022 07:17:24 +0200
In-Reply-To: <20220905110013.31308-1-pbonzini@redhat.com> (Paolo Bonzini's
 message of "Mon, 5 Sep 2022 13:00:13 +0200")
Message-ID: <87leqx6pzv.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

Paolo Bonzini <pbonzini@redhat.com> writes:

> test-visitor-serialization list tests is using an "if" to pick either the first
> element of the list or the next one.  This was done presumably to mimic the
> code that creates the list, which has to fill in either the head pointer
> or the next pointer of the last element.  However, the code in the insert
> phase is a pretty standard singly-linked list insertion, while the one
> in the visit phase looks weird and even looks at the first item twice:
> this is confusing because the test puts in 32 items and finishes with
> an assertion that i == 33.
>
> So, move the "else" step in a separate switch statement, and change
> the do...while loop to a while, because cur_head has already been
> initialized beforehand.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Still a rather smelly bowl of copy-pasta, but this is incremental
improvement, so:
Reviewed-by: Markus Armbruster <armbru@redhat.com>


