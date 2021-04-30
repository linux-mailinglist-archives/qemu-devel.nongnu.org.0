Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 276B036FDFA
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 17:43:23 +0200 (CEST)
Received: from localhost ([::1]:56238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcVIY-0004mc-9r
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 11:43:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lcVG5-0003SM-A9
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 11:40:49 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:36622)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lcVG1-0005pl-MW
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 11:40:48 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 f15-20020a05600c4e8fb029013f5599b8a9so1951426wmq.1
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 08:40:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=VKkGTq5das5Vj9OMpvXn3xI/EGCvHUVC7g2aH6TlYwk=;
 b=gvkTlphvy1Eui171LB1zIhpBaUJcOl9FPhWLlnhU4LFzJgfwhaWTZ0cM9OzuuJ8FC7
 tTSkG46+7iX8X5Bjb+lM3zNWKoEwwG2VabqQC60kiqlDPKgBiEk0hSCYd3c2E5/S/NGa
 WllHgyxWas4oDVNrbVIIitXm0gX+D3VFN/GyqVKQjt+EalvzYGqVbVyfYTt04Yi1E9xp
 mNUODLwb0kxgW2U+FFo5Tj4u8Yl/uitn5aHdfIPmpcsf+b3zvQxbA2sJe3kubBR+b4aN
 Tgw0Z+MmqBTu7L7Hb/tZen12sLzmQL/2IfVAYkvdln3p4V0IHuMUxYaauaca8/buwkn/
 eerw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=VKkGTq5das5Vj9OMpvXn3xI/EGCvHUVC7g2aH6TlYwk=;
 b=dgdgBf+ADS86s2yctO6qQintUHiOdgqU7gXkiEZ2CoBg4+8g7aMSW9CtTmotO+1Z0z
 Ez1TlG3WkljxCOki8LN9eyd1Hh7eU+5HGwfuWGnzqukPNRCYKe9d0kZOVCuPRDeYXh1e
 STdWM1FRkrip7YFjsEiB+v42qd7Yq10xEGQfYdBLy/ef8nHMALo1CPcw+KKAhlr/peht
 5Cw94+L2a+z9Fj5IsvjiPDgdYC0OnAY8lTokWLha4Uor6ILUr4K8zGyL+4yi5RHpVSzS
 mAUqXTmlW89r84UEwr/1yk3FVR8bbg530sRy/ehYRowj3Bdg4bzLv3v6Q5ViZbtCOFby
 BrKw==
X-Gm-Message-State: AOAM530PPRsYiDQ2lDPBor6/YU+BUPJBg84bnzNG2X5aSJznBC0MXFFc
 n6xqlMAjDbeasUitnTj1X56Syw==
X-Google-Smtp-Source: ABdhPJymWprZzpKWps4RKxVhPraB2XxjxqpkbESpARqNlja8Rnp05Kmgl2CJuqoDkevp0ixGZn69FA==
X-Received: by 2002:a05:600c:1991:: with SMTP id
 t17mr9293902wmq.100.1619797244117; 
 Fri, 30 Apr 2021 08:40:44 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id f6sm2638620wrt.19.2021.04.30.08.40.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 08:40:43 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 56F4A1FF7E;
 Fri, 30 Apr 2021 16:40:42 +0100 (BST)
References: <20210415163304.4120052-1-philmd@redhat.com>
 <20210415163304.4120052-10-philmd@redhat.com>
User-agent: mu4e 1.5.12; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v4 09/12] qtest/migration-test: Skip tests if KVM not
 builtin on s390x/ppc64
Date: Fri, 30 Apr 2021 16:37:56 +0100
In-reply-to: <20210415163304.4120052-10-philmd@redhat.com>
Message-ID: <87v983vkzp.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Andrew Jones <drjones@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Claudio Fontana <cfontana@suse.de>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 qemu-devel@nongnu.org, qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 =?utf-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, qemu-ppc@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> We might have a s390x/ppc64 QEMU binary built without the KVM
> accelerator (configured with --disable-kvm).
> Checking for /dev/kvm accessibility isn't enough, also check for the
> accelerator in the binary.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
> Cc: David Gibson <david@gibson.dropbear.id.au>
> Cc: Greg Kurz <groug@kaod.org>
> Cc: Halil Pasic <pasic@linux.ibm.com>
> Cc: Cornelia Huck <cohuck@redhat.com>
> Cc: Christian Borntraeger <borntraeger@de.ibm.com>
> Cc: qemu-ppc@nongnu.org
> Cc: qemu-s390x@nongnu.org
> ---
>  tests/qtest/migration-test.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
> index 3a711bb4929..c32a2aa30a2 100644
> --- a/tests/qtest/migration-test.c
> +++ b/tests/qtest/migration-test.c
> @@ -1408,7 +1408,7 @@ int main(int argc, char **argv)
>       */
>      if (g_str_equal(qtest_get_arch(), "ppc64") &&
>          (access("/sys/module/kvm_hv", F_OK) ||
> -         access("/dev/kvm", R_OK | W_OK))) {
> +         access("/dev/kvm", R_OK | W_OK) || !qtest_has_accel("kvm"))) {
>          g_test_message("Skipping test: kvm_hv not available");
>          return g_test_run();
>      }
> @@ -1419,7 +1419,7 @@ int main(int argc, char **argv)
>       */
>      if (g_str_equal(qtest_get_arch(), "s390x")) {
>  #if defined(HOST_S390X)
> -        if (access("/dev/kvm", R_OK | W_OK)) {
> +        if (access("/dev/kvm", R_OK | W_OK) || !qtest_has_accel("kvm")) {
>              g_test_message("Skipping test: kvm not available");
>              return g_test_run();
>          }

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

