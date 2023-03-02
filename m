Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 591766A810F
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 12:32:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXhAG-0005Yg-Ca; Thu, 02 Mar 2023 06:32:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pXhAB-0005QY-JQ
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 06:31:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pXhAA-0000AP-1P
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 06:31:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677756710;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1cj8O96ETTr/JOsAO+NbDMY3KR0aKFc6+dRWg9LIvZM=;
 b=AhCVTCmKe9PRjprFJ6vajNtLKc+csZS4xhgEhvGzMpMX+zxT9vLDBrXLV9eW8RHufSA9jH
 3VedVDAF3+c3fy+X3tTwU/zSJadb9Ea6KdObGXzi9hU40sjrXnBmRgPyOkZD2Q04OSDjBn
 FF/Ua3jeT/NAB3bUDLfYEdr8clJ9se0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-424-WUYRJJgDPxasSzz52nxIhQ-1; Thu, 02 Mar 2023 06:31:49 -0500
X-MC-Unique: WUYRJJgDPxasSzz52nxIhQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 k26-20020a05600c0b5a00b003dfe4bae099so969216wmr.0
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 03:31:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1cj8O96ETTr/JOsAO+NbDMY3KR0aKFc6+dRWg9LIvZM=;
 b=K1rMHUvwEI64dxe4PYJBxPzYNY4Fzgi3J20zOu+uLXhLFWWdTkCz4nt9ZwRb5Q5jyA
 RS4sPcd5PWvoZHUn0oFNopoV91PXnutlL3tIQPPTdepom1WCGBaGa9s1UCmU5UTLsa1G
 3oNEelpVrjzXTbhgcgwWkr39tSwTQBiKr/Y7vzyB7vXc+JUgXOcXqzDcsrreiLlIJkTo
 4f/7/R0KL698s1gZiZiYt2aOtEADxji0gIIWBRTPAY1pbieK1kCP847Q6l6iuBRcJAaJ
 5llk0Sx5TYDzj/Nhe7a+E87FnMlG+IjsM2pnUpLPN6Ml5aHMhtgEl0Q7R5KFbxIPbam4
 9V0Q==
X-Gm-Message-State: AO0yUKUBFtbGl2G1KdKIVdVTRNFDcbhyGMGV5WDB+UZCRcRgWMWBZ0VH
 6ywuPXMfq4wQ51JI6GPlxPDLymhxGmQ+rIqLN45kP+8Ur9BJZLiRWTw3yjvUU+998zrBaGKWXDh
 i/4tV8Kj+2PQJjF0=
X-Received: by 2002:a5d:6b86:0:b0:2cb:9833:1e8c with SMTP id
 n6-20020a5d6b86000000b002cb98331e8cmr7027239wrx.0.1677756708279; 
 Thu, 02 Mar 2023 03:31:48 -0800 (PST)
X-Google-Smtp-Source: AK7set8GeKqn1bTVVzURdYY+FQSFNTKwybySFU3CVJZMgqjUXhrZB/9NdYOoE64HiGh9P5emXOH94A==
X-Received: by 2002:a5d:6b86:0:b0:2cb:9833:1e8c with SMTP id
 n6-20020a5d6b86000000b002cb98331e8cmr7027221wrx.0.1677756707904; 
 Thu, 02 Mar 2023 03:31:47 -0800 (PST)
Received: from ?IPV6:2003:cb:c70e:4f00:87ba:e9e9:3821:677b?
 (p200300cbc70e4f0087bae9e93821677b.dip0.t-ipconnect.de.
 [2003:cb:c70e:4f00:87ba:e9e9:3821:677b])
 by smtp.gmail.com with ESMTPSA id
 w9-20020adfee49000000b002c7107ce17fsm15489511wro.3.2023.03.02.03.31.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Mar 2023 03:31:47 -0800 (PST)
Message-ID: <377c3521-ffe1-074b-48ac-71fd445b3bb4@redhat.com>
Date: Thu, 2 Mar 2023 12:31:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] hostmem: Add clear option to file backend
Content-Language: en-US
To: Fam Zheng <fam.zheng@bytedance.com>, qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>, Peter Xu <peterx@redhat.com>,
 fam@euphon.net, Igor Mammedov <imammedo@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Eric Blake <eblake@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 stefanha@redhat.com
References: <20230302110925.4680-1-fam.zheng@bytedance.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20230302110925.4680-1-fam.zheng@bytedance.com>
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

On 02.03.23 12:09, Fam Zheng wrote:
> This adds a memset to clear the backing memory. This is useful in the
> case of PMEM DAX to drop dirty data, if the backing memory is handed
> over from a previous application or firmware which didn't clean up
> before exiting.
> 

Why can't the VM manager do that instead? If you have a file that's 
certainly easily possible.

-- 
Thanks,

David / dhildenb


