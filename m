Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98C14501A08
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Apr 2022 19:27:04 +0200 (CEST)
Received: from localhost ([::1]:53194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nf3FH-0003BO-7X
	for lists+qemu-devel@lfdr.de; Thu, 14 Apr 2022 13:27:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1nf3EJ-0002TS-OX
 for qemu-devel@nongnu.org; Thu, 14 Apr 2022 13:26:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32617)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1nf3EG-00010K-V1
 for qemu-devel@nongnu.org; Thu, 14 Apr 2022 13:26:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649957159;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8Rj2/rs0OpJfbP9YDE3QeuhgQ3NcsAWIiUE2qM6T3cQ=;
 b=BIRb6ACkeaFKu54IC4B1LBOBALFdq5RJtlz5gZ76YuC+8roh0/txszlBQBozdnglxB2X68
 nA+dKeQJIinf6pLDgbTWjjIUlMYrIp2fzxzTKkp8sPwq5W/PYBHmDRfUQArZmsp59new2x
 OcddkyY3yX421dW3sq/6D96TenOyLRg=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-292-erK6dYiAM5-2I_BxfBRoRQ-1; Thu, 14 Apr 2022 13:25:57 -0400
X-MC-Unique: erK6dYiAM5-2I_BxfBRoRQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 t15-20020adfdc0f000000b001ef93643476so912561wri.2
 for <qemu-devel@nongnu.org>; Thu, 14 Apr 2022 10:25:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8Rj2/rs0OpJfbP9YDE3QeuhgQ3NcsAWIiUE2qM6T3cQ=;
 b=Fr8RSOe7s3NshETZuaPEs0JPgaJfDktRuT7RinZ8SZzqDA4MJptldRuw/bpwiG6qYO
 wrBI5RbSeV4XCt2U0LtpqZyXRUTSalBYIdI73Ry6dhFXsxSjonqLHM1eaPD7PiZdnUVv
 iexi5Ds4zkvCLySTRuHCtdfFXRPqXU/F/z2rZBSpQjPvqbbwD8Rc0GjqEsx9+rsYKOnG
 zYCWEMt/ZbH+mdJst7pM56H24QwnVvh/BqyFrKRXycnKUNf9BvInvILRN7OALwAczvlQ
 bYjrBsk71cZllUOcJ6rkeFCYSbnjnic4LTEPpUNRYdYrvjIvhhMLlylhdF8o3K5uyNus
 mVFg==
X-Gm-Message-State: AOAM5307UPm0/C5O9qp42b8VqYf+iaDs4GoTyA4+4zc4PUKiledEctc7
 NYe3RvFJLxTb5azDxSnSVZyEpx6QklwR52SVoxFOEKwv6P/veOudfzxqh94U5evIZ/DA8R/X0E2
 OGNKVByjx4MlGx/A=
X-Received: by 2002:a1c:43c6:0:b0:38e:bb4c:6e1a with SMTP id
 q189-20020a1c43c6000000b0038ebb4c6e1amr4527784wma.111.1649957156238; 
 Thu, 14 Apr 2022 10:25:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyiacHZGpHrtC4rd9BCtcf8WZ1Ii9ou1tC96rmJy1RZywAs4XzajuBK7Gv+6iwTGn1ILvav3A==
X-Received: by 2002:a1c:43c6:0:b0:38e:bb4c:6e1a with SMTP id
 q189-20020a1c43c6000000b0038ebb4c6e1amr4527761wma.111.1649957156035; 
 Thu, 14 Apr 2022 10:25:56 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 10-20020a5d47aa000000b00207afc4bd39sm3260964wrb.18.2022.04.14.10.25.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Apr 2022 10:25:55 -0700 (PDT)
Subject: Re: [RFC PATCH] tests/qtest: pass stdout/stderr down to subtests
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20220407150042.2338562-1-alex.bennee@linaro.org>
From: Eric Auger <eauger@redhat.com>
Message-ID: <738a5f8a-a14b-ad07-5d4d-ece8b6ddbd2c@redhat.com>
Date: Thu, 14 Apr 2022 19:25:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20220407150042.2338562-1-alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eauger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eauger@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 slp@redhat.com, mathieu.poirier@linaro.org, mst@redhat.com,
 viresh.kumar@linaro.org, stefanha@redhat.com, marcandre.lureau@redhat.com,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Alex,

On 4/7/22 5:00 PM, Alex Bennée wrote:
> When trying to work out what the virtio-net-tests where doing it was
> hard because the g_test_trap_subprocess redirects all output to
> /dev/null. Lift this restriction by using the appropriate flags so you
> can see something similar to what the vhost-user-blk tests show when
> running.
> 
> While we are at it remove the g_test_verbose() check so we always show
> how the QEMU is run.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  tests/qtest/qos-test.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/qtest/qos-test.c b/tests/qtest/qos-test.c
> index f97d0a08fd..c6c196cc95 100644
> --- a/tests/qtest/qos-test.c
> +++ b/tests/qtest/qos-test.c
> @@ -89,9 +89,7 @@ static void qos_set_machines_devices_available(void)
>  
>  static void restart_qemu_or_continue(char *path)
>  {
> -    if (g_test_verbose()) {
> -        qos_printf("Run QEMU with: '%s'\n", path);
> -    }
> +    qos_printf("Run QEMU with: '%s'\n", path);
>      /* compares the current command line with the
>       * one previously executed: if they are the same,
>       * don't restart QEMU, if they differ, stop previous
> @@ -185,7 +183,8 @@ static void run_one_test(const void *arg)
>  static void subprocess_run_one_test(const void *arg)
>  {
>      const gchar *path = arg;
> -    g_test_trap_subprocess(path, 0, 0);
> +    g_test_trap_subprocess(path, 0,
> +                           G_TEST_SUBPROCESS_INHERIT_STDOUT | G_TEST_SUBPROCESS_INHERIT_STDERR);
While workling on libqos/pci tests on aarch64 I also did that but I
noticed there were a bunch of errors such as:

/aarch64/virt/generic-pcihost/pci-bus-generic/pci-bus/virtio-net-pci/virtio-net/virtio-net-tests/vhost-user/multiqueue:
qemu-system-aarch64: Failed to set msg fds.
qemu-system-aarch64: vhost VQ 0 ring restore failed: -22: Invalid
argument (22)
qemu-system-aarch64: Failed to set msg fds.
qemu-system-aarch64: vhost VQ 1 ring restore failed: -22: Invalid
argument (22)
qemu-system-aarch64: Failed to set msg fds.
qemu-system-aarch64: vhost VQ 2 ring restore failed: -22: Invalid
argument (22)
qemu-system-aarch64: Failed to set msg fds.
qemu-system-aarch64: vhost VQ 3 ring restore failed: -22: Invalid
argument (22)

I see those also when running with x86_64-softmmu/qemu-system-x86_64
(this is no aarch64 specific).

I don't know if it is an issue to get those additional errors?

Thanks

Eric

>      g_test_trap_assert_passed();
>  }
>  
> 


