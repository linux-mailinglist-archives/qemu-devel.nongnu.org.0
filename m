Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DC786C4047
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 03:20:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peo44-0002Fl-I6; Tue, 21 Mar 2023 22:19:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1peo42-0002FX-ND
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 22:18:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1peo41-0006JH-CM
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 22:18:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679451536;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=74Hq9QfCZZO4BWYZlokUVM4ZlxXZQCbsD/gdmsrQ5uI=;
 b=islzvbiRzWRm9ge4W33wRf7AwA0LM4U6PLUdp0mdaBRHVjmF7cx1rl24HRdmEzIQt+h9Uf
 589wGwUs0qIjW5akDCTDXvVwcQWiJIXeFNIc3bUq0RBHbCwXg+SStoID5FLkWVMZC7AsJ6
 zkvuWCUHd9HSN4kL7hOIT1O7XrYqOMY=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-391-NzeibTtYNn2wwEAO0Yp9Qw-1; Tue, 21 Mar 2023 22:18:52 -0400
X-MC-Unique: NzeibTtYNn2wwEAO0Yp9Qw-1
Received: by mail-wr1-f72.google.com with SMTP id
 o13-20020adfa10d000000b002d34203df59so1479729wro.9
 for <qemu-devel@nongnu.org>; Tue, 21 Mar 2023 19:18:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679451531;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=74Hq9QfCZZO4BWYZlokUVM4ZlxXZQCbsD/gdmsrQ5uI=;
 b=H0ng+Ep/BuSTfNwaib1ndi0Foi4xzCHy5O4+ea2l9hzKsp0GOqsyh0dhI2a5dRtIK9
 Hp/1CyoSgWWgyDG8R6azoy/ZFeGNjrPatUjImQg4E2GjWXvlSDgMPHJtZX0ItmYazBhP
 BqQ2jmI6c/57meFgUHh1RjXsQitrMEV3jClHKhCSsAJnr/Xanbt1vizSoiW0/UcUQyiO
 FBkZdc41ekYcS5IM/WGBOWJ/oC1FAx1/Q/jK2PxC5bszVK5dpnKupaZh4Ut3B8wEkVh1
 JfCnpzBkC28VmhXf/nnlKt/jf2OhW1sskTKZle/lxO+7/cVENOGWqAObjt7eQNZ6/LaH
 XZXg==
X-Gm-Message-State: AO0yUKX/MsrUFpBhHT2k8Srb84GFrre3zlUQEj/Ycz/nEuxdNpYqvQvX
 AmdjWOEVHuGo7J1SFOq0EkdPoqo4igI8Be8b2kaoSJ9LwJOVLsfbBPr2FXVvURTpbtpBFrdbMiz
 CkpEMjq/XHhqdOAM=
X-Received: by 2002:adf:fccf:0:b0:2ce:aed6:3f2e with SMTP id
 f15-20020adffccf000000b002ceaed63f2emr3849931wrs.46.1679451531480; 
 Tue, 21 Mar 2023 19:18:51 -0700 (PDT)
X-Google-Smtp-Source: AK7set+Zne2pl2vKfJCmkh89ZpkAk0v82LrZ87XwL9RI266YB7zH+Zjm+tBNjH5AMWcsobU6OyJ5ig==
X-Received: by 2002:adf:fccf:0:b0:2ce:aed6:3f2e with SMTP id
 f15-20020adffccf000000b002ceaed63f2emr3849920wrs.46.1679451531151; 
 Tue, 21 Mar 2023 19:18:51 -0700 (PDT)
Received: from redhat.com ([2.52.1.105]) by smtp.gmail.com with ESMTPSA id
 h10-20020adffa8a000000b002ce3d3d17e5sm12780139wrr.79.2023.03.21.19.18.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Mar 2023 19:18:50 -0700 (PDT)
Date: Tue, 21 Mar 2023 22:18:47 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH 4/4] hw/pci: Ensure pci_add_capability() is called before
 device is realized
Message-ID: <20230321221821-mutt-send-email-mst@kernel.org>
References: <20230314111435.89796-1-philmd@linaro.org>
 <20230314111435.89796-5-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230314111435.89796-5-philmd@linaro.org>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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

On Tue, Mar 14, 2023 at 12:14:35PM +0100, Philippe Mathieu-Daudé wrote:
> PCI capabilities can't appear magically at runtime.
> Guests aren't expecting that. Assert all capabilities
> are added _before_ a device instance is realized.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>  hw/pci/pci.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/pci/pci.c b/hw/pci/pci.c
> index ac41fcbf6a..ed60b352e4 100644
> --- a/hw/pci/pci.c
> +++ b/hw/pci/pci.c
> @@ -2397,7 +2397,7 @@ static void pci_del_option_rom(PCIDevice *pdev)
>   * On success, pci_add_capability() returns a positive value
>   * that the offset of the pci capability.
>   * On failure, it sets an error and returns a negative error
> - * code.
> + * code. @pdev must be unrealized.
>   */
>  int pci_add_capability(PCIDevice *pdev, uint8_t cap_id,
>                         uint8_t offset, uint8_t size,
> @@ -2406,6 +2406,8 @@ int pci_add_capability(PCIDevice *pdev, uint8_t cap_id,
>      uint8_t *config;
>      int i, overlapping_cap;
>  
> +    assert(!DEVICE(pdev)->realized);
> +
>      if (!offset) {
>          offset = pci_find_space(pdev, size);
>          /* out of PCI config space is programming error */

Fails in CI:

https://gitlab.com/mstredhat/qemu/-/jobs/3976974199

qemu-system-i386: ../hw/pci/pci.c:2409: pci_add_capability: Assertion `!DEVICE(pdev)->realized' failed.
Broken pipe
../tests/qtest/libqtest.c:193: kill_qemu() detected QEMU death from signal 6 (Aborted) (core dumped)
TAP parsing error: Too few tests run (expected 49, got 40)
(test program exited with status code -6)



> -- 
> 2.38.1


