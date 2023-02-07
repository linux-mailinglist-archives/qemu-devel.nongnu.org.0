Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A4A268D8F3
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 14:14:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPNmP-0008Hm-8u; Tue, 07 Feb 2023 08:13:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pPNmN-0008He-F6
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 08:12:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pPNmM-0001bi-0T
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 08:12:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675775577;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qYpxMm4gnRSCRC1pGEdtj7WrZHZMp6d4gCcmVCwP7mM=;
 b=Do5wG5QTpxmfoXQ0L3mONnJ+Ntesra+bdYSO5OFUM9K4i66k+1aaEbF+J5y0MNvaCmhio7
 cfpp1RXhQl0I5aJ+at/+BQxqNUkZ84R+Pi1Tg4hC0sKI0Wb7oSmZjP7sJBVhUu4AMndxas
 R4AJbqm5vG1DTQ3+0XJ8geMDiM0IH6w=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-418-lLYaGlfgNUKH6Xolj_5pew-1; Tue, 07 Feb 2023 08:12:55 -0500
X-MC-Unique: lLYaGlfgNUKH6Xolj_5pew-1
Received: by mail-qv1-f71.google.com with SMTP id
 ng1-20020a0562143bc100b004bb706b3a27so7711137qvb.20
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 05:12:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qYpxMm4gnRSCRC1pGEdtj7WrZHZMp6d4gCcmVCwP7mM=;
 b=mlxJc+JG6HsBJAlpC/8/hzGGXygiaUvEi21MSRZDrAOBclE9vXcNNCCO7GRReXCogy
 ZwuZNoZnkKxSYm4kpOEi3HjK4sBhDAD67UdPsmvNgOhiRwAfhIvruw5k4Z3tsrk+WuGJ
 MovXHWPt/xXAUav/HeZn06IUZwbmeWEn8YITDYkmxCD1dpJ0bswDagOX2+yWNHinO9Hx
 atGVPmVbDrj6uR1OTg8O62YkyJ8k5Q4VdJ5dS6N0GUdsuCI2Epyvm9PqDGYR+SRERgXQ
 993M0lnixTvGa/+DcnTveWTpMse+tJ2elEcQ+E5U3CwL9u7Z0JATp8jchb3rFgjzvvkY
 bRTQ==
X-Gm-Message-State: AO0yUKX9/MLgvt+zMJHFi+EqtaLhkYtSakCkkYWTJv0nFkiPT0BIDFhv
 aCrRDiurh2qxLtPFRNOvFErRfcogb4pFgRBlqs4LhdLhIBt1FpW65E4LQXnxscC6zhpILDD6ex1
 qabBNBxM5S+znk8U=
X-Received: by 2002:ac8:7fc2:0:b0:3ba:1360:ec0a with SMTP id
 b2-20020ac87fc2000000b003ba1360ec0amr4996960qtk.41.1675775575316; 
 Tue, 07 Feb 2023 05:12:55 -0800 (PST)
X-Google-Smtp-Source: AK7set+tSqW7KpL1TlElnFckpKH5KqDoPOGn1TwudKnceaNrCwuU8w0vW0uRnVOjBK+cVmABuA7bKw==
X-Received: by 2002:ac8:7fc2:0:b0:3ba:1360:ec0a with SMTP id
 b2-20020ac87fc2000000b003ba1360ec0amr4996929qtk.41.1675775575013; 
 Tue, 07 Feb 2023 05:12:55 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-176-120.web.vodafone.de.
 [109.43.176.120]) by smtp.gmail.com with ESMTPSA id
 y17-20020ac85251000000b003b34650039bsm9398423qtn.76.2023.02.07.05.12.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Feb 2023 05:12:50 -0800 (PST)
Message-ID: <c612ab5f-157b-264b-31e5-94b16b3c30b3@redhat.com>
Date: Tue, 7 Feb 2023 14:12:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 02/12] tests/qtest: Do not run lsi53c895a test if device
 is not present
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <fam@euphon.net>,
 Alexander Bulekov <alxndr@bu.edu>, Bandan Das <bsd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Darren Kenny
 <darren.kenny@oracle.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Laurent Vivier <lvivier@redhat.com>
References: <20230206150416.4604-1-farosas@suse.de>
 <20230206150416.4604-3-farosas@suse.de>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230206150416.4604-3-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.148, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 06/02/2023 16.04, Fabiano Rosas wrote:
> The tests are built once for all the targets, so as long as one QEMU
> binary is built with CONFIG_LSI_SCSI_PCI=y, this test will
> run. However some binaries might not include the device. So check this
> again in runtime.
> 
> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> ---
>   tests/qtest/fuzz-lsi53c895a-test.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/tests/qtest/fuzz-lsi53c895a-test.c b/tests/qtest/fuzz-lsi53c895a-test.c
> index 392a7ae7ed..a9254b455d 100644
> --- a/tests/qtest/fuzz-lsi53c895a-test.c
> +++ b/tests/qtest/fuzz-lsi53c895a-test.c
> @@ -112,6 +112,10 @@ static void test_lsi_do_dma_empty_queue(void)
>   
>   int main(int argc, char **argv)
>   {
> +    if (!qtest_has_device("lsi53c895a")) {
> +        return 0;
> +    }

I'm a little bit confused right now ... We're already checking 
CONFIG_LSI_SCSI_PCI in meson.build, and we're only adding the test to 
qtests_i386 there ... so how did you end up in a situation where you needed 
this change?

  Thomas


