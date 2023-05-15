Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A676703014
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 16:38:17 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyZIu-0001be-Ly; Mon, 15 May 2023 10:36:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1pyZHc-00077q-Ov
 for qemu-devel@nongnu.org; Mon, 15 May 2023 10:34:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1pyZHV-00055K-8E
 for qemu-devel@nongnu.org; Mon, 15 May 2023 10:34:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1684161264;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ulUUW+HVD1XZFUz0PfIesfhY1Z6whtOF6gqVubeLp28=;
 b=BNduF9zUhw65ibd0TEASeblNVVtlWF30N/1bKjLLR5YyLxIghDAoKHCbdD6UzrBqZiAo1g
 +r9fdGEU1cQTXjXNzBE+/OE2SQ4zqc/Oio70Cgtrec2N7swOUMU6kxB6Rg8sGUoNDENBhW
 56fZNBwtnS/TEAVOJ48k08LcxgfcR/8=
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-256-ZtfAHvDIM8eZtuXNrslDcw-1; Mon, 15 May 2023 10:34:22 -0400
X-MC-Unique: ZtfAHvDIM8eZtuXNrslDcw-1
Received: by mail-yb1-f200.google.com with SMTP id
 3f1490d57ef6-ba7831dfe95so3760582276.2
 for <qemu-devel@nongnu.org>; Mon, 15 May 2023 07:34:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684161261; x=1686753261;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ulUUW+HVD1XZFUz0PfIesfhY1Z6whtOF6gqVubeLp28=;
 b=XvmZ+5j38LBg5aHXhbRJkkt6+C/2lqQaLagvE7x6ylDROXb/FMZLFXifY3esJEEyGH
 eHEfcCMz+bpxnIPNxXmlummGVHITOrNDn2NmY0FZ2YPZPii8oELJ38YmYjICXr906uNH
 mhl7cOCmW9bgaSlVrqwR5KIR7i/ytQNySPzJ1nflvrlysZKU/EYEBEt9wdChdF1mALBL
 phlQdIG/4C851G+WiT/IG8c7FYx5AKefBCJ4kSmtoVZqucKTH6Kz7INmHALkPZyycHee
 Vc5Vt2cX598FZ4Kc/i2Nl07FxCMFxhqDBWb4qjNr1zUEnI+ulquH1M3eW2cU0YRsoAT1
 1Ymw==
X-Gm-Message-State: AC+VfDx5PDa3ShIFOQJLDZpsJdxQEOSpeFgh/+UH1csoOD/9MPwXUgDC
 ZAlB8/i+fkxXAFREAHM09YxmlHS6vWmcXD3AA2S67S/4IzPrCGvEAa6ZGdJe0CXKfMo5LyW6VlJ
 FYancuauRl+fGMus=
X-Received: by 2002:a25:aa45:0:b0:ba7:4415:47a6 with SMTP id
 s63-20020a25aa45000000b00ba7441547a6mr6066924ybi.62.1684161261596; 
 Mon, 15 May 2023 07:34:21 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ48M+CFKn2JNHibSfkqOaZGCrC4X5ZKdltQ0CzTFKaKa0/60BZrZDt4N6oKj3ljfEcwqN8zPw==
X-Received: by 2002:a25:aa45:0:b0:ba7:4415:47a6 with SMTP id
 s63-20020a25aa45000000b00ba7441547a6mr6066906ybi.62.1684161261371; 
 Mon, 15 May 2023 07:34:21 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 q26-20020ae9e41a000000b0075951e8cfcdsm482427qkc.56.2023.05.15.07.34.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 May 2023 07:34:20 -0700 (PDT)
Message-ID: <73b8c022-8dc6-1933-85f4-b04c4988e749@redhat.com>
Date: Mon, 15 May 2023 16:34:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [RFC PATCH v3 00/10] Add stage-2 translation for SMMUv3
Content-Language: en-US
To: Mostafa Saleh <smostafa@google.com>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, jean-philippe@linaro.org, qemu-arm@nongnu.org,
 richard.henderson@linaro.org
References: <20230401104953.1325983-1-smostafa@google.com>
 <CAFEAcA8=sOzRW9QZqrpsLZh6q_erXmj2xfazfKrgg_ESR8Fy9Q@mail.gmail.com>
 <ZGItoVA+K8N92SaR@google.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <ZGItoVA+K8N92SaR@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.811, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi Mostafa, Peter

On 5/15/23 15:03, Mostafa Saleh wrote:
> Hi Peter,
>
> On Fri, May 12, 2023 at 03:46:43PM +0100, Peter Maydell wrote:
>> Mostafa: is there anything in particular here that means this
>> patchset should stay an RFC and isn't ready to go into the tree?
> No, I believe the series is in a good shape now.
> I will remove RFC when sending v4, if Eric has not major findings.

Yes I think you need to turn this into a PATCH set now. I had no big
comments to be taken into account. I tested this against non regressions
with S1 and I did not spot anything bad. Also I tested migration between
this and original implementation and it went gently.

Thanks

Eric
>
> Thanks,
> Mostafa
>


