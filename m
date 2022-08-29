Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B635A4C1A
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Aug 2022 14:42:29 +0200 (CEST)
Received: from localhost ([::1]:39680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oSe5z-0007rX-Lw
	for lists+qemu-devel@lfdr.de; Mon, 29 Aug 2022 08:42:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oSe4S-0006Kz-VG
 for qemu-devel@nongnu.org; Mon, 29 Aug 2022 08:40:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43719)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oSe4P-0007WX-Lp
 for qemu-devel@nongnu.org; Mon, 29 Aug 2022 08:40:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661776848;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Pk2bUnqrI+zOexXJH1WQEqWMq2SjOT2dAKnmSbZ13hM=;
 b=f1fWviDWKvev8wongUeswkBmYA0i78al/QwklEvkhexxcakNJj1P6FXsUZzedj0sbvYisW
 2APQ1OtBOiFuMYY+hNs26ar58doB79hkwzCXBLlrbkRb/XQLk8rHEU6sVQ68Ct1az9WEHN
 +NUbk9vZG4br1FQTnalbal+WLRgsUf4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-361-7rZ4xhM7O0aQyQmLgVpjnQ-1; Mon, 29 Aug 2022 08:40:46 -0400
X-MC-Unique: 7rZ4xhM7O0aQyQmLgVpjnQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 d11-20020adfc08b000000b002207555c1f6so1100379wrf.7
 for <qemu-devel@nongnu.org>; Mon, 29 Aug 2022 05:40:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=Pk2bUnqrI+zOexXJH1WQEqWMq2SjOT2dAKnmSbZ13hM=;
 b=wwGkj96wW5Y+8Wp8XXB0eZ7HZPFC4VAVch9KOBx6MtHZ2otCthKCNoWI4t2GGvi+YN
 yfg8cem6e/vzp5WYPZ2PUcIhC/T0jKTyklNKSP1Zo4uw57ZjZpzoAZOvPMxaIelM5iiF
 c0UVlFpHube6T38+x/t4SkWwkcMxeaUuKj/kLXNsZsa0dy6W93RICrdljrvuz9BxVXaK
 cA9NbFXy/1SM+wRGN5ZnbaKVl5ojQFTJZ4YLER1LECcS6raMV2WX+x5/uLdQB2NSGJxR
 801AFch5nvhzTJWYQSEHqNNaPdQn5JgDMXQQvbyuClBdbJgMT8yz9JjQ5Uv4Y+cuKfvY
 S/BA==
X-Gm-Message-State: ACgBeo3F9tyMjNfVSDMglcFCymiSfEnPtkSHfHwt5epJYKFaUqIhEa6Z
 /uL564Wy+HzuF94o5X7OCuMRw9ciA2y68aXdsJIePUEHnUbysuu20EOEBv97zUxFe8pIt8+5C7J
 fCHtNxdmyajnZWPM=
X-Received: by 2002:a05:600c:15c5:b0:3a5:b800:3c53 with SMTP id
 v5-20020a05600c15c500b003a5b8003c53mr6716881wmf.176.1661776845567; 
 Mon, 29 Aug 2022 05:40:45 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7hXCwgRgulowmMAjeRvYHOE1+ajWR9afOsZn30swEzvoNvaSOiuabnf6kjElJAuuWpoZRAtA==
X-Received: by 2002:a05:600c:15c5:b0:3a5:b800:3c53 with SMTP id
 v5-20020a05600c15c500b003a5b8003c53mr6716865wmf.176.1661776845370; 
 Mon, 29 Aug 2022 05:40:45 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-176-147.web.vodafone.de.
 [109.43.176.147]) by smtp.gmail.com with ESMTPSA id
 n8-20020adff088000000b002258235bda3sm6819233wro.61.2022.08.29.05.40.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Aug 2022 05:40:44 -0700 (PDT)
Message-ID: <abc2219f-9ee6-59aa-fee6-4b0ec29aed2c@redhat.com>
Date: Mon, 29 Aug 2022 14:40:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 0/1] Update vfio-user module to the latest
Content-Language: en-US
To: John Levon <levon@movementarian.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: "Zhang, Chen" <chen.zhang@intel.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "stefanha@gmail.com" <stefanha@gmail.com>,
 "jasowang@redhat.com" <jasowang@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Xie Yongji <xieyongji@bytedance.com>
References: <cover.1659403195.git.jag.raman@oracle.com>
 <MWHPR11MB00312737931679069FAAE7AB9B9D9@MWHPR11MB0031.namprd11.prod.outlook.com>
 <e8eab8e6-e6a5-af95-223f-e0ca91b4d833@redhat.com>
 <YuzT2MA9Q4mAr4eQ@redhat.com> <Yu+WYmwvr/1fBww+@movementarian.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <Yu+WYmwvr/1fBww+@movementarian.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

On 07/08/2022 12.39, John Levon wrote:
> On Fri, Aug 05, 2022 at 09:24:56AM +0100, Daniel P. Berrangé wrote:
[...]
>> If we do add something as a submodule for some reason, I'd like us to
>> say upfront that this is for a fixed time period (ie maximum of 3
>> releases aka 1 year) only after which we'll remove it no matter what.
> 
> I'm not clear on the costs of having the submodule: could you please explain why
> it's an issue exactly?

Some reasoning can be found here:

 
https://lore.kernel.org/qemu-devel/d7a7b28f-a665-2567-0fb6-e31e7ecbb5c8@redhat.com/

> I can only think of the flaky test issue (for which I'm
> sorry).

Speaking of that test issue, yes, it would be good to get this patch 
included now as soon as the 7.1 release has been done. Who's going to send a 
pull request for this?

  Thomas


