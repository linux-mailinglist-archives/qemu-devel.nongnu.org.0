Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 677265EEDF5
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 08:35:26 +0200 (CEST)
Received: from localhost ([::1]:48070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odn8m-0006uC-5s
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 02:35:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1odn15-0003Qc-9y
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 02:27:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21781)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1odn10-0005Tm-K6
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 02:27:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664432840;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X7UYIYBhMAykrMjGYWJYok9j76dBU5RTmcx2FJRdGLo=;
 b=dBwqAw/dyzNvnWG3c9tyPnzi5LY0A+uMtqpekmsWHmTsUN2T6mpHQRZmZM/AK6Cs6l/AaZ
 ZguwZsMB0aiQMr5D2TZZmVaRPbdr1txbB7rPQNuNUMUvo3YdTii83Zt4GJGDxMAqMOMvdc
 Cd3ylXnkR6XA8IJ8QF579yJPDrmThGY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-533-n_fgGV7tP1yy4_N3vDlrAw-1; Thu, 29 Sep 2022 02:27:19 -0400
X-MC-Unique: n_fgGV7tP1yy4_N3vDlrAw-1
Received: by mail-wm1-f70.google.com with SMTP id
 b5-20020a05600c4e0500b003b499f99aceso2515978wmq.1
 for <qemu-devel@nongnu.org>; Wed, 28 Sep 2022 23:27:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=X7UYIYBhMAykrMjGYWJYok9j76dBU5RTmcx2FJRdGLo=;
 b=ydrazyyKon3nw7QOQgBTpMmkjKgveq/4SuEZOTknepwTZ8NMcnUSZiRcodQqhrV3l6
 qe/W8IjgP4Xt755wLXrTjjc34wCn1zOWIlzWLG0sahNj+6bGt404HpSPyYK92AJ9i0o0
 tfXFD+4yEa0ggNDpk0RNAhPQYnf3CVq8J5hJJ8zB1zyKAg/lshzJYxGuFhb35BBnrmHI
 EfeV0gnR+VETrpCQ4OOYKSN3jGax7c8i7nHHf/vm+YazLxklVcBbh6Bz1+rofbLII3tm
 dqYG4lQD1LLMzScLEcSGSmokSP/sOOuoYmMm+97Ikqb02LeQGswl565EpNZfGJR9PjIh
 u2AQ==
X-Gm-Message-State: ACrzQf3JoDR7GdfeqJOTxIyYKaMe10P8j5Qim0VykwjGI2riVs1SSqg+
 irIrUFCs3h/9AMwRE8+/E/TlgWUR9YeIkz3ABWpug4E+SHTv/SIkZgQnQxbvtIRqGZgshjf4q+i
 ZllW91gkhoNK0+m0=
X-Received: by 2002:a05:6000:1d83:b0:22c:aa0a:12 with SMTP id
 bk3-20020a0560001d8300b0022caa0a0012mr916876wrb.471.1664432838197; 
 Wed, 28 Sep 2022 23:27:18 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4tKEM+xLAn4pWN6ADMXFzit5bgE19aQCG1t37QUvutQdQw8HvsYHS2PqEra6oXiey7L7JnKw==
X-Received: by 2002:a05:6000:1d83:b0:22c:aa0a:12 with SMTP id
 bk3-20020a0560001d8300b0022caa0a0012mr916853wrb.471.1664432837952; 
 Wed, 28 Sep 2022 23:27:17 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-177-55.web.vodafone.de.
 [109.43.177.55]) by smtp.gmail.com with ESMTPSA id
 26-20020a05600c229a00b003b31fc77407sm3442198wmf.30.2022.09.28.23.27.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Sep 2022 23:27:17 -0700 (PDT)
Message-ID: <4103733d-3bbe-18bd-a9ea-e2f24cbe8d43@redhat.com>
Date: Thu, 29 Sep 2022 08:27:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 0/1] Update vfio-user module to the latest
Content-Language: en-US
To: Jag Raman <jag.raman@oracle.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John Johnson <john.g.johnson@oracle.com>
Cc: John Levon <levon@movementarian.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 "Zhang, Chen" <chen.zhang@intel.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "jasowang@redhat.com" <jasowang@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Xie Yongji <xieyongji@bytedance.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
References: <cover.1659403195.git.jag.raman@oracle.com>
 <MWHPR11MB00312737931679069FAAE7AB9B9D9@MWHPR11MB0031.namprd11.prod.outlook.com>
 <e8eab8e6-e6a5-af95-223f-e0ca91b4d833@redhat.com>
 <YuzT2MA9Q4mAr4eQ@redhat.com> <Yu+WYmwvr/1fBww+@movementarian.org>
 <abc2219f-9ee6-59aa-fee6-4b0ec29aed2c@redhat.com>
 <29C30B29-B948-4DCF-AB4A-C0CA6E3041A5@oracle.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <29C30B29-B948-4DCF-AB4A-C0CA6E3041A5@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.319, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 29/09/2022 03.52, Jag Raman wrote:
> 
> 
>> On Aug 29, 2022, at 8:40 AM, Thomas Huth <thuth@redhat.com> wrote:
>>
>> On 07/08/2022 12.39, John Levon wrote:
>>> On Fri, Aug 05, 2022 at 09:24:56AM +0100, Daniel P. Berrangé wrote:
>> [...]
>>>> If we do add something as a submodule for some reason, I'd like us to
>>>> say upfront that this is for a fixed time period (ie maximum of 3
>>>> releases aka 1 year) only after which we'll remove it no matter what.
>>> I'm not clear on the costs of having the submodule: could you please explain why
>>> it's an issue exactly?
>>
>> Some reasoning can be found here:
>>
>> https://lore.kernel.org/qemu-devel/d7a7b28f-a665-2567-0fb6-e31e7ecbb5c8@redhat.com/
>>
>>> I can only think of the flaky test issue (for which I'm
>>> sorry).
>>
>> Speaking of that test issue, yes, it would be good to get this patch included now as soon as the 7.1 release has been done. Who's going to send a pull request for this?
> 
> Now that QEMU 7.1 has released, could we please pull this patch in - just so no one else has a bad experience when testing?

You are listed as maintainer for subprojects/libvfio-user in the MAINTAINERS 
file, so I guess you should just go ahead and send a pull request for this?

  Thomas


