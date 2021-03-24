Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1772347DD2
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 17:38:56 +0100 (CET)
Received: from localhost ([::1]:36476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lP6X1-0001qd-Qf
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 12:38:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lP6Vi-0001OG-SE
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 12:37:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:58138)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lP6Vf-0006P4-HN
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 12:37:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616603848;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qtKnu9VfutesfOqDtUqRSdPUbrxtGn2W504c4eh4Qds=;
 b=FonjVPlxY5SQRxh36xrEMCg/rZ8mk5b2inTGxb9JnsNWEOvd2pzPCcU1lTxMGwjavTzO4k
 vE11WPZdNDb0Sc456V3hbGJGYoeLaVyaLoJjJFud+CgrWKrGmg1OGrxIsgkUgCzfNmn7nw
 ds+YqBUPHiJObV0nvowHFEiDiaBfC9I=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-526-_Rnptr4OOzW6o29CpYZRoQ-1; Wed, 24 Mar 2021 12:37:26 -0400
X-MC-Unique: _Rnptr4OOzW6o29CpYZRoQ-1
Received: by mail-wr1-f69.google.com with SMTP id i5so1320068wrp.8
 for <qemu-devel@nongnu.org>; Wed, 24 Mar 2021 09:37:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=qtKnu9VfutesfOqDtUqRSdPUbrxtGn2W504c4eh4Qds=;
 b=U7Jy5qVWsnR5USjm+cNiVamw1NQWVfQFvHhXghNG/w9bSGGcSz4wlU5AGAyOYE9Rgc
 eW4fof3z+Nqj8wngpeIsZ3FKJkQzXXGHJcWrRAdbXxLwWCcyEFMMo5hpxmPr06iLm6Rp
 KlwgWogCWalutIy3sYOm+e77mMb5PCeHhfGb0DHdrnnvbm6FvyHKtxMPYuXOh1dR6kkV
 z1eZaxCVJSNZFmmg+znyDeBJAdg2fq+0NblhqnRg9uqE6mdqBxDnAH/JFWiM61uGm16x
 8NUqVblsplWk+WGLs2DE3FA96PHHKldfVCZ/9Zc79ue9fTW7bGQjq6xn/1oQd9lKflnE
 zSJA==
X-Gm-Message-State: AOAM533TguTfmDUZeZAupDQbszfgZJN9wLCj58iKn/6TygAXNfZQ+Z9t
 X+EGi7MADzMG8uKEHnbtqD+a00yQD7OPl2xFy6j6uqaPDHg2XUJkr0YeZz4VWs9RYClrof8dl0E
 rSmzmCRprYvp0/SY=
X-Received: by 2002:adf:f186:: with SMTP id h6mr4482217wro.290.1616603845719; 
 Wed, 24 Mar 2021 09:37:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyHJEl7MrDfNtcr8NS7ThPnDOAfHAho4H0nxwRzhnngrIvUdJSp1w+0Y7Z8gcxnZYlQ8aJ4Rw==
X-Received: by 2002:adf:f186:: with SMTP id h6mr4482190wro.290.1616603845476; 
 Wed, 24 Mar 2021 09:37:25 -0700 (PDT)
Received: from redhat.com (bzq-79-183-252-180.red.bezeqint.net.
 [79.183.252.180])
 by smtp.gmail.com with ESMTPSA id u8sm3792043wrr.42.2021.03.24.09.37.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Mar 2021 09:37:24 -0700 (PDT)
Date: Wed, 24 Mar 2021 12:37:22 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Isaku Yamahata <isaku.yamahata@intel.com>
Subject: Re: [PATCH v2 2/3] pci: sprinkle assert in PCI pin number
Message-ID: <20210324123128-mutt-send-email-mst@kernel.org>
References: <cover.1616519655.git.isaku.yamahata@intel.com>
 <dc9c8d2aa7bfcd82ba812f1ff5630a4cc0ffbbe7.1616519655.git.isaku.yamahata@intel.com>
MIME-Version: 1.0
In-Reply-To: <dc9c8d2aa7bfcd82ba812f1ff5630a4cc0ffbbe7.1616519655.git.isaku.yamahata@intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, Peter Maydell <Peter.maydel@linaro.org>,
 f4bug@amsat.org, qemu-devel@nongnu.org, imammedo@redhat.com,
 isaku.yamahata@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 23, 2021 at 10:24:30AM -0700, Isaku Yamahata wrote:
> If a device model
> (a) doesn't set the value to a correct interrupt number and then
> (b) triggers an interrupt for itself,
> it's device model bug. Add assert on interrupt pin number to catch
> this kind of bug more obviously.
> 
> Suggested-by: Peter Maydell <Peter.maydel@linaro.org>
> Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>
> ---
>  hw/pci/pci.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/pci/pci.c b/hw/pci/pci.c
> index ac9a24889c..cb6bab999b 100644
> --- a/hw/pci/pci.c
> +++ b/hw/pci/pci.c
> @@ -1450,6 +1450,8 @@ static void pci_irq_handler(void *opaque, int irq_num, int level)
>      PCIDevice *pci_dev = opaque;
>      int change;
>  
> +    assert(0 <= irq_num && irq_num < PCI_NUM_PINS);
> +    assert(level == 0 || level == 1);
>      change = level - pci_irq_state(pci_dev, irq_num);
>      if (!change)
>          return;
> @@ -1463,7 +1465,13 @@ static void pci_irq_handler(void *opaque, int irq_num, int level)
>  
>  static inline int pci_intx(PCIDevice *pci_dev)
>  {
> -    return pci_get_byte(pci_dev->config + PCI_INTERRUPT_PIN) - 1;
> +    int intx = pci_get_byte(pci_dev->config + PCI_INTERRUPT_PIN) - 1;




> +    /*
> +     * This function is used to setup/trigger irq.
> +     * So PIN = 0 (interrupt isn't used) doesn't make sense.

Well not really. It just returns it. But of course value -1 is not a
valid index.  Better: callers must make sure the device actually has an
interrupt pin, otherwise PCI_INTERRUPT_PIN is 0 and intx is negative
here.

> +     */
> +    assert(0 <= intx && intx < PCI_NUM_PINS);
> +    return intx;
>  }
>  
>  qemu_irq pci_allocate_irq(PCIDevice *pci_dev)
> -- 
> 2.25.1


