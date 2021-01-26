Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAB87303C89
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 13:08:48 +0100 (CET)
Received: from localhost ([::1]:44840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4N9L-0007TM-TT
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 07:08:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l4N8J-000742-Is
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 07:07:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51511)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l4N8H-0000kl-WE
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 07:07:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611662861;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cN0EbMWYqnRkneVHFvIk7H6fJnmZ7xj6ed3uxoUofYY=;
 b=VAizcuE2psWwjK5kLp4zPtdXUAe8dqtmzrJ8GhEwBzL2jf8+a5uNje0hH3t14hN0lFeSi9
 fNmGmjAyOrq/ackYWKFJAk7nRliXBMjfQAn7kPXo7Kw3299OWCnD3WvTG7OxBLW+P6FoSL
 HQG0onF0oeQ0kMef5kY/SQv1669HTwA=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-393-lO6g5yaLPRaoRxerGJDv3A-1; Tue, 26 Jan 2021 07:07:39 -0500
X-MC-Unique: lO6g5yaLPRaoRxerGJDv3A-1
Received: by mail-ed1-f71.google.com with SMTP id f4so9270569eds.5
 for <qemu-devel@nongnu.org>; Tue, 26 Jan 2021 04:07:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cN0EbMWYqnRkneVHFvIk7H6fJnmZ7xj6ed3uxoUofYY=;
 b=C+nJxtLlrKDpDjrNAY+vHczZT+t5hBQZooPWf8NrYvtPcU3lxCO7EuDKUA8USTQd/V
 kXOFnh+nzbcwhKei3X9SpMpkuzdV/GNrv1TaEnaHCsgUHOIfSNmkSj7K0e/DYM9qpEqC
 prrCVQN92dHdBIchCtFE9BSCPzvB9Q/d1PbyG9U0tjI0FsmSjsjUgCk3lEvEc43cawGy
 dG4H0Ps5e7//nneL4gwhhpH9n6fC0sioxrF/h1ua70BnFavjEKoT3qPpDtXWawNC9xEV
 55DlprdzM1H0C39u9PSW2G19Ui9G6ZorW8iTbWYYV3TWtsNN8JkwswVWNbZpScNb7CgN
 9jXA==
X-Gm-Message-State: AOAM531Re5IxA/QtQTsPLYhW8qS5K84EwPx67CJWrokGJk4xLS7VrbNW
 1CIRnr5kh2ckIPe1nRX4483XC8FWufJ3bkIiJdCWSa90cXRnDTWbHim9Hq5n4bXKXwLt9SgVnxP
 0jR0TV7BfcXOpWuE=
X-Received: by 2002:a05:6402:378:: with SMTP id
 s24mr4512571edw.376.1611662858686; 
 Tue, 26 Jan 2021 04:07:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx9StW5MirRpAy4Xe4N8pQRXsNcTJgRZIoVDz0OPz2uaSUpYamvw8hLcI+7BHG7MlnKAaSMdg==
X-Received: by 2002:a05:6402:378:: with SMTP id
 s24mr4512561edw.376.1611662858580; 
 Tue, 26 Jan 2021 04:07:38 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id n5sm10729247edw.7.2021.01.26.04.07.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Jan 2021 04:07:37 -0800 (PST)
Subject: Re: [PATCH 0/2] gitlab-ci: Test Fedora capstone package
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20210126113649.3148417-1-philmd@redhat.com>
 <22c595d7-e5ce-c536-b0de-b1183550c960@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <f3f4f6a7-e74b-3f3d-5b02-367b5c967156@redhat.com>
Date: Tue, 26 Jan 2021 13:07:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <22c595d7-e5ce-c536-b0de-b1183550c960@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Fam Zheng <fam@euphon.net>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/26/21 1:05 PM, Thomas Huth wrote:
> On 26/01/2021 12.36, Philippe Mathieu-Daudé wrote:
>> Add a job for a supported feature: capstone.
>>
>> Philippe Mathieu-Daudé (2):
>>    docker: Install libcastone on Fedora
>>    gitlab-ci: Test Fedora capstone package
>>
>>   .gitlab-ci.yml                         | 7 +++++++
>>   tests/docker/dockerfiles/fedora.docker | 1 +
>>   2 files changed, 8 insertions(+)
> 
> I've posted a patch for this a couple of days ago already:
> 
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg775255.html

Oh I missed it, thanks.

> 
>  Thomas
> 


