Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E132E6E8B56
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 09:25:07 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppOe5-0007Oj-DU; Thu, 20 Apr 2023 03:23:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ppOdx-0007OE-0x
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 03:23:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ppOdu-0004xI-Vj
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 03:23:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681975425;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NVlP9kZ92ZpvFNdm1Pky9QLdj9f7TBy2S9UT2bV3gcc=;
 b=Hclmob+9B6+QDEohe/kdVsOLRr7T4Pnzr18sCp1y9N5Gwus2tCDfmwqvlqIk9VEh31eAnv
 NrfJVSUA0/frQXtO2kB1pBvFui1bswIzcvwAQNcSH3RidmLzJdUXkzFbtGFplsjDJAijta
 E8pXtyKnDQvmbLgz0c39okencHmQJfE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-645-v6kLjfHoNECeKZ-SH6d20Q-1; Thu, 20 Apr 2023 03:23:43 -0400
X-MC-Unique: v6kLjfHoNECeKZ-SH6d20Q-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-3f17b8d2496so1543265e9.2
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 00:23:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681975422; x=1684567422;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NVlP9kZ92ZpvFNdm1Pky9QLdj9f7TBy2S9UT2bV3gcc=;
 b=B2OZOegjafO9KGKFqIpVrbjUns+pgej6MHQWSrkel+imXxloHG/3YPpstkUTTtoLEJ
 Qsry5+es7qN1kpmSRPLykpe02e1rB9q+gcopdx+bXf8s2Mnee62tZdv6YlFop/CSJPNK
 VJgN2YIHHvWVHh0OMCzTBUNrU6VRAWm5tGP6tc51Q+ON8YubQo42C97OggHSF+DLTIEg
 XHr0jrlgEzyX1eKuiGDLNQNxuxl8E98j9lQFO6dKVF7ryNVb/uUC4bwnTNv4L5WFwDqH
 M6W8pAaR8Fh+kBY3QlEflQEZ/7YoO5F5VofPBx5sPm9rK+DKyQ+ECtnGmfb8BIpOKRaf
 AkBw==
X-Gm-Message-State: AAQBX9e05VDs256TWzI7y5ktvPr97yaZr30eYYGz6tDQnb2l5GiYLtFh
 BF4pZIoztvBORupyuqct+mNNAwNJa+IvdAmwOMqB3JVHIrSHvqzHtcdyH8fzKx4kORkS2DKeE+c
 VUTIN9pk5psl3u78=
X-Received: by 2002:adf:ffc9:0:b0:2f2:4db4:1f5b with SMTP id
 x9-20020adfffc9000000b002f24db41f5bmr477573wrs.29.1681975422630; 
 Thu, 20 Apr 2023 00:23:42 -0700 (PDT)
X-Google-Smtp-Source: AKy350awlxGTl30nzB5B3EdBRk7DTYU8A41+2M/hMmUZZzFLLup29rwFOyhccsGdF8s1kZyw+B/OPg==
X-Received: by 2002:adf:ffc9:0:b0:2f2:4db4:1f5b with SMTP id
 x9-20020adfffc9000000b002f24db41f5bmr477559wrs.29.1681975422158; 
 Thu, 20 Apr 2023 00:23:42 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-178-20.web.vodafone.de.
 [109.43.178.20]) by smtp.gmail.com with ESMTPSA id
 d15-20020adfe84f000000b002fb60c7995esm1211827wrn.8.2023.04.20.00.23.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Apr 2023 00:23:41 -0700 (PDT)
Message-ID: <2467b131-64c2-7c35-584e-c6412956c554@redhat.com>
Date: Thu, 20 Apr 2023 09:23:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 11/41] tests/avocado: Remove test_igb_nomsi_kvm
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: Sriram Yagnaraman <sriram.yagnaraman@est.tech>,
 Jason Wang <jasowang@redhat.com>, Dmitry Fleytman
 <dmitry.fleytman@gmail.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org, Tomasz Dzieciol <t.dzieciol@partner.samsung.com>
References: <20230420054657.50367-1-akihiko.odaki@daynix.com>
 <20230420054657.50367-12-akihiko.odaki@daynix.com>
Content-Language: en-US
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230420054657.50367-12-akihiko.odaki@daynix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.597, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 20/04/2023 07.46, Akihiko Odaki wrote:
> It is unlikely to find more bugs with KVM so remove test_igb_nomsi_kvm
> to save time to run it.
> 
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> ---
>   tests/avocado/netdev-ethtool.py | 12 +-----------
>   1 file changed, 1 insertion(+), 11 deletions(-)
> 
> diff --git a/tests/avocado/netdev-ethtool.py b/tests/avocado/netdev-ethtool.py
> index 8de118e313..6da800f62b 100644
> --- a/tests/avocado/netdev-ethtool.py
> +++ b/tests/avocado/netdev-ethtool.py
> @@ -29,7 +29,7 @@ def get_asset(self, name, sha1):
>           # URL into a unique one
>           return self.fetch_asset(name=name, locations=(url), asset_hash=sha1)
>   
> -    def common_test_code(self, netdev, extra_args=None, kvm=False):
> +    def common_test_code(self, netdev, extra_args=None):
>   
>           # This custom kernel has drivers for all the supported network
>           # devices we can emulate in QEMU
> @@ -57,9 +57,6 @@ def common_test_code(self, netdev, extra_args=None, kvm=False):
>                            '-drive', drive,
>                            '-device', netdev)
>   
> -        if kvm:
> -            self.vm.add_args('-accel', 'kvm')
> -
>           self.vm.set_console(console_index=0)
>           self.vm.launch()
>   
> @@ -86,13 +83,6 @@ def test_igb_nomsi(self):
>           """
>           self.common_test_code("igb", "pci=nomsi")
>   
> -    def test_igb_nomsi_kvm(self):
> -        """
> -        :avocado: tags=device:igb
> -        """
> -        self.require_accelerator('kvm')
> -        self.common_test_code("igb", "pci=nomsi", True)

Reviewed-by: Thomas Huth <thuth@redhat.com>


