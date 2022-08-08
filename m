Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B3A658CA86
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Aug 2022 16:27:16 +0200 (CEST)
Received: from localhost ([::1]:38626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oL3it-0001Uj-KW
	for lists+qemu-devel@lfdr.de; Mon, 08 Aug 2022 10:27:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oL3fp-0005NH-96
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 10:24:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52728)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oL3fm-0008Hz-97
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 10:24:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659968640;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s8Nc0Llm1bgGzPAvbVPHAhlqK535yVT5XrqpWqgpMLk=;
 b=dTF7SyXcNERmqTX7hOFU1jHa0JMKmyVyP2LIa7drQfsvhrTZp+hd1hJLINpaxI5GjZXcY+
 b/XpcAE08eeD1rShOfCZ4r19PIjgeDWaEMSgndqhrBsJLBgk7DHPE+ofq/hZQhohBcR4s+
 JuveR6VJ0Xl9ypRcFg5b3IlMyokp8rU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-594-SdVbLzVIPYSwjj9V0dpJMQ-1; Mon, 08 Aug 2022 10:23:59 -0400
X-MC-Unique: SdVbLzVIPYSwjj9V0dpJMQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 ay31-20020a05600c1e1f00b003a53bda5b0eso2206310wmb.0
 for <qemu-devel@nongnu.org>; Mon, 08 Aug 2022 07:23:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:cc:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=s8Nc0Llm1bgGzPAvbVPHAhlqK535yVT5XrqpWqgpMLk=;
 b=kHRIg46Hvfy+ZPSdpVdHoc8GGNityTXMkLy1ILKACisOW3b2ixQLIViP2V4mkr+/0t
 8Md+gqGyN4FBUd44b1KTGEQjTncgGIEuMuJS+J3ijw+x/WZF7+eROE08OckpaRutPk3s
 Q51DETyIvf1I3cbkFbgkwC5FqvLSmrYcd4yGMvv2MPOwlkc8vIV/2MN72sIvr6ycrPQT
 drLPzGtmwIBHfNixS2f66EE8Qmw1gLi1INhDisAfwrRrlBTVyTLhWcrcshxZgIF0mr7d
 cpt87thfN1jJI2LI4irHfUnJG6abhB7INvT01RH+U1YXM+uVIwas6Ye09qOMlkYCczXe
 9C/w==
X-Gm-Message-State: ACgBeo3dr+XLV3uHcg4530CLhgbVg+VrBTv7cjQDTqO+qbUbGh1Ky+LA
 DZsKrRuKu3RYJGNmZatedwKGjE/myJovkSBbszIcNWqFfZuO3l3CHYhAH7CTQaOMQgjs6tXlR8G
 zgJdPahThiAjwJgE=
X-Received: by 2002:a05:600c:1e14:b0:3a5:1d57:d49d with SMTP id
 ay20-20020a05600c1e1400b003a51d57d49dmr9872716wmb.3.1659968638261; 
 Mon, 08 Aug 2022 07:23:58 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5Y4Brep8CTQHjjKycRGWvPPSX2n+aLClOJTpi7HuW2rdT9IkJBW200tGroqyeIqQ0vv7gZ+g==
X-Received: by 2002:a05:600c:1e14:b0:3a5:1d57:d49d with SMTP id
 ay20-20020a05600c1e1400b003a51d57d49dmr9872707wmb.3.1659968638066; 
 Mon, 08 Aug 2022 07:23:58 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-42-113-71.web.vodafone.de.
 [109.42.113.71]) by smtp.gmail.com with ESMTPSA id
 b18-20020a5d4b92000000b0021d6924b777sm11113168wrt.115.2022.08.08.07.23.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Aug 2022 07:23:57 -0700 (PDT)
Message-ID: <70743a29-474e-728f-4ee1-dd4c734f342f@redhat.com>
Date: Mon, 8 Aug 2022 16:23:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PULL 0/5] Misc QEMU 7.1 fixes for 2002-08-08
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20220808125706.60511-1-pbonzini@redhat.com>
Cc: "Daniel P. Berrange" <berrange@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220808125706.60511-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 08/08/2022 14.57, Paolo Bonzini wrote:
> The following changes since commit 3916603e0c1d909e14e09d5ebcbdaa9c9e21adf3:
> 
>    Merge tag 'pull-la-20220729' of https://gitlab.com/rth7680/qemu into staging (2022-07-29 17:39:17 -0700)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/bonzini/qemu.git tags/for-upstream
> 
> for you to fetch changes up to f6a5f380627ab2af384bf2f2940d29386dea11ff:
> 
>    tests/qtest: add scenario for -readconfig handling (2022-08-08 14:54:56 +0200)
> 
> ----------------------------------------------------------------
> * Fix and tests for -readconfig
> * Fixes for changeable block size
> 
> ----------------------------------------------------------------
> Daniel P. Berrangé (1):
>        tests/qtest: add scenario for -readconfig handling

I still had some questions wrt to Daniel's patch, especially there seems to 
be a bug ("spcie" instead of "spice"), see:

  https://lists.gnu.org/archive/html/qemu-devel/2022-08/msg01153.html

I doubt that this test is working if spice is enabled...
(which leads us to the next question: if the CI did not fail for you, are we 
missing a build with spice enabled there?)

  Thomas



