Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BBFA341BBD
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 12:48:40 +0100 (CET)
Received: from localhost ([::1]:51164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNDcN-0000xC-9B
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 07:48:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lNDJs-0002hz-Cu
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 07:29:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53022)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lNDJq-0003to-RP
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 07:29:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616153370;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=76Jy8viqbEosVEbDEJizaNxoh/MF9JCDVgSbt3PLZBs=;
 b=aNVo3lmxwt4YaAWiQuBv/gN08MCWfuVmTU60ZL3dsFQRSQGwyhzkDCX2SILgZ4OHAFTl9s
 Q7q2gad36GJeoU/by2N8Up/A5Emm+2SoGU8ZlLixxwe07NpOXKythPi1RO3c/RjJ+OaHYg
 2xSwbhfE0NmKohX70jYbTbop2AW5CD8=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-236-7YN8mkFnNR2xS68NDnD50A-1; Fri, 19 Mar 2021 07:29:28 -0400
X-MC-Unique: 7YN8mkFnNR2xS68NDnD50A-1
Received: by mail-ej1-f71.google.com with SMTP id li22so13657531ejb.18
 for <qemu-devel@nongnu.org>; Fri, 19 Mar 2021 04:29:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=76Jy8viqbEosVEbDEJizaNxoh/MF9JCDVgSbt3PLZBs=;
 b=XZzEAwcF7TtsrhPxUVSQ74w/LRBtMYv3evfHboocdLjsWRU8qK9DaYDrOh38WVOu6k
 n/lv8RfyDDo/B+r8vdlEJBONBkfIY+J7roZ5mCq8qdx1gj06KZWdJ7Wvz/GJL26fkOKK
 GKjjH81j+B7/7fNClo/OITzbULNmyqwo4gIvz4jcNed1E6uyqq5bnLI9Xuabq837wtnT
 8ITywK4sEvKRejnlGmleHx6FtVDWRvqrKAEW8T3Mov3R+FEk+/D1FR80bkpIXvAvfOgA
 BEZMm/8rqrYaGhhY9GnVS7SBtNW62AjTJaYvR+r+MkmiN2+Penu0P3s/UflmERozn/ZA
 54nA==
X-Gm-Message-State: AOAM530dCK1sv1tf0szerWgna0vRc/8bsSTY0qyaGBzcjvrhhx63BWcW
 0ssmU6rC7DRYNuKYQFNNSH4NGHK+xGajbEbkEqUCy+rhw9uGlO2XkZgmtEajNCaY6wc3XRpobAN
 x/JXJDCtY+xPtNOsdSJEBeo7fDcBO8WEs9sqHicS7AUPO8BOy/0zmN9lAs2YRpqL7xio=
X-Received: by 2002:a17:906:7384:: with SMTP id
 f4mr3799995ejl.196.1616153367335; 
 Fri, 19 Mar 2021 04:29:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxlYG3ugmYAIVC4X7FdM1Xjz2BzjAw1WKFshvUadkPjrR4LvkVf4bOKb/+1TSPee9BTxVia7A==
X-Received: by 2002:a17:906:7384:: with SMTP id
 f4mr3799978ejl.196.1616153367140; 
 Fri, 19 Mar 2021 04:29:27 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id y24sm3982451eds.23.2021.03.19.04.29.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Mar 2021 04:29:26 -0700 (PDT)
Subject: Re: Misleading configure failure GLIB_SIZEOF_SIZE_T
To: Markus Armbruster <armbru@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <87v99oiq13.fsf@dusky.pond.sub.org>
 <CAFEAcA8597jFxaNLdwEtM0Q9o6Wjx1JrGdeaePkkEDJz5-Y=ow@mail.gmail.com>
 <87zgyzmqg3.fsf@dusky.pond.sub.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <a404bba1-1635-c173-c882-71f3aaab743e@redhat.com>
Date: Fri, 19 Mar 2021 12:29:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <87zgyzmqg3.fsf@dusky.pond.sub.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 19/03/21 10:40, Markus Armbruster wrote:
>      $ cc -std=gnu99 -Wall -m64 -mcx16 -D_GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -Wstrict-prototypes -Wredundant-decls -Wundef -Wwrite-strings -Wmissing-prototypes -fno-strict-aliasing -fno-common -fwrapv -o config-temp/qemu-conf.exe config-temp/qemu-conf.c -m64
>      $ echo $?
>      0
> 
> The test program doesn't actually need libc, so not having glibc-static
> installed doesn't bother the linker.

I guess the bug is that the invocation does not use -static?

Paolo


