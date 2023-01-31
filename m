Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA2C0682AED
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 11:57:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMoJu-0005Fn-N1; Tue, 31 Jan 2023 05:56:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pMoJs-0005CC-8v
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 05:56:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pMoJq-0006PL-R0
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 05:56:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675162612;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=97qt8sFV5hnWT2HlnOkMYE07TWJhUx9yHipnXwIwAhQ=;
 b=Un1EzDftRVOuSwN6VP0baiBMvgbEuZRaEduGX0DkUwn4AgAGj2rstvtbooFAuicscaAYaq
 MvLZL9iaPEe9aV/ig3+12IE32o0KnSh6ZN5jRhqpTtvFM97b1yCbzm5K/2tujZ19vYHH9Z
 Am38rVclQb/5H/Vvs2v3Cg6fsz5WADc=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-423-bZe8FFtsOCmbx2VSIf5d9Q-1; Tue, 31 Jan 2023 05:56:48 -0500
X-MC-Unique: bZe8FFtsOCmbx2VSIf5d9Q-1
Received: by mail-qv1-f70.google.com with SMTP id
 ob12-20020a0562142f8c00b004c6c72bf1d0so7991130qvb.9
 for <qemu-devel@nongnu.org>; Tue, 31 Jan 2023 02:56:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=97qt8sFV5hnWT2HlnOkMYE07TWJhUx9yHipnXwIwAhQ=;
 b=ZvJXCG7keXDmeTE6vhppaZMU6JmXdKUT5X7InCwZdnfBwRv4NbTnPPiPLABnbX7ETc
 ctwvg1FYixP+bSXpjqBnNjg+f6et1cRP64sUPYVNIEFe1CmQyEDq3pVEbkIWNfKi/fPB
 dfZZQy4YrTqngGUexGFwlUpp48krnUZIwz/9EpFwbJuUjv5kKhRqWTS77AtuDceaopek
 y9DSG9s4BXOJph80de8jFVekGvvp3LeNR3gwd1chK5F86taysSRKhevKHYR8ufNiiYdL
 sOTiMZ7cD8LfyZOyIhhq5eOoGEcmrVkHyKfL6miRqTy+yxIELWwH2LqQJ5T03ZwBIybI
 LD1Q==
X-Gm-Message-State: AFqh2koT7Ws67xhQsrqG84KTgjpWF1DcihJZArltzEaw+jxG0Mhiccty
 LEosUhPKLRhJrlI5dBksr0lCPz86RRTR/PSFXTKW8WnQzkh/fY0sVeUfC4EqkRdFOUCZ4dMmwqQ
 DDHwOw1e72ICUNWY=
X-Received: by 2002:ad4:5d6b:0:b0:536:85cf:a265 with SMTP id
 fn11-20020ad45d6b000000b0053685cfa265mr73122760qvb.14.1675162608284; 
 Tue, 31 Jan 2023 02:56:48 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtevF/otHiahMimlZ+r8+sAMnhXIBzD6ZqNWbqhE3KGNMqTcHYxIKBSvuM+Ow8hnVIbKq2w6w==
X-Received: by 2002:ad4:5d6b:0:b0:536:85cf:a265 with SMTP id
 fn11-20020ad45d6b000000b0053685cfa265mr73122746qvb.14.1675162608072; 
 Tue, 31 Jan 2023 02:56:48 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-176-155.web.vodafone.de.
 [109.43.176.155]) by smtp.gmail.com with ESMTPSA id
 m4-20020ae9e704000000b006fba0a389a4sm9671631qka.88.2023.01.31.02.56.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Jan 2023 02:56:47 -0800 (PST)
Message-ID: <1bcb79bd-6485-f614-a6ec-03fa15609313@redhat.com>
Date: Tue, 31 Jan 2023 11:56:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [RFC PATCH] build: deprecate --enable-gprof builds and remove
 from CI
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>,
 "reviewer:Incompatible changes" <libvir-list@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20230131094224.861621-1-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230131094224.861621-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.09, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 31/01/2023 10.42, Alex Bennée wrote:
> As gprof relies on instrumentation you rarely get useful data compared
> to a real optimised build. Lets deprecate the build option and
> simplify the CI configuration as a result.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: Thomas Huth <thuth@redhat.com>
> ---

Thanks for tackling this!

Reviewed-by: Thomas Huth <thuth@redhat.com>


