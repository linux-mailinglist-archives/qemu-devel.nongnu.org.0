Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F0F1408E3B
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 15:31:17 +0200 (CEST)
Received: from localhost ([::1]:41540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPm3I-0006w8-DV
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 09:31:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mPlOC-0006B5-Fw
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 08:48:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59595)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mPlOA-0006qG-NZ
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 08:48:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631537325;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IUnyBct8eM+iRYELREWv70bJ3MBlXCzgmJ4ulFWBh8Q=;
 b=WToPDrVgmyUWFlwAQ+6CF1BIFHF2qb5QOLqhhE11c+Tuvykbjy8lxh5oe1KCIzf/sd+0oZ
 jC9gmrOpMADBmtsDe6Uj6pCGvtBEj1nWy1h6bM2ArJglB75UCj/UbyZzpgK4U8HxiKZqBp
 NQLlnDCEEIqC+ixDt7H7UTB30oSBGBY=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-75-F5usJcVTNsa782CPHzBSeg-1; Mon, 13 Sep 2021 08:48:40 -0400
X-MC-Unique: F5usJcVTNsa782CPHzBSeg-1
Received: by mail-wm1-f71.google.com with SMTP id
 c187-20020a1c35c4000000b00304b489f2d8so3040421wma.6
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 05:48:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=IUnyBct8eM+iRYELREWv70bJ3MBlXCzgmJ4ulFWBh8Q=;
 b=77oj0DBw4Sdw91AdqBT+Bq/0SXxJpMpRadAFLO7UPaibtmnNQkQmsHW6cw9S7Sv3vV
 NHsJAJhfEyXsOcXBTHOfaWF1eWI+cyr5u0GpM9EJZ5ToydR8Jbxf20vqWp93YF2NOtPZ
 guqtFZm/MKjt0AC5ZAivqk1hketdNOoAiI4X/fN9Ydc6uUYTM8mEmlQ34WKf9iN0lKJ5
 h6jCLRZanJ5rtrsP2hRtsF3KcQcqWXd3Djsp2R526oxgramvCW5PK8K+uIpJsB67RmXE
 kDu+4iuFapF4AXutNxICIzGWwASsTUPdCAGMf22+pfiz/TptssCo1ec1cTPbiFHos4es
 B6lA==
X-Gm-Message-State: AOAM5309km5bVFBcBwxAReGX/Pu1k4QhY+4fnGUONYHjmJZjG5HszVFx
 qZLPqrlei8JCuKyWPXod1hghC/CrnxUdY8jmmyNxoQccfdZEiBad3ndFEpRu1MKSvKLfe4/1e9q
 gwz56kW30AxjRlz0=
X-Received: by 2002:a05:6000:124a:: with SMTP id
 j10mr12155332wrx.431.1631537318973; 
 Mon, 13 Sep 2021 05:48:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy8kWX25tS65bJZn9cfcor0DQtGp10+S9+jgecen2ag/6BW6gh2y0QIpFR3AvSL+46hJMFsVQ==
X-Received: by 2002:a05:6000:124a:: with SMTP id
 j10mr12155313wrx.431.1631537318781; 
 Mon, 13 Sep 2021 05:48:38 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id c2sm7421893wrs.60.2021.09.13.05.48.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Sep 2021 05:48:38 -0700 (PDT)
Subject: Re: [PATCH v2 1/3] monitor: Add HMP and QMP interfaces
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Yang Zhong <yang.zhong@intel.com>, philmd@redhat.com, qemu-devel@nongnu.org,
 eblake@redhat.com, seanjc@google.com
References: <20210910102258.46648-1-yang.zhong@intel.com>
 <20210910102258.46648-2-yang.zhong@intel.com> <YTthmPn2KGcfNX21@redhat.com>
 <YT8bboSgYfWJP9kh@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <4ae8c563-9b44-d234-eb01-a61000d01439@redhat.com>
Date: Mon, 13 Sep 2021 14:48:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YT8bboSgYfWJP9kh@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.969, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 13/09/21 11:35, Daniel P. Berrangé wrote:
>>    g_autoptr(Error) err = NULL
> I was mistaken here - Error shouldn't use g_autoptr, just
> 
>     Error err = NULL;
> 
>>> +    SGXInfo *info = qmp_query_sgx(NULL);
>> Pass in &err not NULL;
>>
>> Also  declare it with  'g_autoptr(SGXInfo) info = ...'
>>
>> And then
>>
>>     if (err) {
>>        monitor_printf(mon, "%s\n", error_get_pretty(err);
> Then use the simpler:
> 
>      error_report_err(err);

Indeed.

That said, more long term (but this is something Coccinelle could help 
with) perhaps error_report_err should not free the error, and instead we 
should use g_autoptr(Error) in the callers.  I don't like functions that 
do not have free in their name and yet free a pointer...

Paolo


