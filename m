Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C44E8487666
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 12:21:39 +0100 (CET)
Received: from localhost ([::1]:43860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5nJS-0002Nx-UK
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 06:21:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1n5n1s-0006Nx-6C
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 06:03:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:47475)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1n5n1q-0001ib-53
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 06:03:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641553405;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t1NahwZAZVKXUqP+ktvynLek2xGA7EbuwjjapKiepkI=;
 b=YL6VQeLR5LF/vYgjndcDh0/7MZXRi/iZQkOygC7MgiGnLX6Q2D5mUX+hHP2q+feuXYP73N
 yqxw57+7BoxLz2cz5cRSvEncuih2hPWhb+MD9uyy6DSzvExdD8ktMeLjjEABqAJ5IK62EJ
 bs1b62cUUqlibDHMO2s/hAy4RwIGX88=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-441-ojxRoI9-OzGyp_qDu8MlNg-1; Fri, 07 Jan 2022 06:03:24 -0500
X-MC-Unique: ojxRoI9-OzGyp_qDu8MlNg-1
Received: by mail-wr1-f72.google.com with SMTP id
 w2-20020adfbac2000000b001a540eeb812so1421562wrg.8
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 03:03:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=t1NahwZAZVKXUqP+ktvynLek2xGA7EbuwjjapKiepkI=;
 b=yEzoEumuDZwUjWX7hOCSHBXfl+l2Y9VrtFH+OmKgjX2d6T0DH5i4RsngVwK0A16dwD
 jrZrtGt5Wtotn13byJ1608Bm2xk5jasw4lPiJT18OpRJSvtIQ3dEYK39mlrzldu174ES
 jAM6y4p5xksITAl7e5KvZBSd35nvXf4a9LCNO8CQ6iXQV7H26ASh5CbrbijSfmKjq2yj
 mnjG0swEDtKNF7dHQBxv1niN7LW3KzyX8VUCGjK+NCBmlOXUz+4auHy/LEOPt0NxYcNc
 tZswqwKixJl0uFJG6BGMgcjDBrz/ZOyr/2Lqd6Fi2ThNxrVtw4Ui0y4Q0+V+0rpqUzLy
 1yVQ==
X-Gm-Message-State: AOAM532LDTJMgmGDP4gW6TRDeL/kOnZQee4i1C/MTc3td0GVAW983uLN
 VIVQgNb/zT2RcAUvRIR3eAhHE1gh3MyGu7JsNOoLwcjAnkdvC1tfZg4v2zBaBeMwtExyItVFjk/
 ld6gX+b0/J+lChqU=
X-Received: by 2002:adf:f58b:: with SMTP id f11mr6144896wro.77.1641553403016; 
 Fri, 07 Jan 2022 03:03:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxiWOYKjlG0aBSeSn3neef76lnZ/o6UP/FGbFAxPPieW3fPV3B30ohOuy7CCkyzcPDdzOCWOw==
X-Received: by 2002:adf:f58b:: with SMTP id f11mr6144886wro.77.1641553402838; 
 Fri, 07 Jan 2022 03:03:22 -0800 (PST)
Received: from [192.168.8.100] (tmo-098-68.customers.d1-online.com.
 [80.187.98.68])
 by smtp.gmail.com with ESMTPSA id o3sm5165553wry.98.2022.01.07.03.03.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Jan 2022 03:03:22 -0800 (PST)
Message-ID: <f99727e8-8e37-11eb-a0f0-540c84335814@redhat.com>
Date: Fri, 7 Jan 2022 12:03:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2] q800: fix segfault with invalid MacROM
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <20220107105049.961489-1-laurent@vivier.eu>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220107105049.961489-1-laurent@vivier.eu>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.691, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 07/01/2022 11.50, Laurent Vivier wrote:
> "qemu-system-m68k -M q800 -bios /dev/null" crashes with a segfault
> in q800_init().
> This happens because the code doesn't check that rom_ptr() returned
> a non-NULL pointer .
> 
> To avoid NULL pointer, don't allow 0 sized file and use bios_size with
> rom_ptr().
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/756
> Reported-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Laurent Vivier <laurent@vivier.eu>
> ---
>   hw/m68k/q800.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/m68k/q800.c b/hw/m68k/q800.c
> index e4c7c9b88ad0..55dfe5036f40 100644
> --- a/hw/m68k/q800.c
> +++ b/hw/m68k/q800.c
> @@ -672,12 +672,13 @@ static void q800_init(MachineState *machine)
>   
>           /* Remove qtest_enabled() check once firmware files are in the tree */
>           if (!qtest_enabled()) {
> -            if (bios_size < 0 || bios_size > MACROM_SIZE) {
> +            if (bios_size <= 0 || bios_size > MACROM_SIZE) {
>                   error_report("could not load MacROM '%s'", bios_name);
>                   exit(1);
>               }
>   
> -            ptr = rom_ptr(MACROM_ADDR, MACROM_SIZE);
> +            ptr = rom_ptr(MACROM_ADDR, bios_size);
> +            assert(ptr != NULL);
>               stl_phys(cs->as, 0, ldl_p(ptr));    /* reset initial SP */
>               stl_phys(cs->as, 4,
>                        MACROM_ADDR + ldl_p(ptr + 4)); /* reset initial PC */

Looks nicer than v1, indeed.

Reviewed-by: Thomas Huth <thuth@redhat.com>


