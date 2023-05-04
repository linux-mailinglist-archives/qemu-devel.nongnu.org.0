Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F9186F65A6
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 09:23:04 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puTI3-0007hD-Tz; Thu, 04 May 2023 03:22:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1puTI1-0007ga-9t
 for qemu-devel@nongnu.org; Thu, 04 May 2023 03:22:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1puTHz-0002S4-Ux
 for qemu-devel@nongnu.org; Thu, 04 May 2023 03:22:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683184927;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e39Mds89jzC7NxhVhmQSaRaXl64OT15r7PbFamEUc1c=;
 b=OJRuVEsYS5qreuAylYOyoxBCDqC6HBjoKljLEWL2araMJezu32DeURmjQUrmTr8I+NfyyL
 5SfNXCW6TJbkDBNQxV0QOCF+HQNBxv3DbEePJbdJ3ZDBWzcHgnhKkNoRQXrM0nQrKICsIS
 JCXuE7V+PjqL3OF6PF/MM94KF4tJirE=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-314-_gJJABsGOXmtCbGp-3PPhA-1; Thu, 04 May 2023 03:22:06 -0400
X-MC-Unique: _gJJABsGOXmtCbGp-3PPhA-1
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-953429dac27so11780266b.0
 for <qemu-devel@nongnu.org>; Thu, 04 May 2023 00:22:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683184925; x=1685776925;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=e39Mds89jzC7NxhVhmQSaRaXl64OT15r7PbFamEUc1c=;
 b=XX+gYQeWzzJEb3Rg+4nOwfu/03uH99mbb5k5yfZIJL+JmMP+eeo/X3V6GzJ71l8u+D
 xxmHORQHhm4XRXwGltoD45Qk05I8Xa72c3iuzPUYOkX908qfxdq8tj19MyAtAY/EnH0R
 FcyzoI3yv6vVrNgIq87ptFGQrWEFQqxqLFUz5XgOzHMvZPajcgxFhElidTI495dhLo0y
 nh8nVatnWFlklQzoqznmrImDHr/1QJwIo4/P8y/aYXCj+CyYpPWfGyXhGvETihe+pGIL
 d3JzhiTUNPjT/Y+/AAKnCSnPxrmCqfUavYASkGwBL51xkwyNIBq6tsnzWwaVQooiz8Yx
 2BLg==
X-Gm-Message-State: AC+VfDzFOhn4lQcUNhbJeI+VS1hCtK7BA/l0UYFerpK71h2Ba72BQ3r+
 QMloOtt2Pr0O2eW5Wzxq1Mw2dRZhjq1BsYGTM1e8yc+NXJAvGZaSEMxEvSOcbYm/eltrDEVWq/u
 1WqiNGmRqzdmWbVg=
X-Received: by 2002:a17:906:fd84:b0:961:ba6c:e949 with SMTP id
 xa4-20020a170906fd8400b00961ba6ce949mr4779183ejb.68.1683184924925; 
 Thu, 04 May 2023 00:22:04 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7Fkyt1v2V0QxXgfzAVTiOOmwjoMYXWo0kPGbMoGJyhvHibZKJSoEa+AyORw9su/CIae26G1w==
X-Received: by 2002:a17:906:fd84:b0:961:ba6c:e949 with SMTP id
 xa4-20020a170906fd8400b00961ba6ce949mr4779164ejb.68.1683184924567; 
 Thu, 04 May 2023 00:22:04 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:63a7:c72e:ea0e:6045?
 ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.googlemail.com with ESMTPSA id
 jz26-20020a17090775fa00b009611a489a88sm7301063ejc.25.2023.05.04.00.22.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 May 2023 00:22:03 -0700 (PDT)
Message-ID: <2065c9a7-48ca-1c8a-35a6-a62075536486@redhat.com>
Date: Thu, 4 May 2023 09:22:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 3/3] tests/qtest: Don't run cdrom tests if no accelerator
 is present
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 John Snow <jsnow@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>
References: <20230503193833.29047-1-farosas@suse.de>
 <20230503193833.29047-4-farosas@suse.de>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20230503193833.29047-4-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-4.28, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 5/3/23 21:38, Fabiano Rosas wrote:
> On a build configured with: --disable-tcg --enable-xen it is possible
> to produce a QEMU binary with no TCG nor KVM support. Skip the test if
> that's the case.
> 
> Fixes: 0c1ae3ff9d ("tests/qtest: Fix tests when no KVM or TCG are present")
> Signed-off-by: Fabiano Rosas<farosas@suse.de>

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>


