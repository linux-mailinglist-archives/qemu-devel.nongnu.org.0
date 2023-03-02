Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26F9E6A8158
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 12:39:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXhHK-0002nk-Tj; Thu, 02 Mar 2023 06:39:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pXhHJ-0002nM-17
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 06:39:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pXhHH-0005Wg-JE
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 06:39:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677757154;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hs+vC0jDWd7oC2gnzIs24+HTP4s43rzqfih52WdXWwE=;
 b=Gxh06pCUtYSubsdi8u7lunqCXCD/bNFDD2mDA/RwHm8mLDfrJt7iE+PX+wmz6WnH7W7VUI
 1qxG/U7rtTdODX42/g0qhyKXHVR/yJMIv/1rTD38FZfygGnoukCQmcn1FkR6GNaYxPTXuO
 ZqulARwvaBZEOFfNQqOoF7eLG6KcsL0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-600-Iv1dNHAzNcycPxSV_mxD4g-1; Thu, 02 Mar 2023 06:39:13 -0500
X-MC-Unique: Iv1dNHAzNcycPxSV_mxD4g-1
Received: by mail-wr1-f70.google.com with SMTP id
 j2-20020adfa782000000b002ca9ab26627so2927368wrc.23
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 03:39:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hs+vC0jDWd7oC2gnzIs24+HTP4s43rzqfih52WdXWwE=;
 b=LeCk40a4ZEdb0V/DID789FqUCvzk2GkqrV6wXkEwnhj33QtWd8GRTxLKg/0+YehHAJ
 Y/x3c4/DqMAsTBb9ePqhTYOSiG4F4aTjsHizlyEjnPcv8MT0mD+IdnpkD9OaaRnv/jUL
 FTfhGDbuhfs2lJHyiKyE+7inrEFKEjctV9QsyVV1zpszysD3f+dCbkBZAFeSYfxDYwmO
 Ndhp77s4SCG3Qc2u2b4XBl5tH7OF2JgfThH+EKmY9YC8AYMkAIPUEsWY4fDJnwmddGK6
 srl4uwfU8ov4cC9XehaEDq4avlp4cQRRQSVVI8TRwQPnlQrauoRbPr6ZxoUDmEDmtL6A
 KqeQ==
X-Gm-Message-State: AO0yUKXhrCq8wW1L2J8VNv21LGuHoCkMbgbj9awIwKkchTJ70WxfOJBR
 V3U34/TSFDolQyFYOiOiC8J9+mVTh8fy8PW47yp78wNP+twcnRy8I6LegyHBIe8xOnBIAmSXo6H
 lW7Cyh4jlBNxH8pjmCBgF
X-Received: by 2002:a5d:5146:0:b0:2c7:d87:7a3f with SMTP id
 u6-20020a5d5146000000b002c70d877a3fmr6731090wrt.50.1677757152595; 
 Thu, 02 Mar 2023 03:39:12 -0800 (PST)
X-Google-Smtp-Source: AK7set/yLlQRuTsZnq3Oa0JicmFLewHyzyWFWYe+NIkmvEMJ2hUMT8jI03hY5mT39nFz8pcz8BeYtQ==
X-Received: by 2002:a5d:5146:0:b0:2c7:d87:7a3f with SMTP id
 u6-20020a5d5146000000b002c70d877a3fmr6731074wrt.50.1677757152280; 
 Thu, 02 Mar 2023 03:39:12 -0800 (PST)
Received: from ?IPV6:2003:cb:c70e:4f00:87ba:e9e9:3821:677b?
 (p200300cbc70e4f0087bae9e93821677b.dip0.t-ipconnect.de.
 [2003:cb:c70e:4f00:87ba:e9e9:3821:677b])
 by smtp.gmail.com with ESMTPSA id
 s2-20020adff802000000b002c706c754fesm15101878wrp.32.2023.03.02.03.39.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Mar 2023 03:39:11 -0800 (PST)
Message-ID: <9c14c247-0184-35e8-6399-b542e4e20129@redhat.com>
Date: Thu, 2 Mar 2023 12:39:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [External] [PATCH] hostmem: Add clear option to file backend
Content-Language: en-US
To: Feiran Zheng <fam.zheng@bytedance.com>
Cc: qemu-devel@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 Peter Xu <peterx@redhat.com>, Fam Zheng <fam@euphon.net>,
 Igor Mammedov <imammedo@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Eric Blake <eblake@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
References: <20230302110925.4680-1-fam.zheng@bytedance.com>
 <377c3521-ffe1-074b-48ac-71fd445b3bb4@redhat.com>
 <15DA845E-C50C-46BB-A241-164E5851E388@bytedance.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <15DA845E-C50C-46BB-A241-164E5851E388@bytedance.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.09, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 02.03.23 12:37, Feiran Zheng wrote:
> 
> 
>> On 2 Mar 2023, at 11:31, David Hildenbrand <david@redhat.com> wrote:
>>
>> On 02.03.23 12:09, Fam Zheng wrote:
>>> This adds a memset to clear the backing memory. This is useful in the
>>> case of PMEM DAX to drop dirty data, if the backing memory is handed
>>> over from a previous application or firmware which didn't clean up
>>> before exiting.
>>
>> Why can't the VM manager do that instead? If you have a file that's certainly easily possible.
> 
> 
> Hi David,
> 
> Technically yes, but I have a simple VM manager here which wants to avoid replicating the same mmap code, such as handling the flags depending on share=on|off,hugepages=on|off. All in all this approach requires the least additional code to achieve it.

so ... we're supposed to maintain that code in QEMU instead to make your 
life easier ? :)

Sorry, for this particular use case I don't see the big benefit of 
moving that code into QEMU.

-- 
Thanks,

David / dhildenb


