Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37FF74196C3
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 16:54:04 +0200 (CEST)
Received: from localhost ([::1]:59120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUs15-0005sS-5O
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 10:54:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mUrt6-00059D-65
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 10:45:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24688)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mUrt3-0007GC-Ut
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 10:45:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632753945;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K/Qc2eanngXW0q51KgH8RyqqzVvqKM2POHZAKvPKyp0=;
 b=LXk+9kiSaPoG7jbuGHW43i3GZqGqGkAdQ7fcmdIvKlh0GTYy3AuvUqEI9quC3htprJNH8C
 4z/fq6KNjG/q3RrAYwBCfWru4qOvp1sOhXzmb55a37N2kPFvGe6Nchjd92kBB2QMox5vVo
 Rrj01kjE5FRlcpOIRSxX2We6AZXRhbc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-383-54Y5R5czMKa2E45MrLnnjg-1; Mon, 27 Sep 2021 10:45:41 -0400
X-MC-Unique: 54Y5R5czMKa2E45MrLnnjg-1
Received: by mail-wm1-f71.google.com with SMTP id
 5-20020a1c00050000b02902e67111d9f0so331843wma.4
 for <qemu-devel@nongnu.org>; Mon, 27 Sep 2021 07:45:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=K/Qc2eanngXW0q51KgH8RyqqzVvqKM2POHZAKvPKyp0=;
 b=UD5+5QVBdslkvb8jSZ1J+M7/5TwW5vfCZgqeodOA1dLzane3N6PeWjEZo12Fgh9gk8
 7Xr8ZSHSqL+oUkEWgVzEOKCR87ohkc619d/1VzXMQukIVoMttzxc1cIUA3Vh/JkpVDpF
 Vj5N/LZb0fqMGOtQIrauycVUOnP+3pS5MxPoONXkacRyF9uD3gABmugtSNwnkQmgmcOg
 y2UGWtEn+UmViqkXpxCKswi2XnkEQSe/YaVxbu6IfEAyj8GMdtXyp4CBJ/MF31Tz+tHl
 Gi1ERf/Gazb/nJJCWXlOiQxjx6A1z6Tj29fSOeMlhEY01xkH05/kx5lS8Vu1ALItuDSn
 dJAw==
X-Gm-Message-State: AOAM5321WQ1QDSAVoTI7bEIv9bzjhZlnAZ5n7mQFanfJ9vBl1aGL9YqG
 2AY9wJQIeYAzECxo53WLGYqLI3AQbrMpCEelFdHRXplhSEwjCGQMrB1tFUzdvdrNs9pOr/sIcPS
 FEH1wkJZKgKaXgL4=
X-Received: by 2002:adf:dc0d:: with SMTP id t13mr282981wri.158.1632753940675; 
 Mon, 27 Sep 2021 07:45:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyQxXODe0YxWai9gbo0khNUeuxiP3rr5doc+aHAaEVIOICgYzXDXmqhpFnuBD/nZhsGvp58NQ==
X-Received: by 2002:adf:dc0d:: with SMTP id t13mr282941wri.158.1632753940469; 
 Mon, 27 Sep 2021 07:45:40 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id 1sm7625362wms.0.2021.09.27.07.45.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Sep 2021 07:45:40 -0700 (PDT)
Message-ID: <22c141e4-ba3c-892a-d194-b235cca87bd1@redhat.com>
Date: Mon, 27 Sep 2021 16:45:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 16/16] tests/acceptance/ppc_prep_40p.py: unify tags
To: Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org
References: <20210924185506.2542588-1-crosa@redhat.com>
 <20210924185506.2542588-17-crosa@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20210924185506.2542588-17-crosa@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.136, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, Greg Kurz <groug@kaod.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Auger Eric <eric.auger@redhat.com>, Kamil Rytarowski <kamil@netbsd.org>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Reinoud Zandijk <reinoud@netbsd.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 Willian Rampazzo <wrampazz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Mahmoud Mandour <ma.mandourr@gmail.com>,
 Ryo ONODERA <ryoon@netbsd.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/24/21 20:55, Cleber Rosa wrote:
> The arch and machine tags apply to all tests, so let's define them
> only once.

IIRC this was not the case at the beginning with Avocado 65.0
at least, right? If so, maybe mention since when it is possible?

> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>  tests/acceptance/ppc_prep_40p.py | 12 ++++--------
>  1 file changed, 4 insertions(+), 8 deletions(-)
> 
> diff --git a/tests/acceptance/ppc_prep_40p.py b/tests/acceptance/ppc_prep_40p.py
> index 5e61e686bd..d1e5674673 100644
> --- a/tests/acceptance/ppc_prep_40p.py
> +++ b/tests/acceptance/ppc_prep_40p.py
> @@ -13,6 +13,10 @@
>  
>  
>  class IbmPrep40pMachine(Test):
> +    """
> +    :avocado: tags=arch:ppc
> +    :avocado: tags=machine:40p
> +    """
>  
>      timeout = 60
>  
> @@ -24,8 +28,6 @@ class IbmPrep40pMachine(Test):
>      @skipUnless(os.getenv('AVOCADO_ALLOW_UNTRUSTED_CODE'), 'untrusted code')
>      def test_factory_firmware_and_netbsd(self):
>          """
> -        :avocado: tags=arch:ppc
> -        :avocado: tags=machine:40p
>          :avocado: tags=os:netbsd
>          :avocado: tags=slowness:high
>          """
> @@ -48,10 +50,6 @@ def test_factory_firmware_and_netbsd(self):
>          wait_for_console_pattern(self, 'Model: IBM PPS Model 6015')
>  
>      def test_openbios_192m(self):
> -        """
> -        :avocado: tags=arch:ppc
> -        :avocado: tags=machine:40p
> -        """
>          self.vm.set_console()
>          self.vm.add_args('-m', '192') # test fw_cfg
>  
> @@ -62,8 +60,6 @@ def test_openbios_192m(self):
>  
>      def test_openbios_and_netbsd(self):
>          """
> -        :avocado: tags=arch:ppc
> -        :avocado: tags=machine:40p
>          :avocado: tags=os:netbsd
>          """
>          drive_url = ('https://archive.netbsd.org/pub/NetBSD-archive/'
> 


