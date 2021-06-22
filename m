Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4B813AFDE0
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 09:27:37 +0200 (CEST)
Received: from localhost ([::1]:36346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvaoq-0007ux-Lo
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 03:27:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lvanu-0007EY-TH
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 03:26:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60172)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lvant-00023H-10
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 03:26:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624346796;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JMVqMEiJRb1OXAmVhIOBTeKL74ULTSFu5NrMEOWBzwg=;
 b=OSkIK88YOBIx6n+U0726OCoTppl8Gj5durBcciCSHvqJEuYzTTEz7bK7nF7DX5btZGIUzh
 dyxTzdGhaMpi9DYSDSJu2Iw+eyUIIEvcKSbkER3RZ9jJcG3LxPHGcTE2b2M+vzFZyM1Erf
 I28q0FuZPWgcK7bQsqvGKw4rSC9I7/c=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-287-oGnYrtqcNimLQQZC30g5JA-1; Tue, 22 Jun 2021 03:26:34 -0400
X-MC-Unique: oGnYrtqcNimLQQZC30g5JA-1
Received: by mail-wm1-f69.google.com with SMTP id
 f22-20020a1c6a160000b029018f49a7efb7so397807wmc.1
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 00:26:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JMVqMEiJRb1OXAmVhIOBTeKL74ULTSFu5NrMEOWBzwg=;
 b=ntwbyUCR2Urm3C1H4gtXS53m9Yt6qSiV+LKcjamSeZysSaXSmxeo4LslT938MjzX6s
 wzsCtmkWcjzM5ilvkZx9pFBYsuwZsC8CesrIvY0L4lq2No/easohNmYeSc+mYiaD2BuW
 G1RZqza170ayTCQxn5LiTd5EsJQo3H0+h/nNptAeG7od3CfDaKzq0c+a03VGW1YE2AGN
 uu3HkDGTBDsMWldStlHMkkxQf0zT049VssgC1u+iSQjg/r8lf5OBCRGbx0CXM5RQw5LM
 CKPub2L+WTsdew4Gosku8mZcsTc4vWG+JAOk6vCS/q1yCl4do6wOQDTJ6x/y2LVwOQ2C
 gSCQ==
X-Gm-Message-State: AOAM532CzNhNLVwHlUfUSXXw+/rXRPQ6Vh4E1CqBxc5Aot8J0+sTQGBt
 9mSO0VwaS1RvPz/hoU8NoEXhNBWmsJavmdj6wq+V3tCncvFuoAkl+3YEUQrj9HWGGQmidBT+/yj
 oIOl8ppvT7m3fovs=
X-Received: by 2002:a7b:cb03:: with SMTP id u3mr2743202wmj.119.1624346793235; 
 Tue, 22 Jun 2021 00:26:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxed7b+fKMrJQSOMv3zdCr+w7jSwUigjqHJpmfIDOsoq4D7JXu2WiTZC8Cs1JkolLC9M9e4Ug==
X-Received: by 2002:a7b:cb03:: with SMTP id u3mr2743170wmj.119.1624346792975; 
 Tue, 22 Jun 2021 00:26:32 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id s5sm21590677wrn.38.2021.06.22.00.26.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Jun 2021 00:26:32 -0700 (PDT)
Subject: Re: [RFC 0/3] qtest: pick tests that require KVM at runtime
To: Thomas Huth <thuth@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 qemu-devel@nongnu.org
References: <20210616152455.1270264-1-imammedo@redhat.com>
 <f136b5a1-504b-c602-2e70-12b5b0d976b6@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <75263d99-5da8-bdc5-e977-13c83a31b532@redhat.com>
Date: Tue, 22 Jun 2021 09:26:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <f136b5a1-504b-c602-2e70-12b5b0d976b6@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.373,
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
Cc: lvivier@redhat.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/22/21 9:20 AM, Thomas Huth wrote:
> On 16/06/2021 17.24, Igor Mammedov wrote:
>>
>> Sometimes it's necessary to execute a test that depends on KVM,
>> however qtest is not aware if tested QEMU binary supports KVM
>> on the host it the test is executed.
>>
>> For an example:
>>   test q35 machine with intel_iommu
>>   This test will run only is KVM is available and fail
>>   to start QEMU if it fallsback to TCG, thus failing whole test.
>>   So if test is executed in VM where nested KVM is not enabled
>>   or on other than x86 host, it will break 'make check-qtest'
>>
>> Series adds a lightweight qtest_has_kvm() check, which abuses
>> build system and should help to avoid running KVM only tests
>> on hosts that do not support it.
> 
> You also might want to update the check in tests/qtest/migration-test.c
> while you're at it.
> 
>> PS:
>> there is an alternative 'query-accels' QMP command proposal
>> https://patchwork.kernel.org/project/qemu-devel/patch/20210503211020.894589-3-philmd@redhat.com/
>>
>> which I think is more robust compared to qtest_has_kvm() and
>> could be extended to take into account machine type.
> 
> Could you please get in touch with Philippe directly and discuss which
> way to go? We certainly don't need two approaches in the end...

I'm certainly fine if Igor wants to restart this effort :)

Maybe doing as Claudio suggested, start have qtest_has_accel()
tests accel with Igor's shortpath first, then fallback to
'query-accels' QMP command?


