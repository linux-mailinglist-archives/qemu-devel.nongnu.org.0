Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 255B8700B95
	for <lists+qemu-devel@lfdr.de>; Fri, 12 May 2023 17:27:19 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxUfB-00013c-4S; Fri, 12 May 2023 11:26:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1pxUf9-00013K-41
 for qemu-devel@nongnu.org; Fri, 12 May 2023 11:26:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1pxUf7-00051J-DN
 for qemu-devel@nongnu.org; Fri, 12 May 2023 11:26:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683905187;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5oF4xfYWKx7ohG1H++O9nXnufAUukqJafajHx99DlWA=;
 b=UzA+F2Vixq6EUROzx1uKk33lYq+/rq/KSKD6tnlzIkTIw4N7G9UTwzErO3R/sMXdl+JoXF
 bSjw4rgCBK410DEUPI0C010f5WcRxeAlKIsqYyG2cERipr+YZDbLmUyfrQuaDMqaBjqFDS
 ejh+tyN5NNiTFtMwvagcknV+BBGidcU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-626-g-5Al_8oMuiiPwtzlE8LHg-1; Fri, 12 May 2023 11:26:26 -0400
X-MC-Unique: g-5Al_8oMuiiPwtzlE8LHg-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-30635d18e55so3565756f8f.2
 for <qemu-devel@nongnu.org>; Fri, 12 May 2023 08:26:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683905185; x=1686497185;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5oF4xfYWKx7ohG1H++O9nXnufAUukqJafajHx99DlWA=;
 b=atz90Qg8iGYJy1Jfr/Xpl5rp5orzUtNrNh/2B4vuSGtBhXX/8otmD0WkHr+j5SPp9E
 3bIbqnXoV7Zm0yYBMt85B4o7uxnZH1+axM1Dnzp0C27lsbfqh586tu+xxzYli24pWUwW
 /t8yAnstDgP+LcOLl/HD8RezD1QGe1JkEvXL6zSRQrOL9pntZDlSQfKwigmieFess/kl
 pr/LggPCLZ0tt1BbfXObgxjFRwY1p6J5ZU/JxvPjRFLroGXdnZ2VXi8z/V0C9X3CHglr
 mm2FQru2xlGj486NAwTx3s2IQQL+vvKu6euMrX2Vnv5jxPMUfI36+z1gsKUMoAsWpC82
 RtnA==
X-Gm-Message-State: AC+VfDzIqqHXYGmBcASYWRVzKMkO+XuWWJPe7gXybWEXg55MbDH42Swz
 PWZisPytw2RauoOZ9YJ0Zqo3scsD4i/LRuTgttjv7SLd1OQFgBqDKHQMF1mo7mT5QC7Sis0EgrM
 P1nSWgU7B/poR2qM=
X-Received: by 2002:adf:fe05:0:b0:306:f6c:1063 with SMTP id
 n5-20020adffe05000000b003060f6c1063mr17995230wrr.38.1683905185043; 
 Fri, 12 May 2023 08:26:25 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5fQrG+3Uk/7eS3R5I9baqOzVHWkBT50zKUTu1o85gZIMILoxkFFanGxhHtyimNUjEdKyLicw==
X-Received: by 2002:adf:fe05:0:b0:306:f6c:1063 with SMTP id
 n5-20020adffe05000000b003060f6c1063mr17995216wrr.38.1683905184756; 
 Fri, 12 May 2023 08:26:24 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 e7-20020a5d65c7000000b00307925ff35bsm16895909wrw.49.2023.05.12.08.26.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 May 2023 08:26:24 -0700 (PDT)
Message-ID: <4037a5ca-464f-0798-57c9-74ccdb2c712d@redhat.com>
Date: Fri, 12 May 2023 17:26:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [RFC PATCH v3 00/10] Add stage-2 translation for SMMUv3
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>,
 Mostafa Saleh <smostafa@google.com>
Cc: qemu-devel@nongnu.org, jean-philippe@linaro.org, qemu-arm@nongnu.org,
 richard.henderson@linaro.org
References: <20230401104953.1325983-1-smostafa@google.com>
 <CAFEAcA8=sOzRW9QZqrpsLZh6q_erXmj2xfazfKrgg_ESR8Fy9Q@mail.gmail.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <CAFEAcA8=sOzRW9QZqrpsLZh6q_erXmj2xfazfKrgg_ESR8Fy9Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.845, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

Hi Peter,

On 5/12/23 16:46, Peter Maydell wrote:
> On Sat, 1 Apr 2023 at 11:49, Mostafa Saleh <smostafa@google.com> wrote:
>> This patch series adds stage-2 translation support for SMMUv3. It is
>> controlled by a new system property “arm-smmuv3.stage”.
>> - When set to “1”: Stage-1 only would be advertised and supported (default
>> behaviour)
>> - When set to “2”: Stage-2 only would be advertised and supported.
>> - Value “all” is reserved for nesting support. However it is not
>> implemented in this patch series (more about this in the end)
>>
>> Features implemented in stage-2 are mostly synonymous with stage-1
>> - VMID16.
>> - Only AArch64 translation tables are supported.
>> - Only little endian translation table supported.
>> - Stall is not supported.
>> - HTTU is not supported, SW is expected to maintain the Access flag.
> Eric: are you planning to review this v3? I think only
> patches 2, 4, 5, 8, 10 still need review.

yes I will do it beg of next week and will also test it against non
regression on S1 only.

Thanks

Eric
>
> Mostafa: is there anything in particular here that means this
> patchset should stay an RFC and isn't ready to go into the tree?
>
> thanks
> -- PMM
>


