Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FD8842662A
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Oct 2021 10:45:02 +0200 (CEST)
Received: from localhost ([::1]:39034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYlUz-0006Yf-Ce
	for lists+qemu-devel@lfdr.de; Fri, 08 Oct 2021 04:45:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mYlTG-00059d-4m
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 04:43:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46958)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mYlTB-0003Ie-NK
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 04:43:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633682588;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QWc/RvuRQ2gowOR0g++k53M2EmEYyxUxO9JCZ0iaIcA=;
 b=QLo8zug/T9eUqt3N/WqLA6lLRzYkZKjcUVuxZA4vWQiPOM5VhI2A99triHTNimYcgByk8Y
 1mImQXr+1J6dtXkxqsgA9iHklWKniitgaU/b1JV0QpUSx7xFnLk+I1hkuXpQSzgtRO+0cq
 0+GS+tM39lZRRjAtHy3VyZLPjIX9+es=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-411-Qx9JIBLNM0CRleidMDRJfg-1; Fri, 08 Oct 2021 04:43:08 -0400
X-MC-Unique: Qx9JIBLNM0CRleidMDRJfg-1
Received: by mail-ed1-f69.google.com with SMTP id
 g28-20020a50d0dc000000b003dae69dfe3aso8514188edf.7
 for <qemu-devel@nongnu.org>; Fri, 08 Oct 2021 01:43:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=QWc/RvuRQ2gowOR0g++k53M2EmEYyxUxO9JCZ0iaIcA=;
 b=6TxevY1MI4/wrURxNnRJkiZ1A2xQ9xfPR/81gta6S5jvecNDUe+rl0Xk0bae4+lDf0
 RhMusc5KovGgq07u60zf6j07/UyySABg19ytRwMHVWPkPSLotP0rl/T8nFJFBCWOpFTj
 bDb4DhHwc3r5WCMliz42DWZ7fh8njwUjLgBN2TYYTbJEUnUbOVyRsv/hA2wPFrkNvrB9
 0TrFsPWad3s4aJTFJAuCwCbwEBRZLAS7VXfAgiPzf96PY6Ainq+8T1DVr7liIaF7lTPq
 aa1b4MYxtsEWl3ZgabglNNEm5Cwxj7CyQuUzmmMitBKvgNpKLLz7c1ag/wSANLzxBt38
 lEjg==
X-Gm-Message-State: AOAM533ugGENvKjBIPylEWxDy87W7odrgKO8e5bocvG+di6ndsLhqcLQ
 9YwiqFK6PVVdIqVuV1wCjh9UlkPce5QqlbNjIYK6/Pq3xVrtiXJeBDPuUtMdH5QJvAq426WGdb1
 oyAg1BqoT3H99MnU=
X-Received: by 2002:a17:906:270a:: with SMTP id
 z10mr2505341ejc.464.1633682586639; 
 Fri, 08 Oct 2021 01:43:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxwU1j6iFftZ2f04AkLD6IBCeL63hrcYo9yGvi7AY22NTglDPQkei07sv8QNHsPLi8U7j/f3g==
X-Received: by 2002:a17:906:270a:: with SMTP id
 z10mr2505329ejc.464.1633682586487; 
 Fri, 08 Oct 2021 01:43:06 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id g9sm673731ejo.60.2021.10.08.01.43.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Oct 2021 01:43:05 -0700 (PDT)
Message-ID: <32011430-0e48-46c7-9f1e-c5b484a4eaf4@redhat.com>
Date: Fri, 8 Oct 2021 10:43:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 24/24] configure: automatically parse command line for
 meson -D options
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>
References: <20211007130630.632028-1-pbonzini@redhat.com>
 <20211007130829.632254-19-pbonzini@redhat.com>
 <CAJ+F1C+YriVhkYRtiHe=US3MmhEyLkVPnfwuAJqYvSOCR-uGEg@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <CAJ+F1C+YriVhkYRtiHe=US3MmhEyLkVPnfwuAJqYvSOCR-uGEg@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.964, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 07/10/21 22:41, Marc-André Lureau wrote:
> 
> I have not investigated why, but this broke at least 
> --enable-trace-backend=log for me:
> ERROR: unknown option --enable-trace-backend=log

 From the commit message:

"A few options change name: --enable-tcmalloc and --enable-jemalloc
become --enable-malloc={tcmalloc,jemalloc}; --disable-blobs becomes
--disable-install-blobs; --enable-trace-backend becomes
--enable-trace-backends".

I'll add some code for backwards compatibility.

Paolo


