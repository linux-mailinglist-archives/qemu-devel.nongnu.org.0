Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD9D7577E94
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 11:27:21 +0200 (CEST)
Received: from localhost ([::1]:55054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDN28-0003qH-Rx
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 05:27:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oDN0H-0002Ct-Mh
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 05:25:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20816)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oDN0F-0007rl-IM
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 05:25:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658136322;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kIyVk9bbZarcjeeY9bgqvPuwyYR8Jk+BAunzdz/GBAA=;
 b=TaBHCLf2mn9HzYeJN91UNOXff2t4rRul/bK33VyMOHPp6xEWS9T2XrepabbTxYo3bdhNkk
 SX55BmPYdRjbfAPhmpT3wWkTAXYHrve7ZUAik6lyhXElWkXYwbkAD0UvC2qCySZSdW6Fd1
 WzDTK1SXvMgDTZISbAeLlxUajcFHO8s=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-442-t4Qiqrk6M4aqPRIyFVr4CA-1; Mon, 18 Jul 2022 05:25:15 -0400
X-MC-Unique: t4Qiqrk6M4aqPRIyFVr4CA-1
Received: by mail-wm1-f71.google.com with SMTP id
 a18-20020a05600c225200b003a30355c0feso3734238wmm.6
 for <qemu-devel@nongnu.org>; Mon, 18 Jul 2022 02:25:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=kIyVk9bbZarcjeeY9bgqvPuwyYR8Jk+BAunzdz/GBAA=;
 b=tZN/VohWco8Q+Bn5Zx4aOwv9AFdwpkyfCq9njNhWCqU24Re4fugeLNXaxE7EJ5Z9jJ
 1uhzHE13PVF0jf9GYmxmCghRBmTlnzZ1QZ8fEQunTU5tokvzI24x/atNYmbP5txVdjn1
 mVV9gESVXc/+BEO+zyCLxfoGmJs9QEPzXh4hWqj0LgecNi+Pp2IU1xTNarBOLgamE6ib
 /ipxM36n1T0oQY4BmqxLjKsVdxePBLVpLg3dvujinbZjL6HF+Fy/rqC/aHbIKHYPVVm3
 hh1PvQrktlrP4rJR0NCZGKbe419oKs/WNZftfwD/3W0qBe0ftpWb8TQJ1zvx+eBJVOss
 pMUA==
X-Gm-Message-State: AJIora8aMH3Oew79Cn+ANQmkiTA/H5BRTaYhnCzQmTUlvFLCpsYs826k
 XX58Q6UISelbgohLQIArSaC0fu2W/K/B8ySim0hH07Lkph3jzIbnG/Ou56x9nieTmYQwIU1kY8h
 AVp0lYpa61ZaLkes=
X-Received: by 2002:a05:6000:168e:b0:21d:b5ed:381d with SMTP id
 y14-20020a056000168e00b0021db5ed381dmr21486040wrd.241.1658136314437; 
 Mon, 18 Jul 2022 02:25:14 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tL1AiaG+EAN4uBtldzJLBk1X17UnSw/pFUUrkoTRfWYeVYDsmDrc3x21JbNh4KlRCx6M43OQ==
X-Received: by 2002:a05:6000:168e:b0:21d:b5ed:381d with SMTP id
 y14-20020a056000168e00b0021db5ed381dmr21486016wrd.241.1658136314107; 
 Mon, 18 Jul 2022 02:25:14 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-177-121.web.vodafone.de.
 [109.43.177.121]) by smtp.gmail.com with ESMTPSA id
 v130-20020a1cac88000000b003a046549a85sm18383251wme.37.2022.07.18.02.25.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Jul 2022 02:25:13 -0700 (PDT)
Message-ID: <30e66f70-a004-6789-d66a-351becaa48e2@redhat.com>
Date: Mon, 18 Jul 2022 11:25:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 0/3] target: RFC: display deprecation note for '-cpu help'
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20220714150735.1835166-1-berrange@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220714150735.1835166-1-berrange@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 14/07/2022 17.07, Daniel P. Berrangé wrote:
> When querying '-cpu help' there is no presentation of fact that a
> CPU may be deprecated. The user just has to try it and see if they
> get a depecation message at runtime.  The QMP command for querying
> CPUs report a deprecation bool flag, but not the explanatory
> reason.
> 
> The Icelake-Client CPU (removed in 6df39f5e583ca0f67bd934d1327f9ead2e3bd49c)
> handled this by modifying the '.notes' section to add the word
> 'deprecated':
> 
>              {
>                  .version = 2,
>                  .note = "no TSX, deprecated",
>                  .alias = "Icelake-Client-noTSX",
>                  .props = (PropValue[]) {
>                      { "hle", "off" },
>                      { "rtm", "off" },
>                      { /* end of list */ }
>                  },
>              },
> 
> This relies on the person deprecating the CPU to remember to do this,
> and is redundant when this info is already expressed in the
> '.deprecation_note' field.
> 
> This short series suggests just modifying the '-cpu help'
> formatter so that it displays the full deprecation message
> 
> eg
> 
> $ qemu-system-x86_64 -cpu help:
> Available CPUs:
> x86 486                   (alias configured by machine type) (deprecated: use at least 'Nehalem' / 'Opteron_G4', or 'host' / 'max')
> 
> I wonder if this is too verbose, and we should just do a
> concise flag like approach, similar to QMP:
> 
> $ qemu-system-x86_64 -cpu help:
> Available CPUs:
> x86 486                   (alias configured by machine type) (deprecated)
> 
> leaving the full message to be displayed at runtime ? I'm slightly
> inclined to the simpler more concise output.

I'd prefer to keep it short here and just write "deprecated" without the 
reason. Otherwise this will overflow the lines and break the readability of 
the output. And it's also what we're also doing for "-machine", e.g.:

$ ./qemu-system-ppc64 -M help | grep deprecate
taihu                taihu (deprecated)
$ ./qemu-system-ppc64 -M taihu
qemu-system-ppc64: warning: Machine type 'taihu' is deprecated: incomplete, 
use 'ref405ep' instead

  Thomas


