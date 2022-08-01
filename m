Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 994B658680A
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Aug 2022 13:23:05 +0200 (CEST)
Received: from localhost ([::1]:47928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oITVo-0001ci-7N
	for lists+qemu-devel@lfdr.de; Mon, 01 Aug 2022 07:23:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oITTR-0008CP-Jc
 for qemu-devel@nongnu.org; Mon, 01 Aug 2022 07:20:38 -0400
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136]:35830)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oITTJ-0004Nd-Cx
 for qemu-devel@nongnu.org; Mon, 01 Aug 2022 07:20:37 -0400
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-32269d60830so105594667b3.2
 for <qemu-devel@nongnu.org>; Mon, 01 Aug 2022 04:20:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc;
 bh=gmt6LtA/nwGnB8J/Ffl0WACr25McveDQYoFW5UmbV1M=;
 b=D8Q9uWjaRLtWoCACwbPqrmWVT7giijyNk27JcZjldV9/8bwpmxgKUBrXXhrhGCk607
 IznJ0qwT34wD5bMLBtKMe3bEKn3Jw8q9GBqla4Un1aneF/yNPYI2Zu9i80Vh5UQI85ro
 yuuYHGwYEJRk+1QLbT845ikX6C1pBhdIfjg2az7ZWmrnhG+WwpMy06s7tRJ4bHaQFzgb
 0xOemn5qAhGwp4t5DJhKgqsoltPmsFQo8+2otCN4CF/Us2IjHuOoqgk1V/dwTurUGMwW
 JStwA6SXlSd6OZtQrUiN0PVPS+U1MbFJ3z/wTNV6u7nmVKGE3z3nZzTI1qq+3QcpQPm2
 VviA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=gmt6LtA/nwGnB8J/Ffl0WACr25McveDQYoFW5UmbV1M=;
 b=TQCItQbnGwusIiwx5HzIR0DTcuqamEeLiP3dbg1Ic9zUSHVYoJAAmY6V93D0ymFPuD
 HtW+2w0S+Tms83tJ2fqQGU+wu5CLGqOPNdlN1R3gn/e4UZRqBLlXihBC5pLAJNCW1AjI
 ZsOkGAG7J2XhtP+/xHpvNWnDBpwfoR39bB8E8FlIHzMbHCv8D2qfC5I8Zwj8D3MlfYVy
 SHfbr9+FeWosw5e0lnUV1c39HQyLzIE8KqxMAA+EpsjVt9H3tv5B77xv5SWmqnmSzYJK
 Jq99mLz21xRPK+L/wBc5IJRF/GfS8oF+KgWfdh8XspmdkHvy+cts/K8NzYv68ihfPfa/
 9OMg==
X-Gm-Message-State: ACgBeo1vlj26dBtCQ6jTbKsKlT2QyCmjT9cjSYO94h8as9gVV49fJtxW
 UI3IiGk7EPLBezxVzLWfLeiGmgmM8c0GdLEKyRHp0A==
X-Google-Smtp-Source: AA6agR5e7TDzRXjHDFa9Xwx1mrZswfEM0URLdC5cXE8ElOLdVmoyyXWPue57Qhl7c+uRmDIbJQlfyVu5Qzi0s7BJvdg=
X-Received: by 2002:a0d:cc0d:0:b0:31f:8a70:38e0 with SMTP id
 o13-20020a0dcc0d000000b0031f8a7038e0mr12437670ywd.347.1659352828194; Mon, 01
 Aug 2022 04:20:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220720111926.107055-1-dgilbert@redhat.com>
 <20220720111926.107055-9-dgilbert@redhat.com>
 <c4ad47a1-a946-0f4e-69a2-65a6cc679a6e@redhat.com>
In-Reply-To: <c4ad47a1-a946-0f4e-69a2-65a6cc679a6e@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 1 Aug 2022 12:20:16 +0100
Message-ID: <CAFEAcA-jET2fWX0C5uCW3q5_-SRpsCpM3mGJUQTH-Bj5LY0+8A@mail.gmail.com>
Subject: Re: migration test fails for aarch64 target (was: Re: [PULL 08/30]
 tests: Add dirty page rate limit test)
To: Thomas Huth <thuth@redhat.com>
Cc: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>, qemu-devel@nongnu.org,
 leobras@redhat.com, 
 quintela@redhat.com, berrange@redhat.com, peterx@redhat.com, 
 iii@linux.ibm.com, huangy81@chinatelecom.cn, 
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-arm <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1136;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1136.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On Mon, 1 Aug 2022 at 11:41, Thomas Huth <thuth@redhat.com> wrote:
>
> On 20/07/2022 13.19, Dr. David Alan Gilbert (git) wrote:
> > From: Hyman Huang(=E9=BB=84=E5=8B=87) <huangy81@chinatelecom.cn>
> >
> > Add dirty page rate limit test if kernel support dirty ring,
> >
> > The following qmp commands are covered by this test case:
> > "calc-dirty-rate", "query-dirty-rate", "set-vcpu-dirty-limit",
> > "cancel-vcpu-dirty-limit" and "query-vcpu-dirty-limit".

> This assert triggers on my x86 laptop when I run "make check" there. More
> precisely, it triggers when qemu-system-aarch64 is getting tested:
>
> $ QTEST_QEMU_BINARY=3D./qemu-system-aarch64 tests/qtest/migration-test
> /aarch64/migration/bad_dest: OK
> /aarch64/migration/fd_proto: OK
> /aarch64/migration/validate_uuid: OK
> /aarch64/migration/validate_uuid_error: OK
> /aarch64/migration/validate_uuid_src_not_set: OK
> /aarch64/migration/validate_uuid_dst_not_set: OK
> /aarch64/migration/auto_converge: OK
> /aarch64/migration/dirty_ring: OK
> /aarch64/migration/vcpu_dirty_limit: migration-test:
> ../../devel/qemu/tests/qtest/migration-test.c:2304: dirtylimit_start_vm:
> Assertion `(strcmp(arch, "x86_64") =3D=3D 0)' failed.
> Aborted (core dumped)
>
> >   static bool kvm_dirty_ring_supported(void)
> >   {
> >   #if defined(__linux__) && defined(HOST_X86_64)
> > @@ -2204,6 +2458,8 @@ int main(int argc, char **argv)
> >       if (kvm_dirty_ring_supported()) {
> >           qtest_add_func("/migration/dirty_ring",
> >                          test_precopy_unix_dirty_ring);
> > +        qtest_add_func("/migration/vcpu_dirty_limit",
> > +                       test_vcpu_dirty_limit);
> >       }
>
> kvm_dirty_ring_supported() returns "true" if the KVM of the *host* is x86
> and has the dirty ring support, but it does *not* check the target
> architecture that is currently tested, so you also get here "true" for
> qemu-system-aarch64 being tested on a x86 host... Thus I guess
> kvm_dirty_ring_supported() needs also a check for the right target archit=
ecture?

Presumably it should be checking qtest_has_accel("kvm") -- even
if you're on an x86 host and with an x86 guest, if you're using
TCG you're not going to get KVM dirty ring support...

thanks
-- PMM

