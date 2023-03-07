Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32B926ADA67
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 10:32:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZTeZ-0002kJ-IH; Tue, 07 Mar 2023 04:30:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pZTeX-0002kA-8t
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 04:30:37 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pZTeV-0003Yk-Jh
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 04:30:37 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 o11-20020a05600c4fcb00b003eb33ea29a8so6775298wmq.1
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 01:30:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678181433;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qLoa/Z/uttDfOi+iQiTqHUojT9WuPICTK5WFThT4Tr0=;
 b=i3vQIqgCwAqW3MRT2ACd4+txj9P4W1FjFg2VhkKoyNyaKrXp4P7ZpexIMu6GQcs1Bm
 o3x3rZBqLlsWkIh4gcYrFPopJmH2uQeD11Fx+oGPAXlf4V+cC8WEWzBzYHAEEzLrv7x5
 QsoEwa38l76GCoJxk5fsqV0JoYhDcsDP+MVj+aWkvcxVh3Rwn9P5KdkBJivHEkvZKxkL
 TmE4+2nNPRs1fv6LDOEJmilph46u+1g0qlZm01LIHv55k7eTLQ4bItFugE2Y0dLKDU2H
 G7lSO4a3XD7Ol7YQ10uqj5P8j4DgXfk3nAVdWz8jCnsDyTXgkt7pU/Rg1I7qVIuJuPWt
 jwmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678181433;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=qLoa/Z/uttDfOi+iQiTqHUojT9WuPICTK5WFThT4Tr0=;
 b=gNqwcn2URbRFknJvrOSOVD6AihnGiZmW+dvIM9FWmEVH+8lJ/2cWrj7p+9Oa0Q/ONw
 2IxWjWzZkNS+3NxwtDtfsBV3/3OCcOF6y4jIF33DvqoSZAXT8MVFpgk3nuhPqcsIlhHJ
 bw7TmjiH+o5fDnJItpqYvKBjSR3VUDeYKO2RGwCshXiGdxu8JctaRDUcXtilTmZn2GN/
 TGF/lWXvUCblvr3uJIW7tBfVatVB8dZqfy9+IoAhb91R8XtRjO8WzEatz3t1Xd/fGZi4
 UUtfGKbB00o3Fmzz45Hn4G70aItuDZfXRiAhgBJJxPVDCctN0GrW77gYbjXG7cajqaaP
 Hrpg==
X-Gm-Message-State: AO0yUKUHbiX0QcafNAkjOc33OnTe5qNa9QEGyo1Is0SvEkX4/GhEQUeZ
 QGyIdU1qtbqIa2+6O1RCrD5rdQ==
X-Google-Smtp-Source: AK7set/6RZaa9MsybyseXoYum2dxmlFSE46E0sNr9TLucMCJBfrTI0g8XEyawg15v1rFt1DurLnncA==
X-Received: by 2002:a05:600c:5110:b0:3e2:1a01:3a7c with SMTP id
 o16-20020a05600c511000b003e21a013a7cmr12309531wms.6.1678181432826; 
 Tue, 07 Mar 2023 01:30:32 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 f13-20020a7bcd0d000000b003db01178b62sm16132351wmj.40.2023.03.07.01.30.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 01:30:32 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2CBF11FFB7;
 Tue,  7 Mar 2023 09:30:32 +0000 (GMT)
References: <20230221160500.30336-1-minhquangbui99@gmail.com>
 <20230221160500.30336-5-minhquangbui99@gmail.com>
User-agent: mu4e 1.9.21; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Bui Quang Minh <minhquangbui99@gmail.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson
 <richard.henderson@linaro.org>, Eduardo Habkost <eduardo@habkost.net>,
 "Michael S . Tsirkin" <mst@redhat.com>, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH 4/4] test/avocado: test Linux boot up in x2APIC with
 userspace local APIC
Date: Tue, 07 Mar 2023 07:22:52 +0000
In-reply-to: <20230221160500.30336-5-minhquangbui99@gmail.com>
Message-ID: <87lek8rjrb.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x331.google.com
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


Bui Quang Minh <minhquangbui99@gmail.com> writes:

> Simple test to check Linux boot up in x2APIC with userspace local APIC and
> TCG accelerator.

These aren't really simple tests because they are booting up a whole
distro and on my system at least they timeout:

  =E2=9E=9C  ./tests/venv/bin/avocado run tests/avocado/tcg_x2apic.py=20
  JOB ID     : 9347a29b02111cc865ab5485ed7e06ad932420a3
  JOB LOG    : /home/alex/avocado/job-results/job-2023-03-06T22.17-9347a29/=
job.log
   (1/2) tests/avocado/tcg_x2apic.py:TCGx2APIC.test_physical_x2apic: INTERR=
UPTED: Test interrupted by SIGTERM\nRunner error occurred: Timeout reached\=
nOriginal status: ERROR\n
  {'name': '1-tests/avocado/tcg_x2apic.py:TCGx2APIC.test_physical_x2apic', =
'logdir': '/home/alex/avocado/job-results/job-2023-03-06T22.17-9347a29/test=
-results/1-tests_... (120
  .67 s)
   (2/2) tests/avocado/tcg_x2apic.py:TCGx2APIC.test_cluster_x2apic: INTERRU=
PTED: Test interrupted by SIGTERM\nRunner error occurred: Timeout reached\n=
Original status: ERROR\n{
  'name': '2-tests/avocado/tcg_x2apic.py:TCGx2APIC.test_cluster_x2apic', 'l=
ogdir': '/home/alex/avocado/job-results/job-2023-03-06T22.17-9347a29/test-r=
esults/2-tests_a... (120.
  66 s)
  RESULTS    : PASS 0 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 2 | =
CANCEL 0
  JOB TIME   : 241.63 s

Most of what this exercises is already covered by the boot_linux.py
tests which I would dearly like to deprecate the TCG versions for CI
because they burn so much CI time.

Ideally what I would like are specific directed tests that exercise the
full functionality of the various emulated APICs supported by QEMU
without the weight of a full distro boot.

Do the kvm-unit-test APIC tests count? Forcing TCG seems to fail a bunch
though:

=E2=9C=97  env QEMU=3D$HOME/lsrc/qemu.git/builds/all/qemu-system-x86_64 ACC=
EL=3Dtcg ./run_tests.sh -g apic
FAIL apic-split=20
PASS ioapic-split (19 tests)
FAIL x2apic=20
FAIL xapic

It might be the kvm-unit-tests need a slight tweak to not enable
tsc-deadline for TCG only tests?

Failing that I would accept a kernel+initrd test the focused on
exercising the various APIC paths without the weight of a full distro.

<snip>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

