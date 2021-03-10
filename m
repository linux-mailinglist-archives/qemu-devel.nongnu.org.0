Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60CEF3339EA
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 11:25:43 +0100 (CET)
Received: from localhost ([::1]:46546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJw2A-000589-7I
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 05:25:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lJvqV-0002V1-6j
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 05:13:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43075)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lJvqR-0007Zv-SD
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 05:13:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615371214;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dbSDpXCgs7BRuOIybu+bp7dl7rpsfGlATRbUrnvqOaE=;
 b=CVOl6FNV8m/7aBoVWU7b0qhHCKxxNij18iXK/prMPGt3qP7O4KrafksHlNlvxnGktwPsdt
 CcWHm7j4IUm2xDESXw0o2GQLl7JAom95Qp+UFqITYZUNi0/8WDzxGL+box7L0vIHzxZdL4
 ykDUl7wjWLCDrqiXNPrR+Noue4OmLtw=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-521-Txvw6rQgPbSSRyYOdVAPDA-1; Wed, 10 Mar 2021 05:13:33 -0500
X-MC-Unique: Txvw6rQgPbSSRyYOdVAPDA-1
Received: by mail-ed1-f69.google.com with SMTP id bi17so8098437edb.6
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 02:13:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dbSDpXCgs7BRuOIybu+bp7dl7rpsfGlATRbUrnvqOaE=;
 b=RsPl8rCjzH75/7/1hnLgOu30qecIauBotqmwfoaeiiZTcZksJJnmP+yxrPUioCT4rH
 QE8HE3qmLGaONMNAlk0cMAhESt++geXSyka9UPSW0IMp98jHGXZk8aQJqL2MtsTj8h9X
 IQyKGuPo9aNe4v3LH6hgQb0frdudRWF1V7CvJHm9ZZKJRaszarRB/XZdGs8GpsxRNxk5
 tflBe0zO59wTp4YizRygjFwGqRIhPDqEZ4i717Av91sNnvrr7yw10/8oZrbYWnq64Lnu
 Xvxtbq+W1OzGthR4qr16hOtbHIg2Qik9ur+0cgQ3KaIBTKcmQ1odcTudxjzlKqb4RABa
 uBwg==
X-Gm-Message-State: AOAM532gbfwqWcN7cLq/6uzLeoO6SH2r2gDz7TknU3+3L1V7Gxl10oGI
 4FDev3UqDoS5CiQsm6VQ21Y6ZITAz06xCvCK2npwghUmQ4x6junRe4dSzqjFFcN8DVr6ApbK3O1
 WiRE5v9tteI5Htv4=
X-Received: by 2002:a17:906:d157:: with SMTP id
 br23mr2937560ejb.192.1615371212152; 
 Wed, 10 Mar 2021 02:13:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJys50QRME+/I/zGYvdrH+8p8vsK8uws9MP+tVLF2zoKMbrsk31dyDu+UPfp+Pd8i4Hr4BBDkg==
X-Received: by 2002:a17:906:d157:: with SMTP id
 br23mr2937550ejb.192.1615371212049; 
 Wed, 10 Mar 2021 02:13:32 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id pg2sm9817231ejb.49.2021.03.10.02.13.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Mar 2021 02:13:31 -0800 (PST)
Subject: Re: [qemu-web PATCH] Add GSoC 2021 timeline
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
References: <20210310094441.294746-1-stefanha@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <a55f1c21-741e-0505-2d6d-dbfc85072575@redhat.com>
Date: Wed, 10 Mar 2021 11:13:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210310094441.294746-1-stefanha@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/10/21 10:44 AM, Stefan Hajnoczi wrote:
> QEMU has been accepted into Google Summer of Code 2021. This blog post
> lets prospective applicants know how to apply and what the timeline is.
> 
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  ...03-10-gsoc-and-outreachy-2021-timelines.md | 34 +++++++++++++++++++
>  1 file changed, 34 insertions(+)
>  create mode 100644 _posts/2021-03-10-gsoc-and-outreachy-2021-timelines.md

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


