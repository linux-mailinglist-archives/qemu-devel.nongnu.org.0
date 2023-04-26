Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 803F36EFB0B
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 21:24:47 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prkkO-0000Rd-4V; Wed, 26 Apr 2023 15:24:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1prkkK-0000JX-S5
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 15:24:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1prkkJ-0005IK-3V
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 15:24:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682537046;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q36PIdFxc46QkU0JcfUxoVnrvG+NTHKUYDsNm2Q58is=;
 b=QfTpc9TvNwvfyThytjFoeb3mOgZBChBHyi/GItzQAiTIAjaDpi6Sx45oJ4zhZh1wHUDL+R
 L+fdZdlhHI03X1sapXOmcIdfdpKiCE03XlpizaRjUkF19ptEQJrO8pI0MifVn76uJgNuj3
 9c856IKI8jQzj+oYK9+1Xf1ExPez1oo=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-599-eUK0p5vKMvuc2qD9ng6lQw-1; Wed, 26 Apr 2023 15:24:01 -0400
X-MC-Unique: eUK0p5vKMvuc2qD9ng6lQw-1
Received: by mail-ed1-f70.google.com with SMTP id
 4fb4d7f45d1cf-50684e6414aso7340219a12.1
 for <qemu-devel@nongnu.org>; Wed, 26 Apr 2023 12:24:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682537040; x=1685129040;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Q36PIdFxc46QkU0JcfUxoVnrvG+NTHKUYDsNm2Q58is=;
 b=IM0Blk2+CH+1FCQ9tIyUSGgTmAm4OeaasbIaqby1w+M1t59kX3knOn8Romrimoc4Z0
 UFqqmasqi0GThcwK/uYoCVvbO/rNLQow82wN/F6SFKvKkofbAGGOjiAt81A0s2d7ntfE
 QqIV2VH5Ia+mMNS40q0G9yhr+qre7IQ2In7onyw2d4bb49BMHAyFHlfI4mEZU59Qz1R+
 tdUSejdEc7ZSK49jtb40OMBAOorYr2kvOSlfIgMExY3kWCsB0UdTZvWW/8AWHIku+J+9
 ESmeGnntxWC+Y0wl+Y4N/nSKuhfLY8BnCQNNP8p0GxKYfjoGCVjuv+ImOGZNM1UaDc0V
 B0XA==
X-Gm-Message-State: AAQBX9fM7cIApUqNrItqQTrAeqJoD5yDdGttgJAKmS+uCN4FeCCtHjf7
 eN2f1j47zYU94aJDPItZaSt20mernwlYyGAed8gQC4rpLzknaKgQGgIeQmGERJmy859Jl8zpqc1
 6XkYS7GnzEKEIt6w=
X-Received: by 2002:a05:6402:216:b0:509:d476:3a0f with SMTP id
 t22-20020a056402021600b00509d4763a0fmr11712371edv.2.1682537040590; 
 Wed, 26 Apr 2023 12:24:00 -0700 (PDT)
X-Google-Smtp-Source: AKy350Zs6usAyG4Jy8AWAVj1jFugT+oj+z4lcKqp1NTic4dUfmLi9n6HFV4ug8iBa6stjorN89TVwQ==
X-Received: by 2002:a05:6402:216:b0:509:d476:3a0f with SMTP id
 t22-20020a056402021600b00509d4763a0fmr11712352edv.2.1682537040307; 
 Wed, 26 Apr 2023 12:24:00 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 b11-20020a056402138b00b004bd6e3ed196sm7012411edv.86.2023.04.26.12.23.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Apr 2023 12:23:59 -0700 (PDT)
Message-ID: <d677774d-b4a2-5af2-7dbc-942e88b25fad@redhat.com>
Date: Wed, 26 Apr 2023 21:23:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [RFC PATCH v3 00/20] configure: create a python venv and ensure
 meson, sphinx
Content-Language: en-US
To: John Snow <jsnow@redhat.com>
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Warner Losh <imp@bsdimp.com>,
 Beraldo Leal <bleal@redhat.com>, Kyle Evans <kevans@freebsd.org>,
 Thomas Huth <thuth@redhat.com>, Reinoud Zandijk <reinoud@netbsd.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Ryo ONODERA <ryoon@netbsd.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Ani Sinha <ani@anisinha.ca>, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20230424200248.1183394-1-jsnow@redhat.com>
 <ZEjmo7dRO0Vwcmo5@redhat.com>
 <1f69da1d-ef7a-40f9-7116-fdd572962543@redhat.com>
 <CAFn=p-a9Nz446twKediLqu-dzox7X_27MG+=mxDEBAdj+uehFQ@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <CAFn=p-a9Nz446twKediLqu-dzox7X_27MG+=mxDEBAdj+uehFQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
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

On 4/26/23 18:32, John Snow wrote:
> 
>     mkvenv: Creating {isolated|non-isolated} virtual environment [based on
>     /home/pbonzini/myvenv]
> 
> "based on ..." for nested venv case only?

Yes.

> 
>     and when creating the console-scripts shims:
> 
>     mkvenv: Found avocado v90.0
> 
> Sure. Up to the user at that point to figure out if we used that package 
> or not.
> 
> e.g. "found meson 0.5.0" might occur even if we require >=1.0.

John and I discussed offlist and he'll try to remove --gen so that all 
system packages handling is done at "mkvenv ensure" time.  The "Found" 
message can then be printed at "mkvenv ensure" time too.

Thanks,

Paolo

> Simple to implement, though.
> 


