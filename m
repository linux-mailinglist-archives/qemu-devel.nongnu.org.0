Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4FFF6BD0E5
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Mar 2023 14:34:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcniY-0004TD-RH; Thu, 16 Mar 2023 09:32:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pcniW-0004QI-9t
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 09:32:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pcniU-0005ju-OA
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 09:32:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678973546;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SCnbvXBN7SRTaNl2uewRllQMtjXQj2v61KT6hBu9NQ8=;
 b=YghD9g+JNo4v3iJhWce0VYztXR6vqREqRAWvlPmDD3tp0d/LLDylkJSDK6GPKBMJSEg8q9
 C24G7QY7IbPKRIfb7ld7LuCZHOdPa3jumfsjgIhIiBqXH8ZZBVxiKVR2CJBZqhS5D23fQ5
 zbztRgKbSuMDvvNWWHZaX69eZMq0fDo=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-515-rEPlh3OUMpSshR8gBDRopA-1; Thu, 16 Mar 2023 09:32:19 -0400
X-MC-Unique: rEPlh3OUMpSshR8gBDRopA-1
Received: by mail-wm1-f71.google.com with SMTP id
 bg13-20020a05600c3c8d00b003ed40f09355so767875wmb.5
 for <qemu-devel@nongnu.org>; Thu, 16 Mar 2023 06:32:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678973538;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SCnbvXBN7SRTaNl2uewRllQMtjXQj2v61KT6hBu9NQ8=;
 b=yibWFNYJTU/XRYvGfRaBk36+ZMRYWda+GL86cVpAWNOqvPokFiSugfiFp6vBTbtaLs
 dDqFlhOGZ4c72fUUPUNDHwSmuQP94PEGSbWC33LDM8NK9dlXOYmirTThpojt/EAXjwYQ
 gOOLTbTBC/En6kulihhnIeGe18++vnyJZc6YwRyu0qgGhywQ0aSAH6JPrc9cs38h8gxa
 b0rEB18khbTbCdfxVkNfHBRJh3n6+lnFUglbsZf6pmZp/bfNiWKGV1y2aG5DIAi6r+hb
 aZ/e/MV7288C+FOaFHfhPvbUzXF1jxezexRFekClYi/02fW41UUwAoGPBuM1rrcGBlY8
 JKJA==
X-Gm-Message-State: AO0yUKX7JIb6WcvuQcNjriJTEZax2Ysd6/b5HgrpqkZXIJTlCDRh7S0Z
 vSkbM9spBoa2gtc5dc8Gc4TRyCr+OD9Rk6d4CZmt5Uj5A7Q0iQz6UIVdDnQI1pyNWO5IUFpyMr8
 4onG1K8OFnnF3dFE=
X-Received: by 2002:a05:600c:5386:b0:3ed:301c:375c with SMTP id
 hg6-20020a05600c538600b003ed301c375cmr7510366wmb.21.1678973537997; 
 Thu, 16 Mar 2023 06:32:17 -0700 (PDT)
X-Google-Smtp-Source: AK7set+9pywI+mXz1osUjTZ15kDQaaNHZ1G7YqgIh3nxg353eO1KPK6rlrxD46jhbO2BJsWtX14qJQ==
X-Received: by 2002:a05:600c:5386:b0:3ed:301c:375c with SMTP id
 hg6-20020a05600c538600b003ed301c375cmr7510317wmb.21.1678973537586; 
 Thu, 16 Mar 2023 06:32:17 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-176-151.web.vodafone.de.
 [109.43.176.151]) by smtp.gmail.com with ESMTPSA id
 t8-20020a05600c450800b003daf6e3bc2fsm9616529wmo.1.2023.03.16.06.32.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Mar 2023 06:32:17 -0700 (PDT)
Message-ID: <0e06c704-40d7-b511-8353-0218c3d45d3b@redhat.com>
Date: Thu, 16 Mar 2023 14:32:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: Andrew Randrianasulu <randrianasulu@gmail.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-discuss@nongnu.org, QEMU Developers <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>
References: <CA+rFky6A9Q_5sJ4WDO-Z2HBT59qiNgr8A-xk+O7-gnAMZmHt2A@mail.gmail.com>
 <f06fddef-1e40-1858-2715-50a0518a97f6@linaro.org>
 <CA+rFky5=kc0Pwf3RRhuKrBqtRVkmtm=NDKhrVgJV2_Ame2nUOQ@mail.gmail.com>
 <c33b0e07-5c46-6ebe-fe4c-5308ce508a70@linaro.org>
 <632e7256-34f5-ca87-ff60-a5c11aa1dd7f@redhat.com>
 <CA+rFky6WqdLjNpeU3sCXwjwMEuEK+XVHE5BBCKYC=umRGK81eg@mail.gmail.com>
 <CA+rFky4su7ZEo8pNQGk3qEkTOLEkFAqO2Tsrh6VyDaNOf7w=_Q@mail.gmail.com>
 <ac632c34-42e0-d715-52d9-b70ead6296a7@redhat.com>
 <CA+rFky6Tt0hcv9TuthS7Q-5SMXtPi+3W8B5qX5itJ0A+meh_Ew@mail.gmail.com>
 <ZBMNEdz9WnUsckd7@redhat.com>
 <CA+rFky6hnaCxF10ST=qsLsBjH6=M__kQPA=yoZhdCoB8sH96ug@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: dropping 32-bit host support
In-Reply-To: <CA+rFky6hnaCxF10ST=qsLsBjH6=M__kQPA=yoZhdCoB8sH96ug@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
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

On 16/03/2023 14.01, Andrew Randrianasulu wrote:
...
> Well, this language about "market" and "investment"  not just figures of the 
> speech, sadly? Because paid developers work on  areas they paid to develop, 
> by boss with big bucks.

Sorry for getting more explicit now, but: Can you please stop making such 
aggressive assertions which are obviously wrong and where you apparently 
have no clue about about?

If you'd followed the QEMU project, you'd know that there are very helpful 
people around, from all kind of companies, Linaro guys who help with 
reviewing and merging non-ARM patches, Red Hatters who help with BSD and 
Haiku patches, etc.

Anyway, if you're not happy with the way the project is evolving, then start 
contributing instead of grumbling.

  Thomas


