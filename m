Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9501251A15E
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 15:52:09 +0200 (CEST)
Received: from localhost ([::1]:45104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmFQG-0005yX-FJ
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 09:52:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nmFL6-0001EA-JA
 for qemu-devel@nongnu.org; Wed, 04 May 2022 09:46:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51831)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nmFL4-0002n1-QZ
 for qemu-devel@nongnu.org; Wed, 04 May 2022 09:46:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651672005;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1hmwZ1bKWWAkDbx2BvSb49dhMxHrUcF7QHzEpRlsEEk=;
 b=CQG4JSM9ATxdNWCI0plNB/iOjvjXfDzFSI/gwIZk1cZEecS+BQs2lIim1FFFkj50JosqTf
 egjmNugt+Guit+ypR/5MwSjKYJgySQidYt1ERBtxShg900E/1lpJh04INPdH2kr0KMjAKE
 iqYwlgcxZKl3MKc8w1tLw9zbUabV12k=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-274-kDPOgmx7Nfa7gUqa4-a_gg-1; Wed, 04 May 2022 09:46:44 -0400
X-MC-Unique: kDPOgmx7Nfa7gUqa4-a_gg-1
Received: by mail-wm1-f71.google.com with SMTP id
 m186-20020a1c26c3000000b003943e12185dso703670wmm.7
 for <qemu-devel@nongnu.org>; Wed, 04 May 2022 06:46:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=1hmwZ1bKWWAkDbx2BvSb49dhMxHrUcF7QHzEpRlsEEk=;
 b=5yRBqzA2uud5nypbhhX2p4GMJ9WfJbj5qGnauJQdNCeDQ7WSOmr4Rjhm+WI0inG1Gi
 +Ggt8rDXZluXqizL8YkUQrLfRti+OBYGuu5YvC4m22Grz8f7cgUSWFRMZuroSRmd/G0k
 68K/hhd4j+5suEFX4IgRTAEA0fpO5G5wj9WwCZjpLF3C6fawcQBaivtAS2q7Ex9Fo4n4
 nSshZwOFg08ovs6YEPAkozz9nqzKnFwZ468bQ/2Ack+7jvtljneb4DPBWCgeoWSDCFXh
 mMh4njsWQLd2oBT3wTwbESKK9NfM+Ga5GnOawcoAk7a52N57jttW4lVv/W0OHBSaPXmw
 nU1A==
X-Gm-Message-State: AOAM531SQMfqiaJyumDw6CepAf4m1MNH83vsSC+FQbNdfLlBsAUCHHsc
 tAuIMhlw1L93iTcPPk3mLlFsjwl/ymkdxk4AWgf6UwioNoedvTR/mlTdld9a+WDC3fh9gu2XxOU
 jk/xofensmCsjsr8=
X-Received: by 2002:a5d:5441:0:b0:20a:cdc0:6e90 with SMTP id
 w1-20020a5d5441000000b0020acdc06e90mr16754703wrv.566.1651672002934; 
 Wed, 04 May 2022 06:46:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzw87CgLYUV2qkZkNZ8oNnBkrNp+FxDAEdHkK0T/xWwYcbiEJ4SGhpTRR0Qln+ziGJu9Ih2cw==
X-Received: by 2002:a5d:5441:0:b0:20a:cdc0:6e90 with SMTP id
 w1-20020a5d5441000000b0020acdc06e90mr16754688wrv.566.1651672002749; 
 Wed, 04 May 2022 06:46:42 -0700 (PDT)
Received: from [10.33.192.183] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 f2-20020a7bcd02000000b003942a244f48sm3808680wmj.33.2022.05.04.06.46.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 May 2022 06:46:42 -0700 (PDT)
Message-ID: <197bb25a-f9d4-c29b-8893-1ad73c135127@redhat.com>
Date: Wed, 4 May 2022 15:46:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] linux-user/host/s390: Treat EX and EXRL as writes
Content-Language: en-US
To: Ilya Leoshkevich <iii@linux.ibm.com>, Laurent Vivier <laurent@vivier.eu>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org, Christian Borntraeger <borntraeger@linux.ibm.com>
References: <20220504114819.1729737-1-iii@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220504114819.1729737-1-iii@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 04/05/2022 13.48, Ilya Leoshkevich wrote:
> clang-built s390x branch-relative-long test fails on clang-built s390x
> QEMU due to the following sequence of events:
> 
> - The test zeroes out a code page, clang generates exrl+xc for this.
> 
> - do_helper_xc() is called. Clang generates exrl+xc there as well.
> 
> - Since there already exists a TB for the code in question, its page is
>    read-only and SIGSEGV is raised.
> 
> - host_signal_handler() calls host_signal_write() and the latter does
>    not recognize exrl as a write. Therefore page_unprotect() is not
>    called and the signal is forwarded to the test.
> 
> Fix by treating EXRL (and EX, just in case) as writes. There may be
> false positives, but they will lead only to an extra page_unprotect()
> call.
> 
> Reported-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> ---
>   linux-user/include/host/s390/host-signal.h | 7 +++++++
>   1 file changed, 7 insertions(+)

Great, this fixes the crash for me, indeed! Thank you!

Tested-by: Thomas Huth <thuth@redhat.com>


