Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AE9B4F79F4
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Apr 2022 10:39:25 +0200 (CEST)
Received: from localhost ([::1]:37110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncNfo-0002Ii-4k
	for lists+qemu-devel@lfdr.de; Thu, 07 Apr 2022 04:39:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1ncNcq-0000TH-WA
 for qemu-devel@nongnu.org; Thu, 07 Apr 2022 04:36:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60211)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1ncNco-0005v1-KF
 for qemu-devel@nongnu.org; Thu, 07 Apr 2022 04:36:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649320577;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XdyZuAV21LEGWhQggj68jETHCga3RPCveWRii1PvJOI=;
 b=IOqa92ikMJ/eYK+y/YXWx/CWtgpRWAaGbnwHVvKNeUw/Wn//qVogqjGCz0l3X4nGmhXcLp
 p/u406PJLuNeey0ko0s1kBmrq5kpgzUtvksndgXrD2HenCsyNslNTx+R1AMy0aafComM8A
 0BK6VgCpXCzCr+SuAqE0Xs2pwxC5nb8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-131-hyJhJwGSNOinTX2FKhBDQA-1; Thu, 07 Apr 2022 04:36:16 -0400
X-MC-Unique: hyJhJwGSNOinTX2FKhBDQA-1
Received: by mail-wm1-f70.google.com with SMTP id
 n17-20020a05600c501100b0038e731cf5e1so2655943wmr.2
 for <qemu-devel@nongnu.org>; Thu, 07 Apr 2022 01:36:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=XdyZuAV21LEGWhQggj68jETHCga3RPCveWRii1PvJOI=;
 b=ySbsVNBvmVPlRQ+bMMsXN5PRosRwkdf3Bnmcc/WtYJ0FWZYblq+uOS08gtW8f5Hy1K
 gJjb/76F6OFhO/1GttNB8QIYS9IwTXi/GlRwKgt7OsYJBAArXNFcnU7Gqr9GCkqocShR
 8MqZNoRM37VH+BzRcroxFXrps5NSCQ8DFBvZMG8it4VCt0jidiyARVPF/cYcEP3pHXxe
 EHTqKo/OnNJ8E/KoxhVke081JzbawvuR2XqxPFM/aagYLgMrBPgeWBQjoS4daI43Gdhn
 icrJwdkoA9aQ0N8PgQayBbk0q/lwIXrr1g8/YT+dcUC1lWt8oNJj1VwB/kxcqB8xEcCk
 9cCg==
X-Gm-Message-State: AOAM533O9q+MLDBYy/t7GWL47fh9xrKufZm1GWUTEJJcAC98r8xmT/3g
 MlhuNaU4vu0zhsBllzTc/1i+/Te5KtYgP2OOr6YAo4KTCqUa+gqIBjSDStNLnVCrtazr/OJXA73
 mluE9gKmzExqpIZw=
X-Received: by 2002:adf:e70d:0:b0:207:8c1b:b758 with SMTP id
 c13-20020adfe70d000000b002078c1bb758mr863108wrm.19.1649320575742; 
 Thu, 07 Apr 2022 01:36:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzKu5Uaw8sg6imX0/oLNBC8YYm3d18C/Wbs/B6lorWdVocwYQe6Hc1LkfKNXKHI2QvIOkjMvQ==
X-Received: by 2002:adf:e70d:0:b0:207:8c1b:b758 with SMTP id
 c13-20020adfe70d000000b002078c1bb758mr863097wrm.19.1649320575562; 
 Thu, 07 Apr 2022 01:36:15 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 o8-20020a5d6488000000b002051f1028f6sm19466031wri.111.2022.04.07.01.36.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Apr 2022 01:36:15 -0700 (PDT)
Subject: Re: [PATCH v3 4/5] tests/qtest/vhost-user-blk-test: Temporary hack to
 get tests passing on aarch64
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20220210145254.157790-1-eric.auger@redhat.com>
 <20220210145254.157790-5-eric.auger@redhat.com> <871qyajetd.fsf@linaro.org>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <7e297db9-7935-4a0d-9109-c0203ee1be5c@redhat.com>
Date: Thu, 7 Apr 2022 10:36:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <871qyajetd.fsf@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: eesposit@redhat.com, jean-philippe@linaro.org, mst@redhat.com,
 qemu-devel@nongnu.org, Coiby.Xu@gmail.com, qemu-arm@nongnu.org, clg@kaod.org,
 stefanha@redhat.com, pbonzini@redhat.com, eric.auger.pro@gmail.com,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Alex,

On 4/6/22 7:34 PM, Alex Bennée wrote:
> Eric Auger <eric.auger@redhat.com> writes:
>
>> When run on ARM, basic and indirect tests currently fail with the
>> following error:
>>
>> ERROR:../tests/qtest/libqos/virtio.c:224:qvirtio_wait_used_elem:
>> assertion failed (got_desc_idx == desc_idx): (50331648 == 0)
>> Bail out! ERROR:../tests/qtest/libqos/virtio.c:224: qvirtio_wait_used_elem:
>> assertion failed (got_desc_idx == desc_idx): (50331648 == 0)
>>
>> I noticed it worked when I set up MSI and I further reduced the
>> code to a simple guest_alloc() that removes the error. At the moment
>> I am not able to identify where ths issue is and this blocks the
>> whole pci/aarch64 enablement.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Hi Eric,
>
> I sent a RFC patch which I think avoids the need for this hack:
>
>   Subject: [RFC PATCH] tests/qtest: properly initialise the vring used idx
>   Date: Wed,  6 Apr 2022 18:33:56 +0100
>   Message-Id: <20220406173356.1891500-1-alex.bennee@linaro.org>
>
Indeed this fixes my issue! Many thanks for the debug & fix.

I will respin with your R-b's.

Eric


