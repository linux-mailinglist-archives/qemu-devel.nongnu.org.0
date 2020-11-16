Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E642B2B4415
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 13:58:32 +0100 (CET)
Received: from localhost ([::1]:35144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kee5Y-0005Sc-2E
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 07:58:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kee49-000527-AI
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 07:57:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:58885)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kee47-0006B0-Nx
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 07:57:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605531422;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1B+nY8y5/hM5GRepUXSKARFrS71S/7stmSdcYyYBSTw=;
 b=HcHPlRRhJvhPBf+c76ulJyi1BarKGRg9B241z+Zh1+8mrg7QzZu9ccLsEaFTZ24Ydth3RY
 0N9Ue4UK4LTCOCeqHUVUqqObeyov69uChg32eKtQZZqRw71155nU6JmaL78kx8a7b+O5DC
 UKuZWx4RJrKJVMnxXjwD78RJb6RVL4o=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-138-5H6BlWeNN2a346rde8k-Yg-1; Mon, 16 Nov 2020 07:57:01 -0500
X-MC-Unique: 5H6BlWeNN2a346rde8k-Yg-1
Received: by mail-wm1-f70.google.com with SMTP id k128so10132167wme.7
 for <qemu-devel@nongnu.org>; Mon, 16 Nov 2020 04:57:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1B+nY8y5/hM5GRepUXSKARFrS71S/7stmSdcYyYBSTw=;
 b=UDsytYVNIs5AEDdaCz09a1x47C/7Fgy/1gxXyn6mZ7QLdOZNaGEDjbJhzySnpymZIJ
 Rse9vvYo8ERUkUfuGlsotAsbkyBZhAYi+5u97Ptxle5UKmR7J0SqnSVyyG3v5raHBqSx
 0A5TK6FCEKS8kr76yBnbCL8Wku6/bV/DuFw7hom5/fBgjiXWPOG+TB9KHTfG4DcDDtjj
 silUl6gE9NT9TiaYzIPq8B4Bi1M4kntuyFXWT4FeuplNahrNLIMC921xmJxY0KBN0uID
 lolDZUOx6SozH/BS8xVd3Lt8LD+lm1CJbcYmWiPuc9bzQmrJLkekqTYqFJa3gqiOA4Dy
 pmAQ==
X-Gm-Message-State: AOAM530TPFkeYgfmQWXC5iKl4lOkcKZZ0QGqTdaPpi8Nmtccd302VkeU
 Mf7P6CgmV26t81919rNtJyo+rQkddK0nBaCHNmYxtqQCyIXmETZC9UZXTJ2dI3OAJZ8/xy50xw7
 niVtVMVrJmKaGkQs=
X-Received: by 2002:adf:f9cb:: with SMTP id w11mr19624403wrr.1.1605531419833; 
 Mon, 16 Nov 2020 04:56:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwxpNvh+WeWY8hIKlAv6rUbhyZ9AqgPmHIDHwT5q+iSwFOQAe1vsyYovjLiBg+jFwlKMDGaEg==
X-Received: by 2002:adf:f9cb:: with SMTP id w11mr19624384wrr.1.1605531419672; 
 Mon, 16 Nov 2020 04:56:59 -0800 (PST)
Received: from [192.168.1.36] (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id 6sm17023613wrn.72.2020.11.16.04.56.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Nov 2020 04:56:58 -0800 (PST)
Subject: Re: [PATCH v3 06/11] gitlab-ci: Rename acceptance_test_job ->
 integration_test_job
To: Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Cleber Rosa <crosa@redhat.com>
References: <20201108221925.2344515-1-philmd@redhat.com>
 <20201108221925.2344515-7-philmd@redhat.com>
 <579650f6-e8a1-fa8c-c28c-566d15ef2088@redhat.com>
 <16b2e7ca-5d08-d55c-8db4-08a5d5d4663b@redhat.com>
 <69708ea6-35e8-5a29-0c9d-4bb9d6beef83@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <2114af32-5e14-0839-e5af-fff399040253@redhat.com>
Date: Mon, 16 Nov 2020 13:56:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <69708ea6-35e8-5a29-0c9d-4bb9d6beef83@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/16 04:46:27
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 "Daniel P . Berrange" <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/12/20 9:31 PM, Wainer dos Santos Moschetta wrote:
> 
> On 11/12/20 5:02 AM, Thomas Huth wrote:
>> On 10/11/2020 21.42, Wainer dos Santos Moschetta wrote:
>>> Once Cleber said "acceptance" wasn't  a good name for those tests.
>>> Indeed
>>> "integration" is widely used, so okay for this renaming.
>> Should we maybe also rename the folder and "make check-acceptance" into
>> "make check-integration" ?
> 
> I'm okay with that. But I also would like to hear from Cleber.

This is the plan indeed, but out of the scope of this (gitlab-ci
specific) series.

'check-acceptance' might then depend on 'check-integration'.

> 
> - Wainer
> 
>>
>>   Thomas
>>
>>
> 


