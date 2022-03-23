Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0F254E509F
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 11:48:30 +0100 (CET)
Received: from localhost ([::1]:50972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWyXV-0007um-Jo
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 06:48:29 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nWyVk-00075J-DC
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 06:46:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51765)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nWyVh-0007Tj-HN
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 06:46:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648032394;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z5EhW0HWJdUUKuKTbiEa4mZ7NZTv2gYMkG508GhG4/0=;
 b=RIOscbI65LIJBbHdulkscDPQ+HliOwEtd77Rel9SRzqJ7vlF2CIMmVmgg2/gtJR1jlQCOd
 VN85wiQ0vf4mhqhtLMmCEblyunXW2KAQZTsz3GfYsbDDH3itRFbUb8oOtuolMnHNkgtk7Y
 NH9G5l8aOT8RAfXUl0BJCqVbIpj+Spg=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-341-gDFfqm9hPECse_H_s77CCg-1; Wed, 23 Mar 2022 06:46:29 -0400
X-MC-Unique: gDFfqm9hPECse_H_s77CCg-1
Received: by mail-ed1-f70.google.com with SMTP id
 b10-20020a50e38a000000b00418cd24fd27so805164edm.8
 for <qemu-devel@nongnu.org>; Wed, 23 Mar 2022 03:46:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=z5EhW0HWJdUUKuKTbiEa4mZ7NZTv2gYMkG508GhG4/0=;
 b=xU0e/ncY3bkc401dY9iGZqK2ejEUz3ZCE/gnTBR6Iep/VVqzfPPvxLnnLKuGADe5tL
 W1CI20qsvDP7PlZ0ztMyOKxdGd8GYr4GsK2gI/n5NgUf1zwSe+DkrYG6QfnA4DuCJIqg
 mTTbkG9Cism5bS6nnotfSxsVoUPRploDHBNwDa/8lEOeEyWCpavY1915oakl9qM/X6ov
 Lrid1iT8IU7WF8XQslk+r78Oc5peSJ23uOwMl9CH99cJ2zNRYP5NZQGmdttItWj9T3yM
 R4FVWV+BmDEg50naC0pkS7nTQQBL90iAYOvxlaHMBirklvz7reG7fAkwse1MlJ/WU7Xb
 ldnw==
X-Gm-Message-State: AOAM530cUkX+msY1NCc4bQKZmDa+Pmjycg04ntcTxgPmd5TdEYQXQHYC
 5iEz9ulJ/HaOlmposTi5kG3Oze8IoZ6UqrBml2kQRuXeQexbDUQ+XP9gCSeUe9P7DWtG8MVjZYX
 lM3gub/+P79GMGzI=
X-Received: by 2002:a17:907:96ab:b0:6e0:ed5:7c22 with SMTP id
 hd43-20020a17090796ab00b006e00ed57c22mr14723162ejc.467.1648032387860; 
 Wed, 23 Mar 2022 03:46:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxFfYx+J5jmtkhb+0t7SwG8SSwQfe1Z7CaN5Iwu0ChnlLr5S8uUnQpEDRAJUQi5DsftVUQ8tA==
X-Received: by 2002:a17:907:96ab:b0:6e0:ed5:7c22 with SMTP id
 hd43-20020a17090796ab00b006e00ed57c22mr14723135ejc.467.1648032387577; 
 Wed, 23 Mar 2022 03:46:27 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id
 sb15-20020a1709076d8f00b006dfe4cda58fsm5488932ejc.95.2022.03.23.03.46.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Mar 2022 03:46:26 -0700 (PDT)
Message-ID: <fe028770-f420-905d-84da-04709dfb51bc@redhat.com>
Date: Wed, 23 Mar 2022 11:46:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 0/3] iotests: Check for zstd support
To: qemu-block@nongnu.org
References: <20220302124540.45083-1-hreitz@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220302124540.45083-1-hreitz@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 02.03.22 13:45, Hanna Reitz wrote:
> Hi,
>
> v1 cover letter:
>
> https://lists.nongnu.org/archive/html/qemu-devel/2022-02/msg04592.html
>
> We have two tests (as far as I know) that use compression_type=zstd for
> qcow2 but do not check whether that is actually supported.  Thomas
> reported this for 065, but it’s also the case for 303.
>
> This series makes 303 be skipped when zstd is not compiled in, and has
> 065 use zlib for each of its test cases then (it was made to use zstd
> just to improve on coverage, so using zlib as a fallback is perfectly
> fine).

Thanks a lot for the quick replies to my ping!

Regrettably, I forgot to consider that John’s recent changes would 
remove qemu_img_pipe_and_status(), which is used in patch 1...  I’m 
sorry, but I’ll have to send a v3. :/

Hanna


