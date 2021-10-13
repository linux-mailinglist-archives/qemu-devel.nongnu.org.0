Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D41642B967
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 09:44:37 +0200 (CEST)
Received: from localhost ([::1]:52232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maYwG-00024R-LP
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 03:44:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1maYv2-0000W5-NF
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 03:43:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58306)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1maYv0-0006nv-KJ
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 03:43:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634110997;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y+bzwJBYzQSLEVfZf1LzCMoW08JU8JXqtSFYFrgpG68=;
 b=PJOCq6ZugdIuMARzVHY9E8lK+g4OCOuHQtL/cMRRpN2wuSjUQvrMn+HKl4SNiH6YJV0XoS
 gAcf3ZQmiPWYnOY13OFhLC3Ho33TmPbvOUeGLkGhrMW//XaPm6xvTTTY2eIoGltTUHOEE5
 SzHclUrUvYZNlZhHRgkUrW9CubLsEkA=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-498-F3bNI2YoPweR3rgmIJf0LA-1; Wed, 13 Oct 2021 03:43:16 -0400
X-MC-Unique: F3bNI2YoPweR3rgmIJf0LA-1
Received: by mail-ed1-f72.google.com with SMTP id
 r11-20020aa7cfcb000000b003d4fbd652b9so1442184edy.14
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 00:43:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=y+bzwJBYzQSLEVfZf1LzCMoW08JU8JXqtSFYFrgpG68=;
 b=bcAp8ipjNsYpD2rsY6XxLIiZvWqX9nai/t309kQcFkzt6Kn8xMBs4ZjQMadi0DL0W/
 pTUJNsPAIpI3lGVgvGMTuyPL26U0KGKr8XiZ0Q+QB/hAyImbAVWRma8gbVBHK5cYmp5y
 V59Uvxihqf7iE6Ej37OPne1wc+pTxrHXbGx7bFJCWVZpiGVlbR2AZFNbEN+g6qYroiQe
 rQo3nWXcZ5IEYROF6myE144GElwlzNI4Sx9WTNxgng3kzNN0Lv9ZMDasN4u9IiYgGv1C
 YnXBMGeP+jwhJt2AfgT7BfuNFM14vg8hCjQtjgKGAeNTkvQlCoPLUkByJ0Ti43AAZMGL
 CrhA==
X-Gm-Message-State: AOAM530msGFCpsQN2bsnCrrguxknfeggFi/RXhkK4Rd1MnF/vC7ek0wh
 CZL5Fx6TfctVftazVmjOxXqWKOA49VLD5YcR/5q0+BwB/VGlKaGqpgcRp8CaIKnVKnWAnUX8di+
 VYrOuoVipIpD7eto=
X-Received: by 2002:a17:907:7212:: with SMTP id
 dr18mr38298301ejc.298.1634110995133; 
 Wed, 13 Oct 2021 00:43:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxrIUJLaOssrIZexD38eZ7hNSt0uJi3kn0TcKtzgX3gJa7BEPP5u0WM9Kvmfh+5tMp2AQYw4g==
X-Received: by 2002:a17:907:7212:: with SMTP id
 dr18mr38298283ejc.298.1634110994984; 
 Wed, 13 Oct 2021 00:43:14 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id c8sm4214575edt.55.2021.10.13.00.43.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Oct 2021 00:43:14 -0700 (PDT)
Message-ID: <9f0d78be-b840-4ec1-f61c-11765650285f@redhat.com>
Date: Wed, 13 Oct 2021 09:43:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v2 24/24] configure: automatically parse command line for
 meson -D options
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20211012111302.246627-1-pbonzini@redhat.com>
 <20211012111302.246627-25-pbonzini@redhat.com>
 <de0d99d9-8375-5f01-c0a6-8174b6f57b49@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <de0d99d9-8375-5f01-c0a6-8174b6f57b49@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/10/21 20:15, Thomas Huth wrote:
> 
> Old output with --help:
> 
>   --enable-trace-backend=B Set trace backend
>                             Available backends: nop, dtrace, ftrace, 
> simple, stderr, ust
> 
> New output:
> 
>    --enable-trace-backends=CHOICE
>                             Set available tracing backends [log]
> 
> Why does it fail to list the choices here? ... it works for the other
> options like "--enable-malloc"?

Oh, that's a pity: array options don't include the choices in their 
introspection data.  I'll fix it up ad hoc and submit a patch to Meson.

Paolo


