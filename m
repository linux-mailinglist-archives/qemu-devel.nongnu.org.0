Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 240FB6A9F12
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 19:38:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYAHB-0006Ov-Ps; Fri, 03 Mar 2023 13:37:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pYAHA-0006Mb-2E
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 13:37:04 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pYAH8-0005g8-5c
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 13:37:03 -0500
Received: by mail-pj1-x102d.google.com with SMTP id
 m8-20020a17090a4d8800b002377bced051so7131006pjh.0
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 10:37:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677868620;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=7Sp5fyF/sNppBD4bJDKDkyRkZgtDUC2KlzHR9ANAcwU=;
 b=PM714Do2ZEgaCkVhzIXj0Qd+DCtAvDhZ/zkE5VMG7NTiVnX2yJq8Tlc9zYqeOJUFDb
 awQkOAyTQD4eR5Xlwo7PonwBbb5EOFT4b9hcKcyMD08XD0jxuznp1oMJyPmMO//Dr7SO
 7QnhNNTEt+3+1mzPKRerECHmOfWc4U2tkZRmsHvLyM5iNiY/b/XkAEDrTbPM+FFRp6M8
 ohzc+cSQpKzMTWnxVEr2VAvLrFUd3dZKEdpFhvK7svcm+PDUQEdvm8oK1MAC7859xP5O
 D5mPDD3ZeEVznVJkrXzC1jrq182GQ+EeAkJ4LWLZxuvxkV0i3o/wsVNczZpOwBpzpnF7
 byow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677868620;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7Sp5fyF/sNppBD4bJDKDkyRkZgtDUC2KlzHR9ANAcwU=;
 b=N9CJcxqhw+2UMXNF42ajxgRva9mP+AvBdXgzRpTfrXgov+x3mq2ZYucq1NabcQxZJK
 Y1HxdOE+vBkL4mBwRR9sPg2o2ZMR1VAqhzvel76yihCKJYj2mj0e10tz2dZa+4QJV12K
 2fvWVygvnx16QXMgfqoy/ghcU8t7kChdsgOCO0nCeF9JgaADTYc4t8VwykV92y2Z/TWO
 TBfUPknE3ToNY5L10LWckBtgBMTZN/72zuSw1AwBvJAjpO0XQKG6MIiBn0gfBG8dx14u
 fOWTmm3+jtdv1shrkp0WSkqYDeAVjN3X36yFgMlcC1L/djYDJ9cNBQYCFd7AELyTM37+
 ByZA==
X-Gm-Message-State: AO0yUKXYo13rAKKICAeC7aOX969QJp5Kw8S08BdRSrZk9oUs7ETi/Qdj
 2Yagbw1k73i3a0X3ZY7rmPdk+423xE1RrriFW10YsNeMYGJCjWIq
X-Google-Smtp-Source: AK7set8Cp1dfC6mPcNPBnlvWoCvcBOAPisZUxnvZiv8ccu96BJuGaCZZ8jhcnrwcLksopebSmNmH7pgovBRCOuzkRm4=
X-Received: by 2002:a17:90b:46d2:b0:237:ae7c:1595 with SMTP id
 jx18-20020a17090b46d200b00237ae7c1595mr987977pjb.2.1677868620595; Fri, 03 Mar
 2023 10:37:00 -0800 (PST)
MIME-Version: 1.0
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Mar 2023 18:36:49 +0000
Message-ID: <CAFEAcA_SeUuZRo7HQPUJgeaepoup29YdAuFaWjNL+fhEt+pmkA@mail.gmail.com>
Subject: test-blockjob: intermittent CI failures in msys2-64bit job
To: QEMU Developers <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

I've noticed that test-blockjob seems to fail intermittently
on the msys2-64bit job:

https://gitlab.com/qemu-project/qemu/-/jobs/3872508803
https://gitlab.com/qemu-project/qemu/-/jobs/3871061024
https://gitlab.com/qemu-project/qemu/-/jobs/3865312440

Sample output:
| 53/89 ERROR:../tests/unit/test-blockjob.c:499:test_complete_in_standby:
assertion failed: (job->status == JOB_STATUS_STANDBY) ERROR
53/89 qemu:unit / test-blockjob ERROR 0.08s exit status 3

I haven't looked at whether these jobs all failed on the
same subtest or whether there is better info lurking in
some log file in the pipeline's artefacts.

thanks
-- PMM

