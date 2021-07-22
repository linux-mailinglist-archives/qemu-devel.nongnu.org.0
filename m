Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 899783D2B93
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 19:59:00 +0200 (CEST)
Received: from localhost ([::1]:47870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6cyJ-0003OV-Hp
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 13:58:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m6cwV-0000jj-2l
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 13:57:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40556)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m6cwT-0004vn-2w
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 13:57:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626976624;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2vvIqMxIKCFn5vyMzmymHLKCWlaOOquvsmtMrg9PBJ4=;
 b=ipEJGaQV8qD41+fETfHsHNh7PTIRq7Ms8I6Z1G4ThJeVka2zmzA5sB9TEXT+wGFLtaqH+q
 j59Hi7iFwEHErVD+vtxuTku/mJKAkWgFZ2TZQw1654s4MHLlBpEpu0q02kQv60COT/BC6R
 HlDsXrmJM+f7JD4zyqiu42WCaXW3krk=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-166-fDKVJJ8fPW2subP2rm968Q-1; Thu, 22 Jul 2021 13:57:03 -0400
X-MC-Unique: fDKVJJ8fPW2subP2rm968Q-1
Received: by mail-ej1-f69.google.com with SMTP id
 k1-20020a17090666c1b029041c273a883dso2091202ejp.3
 for <qemu-devel@nongnu.org>; Thu, 22 Jul 2021 10:57:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=2vvIqMxIKCFn5vyMzmymHLKCWlaOOquvsmtMrg9PBJ4=;
 b=Pg6A6sELkaCqRMQyjp1QDbQJEKomZSceCh70JiF5o3WtTlP+nYX4b+qUyHfjSSrrSk
 QZtsQ7pl2abt7vNxMMxP7wEiuKJJ+lVuTcSjR1sIkJ9FIr1ziTfPB8F+0GPs0bZzry+0
 rn9kPjsDZZZ0+iMw9nyiQzIwSDzABUuQWZhGujPeofPq45fQKxiwM4juC9cpVLSAiDty
 /PRcoQan4nSn3p8bs6KYXhjfHRI6/9jYdLZ1OjgcSXIH0y1WooBTDc4Hx2GRHCcstb0H
 uEEGXgmfDGxrV1+yfxVXLUvNPjeBNN2rSlb32BRNVIv+W+nguDpEO2bGDnm6A/Tz0fTe
 VMLw==
X-Gm-Message-State: AOAM532FaLicKkp/yyfv2x3YnuaUKzuHRLLJHODy+Fh6TwO2uW5YMXcw
 xu00fePuq3IZXSkOh2M5I4+mvuPHcKNGtgO6FnQE+jjHITq1N4Ul/SIJFX9ZbZaDGPj9Xnlh811
 p0QGMvcbOhfNCmDA=
X-Received: by 2002:a17:907:1003:: with SMTP id
 ox3mr990930ejb.123.1626976622117; 
 Thu, 22 Jul 2021 10:57:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwrxekgxsUKnRI21fMMzYYx32WqFAmul3AP0hUuCvrVa7y70AflUbryFxn2uflb7EpriCo+2A==
X-Received: by 2002:a17:907:1003:: with SMTP id
 ox3mr990922ejb.123.1626976621998; 
 Thu, 22 Jul 2021 10:57:01 -0700 (PDT)
Received: from redhat.com ([2.55.134.65])
 by smtp.gmail.com with ESMTPSA id b13sm4264164ede.49.2021.07.22.10.57.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jul 2021 10:57:01 -0700 (PDT)
Date: Thu, 22 Jul 2021 13:56:58 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH 0/2] acpi: pcihp: fix hotplug when bridge is wired to
 function > 0
Message-ID: <20210722135626-mutt-send-email-mst@kernel.org>
References: <20210722105945.2080428-1-imammedo@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210722105945.2080428-1-imammedo@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
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
Cc: peter.maydell@linaro.org, jusual@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jul 22, 2021 at 06:59:43AM -0400, Igor Mammedov wrote:
> For full description see 2/2.
> Tested hotplug on Q35 (see 2/2 for reproducer) and PC (with pci-bridge) machines
> 
> Igor Mammedov (2):
>   acpi: x86: pcihp: cleanup devfn usage in
>     build_append_pci_bus_devices()
>   acpi: x86: pcihp: add support hotplug on multifunction bridges
> 
>  hw/i386/acpi-build.c | 42 +++++++++++++++++++++++++++++-------------
>  1 file changed, 29 insertions(+), 13 deletions(-)
> 


In fact I think this fixes a bug in acpi hotplug on pc too.

have some questions though, posted.

Thanks!

> 2.27.0


