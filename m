Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBCD43D5C23
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 16:52:34 +0200 (CEST)
Received: from localhost ([::1]:46514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m81y6-0003Pk-1s
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 10:52:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m81w9-0000vA-A6
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 10:50:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57995)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m81w7-0001jj-TA
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 10:50:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627311031;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Do3uTJtfdr/wuxznNihgOeuHTvP1L4sRNwNx+BWfxmk=;
 b=UxQq9iLTHMvNGvZu3dDwGKRU8F4VL1mtZZrd3ESvIlnpRkKXzbTkvlD3y+5bsm4/oZ4Ad+
 22qsLZT5LqiViLnmGpViZAWKsn6Zs8+Crt+gaNuVcboNpdYZx9lTVqoQMbXsG0MN2Ugzxa
 ObgCkue6y0dPgI7GfZNSiiJYi1TBOh8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-509-39VlkomqNFilpNc3vLSxuA-1; Mon, 26 Jul 2021 10:50:28 -0400
X-MC-Unique: 39VlkomqNFilpNc3vLSxuA-1
Received: by mail-wr1-f69.google.com with SMTP id
 u11-20020a5d434b0000b029013e2027cf9aso4804235wrr.9
 for <qemu-devel@nongnu.org>; Mon, 26 Jul 2021 07:50:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Do3uTJtfdr/wuxznNihgOeuHTvP1L4sRNwNx+BWfxmk=;
 b=ubUZpbOK87MuQmkRoV34FMtjMmsrOqKDM4HTZbD7j+Ak64F5uK3fsRMOLN7manFAX1
 TNYSv0Atat7zJ7EwvyCCWkfooxS4EmQy2vq4YqYYQ5z0crGBIlfNvILbZo/0oycAUYOv
 s5t1W/ZOyLYyv+joig6zJcNWJZj0ZQGszW3w+mppA4UAsAAug6bGWLdl8ilQzzl8HtVf
 0Zm07atSlgfGtZKVzLGyaQVZK0Z0+Xx2X3nLT28GCq9yPA4u1EJwvBCxQm0II/e1vWSU
 se2qaPOw23BE3m35kYv7p6icM0qRqf37B7Sw8rnEr6IlPcBx/MS5r3+RZgI/cYjqSHHi
 LEtg==
X-Gm-Message-State: AOAM533CO8mwizOWt2WPqqmZcxM7C7oJf5Zzunpf4epWjIx2hx0hhg+T
 NvZRGAtiTCdfke/Qr8AH9ygeam3lAfUyJ3a9JrXqL3dL3AqmrguvfBGgwvdJ6aErAxl4CUBTln/
 XbfAZ+uLXdjyAZDQ=
X-Received: by 2002:a5d:6d88:: with SMTP id l8mr19941882wrs.301.1627311026995; 
 Mon, 26 Jul 2021 07:50:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwj1WNJEhtJJL6oGYrnC6VZm2KFID3iwT/Hr0GlX/jqmx432Sf3xjfq1wZTzk4DNJpzppw/Pw==
X-Received: by 2002:a5d:6d88:: with SMTP id l8mr19941847wrs.301.1627311026601; 
 Mon, 26 Jul 2021 07:50:26 -0700 (PDT)
Received: from [192.168.1.36] (122.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.122])
 by smtp.gmail.com with ESMTPSA id z11sm7365wru.65.2021.07.26.07.50.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Jul 2021 07:50:26 -0700 (PDT)
Subject: Re: [PATCH for-6.1 09/10] docs/about/removed-features: Fix markup
 error
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20210726142338.31872-1-peter.maydell@linaro.org>
 <20210726142338.31872-10-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <afbb376c-532b-a491-61ae-90c934299425@redhat.com>
Date: Mon, 26 Jul 2021 16:50:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210726142338.31872-10-peter.maydell@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.438, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Juan Quintela <quintela@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/26/21 4:23 PM, Peter Maydell wrote:
> The section describing the removed feature "-usbdevice ccid" had a
> typo so the markup started with single backtick and ended with double
> backtick; fix it.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  docs/about/removed-features.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


