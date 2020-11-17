Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 824FC2B5F5B
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 13:50:30 +0100 (CET)
Received: from localhost ([::1]:37972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kf0RJ-000290-Dw
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 07:50:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kf0Pm-0001VE-RX
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 07:48:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22019)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kf0Pk-00058x-NE
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 07:48:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605617328;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ExyNjIbyYgPz8m5K9nXO++ZsLvNj801CX8TiAjP5uTY=;
 b=MXxcfzMd6uTBDkcw3FXAU+mHbbw9n5bD2XwKdYmxxKFz69mtvmbzA8Sb/+jNMu/9ahlZf7
 X++OiE+2qa0b62boLIHXee7xe62SKE/89WZPiCvjhWA7dEpofyMd7CUmTby2FMcYxkAniR
 WtAbo8a2+qYVJHLeX7wrAzEmQHR9qnU=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-77-EU9tHctxNKyagY06sMJG2A-1; Tue, 17 Nov 2020 07:48:46 -0500
X-MC-Unique: EU9tHctxNKyagY06sMJG2A-1
Received: by mail-wr1-f72.google.com with SMTP id c8so12996464wrh.16
 for <qemu-devel@nongnu.org>; Tue, 17 Nov 2020 04:48:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ExyNjIbyYgPz8m5K9nXO++ZsLvNj801CX8TiAjP5uTY=;
 b=l0l/ssdML5Q/sVRCDFPcXlMEunqBaEJd11PjA4Ygip04lFmXpvV4qleMLFXGnNqcUh
 MSS18M3CDSFtUyi/5i7eAaMeWs4nifC5KQ988ZB7fv1iIckrs4jF2cnB2Rsaep1wXmBq
 NtTzEqewAIGj/y+9IvliDi7eIwiCDko3/uQSWG4HHblkavU/IfmzuXR58TNlPq4vfpny
 P57Rme1U4zf0ResuIJ45AXYJadHwEqFrLUQ9NKCo2heDb5AHa05yxJnNnyr+CAvzWP7W
 qx6qYxhcUCIQ9HvUbzeM+7KhRK5r5sgPiNkbwA50mvBlsW7U2hZfE7i7bzgZN8/iGfgL
 4g6A==
X-Gm-Message-State: AOAM533bgXlIJ9ZCfixAqgoHvjg9GaW9bprgPGafVs55nIKk6jrwLxmH
 gO7sA6Cd1OCUH03fC0aNcHnr/FQZnZZsXxtRmYNYgPn8dbfoiuw1b8N9jn5U7jjshl1pMBwHGgW
 /vP9SYAukqbO+MtU=
X-Received: by 2002:adf:db8e:: with SMTP id u14mr23598286wri.233.1605617325281; 
 Tue, 17 Nov 2020 04:48:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyx7F7EIFv8ggvihEkVQ1vP1ke0I5g5gmX6uIXHD00Qu0Z3MCqduXzt/c5Juf2Ym240Gfnigg==
X-Received: by 2002:adf:db8e:: with SMTP id u14mr23598267wri.233.1605617325082; 
 Tue, 17 Nov 2020 04:48:45 -0800 (PST)
Received: from [192.168.1.36] (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id k3sm7544564wrn.81.2020.11.17.04.48.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Nov 2020 04:48:44 -0800 (PST)
Subject: Re: [PATCH-for-5.2? 1/5] tests/acceptance: Restrict
 virtio_check_params tests to X86 target
To: "Daniel P . Berrange" <berrange@redhat.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
References: <20201102144245.2134077-1-philmd@redhat.com>
 <20201102144245.2134077-2-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <0c591e28-659b-b30b-105c-e8ee3061b7bd@redhat.com>
Date: Tue, 17 Nov 2020 13:48:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201102144245.2134077-2-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 01:18:45
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
 Sarah Harris <S.E.Harris@kent.ac.uk>, Michael Rolnik <mrolnik@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Fabien Chouteau <chouteau@adacore.com>, Aurelien Jarno <aurelien@aurel32.net>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>, qemu-ppc@nongnu.org,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 Antony Pavlov <antonynpavlov@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ping?

On 11/2/20 3:42 PM, Philippe Mathieu-Daudé wrote:
> We disabled the virtio_check_params tests in commit 2d6a6e238a2
> ("tests/acceptance/virtio_check_params: Disable the test"),
> because these tests were making multiarch CI fail (virtio is
> multiarch).
> 
> We took the big hammer, as we can restrict the tests to the X86
> arch. Restore them on this single arch.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  tests/acceptance/virtio_check_params.py | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/acceptance/virtio_check_params.py b/tests/acceptance/virtio_check_params.py
> index 87e6c839d14..fecf1c094b1 100644
> --- a/tests/acceptance/virtio_check_params.py
> +++ b/tests/acceptance/virtio_check_params.py
> @@ -42,6 +42,12 @@
>  
>  
>  class VirtioMaxSegSettingsCheck(Test):
> +    """
> +    This test should be multi-arch, however only X86 is implemented.
> +
> +    :avocado: tags=arch:x86_64
> +    """
> +
>      @staticmethod
>      def make_pattern(props):
>          pattern_items = ['{0} = \w+'.format(prop) for prop in props]
> @@ -117,7 +123,6 @@ def seg_max_adjust_enabled(mt):
>              return True
>          return False
>  
> -    @skip("break multi-arch CI")
>      def test_machine_types(self):
>          # collect all machine types except 'none', 'isapc', 'microvm'
>          with QEMUMachine(self.qemu_bin) as vm:
> 


