Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 565106AB7EB
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 09:06:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZ5qp-00047C-C3; Mon, 06 Mar 2023 03:05:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pZ5qE-00040v-Jl
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 03:05:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pZ5qB-00067D-03
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 03:05:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678089901;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SFXmeCBxn8HWQkQJSm8XTc+1vZw5W6c2ztuHcxJr5gE=;
 b=HSAN57WtlV5USp7qQGITeGSNn/5GZ0WgFp/mvpdkmbHtd7jyBvT4/pn1Sjcb4eLF4iz8Tt
 vxacqwFBTVg8v1ZW1y4wuXNV/y3wPABCidiwk2KYjItDhLvVhsuAbUkVQyEry24mubLIvK
 SdgeSamA3FlCeOgJc1cxwNnaQwwIaVk=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-340-AQk8xrv4Nm--F-gZnPEtXg-1; Mon, 06 Mar 2023 03:04:58 -0500
X-MC-Unique: AQk8xrv4Nm--F-gZnPEtXg-1
Received: by mail-ed1-f70.google.com with SMTP id
 b1-20020aa7dc01000000b004ad062fee5eso12392580edu.17
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 00:04:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SFXmeCBxn8HWQkQJSm8XTc+1vZw5W6c2ztuHcxJr5gE=;
 b=CZlH/m/f7ELC75L6wznTiu1jNT58ozESXP+nh7NYXg7sS0TwWwnlnKldDnEsZ83aDX
 KFlWvD1WF+cQzP85FpyMzGr57CPkoVx1ucDj/Ed2fcVsJwBKoq8aegUWm3zbx1cl2F3k
 zemBsgLvPglDkqwoapaZpTXFAAVJ/pEhmQ0LiOPKBBKnrj8Se/AFBg85h9/BHqNeoX8c
 4OwCHHdXCRtRI55pzuCzyHJQuHw/YvGGdESmTjsIO7u8gkpRlwHi9GsFy2UQrh7E/XQg
 6LSPBWV2aAlxQOVz9FRBn+l9Cni1ISZBL0CouO+GEwVeAl/9Jy4qCJ8E2iMNVq04UTHL
 5T3g==
X-Gm-Message-State: AO0yUKUiK0U0adjdcBbrt8VD15+2sOpoF4i+CymW6Q8nXfZoWSWVvX32
 Pl5w5TAIENP/SXu5EAV8/u6Pk+3Ivpoi9QsgQJ1IyuiN/Ek/XczF1WhxrmhaT9qE3ajeJD4XNg0
 2lGlstZXf3JMUlVs=
X-Received: by 2002:a17:907:80e:b0:885:6a2e:f941 with SMTP id
 wv14-20020a170907080e00b008856a2ef941mr12576649ejb.54.1678089897161; 
 Mon, 06 Mar 2023 00:04:57 -0800 (PST)
X-Google-Smtp-Source: AK7set+N82/9h/jGcXg87CwC0EtqE9Bq1CyMtQSo2FHEluBRw/c2y1TusZB4hUTDR8U4zRvsZcdLmw==
X-Received: by 2002:a17:907:80e:b0:885:6a2e:f941 with SMTP id
 wv14-20020a170907080e00b008856a2ef941mr12576615ejb.54.1678089896817; 
 Mon, 06 Mar 2023 00:04:56 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 i9-20020a1709063c4900b008d427df3245sm4232381ejg.58.2023.03.06.00.04.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 00:04:56 -0800 (PST)
Message-ID: <cd4d82c4-6161-493b-073b-235141d6337a@redhat.com>
Date: Mon, 6 Mar 2023 09:04:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 00/16] win32: do not mix SOCKET and fd space
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 qemu-devel@nongnu.org
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Jason Wang <jasowang@redhat.com>, Michael Roth <michael.roth@amd.com>,
 qemu-arm@nongnu.org, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, armbru@redhat.com,
 Peter Maydell <peter.maydell@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Fam Zheng <fam@euphon.net>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>, Joel Stanley <joel@jms.id.au>,
 Hanna Reitz <hreitz@redhat.com>
References: <20230221124802.4103554-1-marcandre.lureau@redhat.com>
 <CAMxuvawu4EWKpw_8sHGU-hVKeX_wZzpWqaRJo6kjbkYB45VWjw@mail.gmail.com>
Content-Language: en-US
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <CAMxuvawu4EWKpw_8sHGU-hVKeX_wZzpWqaRJo6kjbkYB45VWjw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 3/2/23 15:09, Marc-André Lureau wrote:
> 
> 
>     v3:
>     - fix closesocket() to prevent CloseHandle() from close()
>     - fix direct closesocket() usage (#undef closesocket before)
>     - add a test for &error_warn
>     - add r-b tags
> 
> ping  (I am missing reviews, thanks)

I'm going to queue this series today if that's fine for you---thanks for 
reminding!

Paolo


