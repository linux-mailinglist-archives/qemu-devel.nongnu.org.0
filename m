Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61595690DBC
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 16:58:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQ9I8-0008Kk-HQ; Thu, 09 Feb 2023 10:56:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pQ9Hz-0008KE-Ld
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 10:56:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pQ9Hx-0006OW-Md
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 10:56:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675958190;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cdQXeUifbENFafvvBVqTUigk1jLgAC3mphSyBEo/lMo=;
 b=epnlcodSFUlwHkLRZ/eBbmNISYmb732mq4wwLT8TsPzunI1H3PIs4r0VOBqnUfOGzdKs9j
 2cP35GKKPeL3F3gm/xWKIFdooFNXLpMNU76syXMcehilWR8WAjLEIqSV64htIVz3uGH/bf
 pZdYa3qkB2ccvzXnivHEi7l0jK30vWs=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-187-omVoJoiXN2yqNDWLUw1Kig-1; Thu, 09 Feb 2023 10:56:28 -0500
X-MC-Unique: omVoJoiXN2yqNDWLUw1Kig-1
Received: by mail-qt1-f200.google.com with SMTP id
 he22-20020a05622a601600b003ba3c280fabso1321057qtb.2
 for <qemu-devel@nongnu.org>; Thu, 09 Feb 2023 07:56:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cdQXeUifbENFafvvBVqTUigk1jLgAC3mphSyBEo/lMo=;
 b=5WrMq1Koh/0I5TqbTb8TyvipXC8h/qW4+pEKyy2NsxRLU4YoONoEvTwi8/1kn2Nelx
 nTr2kMtdORB/LKIs6SUzJIoVpeYNcIVrpUuq+qUtR9kp5ur07SwI0AgSlsj3doU4qcts
 LqCi22kwZu3cpplCa/t1A6ka52pAlfXWsQ1CQg8I65MtCy9QtdLMHL/+sdhDp8KXjRVE
 SEqYN9AIq8Mxcu8c7LwEToYCBCpg7dCzcmGNyLKYvElFPe638vuAaU/xE0IfcirCs6mk
 yxNmDpZxMvHGj7pWNWSagpnLlRNbrFwNyGZtzYg9aQk5iBdcBAywEMzGhZGhIS6j9B/R
 j+ow==
X-Gm-Message-State: AO0yUKWjxCqwy6U25GJqQmFuwdvUXvjWEq98C0l4c85Iav63JEDEMLE9
 bqFoH/c2LCBPPe+CnnRbt36vWKsh+EMDVZQUIEEDlDRdlnML+4rU/o/V08YoJ4MiZiD2XiBf+Qy
 1BEzhGKnjXyx1QhA=
X-Received: by 2002:a05:6214:2b05:b0:568:cc4d:19ab with SMTP id
 jx5-20020a0562142b0500b00568cc4d19abmr21610453qvb.21.1675958188488; 
 Thu, 09 Feb 2023 07:56:28 -0800 (PST)
X-Google-Smtp-Source: AK7set+fs9ednrwZl0XHzu19rd7NuNxEPQTfsl2JQjWyXhtgr6SrTmbCTFISm3fpRV23qhsRjOM6CQ==
X-Received: by 2002:a05:6214:2b05:b0:568:cc4d:19ab with SMTP id
 jx5-20020a0562142b0500b00568cc4d19abmr21610418qvb.21.1675958188248; 
 Thu, 09 Feb 2023 07:56:28 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-176-209.web.vodafone.de.
 [109.43.176.209]) by smtp.gmail.com with ESMTPSA id
 l63-20020a378942000000b0071d3e432c9bsm1627232qkd.28.2023.02.09.07.56.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Feb 2023 07:56:27 -0800 (PST)
Message-ID: <273ab983-338b-1aa2-6317-ed5a9099b574@redhat.com>
Date: Thu, 9 Feb 2023 16:56:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 5/7] testing: Add Python >= 3.7 to Centos, OpenSuSE
Content-Language: en-US
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org,
 Daniel Berrange <berrange@redhat.com>
Cc: Hanna Reitz <hreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Cleber Rosa <crosa@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
References: <20230209154034.983044-1-jsnow@redhat.com>
 <20230209154034.983044-6-jsnow@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230209154034.983044-6-jsnow@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.148, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 09/02/2023 16.40, John Snow wrote:
> This is just a proof-of-concept patch, as these files are lcitool
> generated. The real fix will involve updating the lcitool configuration
> and updating these files that way.

I think it would be good to have a RFC or DONOTMERGE in the patch title, so 
that it is clear right from the start that this should not get merged.

> Note that this requires OpenSuSE Leap 15.3; 15.2 won't cut it.

Looking at https://en.wikipedia.org/wiki/OpenSUSE#Version_history it seems 
like even 15.3 is EOL already, so I think we can switch to 15.4 immediately.

  Thomas


