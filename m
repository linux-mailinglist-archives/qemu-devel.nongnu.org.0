Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B3EC6EFAAD
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 21:10:43 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prkWt-0002kE-Mg; Wed, 26 Apr 2023 15:10:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1prkWp-0002hr-VI
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 15:10:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1prkWo-00037M-IH
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 15:10:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682536209;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VrSuq2LEeUkAP98e8EWwupizJmXmPw1wxeEBaK5unao=;
 b=NS5O0JjsAuCU6tZ+Ghm/b/jht/MpYIbQ9JDKPRBgpVDoqzjDCkRmqZJnz/0RYR90ndS0Md
 d+MGL7iEdM7yNlrrUNrHm4CJEYHethXnFfVwgfStPf9fSh2knXX/kMpmbLko/w2trGOneg
 Bcj2tHEC12RHSCP5A15eGgQb7pVncs4=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-518-_cG2pT8APPGKgGch09LMkw-1; Wed, 26 Apr 2023 15:10:08 -0400
X-MC-Unique: _cG2pT8APPGKgGch09LMkw-1
Received: by mail-ed1-f72.google.com with SMTP id
 4fb4d7f45d1cf-5069f2ae8eeso696593a12.0
 for <qemu-devel@nongnu.org>; Wed, 26 Apr 2023 12:10:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682536207; x=1685128207;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VrSuq2LEeUkAP98e8EWwupizJmXmPw1wxeEBaK5unao=;
 b=PhSHahL+SZ9HqjVkLALOLTIBx+LznxeNRevw/NiiBPqel7k8Kh4FoOMjQSntAdm+Vy
 tR1HPEi+4q6LXizTZt/7JnWiK1OrMDjPXirJ+OimH2xt0mn2ajmsqRu9GtV80XzqHFyX
 LfZ8vjeRgyyxmkYfbDzRecJC2uKXjzyuo6pcp+KGM/+wGXNV/14kV/q+wKJMASFkEiSL
 S5OriEdeiFTfADnEg4m9USWiXt/ZLlGkC77yAW427z4rToFpweCCZby2a7DY/CaPMsiO
 kGQCWc2rGbtp7kTeSukIFUQ4mf11CAM/zMN6+un9rh8LRPPmdfbTMQCe4eFaHY8yEILh
 dBjw==
X-Gm-Message-State: AC+VfDw2W5mOOrWa5vYCU1qq2uZ8kk2efciVk23d2nj+eB6YQRLvye6t
 c3aj/y6/RS8Wo6zAVMNU23igAD0jxNoqKsIg4l0ik3mKld/xLnoivxOiSjy+jkONqBoz+xB3MGi
 YSkYyoQsHG7B1/hE=
X-Received: by 2002:a17:907:b025:b0:959:b757:e49 with SMTP id
 fu37-20020a170907b02500b00959b7570e49mr2651999ejc.1.1682536206947; 
 Wed, 26 Apr 2023 12:10:06 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7Zzjiik/hOjfpKWRM0tiCXxzZa0JOTBHyGkT3C1qgMyCyQ+OPfrcq1JIOA7PW+vtDyMtAt1Q==
X-Received: by 2002:a17:907:b025:b0:959:b757:e49 with SMTP id
 fu37-20020a170907b02500b00959b7570e49mr2651984ejc.1.1682536206651; 
 Wed, 26 Apr 2023 12:10:06 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 x19-20020a1709065ad300b0095381e27d13sm8416406ejs.184.2023.04.26.12.10.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Apr 2023 12:10:05 -0700 (PDT)
Message-ID: <9dbae22f-ba66-4e5a-50fa-4fc4b790983d@redhat.com>
Date: Wed, 26 Apr 2023 21:10:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [RFC PATCH v3 00/20] configure: create a python venv and ensure
 meson, sphinx
Content-Language: en-US
To: John Snow <jsnow@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Warner Losh <imp@bsdimp.com>,
 Beraldo Leal <bleal@redhat.com>, Kyle Evans <kevans@freebsd.org>,
 Thomas Huth <thuth@redhat.com>, Daniel Berrange <berrange@redhat.com>,
 Reinoud Zandijk <reinoud@netbsd.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Ryo ONODERA <ryoon@netbsd.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Ani Sinha <ani@anisinha.ca>, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20230424200248.1183394-1-jsnow@redhat.com>
 <87ab99cd-b3a6-22a5-ce2a-f569b2ef1213@redhat.com>
 <74877b05-a904-8c51-4b50-bdd078a2fab3@redhat.com>
 <CAFn=p-ZRUocSC+UhTs1FPNBbnY0q2c6b5_ZAxT7_C9LjB8MKWA@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <CAFn=p-ZRUocSC+UhTs1FPNBbnY0q2c6b5_ZAxT7_C9LjB8MKWA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.422, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 4/26/23 18:16, John Snow wrote:
> 
>      > - I am ambivalent about keeping --enable/--disable-pypi in the first
>      > committed patchset, but in any case I would move patches 16 and 20
>      > before patch 15
> 
> I might be stubborn but I think I want to keep it in for now. If it 
> needs redesigned to fit with the other flags you want to add, I think 
> that's OK.
> 
> if we vendor the whl directly in qemu.git we won't need PyPI for meson, 
> but it's still useful for Sphinx so I think I'm still leaning towards 
> keeping it.

Yes, it's definitely useful.  It's just that unifying $python with 
sphinx-build's interpreter is as a separate (and earlier) step than 
introducing PyPI.

> I'll try to refactor to keep it at the tail end of the series.

Cool, thanks.

>     Just one extra thing, since we're changing so much of Python handling
>     and since the code is written, I would keep the Debian 10 workarounds
>     for now, and only drop them after we drop support for 3.6.
> 
> 
> This series was written assuming we get to drop 3.6 as a prereq. Is that 
> not the case?
> 
> Or did you mean to write 3.7 there?

Yes, 3.7.

Paolo


