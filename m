Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2939D3C5F5B
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 17:34:47 +0200 (CEST)
Received: from localhost ([::1]:52244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2xxG-0006x8-88
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 11:34:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m2xtK-0001Xd-LV
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 11:30:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38491)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m2xtI-0002HM-Ju
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 11:30:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626103840;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GtN5J1m/USerE/hsC6fbFDg605YaYWMzBfuc1LhZoB8=;
 b=D8FJmkkZlG2CgvNbrR6sWOc1fucHU9GkbGXUXIGBSR5dE0rlTNIhYiZ6IRkFlIk3JTAoh0
 TdBrvUme/utsQWLqhZ6BMpSGdklKFGhQjIkygPvV2qOPz2TmL3VKXmUmp8y1svPCtev4HY
 Nf/mPoOPfhMQZFmAy3j6/J/Drh6LIuM=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-321-wfWk6AKpOGWI3zc_B67qUg-1; Mon, 12 Jul 2021 11:30:38 -0400
X-MC-Unique: wfWk6AKpOGWI3zc_B67qUg-1
Received: by mail-wr1-f72.google.com with SMTP id
 i10-20020a5d55ca0000b029013b976502b6so5891339wrw.2
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 08:30:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GtN5J1m/USerE/hsC6fbFDg605YaYWMzBfuc1LhZoB8=;
 b=PtRCPzqBiTv5OSZbp7uieFCpuB9IMp7f7yGbIE6AjiXpozn8Umo8TvBy1OyN1LLL+h
 NB8rC//VMQ1sc/4/B3p2B4PtJecrjig/Abk0h1waN8eyjzcVnrE1J+RJNKRkdfqlDHci
 pz1jtXHaYqMuk6jvixJo6bfAxyPUOc3DpxT4UvY66PgO5n/sOZxteP79pkczL9z0nMqf
 qLLaUeEbOhRT8yTaf+bIFDqwN8g2KOQN/wv37sdhEMj5fp9XD4I1xRyO+qrVzlJYaNnH
 zIMbZ7cnjF93LF9EASHPrklStEuxV4M7xqTyH7sv2s/3+ugx2eWPJ87lvEsN9WwkWlq5
 m2RA==
X-Gm-Message-State: AOAM532RGt76YyiOyyKMsEjLgnkCWx5TKksidDr0sy905KTZlNLP+zVJ
 mEK/DQ2JYhdGRUovYIXyKpjBmpL3GzHsUxyxnITDFCfi/msyerxC3g0w9vJWhFRrdeIOcjby/ix
 RkIFKZGHlpf4LoXo=
X-Received: by 2002:a05:600c:154b:: with SMTP id
 f11mr15612869wmg.82.1626103837725; 
 Mon, 12 Jul 2021 08:30:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzveofkcuO9odMqFJNyBBzKeb8PcmPkz2mikqGOhnIWVcn+nOm7DOWmyqR+YHaf2gB3jqhWXQ==
X-Received: by 2002:a05:600c:154b:: with SMTP id
 f11mr15612858wmg.82.1626103837607; 
 Mon, 12 Jul 2021 08:30:37 -0700 (PDT)
Received: from [192.168.1.27] (abayonne-654-1-142-116.w86-222.abo.wanadoo.fr.
 [86.222.93.116])
 by smtp.gmail.com with ESMTPSA id u15sm237749wmq.1.2021.07.12.08.30.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Jul 2021 08:30:35 -0700 (PDT)
Subject: Re: [PATCH v2] meson: fix condition for io_uring stubs
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20210712151810.508249-1-pbonzini@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <179a8bd8-4f79-ab89-f5ab-cda75a79af3d@redhat.com>
Date: Mon, 12 Jul 2021 17:30:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210712151810.508249-1-pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.479, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/12/21 5:18 PM, Paolo Bonzini wrote:
> CONFIG_LINUX_IO_URING is not included in config-host.mak and therefore is
> not usable in "when" clauses.  Check the availability of the library,
> which matches the condition for the non-stubbed version block/io_uring.c.
> 
> At this point, the difference between libraries that have config-host.mak
> entries and those that do not is quite confusing.  The remaining ~dozen
> should be converted in 6.2.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  stubs/meson.build | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


