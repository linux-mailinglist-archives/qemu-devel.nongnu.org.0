Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EC4464DCC4
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Dec 2022 15:14:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5p07-0000Aj-I1; Thu, 15 Dec 2022 09:14:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p5p06-0000Ab-3W
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 09:14:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p5p00-0004Gz-RH
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 09:14:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671113652;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ApPquzehPp1RVLdMxJTlY9/9EDJsZcXeMD23quahb+I=;
 b=irroJPVtGne5FyYp5TPHsd01oWzFgrr8mEP4r70zGOLW+WlsEI9p3PqK2+Ow3VnAMB19Mv
 ZqydGJw/0mTXYXvGAatViExHVvS3xr7wRzisHWsZxF7tUjuNfq/pTLQ5bBGzO/XxIHyAWe
 /WPIs9Qg06AZTaw6X2e62uY3Rxrcy9c=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-664-klpuDnkuNoGiPJ8zEkNLDA-1; Thu, 15 Dec 2022 09:14:11 -0500
X-MC-Unique: klpuDnkuNoGiPJ8zEkNLDA-1
Received: by mail-wr1-f72.google.com with SMTP id
 s1-20020adfa281000000b00241f7467851so677905wra.17
 for <qemu-devel@nongnu.org>; Thu, 15 Dec 2022 06:14:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ApPquzehPp1RVLdMxJTlY9/9EDJsZcXeMD23quahb+I=;
 b=i3iPY2JOMMVpunWSNacUKuY7t6DFqZfPhfQSkdCyMTsO3oKaCeanvAVzrRov6exIvE
 l9ihCJxJpV32WLBqOb23dgnIVbzdOL1qsxpDWGA88JWKrkPbQRrAyMDl7/iUuHv60Gly
 s+6V/E3Fak9HjRd6UqvxyPq4Kx3x7NXChUcRx3tvndj4Ug6Xh+9g8A5QJM9ieR2pVkB4
 LVJPxcKzIMquLEIPDgK8XF78Kge5bLub+2UTSGN/G5/AFHvhmyhCzfH6VcpxGw6KRfSU
 byMY1t31zZyBXxtZBjqqAIYaAqsSfbkecg6Zet2LM3RIDVF6y2uxxD+RyRgDc0uTrqTr
 WKBw==
X-Gm-Message-State: ANoB5pnK9J1b3j1ZwqQi0gkl+E8QY8Nz7c8ISeufv6s1fPXEJVAO4Ipn
 yj25cIJNRYHac7tRTc+ofx5qksuOaJZSMYNPdwSlcaWuOJz7wqcvlf792e4yfsXXUvtGtRhCD1p
 H4U5zEbdgKcNmUc0=
X-Received: by 2002:a05:6000:246:b0:242:5927:2026 with SMTP id
 m6-20020a056000024600b0024259272026mr17894851wrz.40.1671113650051; 
 Thu, 15 Dec 2022 06:14:10 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5/VTpSMBmgrvtUzv8EsFIJI1QROYOltfhz/EdffZzNSLE+MHQj7C0G9gH7u8KjvsHPL8nUDQ==
X-Received: by 2002:a05:6000:246:b0:242:5927:2026 with SMTP id
 m6-20020a056000024600b0024259272026mr17894843wrz.40.1671113649837; 
 Thu, 15 Dec 2022 06:14:09 -0800 (PST)
Received: from [10.33.192.205] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 bp15-20020a5d5a8f000000b00257795ffcc8sm1669982wrb.73.2022.12.15.06.14.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Dec 2022 06:14:09 -0800 (PST)
Message-ID: <98c3b584-5950-c9cd-1f6a-d4f6272d4ead@redhat.com>
Date: Thu, 15 Dec 2022 15:14:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PULL 00/23] First batch of s390x, qtest, CI and misc patches for
 8.0
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
References: <20221214100911.165291-1-thuth@redhat.com>
 <CAFEAcA8fCmsQO6vRbmOysq2rKEt60iaxN_pVBdyus7Mf3Q9=fA@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <CAFEAcA8fCmsQO6vRbmOysq2rKEt60iaxN_pVBdyus7Mf3Q9=fA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 15/12/2022 14.38, Peter Maydell wrote:
> On Wed, 14 Dec 2022 at 10:16, Thomas Huth <thuth@redhat.com> wrote:
>>
>>   Hi!
>>
>> The following changes since commit 5204b499a6cae4dfd9fe762d5e6e82224892383b:
>>
>>    mailmap: Fix Stefan Weil author email (2022-12-13 15:56:57 -0500)
>>
>> are available in the Git repository at:
>>
>>    https://gitlab.com/thuth/qemu.git tags/pull-request-2022-12-14
>>
>> for you to fetch changes up to 8eeb98e2ea03639e743fdae82ae69d571d8ef0a3:
>>
>>    tests/qtest/vhost-user-blk-test: don't abort all qtests on missing envar (2022-12-14 08:55:37 +0100)
>>
>> ----------------------------------------------------------------
>> * s390x PCI fixes and improvements (for the ISM device)
>> * Fix emulated MVCP and MVCS s390x instructions
>> * Clean-ups for the e1000e qtest
>> * Enable qtests on Windows
>> * Update FreeBSD CI to version 12.4
>> * Check --disable-tcg for ppc64 in the CI
>> * Improve scripts/make-releases a little bit
>> * Many other misc small clean-ups and fixes here and there
> 
> Hi; this fails to compile:
> 
> ../../util/qemu-config.c: In function 'objprop_to_cmdline_prop':
> ../../util/qemu-config.c:165:13: error: 'CommandLineParameterInfo' has
> no member named 'has_help'
>    165 |         info->has_help = true;
>        |             ^~
> ../../util/qemu-config.c: In function 'query_all_machine_properties':
> ../../util/qemu-config.c:217:9: error: 'CommandLineParameterInfo' has
> no member named 'has_help'
>    217 |     info->has_help = true;
>        |         ^~
> 
> I'm afraid your pullreq has crossed in the mail with Markus'
> QAPI one, which refactored things so these QAPI structs
> no longer have has_* fields.

Right. Should be easy to fix, I'll send a v2 as soon as I've checked that it 
compiles fine everywhere...

  Thomas


