Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82B2E6EF056
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 10:36:23 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prad5-0002AQ-M1; Wed, 26 Apr 2023 04:35:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1prad1-00029s-Iv
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 04:35:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pracz-0004mM-FE
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 04:35:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682498152;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7QN60KQwMSbtP2Jas+ML5memxyfC8SCYTLlb2k4LDMI=;
 b=We3ejv87RjzhknI79gZ39pwFgoQfn3Jymr/9P+de2sr0NWHBSwo0J6xdzLEBdvsHoti8UB
 KXlIQv3e5y1mAYFDKTCvE2T6G+C4SMp5a+9RAI608CTzbqZDHnoRjYrFHbTb4QcTSM2Zdn
 avZecBXsfNm7TlJcyexh2NcjXMoUSkI=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-126-Jjh8YdGuOnGJTfAyQX44Jw-1; Wed, 26 Apr 2023 04:35:50 -0400
X-MC-Unique: Jjh8YdGuOnGJTfAyQX44Jw-1
Received: by mail-ed1-f71.google.com with SMTP id
 4fb4d7f45d1cf-505b696f254so6585659a12.3
 for <qemu-devel@nongnu.org>; Wed, 26 Apr 2023 01:35:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682498149; x=1685090149;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7QN60KQwMSbtP2Jas+ML5memxyfC8SCYTLlb2k4LDMI=;
 b=QogZw33GjYQHVIRdQUtSvzMR1xX4k58tMaRLfGLVCC/N1TFKNbG9ajPsdawz1WG+XE
 HbL74hKT7C5aq8TWMfFEbuyXgtZWEci60pQqnPsgN8dHqg5CPVp7q49cIcbUjy8LLoGX
 C4zm8M7/JJ6yUJed1KVX+VpG5teECu73AzDXUEfQv0fda5GtVr7Dai9CYGKkRpx9XLPv
 fb6xX56VF21nKU0C6k4Zc6OOhJLdjQ/GGNI1XNkmGLZ+IyDkLku3oZyEEK1hA+eYjj9T
 lu8oqQVr5LpPjMTo0WHOx0I7m9E7rCQ9OdFpsp2lTHW2R7ultxQQQVc42BchT4iRfazc
 DSAQ==
X-Gm-Message-State: AAQBX9dHzI5PpZGS2dRPAsDzQaSwAN0kne8MFcXHabZ26Isk5M3LVViv
 qA2p6F+SE6DulYY4wQZtiWnIRMuSFmxCtZGpvlvgjjM4f91tAcpLCyf7jRSJ4SX9kwAN8AjaeQD
 XbGPI+3ne4ArfEd4=
X-Received: by 2002:a05:6402:120c:b0:506:a2dd:e162 with SMTP id
 c12-20020a056402120c00b00506a2dde162mr16678267edw.22.1682498149318; 
 Wed, 26 Apr 2023 01:35:49 -0700 (PDT)
X-Google-Smtp-Source: AKy350b2SbXch9W9bd+DYRt3Isfegp7vh1j/pdjj93JCXU/mIYYZdcsiCuizd8mITHnK4m/e2ZK77g==
X-Received: by 2002:a05:6402:120c:b0:506:a2dd:e162 with SMTP id
 c12-20020a056402120c00b00506a2dde162mr16678255edw.22.1682498149009; 
 Wed, 26 Apr 2023 01:35:49 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.googlemail.com with ESMTPSA id
 t1-20020aa7d4c1000000b005066cadcc54sm6506591edr.43.2023.04.26.01.35.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Apr 2023 01:35:48 -0700 (PDT)
Message-ID: <85f4b92c-3194-a3e6-b656-289118852341@redhat.com>
Date: Wed, 26 Apr 2023 10:35:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [RFC PATCH v3 00/20] configure: create a python venv and ensure
 meson, sphinx
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 John Snow <jsnow@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Warner Losh <imp@bsdimp.com>,
 Beraldo Leal <bleal@redhat.com>, Kyle Evans <kevans@freebsd.org>,
 Thomas Huth <thuth@redhat.com>, Reinoud Zandijk <reinoud@netbsd.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Ryo ONODERA <ryoon@netbsd.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Ani Sinha <ani@anisinha.ca>, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20230424200248.1183394-1-jsnow@redhat.com>
 <ZEgLNJ13fJf5RAI4@redhat.com>
 <CAFn=p-YNjRZnFUhFr7PfHWKGvRnRnF1mpTc7KvFr5eXBM0Lsxw@mail.gmail.com>
 <CAFn=p-ajvEJkCvv=Z0hG9A8tbf9cYz2eTTDRChwqbFWiMUzAPw@mail.gmail.com>
 <ZEgXo67oiOugfCn8@redhat.com>
 <CAFn=p-bcuu8__gRfRtkMikZ=+N2e63yU2q1rkjaQNpTK_LYL=w@mail.gmail.com>
 <ZEjfJtRC+MfRXpVL@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <ZEjfJtRC+MfRXpVL@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 4/26/23 10:21, Daniel P. Berrangé wrote:
>> So if you already have Sphinx, this should perform an upgrade to the
>> latest version?
>
> Essentially I meant 'force' to mean*never*  use the host python
> installation packages. Always install all the deps in the venv,
> even if they exist in the host with sufficient version met.

I think this is essentially --enable-isolated-venv.  I don't think there 
is a usecase for "let the venv use system packages, but override them 
with pip right away".

>>
>> --python=... # runtime used to create venv
>> --enable-pip-groups=testing,devel,avocado,meson,sphinx
>> --enable-pip=now  # install all python deps now
>> --enable-pip=on-demand  # install qemu.git/meson/sphinx, delay the rest
>> --enable-pip=no    # offline
>> --{enable,disable}-isolated-venv # let venv use system/distro if disable
> 
> This feels like a bit of overkill to me, and would create a hell
> of a lot of combinations to test if you expand the matrix of
> options.

Yeah, this is a bit overkill.  I think we can reduce it to three cases, 
corresponding to:

- --enable-pypi --enable-isolated-venv - use pip to install everything, 
including for options in "auto" state (e.g. would install sphinx without 
--enable-docs)

- --enable-pypi --disable-isolated-venv - use pip to install missing 
packages.  TBD whether to do so for options in "auto" state or only for 
"enabled" (i.e., TBD whether to install sphinx without --enable-docs).

- --disable-pypi (only meaningful for --disable-isolated-venv) - apart 
from vendored wheels, just use system site packages (same as QEMU <= 8.0)

I think we want to hash out this detail first, and thus we should leave 
online mode out of the non-RFC version.  It can be implemented together 
with isolated mode.

Paolo


