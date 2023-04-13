Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE8A16E16A1
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Apr 2023 23:46:02 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pn4kz-0006ki-8N; Thu, 13 Apr 2023 17:45:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pn4kx-0006ka-RS
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 17:45:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pn4kw-0007Wh-07
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 17:45:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681422325;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9vOAI4hbAicFAA60hsvqdhfDss0Ylqv6HldesoU/tJY=;
 b=i8a28kdt+w+DFGExE8FFlNLHBdayUKUntA/6tjDt2fO1Do6GMoZ016LyExqPmP2/KPTQfg
 gFH3vuuN8RlnBc4WQ+8EdWcEAgRbxF5jM5MRTo+uiQakkgwbfOybX6Ggwsu0dHQIqMRyLY
 SU044y2fmsUOzIPG1zUUapId2Hjm7K8=
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-59-RBaREL4_O82yLxbKbOb05g-1; Thu, 13 Apr 2023 17:45:24 -0400
X-MC-Unique: RBaREL4_O82yLxbKbOb05g-1
Received: by mail-pg1-f197.google.com with SMTP id
 i63-20020a638742000000b0050bdffd4995so6860124pge.16
 for <qemu-devel@nongnu.org>; Thu, 13 Apr 2023 14:45:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681422322; x=1684014322;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9vOAI4hbAicFAA60hsvqdhfDss0Ylqv6HldesoU/tJY=;
 b=SOETDUkEkrcFZApQKWpSPUQnt+je4O2jOii1QpGMzf0z1aN0H/KNxWbY4RrEXT0HUX
 /BYs0TD/f5nJ6PZ9mazJKxNUu0xOYoRAMYqaAliG6GGFEzTKaVpx0LCb4r38YaNxbq1I
 mME83M/4A55Xx2+6pOSEO/QfeY76GLXIBWTJix2WEjRqXGZQn/zgS0MM6K8UBDbwkQLj
 v2IceUnvQBSZciE21RUvLGPPxm4TgX2nUDESrTNHPJqfRjaNXdn3TeZM6U7VJDNo9jD/
 TmEimy0oWjO8QrNpH7PUGIxKvNSM2sfIKPFca+JEXicqXUIXDoLQc56kDVEXQjl1Pf9G
 0iMw==
X-Gm-Message-State: AAQBX9dqfpcGNb+1rT5An5oLa+o4iWCU5KVe2BU8Ia21VcvjH0mOtTtS
 to0uRqdM0Dpx0UypehafZXC5F+O0wvUg5GAkz1Tx9eoDfbYlpMa2//sMqpvSnCEx08XDotYep7l
 NNKZ1gz7lP/oH2OKP1FQ1FxVGwCHGEr0K2iIymqA=
X-Received: by 2002:a17:902:d2c7:b0:1a0:4321:920e with SMTP id
 n7-20020a170902d2c700b001a04321920emr136881plc.12.1681422322596; 
 Thu, 13 Apr 2023 14:45:22 -0700 (PDT)
X-Google-Smtp-Source: AKy350bbra8lxir7fYCK6ZR40qL56WgEcSrFjv5l2/KQ926Swjz600KOcWMzMve3Fg1XTX93A3R0pJfAyX+8tlT9ysg=
X-Received: by 2002:a17:902:d2c7:b0:1a0:4321:920e with SMTP id
 n7-20020a170902d2c700b001a04321920emr136870plc.12.1681422322272; Thu, 13 Apr
 2023 14:45:22 -0700 (PDT)
MIME-Version: 1.0
References: <20230413214327.3971247-1-jsnow@redhat.com>
In-Reply-To: <20230413214327.3971247-1-jsnow@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Thu, 13 Apr 2023 17:45:11 -0400
Message-ID: <CAFn=p-aEozt=1vBjGT6DQ0=_VgVP9dRTvFJcsvPU5U0ghcvOAg@mail.gmail.com>
Subject: Re: [PATCH] tests/avocado: require netdev 'user' for kvm_xen_guest
To: qemu-devel@nongnu.org
Cc: Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, 
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Peter Maydell <peter.maydell@linaro.org>, kvm@vger.kernel.org, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
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

On Thu, Apr 13, 2023 at 5:43=E2=80=AFPM John Snow <jsnow@redhat.com> wrote:
>
> The tests will fail mysteriously with EOFError otherwise, because the VM
> fails to boot and quickly disconnects from the QMP socket. Skip these
> tests when we didn't compile with slirp.
>

Full disclosure: I only tested this patch in conjunction with a much
larger series that also messed around with tests, but it seemed to
work OK on my local machine in that circumstance. Didn't find any
other tests that needed this same treatment.

--js

> Fixes: c8cb603293fd (tests/avocado: Test Xen guest support under KVM)
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  tests/avocado/kvm_xen_guest.py | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/tests/avocado/kvm_xen_guest.py b/tests/avocado/kvm_xen_guest=
.py
> index 5391283113..171274bc4c 100644
> --- a/tests/avocado/kvm_xen_guest.py
> +++ b/tests/avocado/kvm_xen_guest.py
> @@ -45,6 +45,7 @@ def get_asset(self, name, sha1):
>      def common_vm_setup(self):
>          # We also catch lack of KVM_XEN support if we fail to launch
>          self.require_accelerator("kvm")
> +        self.require_netdev('user')
>
>          self.vm.set_console()
>
> --
> 2.39.2
>


