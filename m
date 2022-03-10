Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBEA84D50FA
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 18:57:08 +0100 (CET)
Received: from localhost ([::1]:52210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSN2C-0008PP-0D
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 12:57:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nSN0h-0006rp-1b
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 12:55:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49352)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nSN0f-0000v8-Du
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 12:55:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646934932;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PdDmE8hMRMyIY5U24Y3b2yJ7fjk2BxSaK8PFXLCKIpA=;
 b=Ra5dPmsWK9jqyHpyorE8R5Cva6meaywpNq8V1NCljGxdz34ThSpovAtgNIYGWluTpI9b7q
 FFt4dlAST5IqH0JrdLORVbK2ezIdtNOqqMcS3ve+mvWSgxFvQtDgu9QywH4RMGsv0LjEPm
 en009g4xzuV7KYQW48AznxzuexQvxK4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-494-kCxQznSIM1e0becVm20kgw-1; Thu, 10 Mar 2022 12:55:31 -0500
X-MC-Unique: kCxQznSIM1e0becVm20kgw-1
Received: by mail-wr1-f72.google.com with SMTP id
 t15-20020adfdc0f000000b001ef93643476so1944558wri.2
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 09:55:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=PdDmE8hMRMyIY5U24Y3b2yJ7fjk2BxSaK8PFXLCKIpA=;
 b=GKFBwA1EBa0uCXgp6xty2JrNBv5OBwxusL+XoJijHdRIw9wJ/95n5EP2aaVZIsvei8
 xhtoOahHG6oPCdxR+x+Hr3QijrOzrJ6EQMsAZNw5m05MU1Jzok18aUrj19aQW3Dwt5Gy
 IfV1m0heJpA4iQdrShsEvxjiiXDOPaxyBFooEbre40tUdBs9XMX7GuST0vMnr/C9WnPw
 domiU3dNfsiVzVdEeEIE+RnmwmgPmvWCdS57J2sm2rDrMvlFfFwMFksQJnnJ9D+dihC0
 ProeD5N6uVSzq1qMX6oZ9Vo6YUXPN2NMbMM3sCmRS8/Pv6DzlWeyQq90Dbf+r9q0jhQu
 BnKw==
X-Gm-Message-State: AOAM533a3+DV5LIQkFcv5WyqzsJI8fyG8e88ZbQQ9wSJ46Sy4lnOU1pg
 ePKgLEF3MN3HZOe6Ncagd3FvgG9he8lD+Mffrcunun564xAql/2SMqJO24jP4YGhqiza0tid5eY
 kTqVUl8ewHblkHOk=
X-Received: by 2002:adf:c188:0:b0:1e6:8ecb:ea5a with SMTP id
 x8-20020adfc188000000b001e68ecbea5amr4393186wre.711.1646934930299; 
 Thu, 10 Mar 2022 09:55:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxacsvRu7Tm8O0XHEWl/foBOEUoajFzpMnrjSVBxlrHGsJnk1mlpx+6uqRQrMWG2B9z2RyTzA==
X-Received: by 2002:adf:c188:0:b0:1e6:8ecb:ea5a with SMTP id
 x8-20020adfc188000000b001e68ecbea5amr4393164wre.711.1646934929936; 
 Thu, 10 Mar 2022 09:55:29 -0800 (PST)
Received: from [192.168.8.104] (tmo-098-218.customers.d1-online.com.
 [80.187.98.218]) by smtp.gmail.com with ESMTPSA id
 r187-20020a1c44c4000000b0038377fb18f8sm7445993wma.5.2022.03.10.09.55.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Mar 2022 09:55:29 -0800 (PST)
Message-ID: <df27854b-8f41-b83c-600e-72e52416c787@redhat.com>
Date: Thu, 10 Mar 2022 18:55:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v4 01/18] ppc/xive2: Introduce a XIVE2 core framework
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
References: <20220228155222.643974-1-clg@kaod.org>
 <20220228155222.643974-2-clg@kaod.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220228155222.643974-2-clg@kaod.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>,
 Frederic Barrat <fbarrat@linux.ibm.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 28/02/2022 16.52, Cédric Le Goater wrote:
> The XIVE2 interrupt controller of the POWER10 processor as the same
> logic as on POWER9 but its SW interface has been largely reworked. The
> interrupt controller has a new register interface, different BARs,
> extra VSDs. These will be described when we add the device model for
> the baremetal machine.
> 
> The XIVE internal structures for the EAS, END, NVT have different
> layouts which is a problem for the current core XIVE framework. To
> avoid adding too much complexity in the XIVE models, a new XIVE2 core
> framework is introduced. It duplicates the models which are closely
> linked to the XIVE internal structures : Xive2Router and
> Xive2ENDSource and reuses the XiveSource, XivePresenter, XiveTCTX
> models, as they are more generic.
> 
> Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
[...]
> +static Property xive2_end_source_properties[] = {
> +    DEFINE_PROP_UINT32("nr-ends", Xive2EndSource, nr_ends, 0),
> +    DEFINE_PROP_UINT32("shift", Xive2EndSource, esb_shift, XIVE_ESB_64K),
> +    DEFINE_PROP_LINK("xive", Xive2EndSource, xrtr, TYPE_XIVE2_ROUTER,
> +                     Xive2Router *),
> +    DEFINE_PROP_END_OF_LIST(),
> +};
> +
> +static void xive2_end_source_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +
> +    dc->desc    = "XIVE END Source";
> +    device_class_set_props(dc, xive2_end_source_properties);
> +    dc->realize = xive2_end_source_realize;
> +}
> +
> +static const TypeInfo xive2_end_source_info = {
> +    .name          = TYPE_XIVE2_END_SOURCE,
> +    .parent        = TYPE_DEVICE,
> +    .instance_size = sizeof(Xive2EndSource),
> +    .class_init    = xive2_end_source_class_init,
> +};

This device can be used to crash QEMU:

$ ./qemu-system-ppc64 -nographic  -device xive2-end-source
qemu-system-ppc64: ../../devel/qemu/hw/intc/xive2.c:966: 
xive2_end_source_realize: Assertion `xsrc->xrtr' failed.
Aborted (core dumped)

Should it be user_creatable = false ?

  Thomas


