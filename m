Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7F3C542157
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 07:49:24 +0200 (CEST)
Received: from localhost ([::1]:42756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyoZH-0000KM-WB
	for lists+qemu-devel@lfdr.de; Wed, 08 Jun 2022 01:49:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nyoWp-0007vG-60
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 01:46:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45621)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nyoWh-0005xv-Vr
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 01:46:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654667194;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I4dclGms8Zq0D4fm1XveYvy/Ws6yS6PpPMoOUcxmw2c=;
 b=OxlbroXpVNcWcudEAd8mUgcNvqrsHrCGnrkAkgoaDdLbnujdwSF/ThdFwcFatHsmxR5uBb
 IgQbxs32KeJjXWR5VFu/vemJ0XUHSnOjg9zF1qtIlwD85aJyB8InDr2Oek9DCm1hQRP+lo
 yTKPnyQbTZ+M4CG6uzdbE9lSYCg4Xhw=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-567-EPyulm2VNaSyeS-BrBSvyQ-1; Wed, 08 Jun 2022 01:46:31 -0400
X-MC-Unique: EPyulm2VNaSyeS-BrBSvyQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 i10-20020a5d55ca000000b002103d76ffcaso4411451wrw.17
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 22:46:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=I4dclGms8Zq0D4fm1XveYvy/Ws6yS6PpPMoOUcxmw2c=;
 b=XoCRuqeI2HIW8apEY3bHndhh4s7ysAffEURcWgcyrdLK0a80BzmyvIsVRPS+9O8YyO
 BcKED1OAgfIvefEwkYKrjLV397lUIgtimJmweSsh/mv9YTEwNJ3MvYP8qdzDsghdyIhV
 zIyp2J+H0fEfULlkMUmHy6J4bHBqeWcWgXxBME23l+qYskOibixDzoTM3Eoq98/MAxDZ
 6Cdj2xrcqBGARsvmROzq/r1vnyuz+ShT4HWVvy3ktrjy2KH65GDDx28W/uaQfHreu5fo
 iTjVxv+aUosOStyoa78G603DSceuGLkSvWW8RPLudxLyceZ5TeuYVsLFgNBuNyaAaNVd
 GRWQ==
X-Gm-Message-State: AOAM533wHdFzeTCbO8z4a/GOj1orC6ot26xJJoPwI9P3FCGw9oqsdWs0
 lmTzjOpYKi1oTcC3GtBVgsKhLYwq+R7j+cyV/2R4fRA1F8v+Z1uUeSLdXIIEE8gURki4Ib+pN5a
 SN/X6n2skL74KXNw=
X-Received: by 2002:a7b:c758:0:b0:39c:44ce:f00f with SMTP id
 w24-20020a7bc758000000b0039c44cef00fmr23476353wmk.167.1654667190632; 
 Tue, 07 Jun 2022 22:46:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy9C9tH4mhB98z2E5GGv089pHy4jrN6A30h+58MTd9KYubrftaLkBR3yZN5eEIlVb0Udj/RfA==
X-Received: by 2002:a7b:c758:0:b0:39c:44ce:f00f with SMTP id
 w24-20020a7bc758000000b0039c44cef00fmr23476334wmk.167.1654667190364; 
 Tue, 07 Jun 2022 22:46:30 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-42-114-66.web.vodafone.de.
 [109.42.114.66]) by smtp.gmail.com with ESMTPSA id
 n16-20020a1c7210000000b0039c4d9737f3sm9337707wmc.34.2022.06.07.22.46.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jun 2022 22:46:30 -0700 (PDT)
Message-ID: <501454fe-1889-d573-2976-27485b22f00b@redhat.com>
Date: Wed, 8 Jun 2022 07:46:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v3 2/4] docs: rSTify MailingLists wiki; move it to QEMU Git
Content-Language: en-US
To: Kashyap Chamarthy <kchamart@redhat.com>, qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, peter.maydell@linaro.org, eblake@redhat.com
References: <20220606164336.245740-1-kchamart@redhat.com>
 <20220606164336.245740-3-kchamart@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220606164336.245740-3-kchamart@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 06/06/2022 18.43, Kashyap Chamarthy wrote:
> This document is referred to from the GettingStartedDevelopers wiki
> which will be rSTified in a follow-up commit.
> 
> Converted from Mediawiki to rST using:
> 
>      $> pandoc -f Mediawiki -t rst MailingLists.wiki
>          -o mailing-lists.rst
> 
> The only change in this coversion is that I have removed the users
> mailing list, as it will be referred to from a different document from
> the docs/about/ directory.

Which document? I didn't spot it in the other two patches...?

  Thomas


