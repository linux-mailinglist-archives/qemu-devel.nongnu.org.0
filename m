Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E814748776C
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 13:08:20 +0100 (CET)
Received: from localhost ([::1]:57704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5o2e-0002Ow-2A
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 07:08:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1n5nqc-0006mS-EZ
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 06:55:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20900)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1n5nqY-00045C-TQ
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 06:55:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641556549;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z7HxUBU5Z8mNCYdqxum4L3qDivRoJsMqfya0JyJWrdw=;
 b=hnqIY03+y/klrfee9dL5XzLCnsQjhhPo5yyiR5JTjID4ud1Tc4RYFqEFGFJuXkUl51eYnJ
 G8U6hRcgJ547LmffuIiHP0nLUiD6BXfLI7nkZvtDlCv4bP0GsWkIWLM0d5e1FQr8lgEGPO
 LbGC2WMQ6kraaFaFN4UcNlozLU79soY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-320-GEpmUnDHMqO-0kl2_sUj0A-1; Fri, 07 Jan 2022 06:55:46 -0500
X-MC-Unique: GEpmUnDHMqO-0kl2_sUj0A-1
Received: by mail-wm1-f70.google.com with SMTP id
 m9-20020a05600c4f4900b0034644da3525so1417439wmq.3
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 03:55:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=z7HxUBU5Z8mNCYdqxum4L3qDivRoJsMqfya0JyJWrdw=;
 b=vP5XB69JncZ1U3AY0vmqn0+tvTNlqRPOGRy0+RqpDPu0SbO9/m81czE+TSpncQSmC2
 +fwOOei0dvfgTBMyiNHBzXOQYQn2gpvQ7pk2khq2OqC4zlH1oI8IRf6KuPkNKdsDxVt/
 r1eo1IQH33L5K+j4w0Ek9MCfe7UY+xwAjOThEjZ8BBs0nSrUsvu9MdlDaHBiusqgOmW3
 pwRpjbY3TIxMFG8sHApyembZDz6QC9vJyxyU3gGTPgqBUGS37e+VKSaaqOMA/64SInrZ
 M4N7UDDIeHHEuJe7AOMgfZQ0R3STb5Jf/zLugHTgh9pMTI0C2FutYCU20K31PIqIiMXO
 NU/Q==
X-Gm-Message-State: AOAM531ZQSWBubf9hMDZ6Y97p+C2IfaJ+Aqe7IoDpeVTxam8bafQAp9I
 22w59Pu/iO92qUmARnv6MFLom/cKytN8a+SSzSwTSOU4WMstinUJRfZv7QtguHVtvjNytbhOkjj
 qarZfEplksMyGNBc=
X-Received: by 2002:a5d:59af:: with SMTP id p15mr55208489wrr.422.1641556545241; 
 Fri, 07 Jan 2022 03:55:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyP+FjQh3Mh0uyc225ACvAJwE9X15G6LcM2Jf1xgfVXCo2cyUrQHc4UlRT1kyHj95YV1F2kXQ==
X-Received: by 2002:a5d:59af:: with SMTP id p15mr55208473wrr.422.1641556544970; 
 Fri, 07 Jan 2022 03:55:44 -0800 (PST)
Received: from [192.168.8.100] (tmo-098-68.customers.d1-online.com.
 [80.187.98.68])
 by smtp.gmail.com with ESMTPSA id a2sm5855297wri.17.2022.01.07.03.55.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Jan 2022 03:55:44 -0800 (PST)
Message-ID: <8fc873a8-9bda-09f2-4344-24f8331dba7c@redhat.com>
Date: Fri, 7 Jan 2022 12:55:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [Qemu-devel] [PATCH] configure: Add pkg-config handling for
 libgcrypt
To: Andrea Bolognani <abologna@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <1567068782-371028-1-git-send-email-zhe.he@windriver.com>
 <20190829091505.GB17141@redhat.com>
 <CABJz62M1o7Vof3LSG0BNY506jEdB1S110mMOVbu-ZpQfPJCWfQ@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <CABJz62M1o7Vof3LSG0BNY506jEdB1S110mMOVbu-ZpQfPJCWfQ@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.691, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: pbonzini@redhat.com, zhe.he@windriver.com, philmd@redhat.com,
 laurent@vivier.eu, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 07/01/2022 12.43, Andrea Bolognani wrote:
> On Thu, Aug 29, 2019 at 10:15:05AM +0100, Daniel P. Berrangé wrote:
>> On Thu, Aug 29, 2019 at 04:53:02PM +0800, zhe.he@windriver.com wrote:
>>> libgcrypt may also be controlled by pkg-config, this patch adds pkg-config
>>> handling for libgcrypt.
>>
>> Where are you seeing pkg-config files for libgcrypt ?
>>
>> The upstream project has (frustratingly) been hostile to any proposal to
>> add pkg-config support saying people should stick with their custom
>> libgcrypt-config tool
>>
>>     https://dev.gnupg.org/T2037
>>
>> Even if this is something added by some distro downstream, what is the
>> benefit in using it, compared with libgcrypt-confg which should already
>> work & is portable.
> 
> Resurrecting an old thread to point out that the upstream stance
> seems to have changed since that discussion:
> 
>    https://git.gnupg.org/cgi-bin/gitweb.cgi?p=libgcrypt.git;a=commit;h=97194b422bc89a6137f4e218d4cdee118c63e96e
> 
> libgcrypt 1.9.0, released almost exactly a year ago, comes with a
> pkg-config file out of the box. With that in mind, I think it would
> make sense to re-evaluate this patch for inclusion.

Maybe ... but we switched to Meson in between, so the patch needs to be 
rewritten to use meson.build instead, I think. Also it seems like version 
1.9 is not available in all distros yet, so someone needs to do an 
assessment whether the distros that use an older version of libgrypt provide 
a .pc file or not...

  Thomas


