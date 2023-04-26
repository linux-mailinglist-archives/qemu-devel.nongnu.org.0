Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA3986EF072
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 10:49:43 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1praq4-00078M-Mf; Wed, 26 Apr 2023 04:49:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1praq3-00078C-4d
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 04:49:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1praq1-0007Ho-Ae
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 04:49:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682498960;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kY/KZKQDisWCnAGeDkJmVL2pp7Jh6/gINHUdEeg2lVU=;
 b=V/wwG82xLrdgoTnasmSxXe+sMS66UYvE19dcbMyQmTaTlQZXEdvG3HDyX7jCY59HlttH3V
 bgNSZf7/xB1fUfOZ3hx/UExyKRSaBjawqd13+on8tzzEka8Fi4qMZzGqBKOGhcBxyTA0MF
 Ph2uKmbVPH1rHNjKsG9giNdIRCmC3oA=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-546-jQNj3UaHOwSedi_e9elEUA-1; Wed, 26 Apr 2023 04:49:19 -0400
X-MC-Unique: jQNj3UaHOwSedi_e9elEUA-1
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-94f2d9389afso607337866b.2
 for <qemu-devel@nongnu.org>; Wed, 26 Apr 2023 01:49:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682498958; x=1685090958;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kY/KZKQDisWCnAGeDkJmVL2pp7Jh6/gINHUdEeg2lVU=;
 b=T2ZcPfZP1fvdo9252MJsFRNAHe74QVp9MwFqZ0lVndo4NWWorkU4/JLtY1tsr2dODW
 JLFY7BP8WNTl+tgLBn1znSqJ6rEBGOci1vfZ3z5wWVhcTCqIvGMTQRSSOXodoYVc6lhH
 ZzaPFtPtGMJzQm3+8gkCVBBCoOIaES9fjxUdheyTk6cjEnk0qzWUmuBRvJs+pOqhwBfK
 6b31Apse/4aG0mOOfNfHwsOdmREMw23eDjnDgUOfw0WYCtVmJ+flocw4VGHf1xyKkj23
 hCV4AEI4y+Vib8lV/a07OiCVlGBxZYqZoYqYmlNCctlxLdwuQLe/V1xUvgnx7zYc10QL
 xxQg==
X-Gm-Message-State: AAQBX9fZVPHjdUamHH/sun2C/exMb54TdDY2JEBDdigXsL6j/VnV2NU0
 sSim7/hz77b6clecbYyCWx43Gp7n/SI5B9iuOvdF9doU7kQVJj9jYe7/l6xucDXBnJwspMmt3Z0
 cKo/Szq9SSN5rXBw=
X-Received: by 2002:a17:906:869a:b0:94f:322d:909d with SMTP id
 g26-20020a170906869a00b0094f322d909dmr15680713ejx.63.1682498957942; 
 Wed, 26 Apr 2023 01:49:17 -0700 (PDT)
X-Google-Smtp-Source: AKy350an3fuT24VxcXxfXO7+zbwAvRhc+0xyQp3v3pNf4l4owteeqlfvNRF8LMYG9IzpsMjJvcazGA==
X-Received: by 2002:a17:906:869a:b0:94f:322d:909d with SMTP id
 g26-20020a170906869a00b0094f322d909dmr15680691ejx.63.1682498957577; 
 Wed, 26 Apr 2023 01:49:17 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.googlemail.com with ESMTPSA id
 ec17-20020a170906b6d100b0094f6bf5ac9asm7845715ejb.22.2023.04.26.01.49.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Apr 2023 01:49:17 -0700 (PDT)
Message-ID: <74877b05-a904-8c51-4b50-bdd078a2fab3@redhat.com>
Date: Wed, 26 Apr 2023 10:49:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [RFC PATCH v3 00/20] configure: create a python venv and ensure
 meson, sphinx
Content-Language: en-US
From: Paolo Bonzini <pbonzini@redhat.com>
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
Cc: Warner Losh <imp@bsdimp.com>, Beraldo Leal <bleal@redhat.com>,
 Kyle Evans <kevans@freebsd.org>, Thomas Huth <thuth@redhat.com>,
 Daniel Berrange <berrange@redhat.com>, Reinoud Zandijk <reinoud@netbsd.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Ryo ONODERA <ryoon@netbsd.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Ani Sinha <ani@anisinha.ca>, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20230424200248.1183394-1-jsnow@redhat.com>
 <87ab99cd-b3a6-22a5-ce2a-f569b2ef1213@redhat.com>
In-Reply-To: <87ab99cd-b3a6-22a5-ce2a-f569b2ef1213@redhat.com>
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

On 4/26/23 10:05, Paolo Bonzini wrote:
>>
> 
> Thanks, this looks pretty good.  Some changes I'd make for the non-RFC 
> version:
> 
> - I think we should just check in the meson wheel (which also removes 
> the need for patch 12, so it can be done in its stead) and remove the 
> submodule
> 
> - The verbosity of mkvenv.py can be tuned down and most prints replaced 
> with logger.info() or logger.debug()
> 
> - While I agree with keeping patch 18 separate, I would move it earlier 
> so that patch 19 can be squashed into patch 14
> 
> - I am ambivalent about keeping --enable/--disable-pypi in the first 
> committed patchset, but in any case I would move patches 16 and 20 
> before patch 15

Just one extra thing, since we're changing so much of Python handling 
and since the code is written, I would keep the Debian 10 workarounds 
for now, and only drop them after we drop support for 3.6.

Paolo


