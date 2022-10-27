Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7336860FBFA
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 17:31:19 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo4lp-0007iF-Ps; Thu, 27 Oct 2022 11:26:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oo4lX-00067N-21
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 11:26:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oo4lR-0005wW-Eu
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 11:25:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666884348;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MlSoFtLprZ7zyOdq/Xat6L5O6fZtpRfP2cujlwEfb9U=;
 b=ObxL2dDOtPKbWrh3HrZ44Kx1Ay/jLuEFw9dAj7c8VNFGscmgZYzVoXid5KeRr2mePijq9k
 jm/c2Ybvbn4zYm1n1NHpluwiMqu67agiwj5j4wAVtvsIStqKa05XEGc5f+g4DiTxIN/PN5
 mEm5G08w5BpZWoiHkX7R81G17YFrrJw=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-624-Hbs5XgXSNfeUZ-fItXrHxw-1; Thu, 27 Oct 2022 11:25:46 -0400
X-MC-Unique: Hbs5XgXSNfeUZ-fItXrHxw-1
Received: by mail-wr1-f71.google.com with SMTP id
 h18-20020adfa4d2000000b00236584fc8c7so519810wrb.7
 for <qemu-devel@nongnu.org>; Thu, 27 Oct 2022 08:25:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MlSoFtLprZ7zyOdq/Xat6L5O6fZtpRfP2cujlwEfb9U=;
 b=y3KrA/LTVkUTdzooN7G0MAwVf1J/7dXsshlG81++bVKU1BhK8IwLlJ3Ev57hJcdi1d
 WCqWRkEGm5w6Lr6x3EumBExjcOgbQno+CKIISvU9FsjduFC1OV+3bwO33dSCIP7DtnX3
 O0Cg1qhwyY/Iy8tbeJxsOtLwYcyU6s0D0QGAmW8xsnQnB9DlTtjoDoLqDBrD/Akq3GGl
 d2SPu9qVGIQkN3v0NX+Xh3ykiAJd06arRLAm/wEFz6rVzuTo1w955HLi/+WqJ1973qrG
 PregoQ1RGqyn9QQCbDXca2sqcTkMVxEtE+/dP9N9lgmRn/IStnXSAdi6PtAEpqz+crQ8
 p+ZA==
X-Gm-Message-State: ACrzQf3fU7F62Zk57W/di0pMGhc9h2AMQ6QUG2zHmSk7UcfxqLT1qsMc
 a6BGRRbO2Ty9p6NWXekqe1ieOPrzijUvZCCgwrsb5FhSMyKvjAxCQ9dkaOvKxZonBsUvC+j2C5v
 tbfKaO2J8xJHpeqs=
X-Received: by 2002:a05:600c:a4c:b0:3b4:fc1b:81 with SMTP id
 c12-20020a05600c0a4c00b003b4fc1b0081mr6224786wmq.125.1666884345730; 
 Thu, 27 Oct 2022 08:25:45 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6AlCjhq7at2iT7JNVQajVhFsJxk3CPBfQDV7mB8AGZYNaFweqTVVo7mHlUkBpIDNkQrx+t3Q==
X-Received: by 2002:a05:600c:a4c:b0:3b4:fc1b:81 with SMTP id
 c12-20020a05600c0a4c00b003b4fc1b0081mr6224776wmq.125.1666884345503; 
 Thu, 27 Oct 2022 08:25:45 -0700 (PDT)
Received: from [192.168.8.100] (tmo-066-116.customers.d1-online.com.
 [80.187.66.116]) by smtp.gmail.com with ESMTPSA id
 n17-20020a05600c501100b003b4fdbb6319sm3532321wmr.21.2022.10.27.08.25.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Oct 2022 08:25:44 -0700 (PDT)
Message-ID: <57067646-651b-15b1-34a9-99b4d9489421@redhat.com>
Date: Thu, 27 Oct 2022 17:25:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 0/3] target: Rename headers using .def extension to .h.inc
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>
References: <20221025235006.7215-1-philmd@linaro.org>
 <8d197b71-937a-5693-3b7f-ea4bded8c360@redhat.com>
 <9b3824be-1da3-e5bb-d324-d1f2a417b6e8@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <9b3824be-1da3-e5bb-d324-d1f2a417b6e8@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 27/10/2022 16.12, Philippe Mathieu-Daudé wrote:
> On 27/10/22 08:46, Thomas Huth wrote:
>> On 26/10/2022 01.50, Philippe Mathieu-Daudé wrote:
>>> We use the .h.inc extension to include C headers. To be consistent
>>> with the rest of the codebase, rename the C headers using the .def
>>> extension.
>>>
>>> IDE/tools using our .editorconfig / .gitattributes will leverage
>>> this consistency.
>>
>> Ack for this series, but I've got a meta-question: Does anybody remember 
>> why we are using .h.inc and not .inc.h for such headers? .h.inc has to be 
>> manually configured in most editors for supporting syntax highlighting 
>> here - with .inc.h most editors would get it right by default instead...
> 
> Daniel synthesized the reason here:
> https://lore.kernel.org/qemu-devel/20200817165207.GN4775@redhat.com/
> 
>  >> IIRC, we need to use  c.inc, because Meson has specific semantics
>  >> around a file ending in ".c" that we don't want.
> 
> First explanation from Paolo:
> 
> https://lore.kernel.org/qemu-devel/36032642-9bea-8625-65a6-bd4afc7e459d@redhat.com/ 
> 
> 
> See also for generic .*.inc admitted as convention:
> https://lore.kernel.org/qemu-devel/CAFEAcA-kOs3dKhh3SRchg6Ne8QL8kwyz+2ihDC6ND2v-seuRfw@mail.gmail.com/ 
> 
> Could be worth mentioning in docs/devel/build-system.rst...

Thanks for the summary! ... now if someone (who feels confident about all of 
this) could add some sentences to build-system.rst, that would be really 
great...

  Thomas


