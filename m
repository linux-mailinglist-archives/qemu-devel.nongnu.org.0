Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45BC63E2DEC
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Aug 2021 17:48:39 +0200 (CEST)
Received: from localhost ([::1]:44460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mC25O-0003lI-5S
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 11:48:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mC24W-00033V-Bc
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 11:47:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24127)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mC24V-0001SV-3E
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 11:47:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628264862;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lZuVqJuX8Q495aRQUrn2KSLvNk8+0Kh6WfGAXWaMcMU=;
 b=ceIkppOKz6IFizjT34R/TlueXrhSPIuyo95xYxB2M0Bv/nzo8j0ig5i72T53glJFulHx7p
 J5Tj5MxoPr+Usg2FV8+NYMaZnDz0K0/jDKPapexGwJs/D3XgP3+TfbAElj3PGCAuyHwK33
 JJWcS19W2dS9i9mRG5x6nuhFmbFJwZE=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-218-RJDnwaG1OhuHGp1FqMo_Jw-1; Fri, 06 Aug 2021 11:47:39 -0400
X-MC-Unique: RJDnwaG1OhuHGp1FqMo_Jw-1
Received: by mail-ej1-f69.google.com with SMTP id
 lu19-20020a170906fad3b029058768348f55so3277441ejb.12
 for <qemu-devel@nongnu.org>; Fri, 06 Aug 2021 08:47:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lZuVqJuX8Q495aRQUrn2KSLvNk8+0Kh6WfGAXWaMcMU=;
 b=c8gYQKCzDE5McRfg63CFACd2Gm2llKlC4UdIvWEmRm6zNQVn0zBF37uPtJxS8TQbzx
 kEzqhHt4vsVj7MCCnnK3FeubyaJLn+2eWZT23sRZoy4vX1xuK7RA4W3pH7bTQLIKR2vd
 ZUp6MbxZ3/p4UHHoTX1+ZchCHD+sqkpCyyonF5CADUuR72R/gPAVrxfSN/2eAQ2EUvH3
 /cXLcYDt8zODx+Kb2229JTZyfYZfxTChixtd2JZqYho9ukt1yOlJ3G37mLekcQcofuOg
 EKOAwW+rYPp4itWRaP33bBnmIDR+I8IpA5pAToZYQrsVRrl3/qbJYgg6L7oHaYZoeA1R
 2vww==
X-Gm-Message-State: AOAM530H/WMftpmVZZ+hplylOHJ/V1HCUcKCvvGATV2utYLN+KY7Ehqs
 qbwzEj3xutW0z4FQW98XnnmTCr1oTzgYOEbnCCUS4/4hm4WDc+/O03iUJgB1TZntSHrkW0FlgqA
 xNRIHDfHk37GWjhg=
X-Received: by 2002:aa7:c956:: with SMTP id h22mr13690938edt.378.1628264857862; 
 Fri, 06 Aug 2021 08:47:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx26SPSxsZtgLqlXwO/RkuDplycZNA2wPy6FaCLtyMd1oXQDa/bdSxY0thg9exT0aYShIue9A==
X-Received: by 2002:aa7:c956:: with SMTP id h22mr13690914edt.378.1628264857655; 
 Fri, 06 Aug 2021 08:47:37 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id cf16sm3997047edb.92.2021.08.06.08.47.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Aug 2021 08:47:37 -0700 (PDT)
Subject: Re: [PATCH 3/6] docs/about/removed-features: Document removed CLI
 options from QEMU v3.1
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20210806151012.103108-1-thuth@redhat.com>
 <20210806151012.103108-4-thuth@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <4beeee5d-259f-1179-4adb-ef2220adcd75@redhat.com>
Date: Fri, 6 Aug 2021 17:47:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210806151012.103108-4-thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -60
X-Spam_score: -6.1
X-Spam_bar: ------
X-Spam_report: (-6.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.619, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Daniel P . Berrange" <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 06/08/21 17:10, Thomas Huth wrote:
> +``-balloon`` (removed in 3.1)
> +'''''''''''''''''''''''''''''
> +
> +The ``-balloon option`` has been replaced by ``-device virtio-balloon``.

Maybe the ``-balloon virtio`` option?  While ``-balloon none`` was a 
no-op and had no replacement.

Paolo


