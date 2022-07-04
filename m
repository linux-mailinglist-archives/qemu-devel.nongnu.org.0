Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC31A564E48
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 09:08:38 +0200 (CEST)
Received: from localhost ([::1]:55354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8GCD-0003Jc-Co
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 03:08:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o8GAa-0001ui-6p
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 03:06:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34314)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o8GAX-0000Wi-J1
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 03:06:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656918411;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=80AkkjAp18XTPZFerofY+rPAqZtiJ2Z7Mc3PffF/fiE=;
 b=CxHktNl1wb7zx9uWVsDRmcj5kOeT9anTNbHe7biTYfbikUdAErDoSiDOV0H+9vD4OhuTSE
 YbUgZQo9sIJ2maYaFTzuxoz8LCeXpaMTcTFhAuJ0SVecOt/35rHTSqByGTZgnx7OyA4y7X
 86wO8CBZYD10lw7Ku+RwH0jYwlsYWoI=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-519-i8Vu_sjbPIawUXGlxlIRyg-1; Mon, 04 Jul 2022 03:06:45 -0400
X-MC-Unique: i8Vu_sjbPIawUXGlxlIRyg-1
Received: by mail-wr1-f70.google.com with SMTP id
 e7-20020adfa447000000b0021d669c6a76so460491wra.19
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 00:06:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=80AkkjAp18XTPZFerofY+rPAqZtiJ2Z7Mc3PffF/fiE=;
 b=tim5UdWR9oA8uz7xghqLM6lAijtlfpO6rbFWnfMELFOdE7ISLlWUdMQ8irF1n08ioZ
 6VIU357aM9mCh0K+VO8wpA4CxDAN0CfeYaK4NugDjv4FFrRFEqd9oxGvaRkcVy1lxurZ
 j1E/syQq521l9Om1vEElX5ntcEScRQBySWfjYQxX38siNLF6FzShSmbV4TddAWiLbzrA
 dY2++oFtfaPI0PVqVEdvciPSs22YffjjRPp1bSAlRe5NoxvadiQ1MPi2Ou4jOVfz9Q3e
 9w9sgR0eu1ZDurpQBxWq3ZvYyj+yNaZ0smjF+LE4GS1KPnV79fhn9TVAFGk2QOaHc4HL
 t6mg==
X-Gm-Message-State: AJIora8vviT8PKl+Jivrq0r1mu4FaHnFafMczGIie+hIravjlg4e74fh
 k/2zA42RY8L2sqft2oHntGSrI+VPvldAT13nxWmTFBrW5IRYIQ4tev47CwJ7ojrP08DqEXFb2lY
 SFvGScQztssbamUM=
X-Received: by 2002:a05:600c:4fcc:b0:3a1:987c:82c9 with SMTP id
 o12-20020a05600c4fcc00b003a1987c82c9mr10026645wmq.73.1656918404301; 
 Mon, 04 Jul 2022 00:06:44 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sDWf9RQxK+O5Of+lDi72nIA82nFHsqZaO9VjmtiBsBQTElmmc9a9kG6cTwJcib4+RLUywPJw==
X-Received: by 2002:a05:600c:4fcc:b0:3a1:987c:82c9 with SMTP id
 o12-20020a05600c4fcc00b003a1987c82c9mr10026621wmq.73.1656918403903; 
 Mon, 04 Jul 2022 00:06:43 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-178-243.web.vodafone.de.
 [109.43.178.243]) by smtp.gmail.com with ESMTPSA id
 v4-20020a7bcb44000000b0039746638d6esm18168707wmj.33.2022.07.04.00.06.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Jul 2022 00:06:43 -0700 (PDT)
Message-ID: <cd52abfa-b3ff-02fe-e4e4-f9391a1fdad9@redhat.com>
Date: Mon, 4 Jul 2022 09:06:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: API to change the vendor of IDE disk
Content-Language: en-US
To: Alex <wzf_developer@foxmail.com>, qemu-devel <qemu-devel@nongnu.org>,
 qemu-discuss <qemu-discuss@nongnu.org>
References: <tencent_B0895AC50F447E50745E86C5772DE63D3805@qq.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <tencent_B0895AC50F447E50745E86C5772DE63D3805@qq.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

  Hi!

On 01/07/2022 10.18, Alex wrote:
...
> Here is my questions:
> 
> 
> Q1: How to change the vendor-name of a IDE disk?
> 
> Is there any API(s) to config it?
> 
> I can't find the way from libvirt-doc.
> 
> ​In Qemu code, I seems that "QEMU HARDDISK" is just by default, and 
> it's configurable.

I think you can specify the model string when you run QEMU directy, e.g.:

  qemu-system-x86_64 -device ide-hd,model=XYZ ...

Whether that's somehow configurable via libvirt, too, you should better ask 
that question on the libvirt mailing list instead, I think.

  Thomas


