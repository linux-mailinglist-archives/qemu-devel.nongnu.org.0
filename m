Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AFA033D102
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 10:42:34 +0100 (CET)
Received: from localhost ([::1]:52396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lM6Dh-0006Vp-84
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 05:42:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lM6Cj-0005yi-25
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 05:41:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:21218)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lM6Cg-0002jN-BP
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 05:41:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615887689;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/xc4JNkX9F1u1/WOvcyVrJQtHfpOtCt4+VPAjm6z0e8=;
 b=Tc/lJ7GiE2fwhJwia4OYBEIKu6Eitu8CJaaHM68PYi//QtGLDRQJzIssV1OfTOiRGFupHR
 h+g6mrdeu9P1bvcoh1izVc6m8s/NK0pEnsViNPkI8J5P9Pb8xKqpdnSiryCOQ9GCSdnlqK
 37uH6Da4vMIjXoUsCN5rVBzN1iIwUbY=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-484-0-z-mOLaOFyijEW9V9qCHA-1; Tue, 16 Mar 2021 05:41:23 -0400
X-MC-Unique: 0-z-mOLaOFyijEW9V9qCHA-1
Received: by mail-ej1-f71.google.com with SMTP id mj6so13357518ejb.11
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 02:41:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/xc4JNkX9F1u1/WOvcyVrJQtHfpOtCt4+VPAjm6z0e8=;
 b=I+3PHSWk49GveptkAY6Sg0eW6xNQgAK3fMMxeH6l/O1KseVVOoHbX5bIoMWbC2sPCL
 hjb4hSxPKxQCpgTiJ3z4ataHAl8f5ITfsHEAjHqztCQg2ROKnNVQOTtur7zrjqwNC5BB
 K2iwsuW3A1Ew/LHR0VW2X4noatb62uaWySka9KnchBeaUxszC6myhYWB1zQjk52ZdoG/
 /HSr2CGHzCk2CiZd9/BczYPtjrvMdliXWXkxFxkjtT/AN1mTvqXO/bEa1kps0/RPGm7i
 VyXAzquKS42fV6wQojaEsrmI5VPq3sButOqhlmYgEyEUGoRaag0WAu8CG3wQw+Umfzmd
 2kOg==
X-Gm-Message-State: AOAM530GiD0ROuCo3fpQnwet0t5LgPVQzMJ92vkdyiAwKVAjPIsZzZ3B
 JJFYCMI8hNZc3H5DH/p8TX4nbeLjjs8zD3cfI9Gnttyxhjm97FsHOIfz5ekIn5ieIXxFEFJMIsu
 i0JAsEVTuzPH0C+o=
X-Received: by 2002:a17:906:8043:: with SMTP id
 x3mr28075536ejw.149.1615887682470; 
 Tue, 16 Mar 2021 02:41:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyfukynq69S4NiJ3IoZzBxWvaVJmQKHa1hoiGP+H2a3GUxB17dk+6z3TszgdvqKe6rQRjP+rw==
X-Received: by 2002:a17:906:8043:: with SMTP id
 x3mr28075517ejw.149.1615887682256; 
 Tue, 16 Mar 2021 02:41:22 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id q16sm2729611edv.61.2021.03.16.02.41.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Mar 2021 02:41:21 -0700 (PDT)
Subject: Re: libqemuutil
To: Thomas Huth <thuth@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org
References: <87zgz38o0v.fsf@dusky.pond.sub.org>
 <0c90e3ce-6be7-291f-3121-b6d7d725bcdf@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <0976f48e-090c-b00e-ac96-286f440e276b@redhat.com>
Date: Tue, 16 Mar 2021 10:41:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <0c90e3ce-6be7-291f-3121-b6d7d725bcdf@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16/03/21 10:24, Thomas Huth wrote:
> A very, very quick-n-dirty band-aid is likely to mark the function in 
> stubs as weak:

This probably does not work on some of our porting targets (OS X)?  The 
static library was introduced as a low-tech alternative to weak symbols, 
IIRC.

Paolo


