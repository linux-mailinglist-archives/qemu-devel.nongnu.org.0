Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B52C6DD647
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Apr 2023 11:09:34 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pm9zg-0007aA-Kj; Tue, 11 Apr 2023 05:08:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew.jones@linux.dev>)
 id 1pm9ze-0007Zo-BM
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 05:08:50 -0400
Received: from out-63.mta0.migadu.com ([91.218.175.63])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew.jones@linux.dev>)
 id 1pm9zb-0006bu-Vh
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 05:08:49 -0400
Date: Tue, 11 Apr 2023 11:08:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1681204125;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I2iC8buvK2tS8ozL9BHGlo/Sy4UT6qIVUL5c6wk4p6g=;
 b=jDlTpk0mHI9HGFG/mMYsZ8feUXZFsTYrXMBV5wrpq5gBMwvb/D9qBQrkCPFRqNvyAJEb4W
 P4y8LBz10RyPFh4MBpBmxUQknrrQybLiS/mbE8byvPCvvIGCxYHg6xrzoKogdNXTySydbl
 /Ezp9qgwjnJyILNj90gjOzfVQUX4280=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: kvmarm@lists.cs.columbia.edu, kvm@vger.kernel.org, 
 qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, kvmarm@lists.linux.dev,
 qemu-arm@nongnu.org
Subject: Re: [kvm-unit-tests PATCH v10 0/7] MTTCG sanity tests for ARM
Message-ID: <hlno75xnob6jwbpfzwbwsjje2ujgfzw5kwvwmu2627obkmpqk2@dtcvgno2dkge>
References: <20230307112845.452053-1-alex.bennee@linaro.org>
 <20230321152649.zae7edlfub76fyqq@orel> <87mt3erhe3.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87mt3erhe3.fsf@linaro.org>
X-Migadu-Flow: FLOW_OUT
Received-SPF: pass client-ip=91.218.175.63;
 envelope-from=andrew.jones@linux.dev; helo=out-63.mta0.migadu.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Tue, Apr 11, 2023 at 08:43:49AM +0100, Alex Bennée wrote:
> 
> Andrew Jones <andrew.jones@linux.dev> writes:
...
> > Someday mkstandalone could maybe learn how to build
> > a directory hierarchy using the group names, e.g.
> >
> >  tests/mttcg/tlb/all_other
> 
> So nodefault isn't enough for this?
>

nodefault is enough to avoid running a test with run_tests.sh,
when its group hasn't been explicitly selected, i.e.

 ./run_tests.sh

doesn't run the test

 ./run_tests.sh -g test-group-name

does run the test.

standalone test filtering is only done by filename (but
potentially pathname), which is why I suggested we someday use
the group names as directory names. Anyway, that's future work.
This series just needs to ensure it gets its group names right.

Thanks,
drew

