Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5312C4D64B5
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Mar 2022 16:33:25 +0100 (CET)
Received: from localhost ([::1]:45084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nShGe-0004NZ-E1
	for lists+qemu-devel@lfdr.de; Fri, 11 Mar 2022 10:33:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nShCp-0008Ce-HJ
 for qemu-devel@nongnu.org; Fri, 11 Mar 2022 10:29:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40959)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nShCo-0005nI-2m
 for qemu-devel@nongnu.org; Fri, 11 Mar 2022 10:29:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647012565;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=F12d0zHTRgL0OTjzk4BjJWJ4qTXCFNzxpmGUYQZoP1o=;
 b=Pch4aiPmw8PJWcGRAu1flsepA1krM5X52KY+GMcnJuLpjMpccbt9C3czP2NIl2Kom9w/3R
 WZnZGYg4MihyZ5MQaKVfaeXiIGmTq7WY62pCMzIf7eqR5C2cev1oEBBpvqGOyXTayN0bPr
 fOGpISJ/AG22EPjaePeCbu4RtrJIxnk=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-505-qRwneg6_Ov6xFA5i4xGGPQ-1; Fri, 11 Mar 2022 10:29:24 -0500
X-MC-Unique: qRwneg6_Ov6xFA5i4xGGPQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 a16-20020adff7d0000000b001f0473a6b25so2933113wrq.1
 for <qemu-devel@nongnu.org>; Fri, 11 Mar 2022 07:29:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=F12d0zHTRgL0OTjzk4BjJWJ4qTXCFNzxpmGUYQZoP1o=;
 b=qfNj8JOPYeivSdrB+xIAl9GfGPZVr55QOfyn2IQi+fJz/Ke1I7OWG8BDiUjoUGWssL
 J+GiJEvzcRUvAUxRzjZo+sSQqOCPTdqOnNPAfSf3AJNsHghZBgr4iUorohgBoBcYoFHh
 pW9SFtJU/88G6KAU7p5CTpPIGxXsTY2KUU4hbbcIDPFoxNsgu1juK5PM8sDXY9yeVMnC
 uGwEnmlKyJr5XJJLF7epHapKBNB4gopZ1ck4/1IK3YlyDcJexiNi6P0WHEthzCcoVXMn
 vcg8OkKIrqFzGjT1cUKSpKHctyP8hr5n3KOoo5c1RvsWMGMDdN7I5ovO5oDlhVIrSMgE
 lT6Q==
X-Gm-Message-State: AOAM5334ePIHGkQDFH2xmjTbae23EvlaIELApSDwf+L96PLthmmfSCys
 XpL50ypbGvaAFi0X7A1itKIFf1bg/9o3o2rEeGrgZ9w1WUu4VC3r38UC289zH3Dw+PGUhuJ7WnW
 dNEW2WVmlAQUJuoo=
X-Received: by 2002:adf:b608:0:b0:1f0:5928:2e0e with SMTP id
 f8-20020adfb608000000b001f059282e0emr7607789wre.528.1647012562843; 
 Fri, 11 Mar 2022 07:29:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwVGMpr08LF1f+zy2ghQz+p9mB8N+HtgI9D0zVKKSkheebBqD7CydnkkdJKzo67VSz/nbNieg==
X-Received: by 2002:adf:b608:0:b0:1f0:5928:2e0e with SMTP id
 f8-20020adfb608000000b001f059282e0emr7607781wre.528.1647012562646; 
 Fri, 11 Mar 2022 07:29:22 -0800 (PST)
Received: from redhat.com ([2.53.27.107]) by smtp.gmail.com with ESMTPSA id
 p2-20020a1c7402000000b0038159076d30sm10489032wmc.22.2022.03.11.07.29.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Mar 2022 07:29:22 -0800 (PST)
Date: Fri, 11 Mar 2022 10:29:18 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v2 07/11] tests/acpi: update expected data files
Message-ID: <20220311102909-mutt-send-email-mst@kernel.org>
References: <20220311053759.875785-1-kraxel@redhat.com>
 <20220311053759.875785-8-kraxel@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220311053759.875785-8-kraxel@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-devel@nongnu.org,
 Ani Sinha <ani@anisinha.ca>, Igor Mammedov <imammedo@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Mar 11, 2022 at 06:37:55AM +0100, Gerd Hoffmann wrote:
> The switch to edk2 RELEASE builds changes the memory layout a bit,
> resulting in a acpi table change.
> 
>  DefinitionBlock ("", "SSDT", 1, "BOCHS ", "NVDIMM", 0x00000001)
>  {
>      Scope (\_SB)
>      {
>          Device (NVDR)
>          {
>              Name (_HID, "ACPI0012" /* NVDIMM Root Device */)  // _HID: Hardware ID
>              Method (NCAL, 5, Serialized)
>              {
>                  Local6 = MEMA /* \MEMA */
>                  {
>                      Return (NCAL (Arg0, Arg1, Arg2, Arg3, 0x02))
>                  }
>              }
> 
>              Device (NV02)
>              {
>                  Name (_ADR, 0x03)  // _ADR: Address
>                  Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
>                  {
>                      Return (NCAL (Arg0, Arg1, Arg2, Arg3, 0x03))
>                  }
>              }
>          }
>      }
> 
> -    Name (MEMA, 0x43D10000)
> +    Name (MEMA, 0x43F50000)
>  }
> 
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>

Reviewed-by: Michael S. Tsirkin <mst@redhat.com>

> ---
>  tests/data/acpi/virt/SSDT.memhp | Bin 736 -> 736 bytes
>  1 file changed, 0 insertions(+), 0 deletions(-)
> 
> diff --git a/tests/data/acpi/virt/SSDT.memhp b/tests/data/acpi/virt/SSDT.memhp
> index 375d7b6fc85a484f492a26ccd355c205f2c34473..4c363a6d95a7e2e826568c85f5719127748e7932 100644
> GIT binary patch
> delta 22
> dcmaFB`hb-yIM^lR0TTlQqx43uD@;sZodHo~2HXGu
> 
> delta 22
> dcmaFB`hb-yIM^lR0TTlQqy0v%D@;rmodHrj2HXGu
> 
> -- 
> 2.35.1


