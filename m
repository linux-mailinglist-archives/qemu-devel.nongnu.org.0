Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBDB26BE9F0
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Mar 2023 14:19:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pd9yg-0007Hn-Qj; Fri, 17 Mar 2023 09:18:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abhishek@drut.io>) id 1pd9tZ-0006XM-My
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 09:13:21 -0400
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <abhishek@drut.io>) id 1pd9tX-0001q3-EA
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 09:13:21 -0400
Received: by mail-qk1-x72b.google.com with SMTP id 24so1688961qka.11
 for <qemu-devel@nongnu.org>; Fri, 17 Mar 2023 06:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=drut-io.20210112.gappssmtp.com; s=20210112; t=1679058798;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=PDbfr/QAhA0Hqe3m2Zq4snKHSzB0kg4IKsUnWvepz0s=;
 b=wvSfu3osZtXaOyduA35I8iksif3OU/R0YlNMdxMwpZN92nzCOndssUW7vmzJbmI9vC
 iDCXt9SQui269PI6QmKXy3Q42vmJp+Q8BcClqnmdLHSntzRjYBp9Lzdm15fMHnJmn2ij
 AMKBlz/nbPHwZPVDFS6qNrNQ9qY3OLvdsTRroN1lqy+JEZgh1wwUUPbgRdAyXbDEp0W5
 u3AcVXomfQK1uVm/gYcOUTsSXP8zkttMioUHB8gF+3rHSCAiEjkM3mJCTIPADDLQFqvp
 2k4jzZHqKE/k7eJ1X6NfvzL4QmQiOKJFT5u3Ph0Y+FGg1PouVri2uKwF/4sdO9bzI5Q6
 w32A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679058798;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PDbfr/QAhA0Hqe3m2Zq4snKHSzB0kg4IKsUnWvepz0s=;
 b=xNL4mfsJF1w/RaMn8XOszJ20FbbhpCKjPhmnB71wdZLi4Afdxp+5heMKEz/1xFuQPb
 xX7jT8kqfugqGYxBK3JXjJ84e1gR3MjlNda/o+aZ4dbVWuwAwzCWOijyhgeYa7wJOnyV
 EvS7oeS4iN55XswhazY50wwdN0YOYO36QJbHRpBakIq65sa1/gMbo71RsaN0ST4L4ONh
 6tybWEMyRgUI5mhaXclSgG33//gIuuxgPbNUOGthct9NCr01Sx88rnCXvKHdaeBpW2oV
 C1FbIm4QjA5okU2sO3xg1s9qdH2qizmweW5jPUZGDuQl47zMi1+jwRePRo+rd++ZUgtS
 A5uA==
X-Gm-Message-State: AO0yUKWBsAMcPX31fBf4AfBjeQTy7DtfR6MO+U1oc8yvkQsHJ7tF03Fv
 Om9eGUu+gJ0FgWw0MqhHjNwDR9qPL8i+9o6b/2Iu3yQjkpdYJu5kw7u+5Q==
X-Google-Smtp-Source: AK7set+LY1yqDIQ9LaJiizkAbaUCo1EmOVwoH84O6snphiWSiAsUafYig4HZHqHqfhMCUjplfmZTjR3WLS2UNVGoRl8=
X-Received: by 2002:a05:620a:211b:b0:745:72b3:304f with SMTP id
 l27-20020a05620a211b00b0074572b3304fmr5151488qkl.5.1679058797970; Fri, 17 Mar
 2023 06:13:17 -0700 (PDT)
MIME-Version: 1.0
From: Abhishek Singh Dagur <abhishek@drut.io>
Date: Fri, 17 Mar 2023 18:43:06 +0530
Message-ID: <CAJ1un7j0FNpYaaviQxoKQN4O+C8RejqA918CdBamPySKyAEJUQ@mail.gmail.com>
Subject: Using QEMU how to redirect serial /dev/ttyS2 output of guest machine
 to host machine.
To: openbmc@lists.ozlabs.org
Cc: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="00000000000035daa405f718572f"
Received-SPF: pass client-ip=2607:f8b0:4864:20::72b;
 envelope-from=abhishek@drut.io; helo=mail-qk1-x72b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 17 Mar 2023 09:18:36 -0400
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

--00000000000035daa405f718572f
Content-Type: text/plain; charset="UTF-8"

Hi all,

We are using obmc-phosphor-image on an ast2500 board which is trying to
communicate with other devices over serial port /dev/ttyS2.
As we are trying to emulate the machine on qemu we need to redirect the
request to the host machine so that it can handle this request and return
appropriately.
We tried using QEMU options like -serial ,-chardev but still not the
concrete way we get to do it.

It will be very helpful if you can provide us some guidance on this.

Thank you,
Abhishek

--00000000000035daa405f718572f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi all,<div><br></div><div>We are using=C2=A0obmc-phosphor=
-image on an ast2500 board which is trying to communicate=C2=A0with other d=
evices over serial port /dev/ttyS2.</div><div>As we are trying to emulate t=
he machine on qemu we need to redirect the request to the host machine so t=
hat it can handle this request and return appropriately.</div><div>We tried=
 using QEMU options like -serial ,-chardev but still not the concrete way w=
e get to do it.</div><div><br></div><div>It will be very=C2=A0helpful=C2=A0=
if you can provide us some guidance on this.</div><div><br></div><div>Thank=
 you,</div><div>Abhishek</div></div>

--00000000000035daa405f718572f--

