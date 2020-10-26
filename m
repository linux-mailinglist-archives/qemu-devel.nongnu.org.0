Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34CC72999C7
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Oct 2020 23:38:54 +0100 (CET)
Received: from localhost ([::1]:60180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kXB8f-0007Zg-8E
	for lists+qemu-devel@lfdr.de; Mon, 26 Oct 2020 18:38:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kXB5r-0004y6-Kx
 for qemu-devel@nongnu.org; Mon, 26 Oct 2020 18:35:59 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:40302)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kXB5p-0001Pv-2R
 for qemu-devel@nongnu.org; Mon, 26 Oct 2020 18:35:58 -0400
Received: by mail-ej1-x631.google.com with SMTP id z5so16204864ejw.7
 for <qemu-devel@nongnu.org>; Mon, 26 Oct 2020 15:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=9nO3FcwNBPpvstUhOZbMuUrgwTS31PjM2Wek0c0Ku8k=;
 b=HVsXjO/60pR9Qq8ex3CIuAZ8Dlhj/wcpjwZy0uV8TU9ACUdAYGs8ij7+juzXKkyyJj
 59c1yC+yjwRyUNwXtah/rIh/GZSA0W2bdpr0h59+RhJPV4K+iNLoTVsJ421Irr/jc7OS
 6PeYvvsurC9okWFYNS2Zcv7iQfE6+5GoUJXZ9XdqRZJQlBRZ1ERCEItiJ5KTV9KnS5Vy
 W5V3NJ4wEHb+7z1yRulJOmbVzrfcpDvXBifTQ8/ibvnzvkjyi7sYxUpm0EB+UgvNLK/k
 hxa52p6c8ALht7OJML4UAHGsLVpiZTs6vEHoeedwEtzLlWmOtTzfIjdGo7Hr+uc7zaB+
 4Rkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=9nO3FcwNBPpvstUhOZbMuUrgwTS31PjM2Wek0c0Ku8k=;
 b=OKzHDV0p79BH/Q6w9h8jLwyzgrdmyWufsKI/9ZBhRwnWGpEeNo2MLXHJ6MeCSFCn2a
 r8foB9JkAZVetQP/tkYFjDhH6v1Jq56oXBYvWZGpbEQgPi5NLVBK0SJc9pPEtZ6F1X2u
 Mos6wgSGIuH9x9Dw4YKSp47AjfdTAtjnNGGLEGInVF1DbKTINWLNK0TT+O9aedk5Z7vh
 J68oOkfnUYPQKHFrKdZnjrqpMQdu2jwy+Z3i0yuWHS8kI9LmXGrl8DrVc8SPx1GoxdbW
 IrNrJuWrPz+Jkoxfhz7lFfhYB4Rn7dyi68ffEOiAD6zdKz49DCeNSbhUl9esBV4NFO8L
 oC3w==
X-Gm-Message-State: AOAM533b2d1D9D47IUu+pjxuHU29VhsLEe9AmtclYDxdmDaHNcSkIU+C
 ouVQsIX7vCt1zUpB3YkREnR8IovaQLP8P08Y2wPbrjgrjb4ZVg==
X-Google-Smtp-Source: ABdhPJy1LNTF68BOh8gX9jVGkdxcvfMor3w5RtZMfB2C+t2caIFUVTnKUcoYJNKX20F4W//a09Vdjqvo6Q5PG/MNY7A=
X-Received: by 2002:a17:906:af8d:: with SMTP id
 mj13mr17514806ejb.85.1603751753625; 
 Mon, 26 Oct 2020 15:35:53 -0700 (PDT)
MIME-Version: 1.0
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 26 Oct 2020 22:35:42 +0000
Message-ID: <CAFEAcA8z=vQ9E6hNKUuzk2EgH8Dpkxo=3YbnQ5iX0DYCQDr6bg@mail.gmail.com>
Subject: runaway avocado
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x631.google.com
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
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

So, I somehow ended up with this process still running on my
local machine after a (probably failed) 'make check-acceptance':

petmay01 13710 99.7  3.7 2313448 1235780 pts/16 Sl  16:10 378:00
./qemu-system-aarch64 -display none -vga none -chardev
socket,id=mon,path=/var/tmp/tmp5szft2yi/qemu-13290-monitor.sock -mon
chardev=mon,mode=control -machine virt -chardev
socket,id=console,path=/var/tmp/tmp5szft2yi/qemu-13290-console.sock,server,nowait
-serial chardev:console -icount
shift=7,rr=record,rrfile=/var/tmp/avocado_iv8dehpo/avocado_job_w9efukj5/32-tests_acceptance_reverse_debugging.py_ReverseDebugging_AArch64.test_aarch64_virt/replay.bin,rrsnapshot=init
-net none -drive
file=/var/tmp/avocado_iv8dehpo/avocado_job_w9efukj5/32-tests_acceptance_reverse_debugging.py_ReverseDebugging_AArch64.test_aarch64_virt/disk.qcow2,if=none
-kernel /home/petmay01/avocado/data/cache/by_location/a00ac4ae676ef0322126abd2f7d38f50cc9cbc95/vmlinuz
-cpu cortex-a53

and it was continuing to log to a deleted file
/var/tmp/avocado_iv8dehpo/avocado_job_w9efukj5/32-tests_acceptance_reverse_debugging.py_ReverseDebugging_AArch64.test_aarch64_virt/replay.bin

which was steadily eating my disk space and got up to nearly 100GB
in used disk (invisible to du, of course, since it was an unlinked
file) before I finally figured out what was going on and killed it
about six hours later...

Any suggestions for how we might improve the robustness of the
relevant test ?

thanks
-- PMM

