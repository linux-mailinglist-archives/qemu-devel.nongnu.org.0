Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9046248D532
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 10:59:16 +0100 (CET)
Received: from localhost ([::1]:33142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7wt0-0004ty-AR
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 04:59:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1n7wq2-0003Rw-89
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 04:56:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39662)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1n7wpz-0003U1-CA
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 04:56:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642067760;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Qg9yq3c1Y+ToCk0+TIVciRTP+iz9xLCSBQ4av64Tv2M=;
 b=PCNPjsOotYcc3/HCO1JiCn/nUCgUUkDeT+SidCLAtJQIja2ZB61pMv2py+CN+SUx2JJLKh
 O3P8t8npX9Q/P8k7AJ4AM6Tbyr39Xh7Pxq7ZIBWWL0mNXPe5k9hCnSD+aJBDD8nnWwATKg
 VTyyG6V0taKsrSGQYmnl3DoSh5hEr3Y=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-158-ft8vFUFVMRKYnWO_7KSW9A-1; Thu, 13 Jan 2022 04:55:59 -0500
X-MC-Unique: ft8vFUFVMRKYnWO_7KSW9A-1
Received: by mail-wr1-f72.google.com with SMTP id
 j19-20020adfa553000000b001a375e473d8so1009132wrb.4
 for <qemu-devel@nongnu.org>; Thu, 13 Jan 2022 01:55:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Qg9yq3c1Y+ToCk0+TIVciRTP+iz9xLCSBQ4av64Tv2M=;
 b=OJhh4llRsny1IX+hmwpX45Eko02rt/FOvwW7xRUTa680sNQhGhyTiiRdX9e8fGT+ur
 Ith/GUie+cVh1dASCnSGk7keoB7i3p5tu1PG3oVOgFmpUTZSkL3WfUU8QK0dX/WCVJ9b
 DCNaF9wPF4bGOtTQ3aEtGj7n5FCXP3n7W8vz0oYh9rFfI6tglVo0xmmii1ryD5CxR0J8
 cWfpsnxeDXrgh7QfEfAQxwgBKPdQpLh8Dzox/sISvZ6TKcsFAs18tjnp+teFzTG3toca
 +S6oCgOd9SmwMiJf1bX4ww3tbL/iyg8/QWCWqQce2qq07TSUdmr86lOXEMYjMzBrMoJL
 LVMQ==
X-Gm-Message-State: AOAM532kwnPUJD/h5lwgIEwteQJ29lDEN86cDQua5MTqLTP9ftItUd22
 9hqDzBG4UnygGuv2xmG3hM4xw+pkD7KXLBULoMOPVP6UG1HqCDuLCgCMPxO+Vm1TkRqqJdi01JE
 Bima38U4KVLLp7NM=
X-Received: by 2002:a5d:53c3:: with SMTP id a3mr1970457wrw.276.1642067758390; 
 Thu, 13 Jan 2022 01:55:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxrgSbqokcEv/WBXf8W3qKK0a+KFVGBW+8BviMFv51a29WEsOg6bhgmCcTrrlBk/GceUTWvow==
X-Received: by 2002:a5d:53c3:: with SMTP id a3mr1970439wrw.276.1642067758220; 
 Thu, 13 Jan 2022 01:55:58 -0800 (PST)
Received: from [192.168.8.100] (tmo-098-68.customers.d1-online.com.
 [80.187.98.68])
 by smtp.gmail.com with ESMTPSA id q6sm2156959wrr.88.2022.01.13.01.55.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Jan 2022 01:55:57 -0800 (PST)
Message-ID: <86567806-8880-f07e-e0ad-c60d2abc3bbc@redhat.com>
Date: Thu, 13 Jan 2022 10:55:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2 2/2] tests: add qtest for hw/sensor/sbtsi
To: Patrick Venture <venture@google.com>, lvivier@redhat.com,
 pbonzini@redhat.com, f4bug@amsat.org, cminyard@mvista.com
References: <20220112232633.1811256-1-venture@google.com>
 <20220112232633.1811256-3-venture@google.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220112232633.1811256-3-venture@google.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.594,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Hao Wu <wuhaotsh@google.com>, qemu-devel@nongnu.org,
 Doug Evanwqs <dje@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 13/01/2022 00.26, Patrick Venture wrote:
> From: Hao Wu <wuhaotsh@google.com>
> 
> Reviewed-by: Doug Evanwqs <dje@google.com>
> Signed-off-by: Hao Wu <wuhaotsh@google.com>
> Signed-off-by: Patrick Venture <venture@google.com>
> ---
>   tests/qtest/meson.build      |   1 +
>   tests/qtest/tmp_sbtsi-test.c | 161 +++++++++++++++++++++++++++++++++++

I'd prefer to use "-" instead of "_" in the file name, but anyway:

Acked-by: Thomas Huth <thuth@redhat.com>


