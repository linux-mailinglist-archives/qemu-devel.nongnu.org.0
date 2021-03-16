Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 634F133DC7C
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 19:21:19 +0100 (CET)
Received: from localhost ([::1]:50132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMEJi-0003rV-EE
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 14:21:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lMDhi-0005h1-5V
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 13:42:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45072)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lMDhg-0007Vw-Br
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 13:42:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615916516;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DTL263My/8C24LaEhEXGupyd31wuzyre89WxDr3AbZw=;
 b=MsL/OQX6A+Idiwris6oNgmok9E0ZrS93DRQn5rrYnL3iU+o1ksMjrmkKo0GJgP9tRQ8ht7
 /aOSpjSjvru7PDWvL2o28ARZ+jPCeNFxF+7z9kawoxBS5xMuXjAM2Nt8It1upxhdJwxcug
 yx5yw6dWOfT3wkfXr9uBH0bPrVQ9oqk=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-311-DotkSP2wOXSbgL4HUw7uUQ-1; Tue, 16 Mar 2021 13:41:54 -0400
X-MC-Unique: DotkSP2wOXSbgL4HUw7uUQ-1
Received: by mail-wr1-f71.google.com with SMTP id p12so14447605wrn.18
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 10:41:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DTL263My/8C24LaEhEXGupyd31wuzyre89WxDr3AbZw=;
 b=FjWuRGWohSeuetVHiXnSR6v1CUttYJ+1XlzVayrTzWZSOjOI7j3b8gljWVOIRd06Xt
 BkzmwGz0MN/2D3+g22SC+h3ZZor+ROF4ZOWZyCJELxaFX3JxfoVe5ZOywZgxhzOyxGRL
 s4Cv3pKDWSnt+LexNpRi55O2YFVwYbvpXxpFqMRYskaqKvJp3PgnMI6bOdMJ9E/GuUWz
 V9dJFnywNObtNGwZ5LXRwNTmtdlSI2eCXvzkWTxPG5HbC8RgMhbwv4DFtrfHbPklm9vH
 pTPHWDBZEm9srAHvYJ0ENvGddVJUEeYSyHkJe8zTqT9O2whCERK65WY5McyIqnJCL9of
 kLaA==
X-Gm-Message-State: AOAM530Ab/OdDz7qbhiqJilObabWbzEYaxlDmgxQAhU/3OiZD8Ox6FiZ
 zCtAl38VTHSy0NLFkKhRDXsUlm+IIAA4+QcJ82GHn3A0agKZv/z4kUC8KHOtldMh0z/kAxcB71K
 211ukc8lSpGEXTx4jBChDNBZ5BBtnDETOEWZW9kqpFwNFr1KT75enMVOvv9jV+wgtf0I=
X-Received: by 2002:a5d:4587:: with SMTP id p7mr138790wrq.205.1615916513455;
 Tue, 16 Mar 2021 10:41:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxCysHrkIq5zvPtskfUswnt4TvX7ScFlhtzCi1dvR6tDcI48FnUVBqTTTtVxpqlsF+LWD8Ivg==
X-Received: by 2002:a5d:4587:: with SMTP id p7mr138770wrq.205.1615916513285;
 Tue, 16 Mar 2021 10:41:53 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id j12sm22926484wrx.59.2021.03.16.10.41.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Mar 2021 10:41:52 -0700 (PDT)
Subject: Re: [PULL 00/11] 20210315 patches
To: Alexander Bulekov <alxndr@bu.edu>, qemu-devel@nongnu.org
References: <20210315183812.27760-1-alxndr@bu.edu>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <3ab73a82-e9b8-2870-b57b-b640a77b0995@redhat.com>
Date: Tue, 16 Mar 2021 18:41:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210315183812.27760-1-alxndr@bu.edu>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 15/03/21 19:38, Alexander Bulekov wrote:
>    https://gitlab.com/a1xndr/qemu  tags/20210315-pull-request

Pulled, thanks.

Paolo


