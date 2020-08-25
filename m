Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFD8625231D
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Aug 2020 23:50:49 +0200 (CEST)
Received: from localhost ([::1]:45042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kAgq9-00065t-0n
	for lists+qemu-devel@lfdr.de; Tue, 25 Aug 2020 17:50:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kAgol-0004yH-CB
 for qemu-devel@nongnu.org; Tue, 25 Aug 2020 17:49:23 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:35470)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kAgoj-0007kc-IF
 for qemu-devel@nongnu.org; Tue, 25 Aug 2020 17:49:22 -0400
Received: by mail-ej1-x62f.google.com with SMTP id a26so112739ejc.2
 for <qemu-devel@nongnu.org>; Tue, 25 Aug 2020 14:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=2VAjiLHBglPzWdiCUkz0klBcv54Rvek+r+LYPAkM/4I=;
 b=Stq/50qmzhXjhh7aMNF/85jsEFsTMeV00K7UgCDv8eCATYpwln8wGrMBdCbSA8CKXc
 r+RxWd7DISS3owqrRhqXsueB1qRDk7MmUu3RYohi1uyJidbOttPM3QFz9RSSBJ8rHf//
 EkIFDjHF5fmlriI7mqT0Vg+YDztW0BZu6hI2xo9MjER2UcvBtZH7EIXs02otci41Ef0k
 IJOyW6mXBKiW6yLBEJLcmk50IL6eK8IQ/Ke61EjjgjYAjZwHdBexbYTrumpkq1Wf3fXZ
 cKb22NE1F/CrIln3mxsucIrQ1BH+h5kPWS6Nw3Aas8uHPJhZ8jvZs1eTniedKnfl4nxC
 m1MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=2VAjiLHBglPzWdiCUkz0klBcv54Rvek+r+LYPAkM/4I=;
 b=FzZO5zxOEC/5DacbAH81Vb/84r9IRcr0aCbSLA9WUY4gJUeFgzkIM5cRabwxMtu5ax
 LOBzXuMqFCrVUJkXJDvG0bqRUiK0O/Qg//DwEMtezBF/MzuDRnio7S3odBCVKVhbmzls
 qP4n3w9A2Wr+9Zfy7pVeLxMZFuL/WZVOrwMJE0tBSFfCnCGH5AcHPwtCVLYFqHwarO0i
 mpC0gccIVF9unlTpehNBjPTMCAlvyCrWZKneg5vGeBXvN+0YCqeTVgYkNOLUd6rVVAE8
 2e73RV0Qui28DeU/K1vMjxDVQGqbS45HUkTivqcqO0otc9l9LxneqRIxWpxmCYyV7Mvg
 uf8w==
X-Gm-Message-State: AOAM531pUfbeBD72zGWgRuVOJ5AJ9HtiUIr9fRprwiaBESA2OWIFPeNo
 NdTv/BSSL9YgbNCBTh68rwDGrfQAYtDnoLBrSkhOO/u8ahgrJD34
X-Google-Smtp-Source: ABdhPJyF0PgARQleve+DvDpIihm16J+3WZGwpLtHzWDoW0mgC+g2qtpnQDbWeQ8t38Qa9Eeu3GT1Ak66E18neBIcW8o=
X-Received: by 2002:a17:906:f28b:: with SMTP id
 gu11mr12277603ejb.407.1598392159726; 
 Tue, 25 Aug 2020 14:49:19 -0700 (PDT)
MIME-Version: 1.0
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 25 Aug 2020 22:49:08 +0100
Message-ID: <CAFEAcA9Z6V4ZkUfnpu-YY9AqU=YUK1Tb8cF-+4_CSPbGLbVHtQ@mail.gmail.com>
Subject: better file/line info for format string errors in trace events
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62f.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If you have a format string error in a trace event it fails
like this:

In file included from ../../hw/block/trace.h:1:0,
                 from ../../hw/block/fdc.c:48:
./trace/trace-hw_block.h: In function '_nocheck__trace_pci_nvme_err_mdts':
./trace/trace-hw_block.h:2162:18: error: format '%llu' expects
argument of type 'long long unsigned int', but argument 6 has type
'size_t {aka unsigned int}' [-Werror=format=]
         qemu_log("%d@%zu.%06zu:pci_nvme_err_mdts " "cid %"PRIu16" len
%"PRIu64"" "\n",
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from /home/peter.maydell/qemu/include/qemu/osdep.h:89:0,
                 from ../../hw/block/fdc.c:30:
/usr/include/inttypes.h:105:34: note: format string is defined here
 # define PRIu64  __PRI64_PREFIX "u"


which doesn't anywhere give the filename where the format
string is actually defined (hw/block/trace-events in this case),
let alone the line number in that file of the trace event.

Bit of a long shot, but I don't suppose it's possible for the
tracing subsystem to give more targeted error messages in this
situation ?

thanks
-- PMM

