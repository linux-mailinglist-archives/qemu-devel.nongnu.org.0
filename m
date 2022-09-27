Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 333B15EC516
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 15:56:55 +0200 (CEST)
Received: from localhost ([::1]:46920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odB4w-0007SP-96
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 09:56:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1od9b6-0002r9-MZ
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 08:22:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27624)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1od9b3-0002qD-7s
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 08:21:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664281314;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tzVd2sKII0qA4nr34nqAscSybZ7Bg5xBPq7skVrQLfY=;
 b=QrA2G26O2Uy1uAxWzRJLHZGYlGKJcPAT23d8o051ju0FJ+tNLxYK0QIrw1LW9nRXWdIeyu
 swCVF0CKtd62zuO1vLqJA0wOaYthnasB2+Ddz8vR4Bqq1UKgWcyxpfyInC0bYkgLLYusIu
 TzbQN9hFNCOtlt0Qc8vy6Wi0mKFFVqo=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-512-W05K4iAJPUqD82eol5GuZg-1; Tue, 27 Sep 2022 08:21:53 -0400
X-MC-Unique: W05K4iAJPUqD82eol5GuZg-1
Received: by mail-wr1-f69.google.com with SMTP id
 g15-20020adfbc8f000000b0022a4510a491so2110871wrh.12
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 05:21:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=tzVd2sKII0qA4nr34nqAscSybZ7Bg5xBPq7skVrQLfY=;
 b=u6xri+j4Or9bPt43NGy5bvzHKifCn1e+QknNl+JujFRvIks8EpnmP+P0hRjQP/FIeC
 LQdLj6R8FtkBhXNpmzbXHHTBq/JtEMJG7EQgF9DWLo+kI57BoknXqe957BwhPZv8DRJ9
 RMd+r9faD1eGs6Pn8r0mpYglFM0hXq+spO6WoGmKiSpJzUsjjPNuviWq7vPFNrlfTf30
 Lr5/GBk8r14h4+i5cyVrhnDHl02Fs5se64BsJvL2mn9n3Q28AUnJmTsb08/ShRcUl5oK
 RDdV5NCgwwp8FESSKL3n2kwozGGGxNEfQa54oMWzhwobWRCs7D8Bwck8hE6I1edhhgVM
 qK4g==
X-Gm-Message-State: ACrzQf033oMBGdyZNQw7f+gbEMP4IrW5Bx3TKTaCkLwce6Ycxc1jN1fs
 38oW1V2BE2/+f5yHtGEI37gkV8mM9n0Ph7G4Cc3Dl/8pwaC7+pNub99SZtxK6ux6qMbGm67KVyO
 iQ3HSzp/dQbOz5e4=
X-Received: by 2002:a05:600c:229a:b0:3b4:810a:8b4f with SMTP id
 26-20020a05600c229a00b003b4810a8b4fmr2461472wmf.117.1664281312208; 
 Tue, 27 Sep 2022 05:21:52 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7qOPuqERHmo3figWuG4KGJUHNQVVxoRlQFKhTN/VP8//Kgq3WstcZnK/l3OY7iF43XNTDHvg==
X-Received: by 2002:a05:600c:229a:b0:3b4:810a:8b4f with SMTP id
 26-20020a05600c229a00b003b4810a8b4fmr2461459wmf.117.1664281312015; 
 Tue, 27 Sep 2022 05:21:52 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-179-30.web.vodafone.de.
 [109.43.179.30]) by smtp.gmail.com with ESMTPSA id
 x18-20020a1c7c12000000b003a5ffec0b91sm1616317wmc.30.2022.09.27.05.21.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Sep 2022 05:21:51 -0700 (PDT)
Message-ID: <f9c0cd6d-b899-b811-8109-e6f4404a608c@redhat.com>
Date: Tue, 27 Sep 2022 14:21:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v4 12/54] tests/qtest: hd-geo-test: Avoid using hardcoded
 /tmp
Content-Language: en-US
To: Bin Meng <bmeng.cn@gmail.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20220927110632.1973965-1-bmeng.cn@gmail.com>
 <20220927110632.1973965-13-bmeng.cn@gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220927110632.1973965-13-bmeng.cn@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.319, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 27/09/2022 13.05, Bin Meng wrote:
> From: Bin Meng <bin.meng@windriver.com>
> 
> This case was written to use hardcoded /tmp directory for temporary
> files. Update to use g_file_open_tmp() for a portable implementation.
> 
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
> 
> Changes in v4:
> - Do not use g_autofree and g_steal_pointer
> 
> Changes in v3:
> - Split to a separate patch
> - Ensure g_autofree variable is initialized
> - Use g_steal_pointer() in create_test_img()
> 
>   tests/qtest/hd-geo-test.c | 24 +++++++++++-------------
>   1 file changed, 11 insertions(+), 13 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>


