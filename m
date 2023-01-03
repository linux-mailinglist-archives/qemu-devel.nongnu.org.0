Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 138BD65BFAA
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Jan 2023 13:10:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pCg7w-0000lr-9w; Tue, 03 Jan 2023 07:10:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pCg7u-0000la-2M
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 07:10:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pCg7s-000838-II
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 07:10:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672747839;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Dk0zIfE1rr1oDEzDNVDwKPigK+zN3/cNJR4/t16GaH8=;
 b=RWZoNP5sAmHNS+91KSvItSc7JWBk7A/QzDTL+XgrxD5o5+OPTogfLblrs3yXZI1zhFFd49
 ijVYo7kQNaon1dqS6MFKrn2Q1ZDn8OyS8HBhyNFO4kEKIwsQt6/is8NIl+/M1ICNTyeflP
 FDtYnvWt/Eda5kiDlBRaMnm/VocrXvo=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-608-mtMGtWa_OG69qlh722ltOA-1; Tue, 03 Jan 2023 07:10:38 -0500
X-MC-Unique: mtMGtWa_OG69qlh722ltOA-1
Received: by mail-wm1-f72.google.com with SMTP id
 ay32-20020a05600c1e2000b003d9730391b5so13853933wmb.5
 for <qemu-devel@nongnu.org>; Tue, 03 Jan 2023 04:10:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Dk0zIfE1rr1oDEzDNVDwKPigK+zN3/cNJR4/t16GaH8=;
 b=R2oAwo1MemT/re4/aJsta0uRe788XAlmk27SuHKICazpYlAkGOjb4Zyl7OdDrqVen1
 UxEW2t9swb02dwXa3PdSGxYS1pov8WfO8X/1bwWMSySmaXvd9+AP6PL9CwdKaQt+Vl4j
 VF7qvCG8cBDVg2OQivJWpy0DF1z1L4fBF3N6eoCHEj+6VFjOHwxfrh/fgQQeEcr8yUyt
 rjIyLGCXePhCubYRaBVDSubIANJKlep9X/zhEkM3b4UH7D0w8apEU+sqWFcaUnBoDUU1
 vm0NyVXilYE4IAGlwuPySPpJa+vMNk5Xyheyf6M7vQRGVRB3b1Or3pHIGUfs9ZxIdQcq
 VH0A==
X-Gm-Message-State: AFqh2kq14AZx0UIBpxm/wrRtf5EZtkxSdvKs0d8/gZmVdo5FdJ48pvQ9
 70IBAx73FrOMHd+xJuXb3f02gyEcHj1wywKdXtucBsN5O7Ouk6OhOwM64QEuoVIAGFYONUYLy/y
 fnfQE4i9BMbJAWhk=
X-Received: by 2002:a05:600c:21cc:b0:3d5:79bb:d7da with SMTP id
 x12-20020a05600c21cc00b003d579bbd7damr31033842wmj.18.1672747837351; 
 Tue, 03 Jan 2023 04:10:37 -0800 (PST)
X-Google-Smtp-Source: AMrXdXv6Ti9c7+gP2TsA6oqLxI6Za0F3WrNuarwUZ6E7N/QavxBi8i+b14NYQh+Eqc3Tj0fqBL5i8A==
X-Received: by 2002:a05:600c:21cc:b0:3d5:79bb:d7da with SMTP id
 x12-20020a05600c21cc00b003d579bbd7damr31033820wmj.18.1672747837113; 
 Tue, 03 Jan 2023 04:10:37 -0800 (PST)
Received: from [192.168.0.5] (ip-109-43-177-55.web.vodafone.de.
 [109.43.177.55]) by smtp.gmail.com with ESMTPSA id
 u13-20020a05600c19cd00b003d1d5a83b2esm49160625wmq.35.2023.01.03.04.10.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Jan 2023 04:10:36 -0800 (PST)
Message-ID: <aab357ff-605b-3d79-9c67-a15a2868ef54@redhat.com>
Date: Tue, 3 Jan 2023 13:10:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 09/10] libqtest: make qtest_qmp_add_client work on win32
Content-Language: en-US
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>, Eric Blake <eblake@redhat.com>,
 Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <20230103110814.3726795-1-marcandre.lureau@redhat.com>
 <20230103110814.3726795-10-marcandre.lureau@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230103110814.3726795-10-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.103, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 03/01/2023 12.08, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> Use the "get-win32-socket" function to pass an opened socket to QEMU,
> instead of using "getfd", which relies on socket ancillary FD message
> passing.
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   tests/qtest/libqtest.h |  5 ++---
>   tests/qtest/libqtest.c | 16 ++++++++++++++--
>   2 files changed, 16 insertions(+), 5 deletions(-)

Acked-by: Thomas Huth <thuth@redhat.com>


