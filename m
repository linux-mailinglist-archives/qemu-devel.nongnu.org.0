Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B0C45BD65
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 13:35:58 +0100 (CET)
Received: from localhost ([::1]:57322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mprVE-0004wG-W9
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 07:35:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mprTh-00046x-C1
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 07:34:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38463)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mprTd-0004SZ-S5
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 07:34:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637757256;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=26o6tM9xdbm8zSQR0ezUDBpaqzth2vRh4Od9mRx1fS8=;
 b=TyhqgCIOPfuE32Jaxw58eVltOj5zTIrVkLQhmV4942Bx2H0G55daSNapDVNRIXAkQRF7s5
 gHfQedtk515Et8a12B259K5/kfuxNY7ILBdCQIsZBk5tUiqRgk2hSeBlU9zhfkS1QHWESC
 Pik5E4jIXgCYJ3b7JOd5yoBBkWCa40Q=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-310-5h23HkPXNP66-T2hn53DdA-1; Wed, 24 Nov 2021 07:34:15 -0500
X-MC-Unique: 5h23HkPXNP66-T2hn53DdA-1
Received: by mail-wm1-f72.google.com with SMTP id
 ay34-20020a05600c1e2200b00337fd217772so1364938wmb.4
 for <qemu-devel@nongnu.org>; Wed, 24 Nov 2021 04:34:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=26o6tM9xdbm8zSQR0ezUDBpaqzth2vRh4Od9mRx1fS8=;
 b=gU1sHDq3teWvpo8SQD91QFngkby8hybkdRLd/ntNRLikZInCyn76qdgAOUruKPszIp
 ziHZWKxQx5G1J0DGV76QNrR+ZpAh3vx1+zookEHevGwglyRbFc6wIWgtsihYxLCd9s5V
 UQPJLv2dwacYTckdoThChtoKRwFXCXLdcl9GZaRRu9s89lFTQIdml1wzPZEM/HFDEoOp
 1AKL6X9wBmEms8ADrWBXQSDJRo3sr3/qxlGTEDr5vVXd/JUdnpquPOx30OlQPkqQ6NSo
 DG47dRkT75sBaFjjPt2xTCbLuB0dI3cllAM+05UGgtPi2x3bBvcuppvfD+XI6PcBvAOm
 P/FQ==
X-Gm-Message-State: AOAM533yP953Wx6EUGlsuPYUk7h3khrTxKoD+kET72I+ILsEMqgMI9tJ
 /UObQFi+gRF8cypQtdZ/TF28GwTqKTF5cUvpuaxWmsKru7JILOqyQCP4K9rBX30VIIeKFVc7nHK
 SnOXY4TIUInYzn4U=
X-Received: by 2002:a7b:cbc3:: with SMTP id n3mr14880194wmi.90.1637757254065; 
 Wed, 24 Nov 2021 04:34:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwe5c8HW/nRXclpoi/XasEyxhKEaX+kPUxlL5yFl5nMdiEWFOe8D3y+XbyDJnKt6m3a38do+Q==
X-Received: by 2002:a7b:cbc3:: with SMTP id n3mr14880134wmi.90.1637757253790; 
 Wed, 24 Nov 2021 04:34:13 -0800 (PST)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id c4sm15157824wrr.37.2021.11.24.04.34.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Nov 2021 04:34:13 -0800 (PST)
Message-ID: <9fa0d8bb-9f64-539f-c579-f26d6013207e@redhat.com>
Date: Wed, 24 Nov 2021 13:34:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 0/6] tests/docker: Update Fedora containers
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Alexander Bulekov <alxndr@redhat.com>
References: <20211103144844.1285634-1-jsnow@redhat.com>
 <YZ4tuO2tJKdT7FP3@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <YZ4tuO2tJKdT7FP3@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -75
X-Spam_score: -7.6
X-Spam_bar: -------
X-Spam_report: (-7.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-4.1, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, John Snow <jsnow@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc'ing Alex.

On 11/24/21 13:19, Daniel P. Berrangé wrote:
> On Wed, Nov 03, 2021 at 10:48:38AM -0400, John Snow wrote:
>> Fedora 33 will be EOL before 6.2 ships; Fedora 35 was just
>> released. Update our various containers to test on F34 and F35.
>>
>> Fix a minor code warning issue that surfaces in a new version of Clang,
>> and fix a small deprecation issue for the latest version of spice.
>>
>> In testing, I found that oss-fuzz was more likely to time out on GitLab;
>> it's unclear if this is a performance regression or just getting unlucky
>> with when I test.
> 
> For me it times out every time on Fedora 35. In fact if I run it
> locally, it doesnn't even finish after 24 hours ! There's a real
> bug in there somewhere.
> 
> 
> Regards,
> Daniel
> 


