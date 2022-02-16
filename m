Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DCFA4B8673
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 12:07:40 +0100 (CET)
Received: from localhost ([::1]:55464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKI9r-0005Y9-Gy
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 06:07:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nKI7T-0003NI-Tt
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 06:05:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52917)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nKI7O-0004TN-66
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 06:05:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645009505;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eq5MFQBr3+Qka7AS7Wvl084+gCBnemtT5nXOSkUSKNg=;
 b=F3xU8SOD48kzx41LDGCvQZ/I0xDLDbxFx8CnWOOH8CrkyvJU70wMCeeSzOcMyqdPboiDY5
 fCrJesNJ2iwhvRrag/paV5jNWw+zsh1l+88v0/AXxdhwKnoiS2+8P4eZEjKS0X8/QXAG7M
 W4jAPV98t3JhPcP1Ae04a/aL3CGf7BA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-527-PWWLJ8ymPGyarcuhmeIbpQ-1; Wed, 16 Feb 2022 06:05:04 -0500
X-MC-Unique: PWWLJ8ymPGyarcuhmeIbpQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 n3-20020a05600c294300b0037bc685b717so331369wmd.8
 for <qemu-devel@nongnu.org>; Wed, 16 Feb 2022 03:05:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=eq5MFQBr3+Qka7AS7Wvl084+gCBnemtT5nXOSkUSKNg=;
 b=aI4Rfj9esYyO6xFC8k3xOvBiZr3ciFKDQfj7S3TLK2AU0WfJQTDqwVTQd5OH/B0nGI
 99meno09260tYPjAqM19fhFbO+tnWtpe+Nr6y67s83F6ZLPMxH2zeo3GO7bwJPy4I388
 5jaWf/CDalAk8Uzm3ETMDm3Yuv7Em71ES2Bgciso2K+ti84mMyjbwCMBcTPOuDSNk7cF
 U+ivW1lFe2YYu84PYhViMCAIjknQmxWnaH49IqsNEEJK5a2OvC1Ma9fdLO70wz0Bse6S
 Ks7/ODrzhQ9F6zlLyUlGn1JeOHdGYkJS+oCC4FD2IJB5qTrFqteBqtySkR/3Iprwt2Hp
 2dCA==
X-Gm-Message-State: AOAM532KgZ2jTRK5v23UstCSJSm7SzWv6DI0QIhF0pYZnaSpLgYcm+IW
 mjGILC2PPhaKfLt+z7jRXY3JM3KJXd0JmVE4J+03mu7J75BHWzYUWHAtLjtOCNfuyk3ZmXk34ox
 Y2LM7izVHSAfCRSk=
X-Received: by 2002:a05:600c:364a:b0:37b:ac5d:b77b with SMTP id
 y10-20020a05600c364a00b0037bac5db77bmr1069906wmq.82.1645009503073; 
 Wed, 16 Feb 2022 03:05:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxeE8bvTvmYZWYeEGkkM+elQQzgG2eeAeLaJEgQ2/8afoLfoBt+8IWzanYzdKI+1c3pBHs8Sg==
X-Received: by 2002:a05:600c:364a:b0:37b:ac5d:b77b with SMTP id
 y10-20020a05600c364a00b0037bac5db77bmr1069877wmq.82.1645009502784; 
 Wed, 16 Feb 2022 03:05:02 -0800 (PST)
Received: from ?IPV6:2003:cb:c70b:600:4ff7:25c:5aad:2711?
 (p200300cbc70b06004ff7025c5aad2711.dip0.t-ipconnect.de.
 [2003:cb:c70b:600:4ff7:25c:5aad:2711])
 by smtp.gmail.com with ESMTPSA id j35sm17630427wms.32.2022.02.16.03.05.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Feb 2022 03:05:02 -0800 (PST)
Message-ID: <2a1e0ed0-57ca-205c-a652-fd41d2ec586e@redhat.com>
Date: Wed, 16 Feb 2022 12:05:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v3 3/3] s390x/tcg/tests: Tests for
 Miscellaneous-Instruction-Extensions Facility 3
To: David Miller <dmiller423@gmail.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org
References: <b69367a6-7744-6dbf-c370-3019bd66965c@gmail.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <b69367a6-7744-6dbf-c370-3019bd66965c@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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
Cc: thuth@redhat.com, cohuck@redhat.com, richard.henderson@linaro.org,
 farman@linux.ibm.com, pasic@linux.ibm.com, borntraeger@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 15.02.22 21:27, David Miller wrote:
> tests/tcg/s390x/mie3-compl.c: [N]*K instructions
> tests/tcg/s390x/mie3-mvcrl.c: MVCRL instruction
> tests/tcg/s390x/mie3-sel.c:  SELECT instruction
> 

(I know, a lot of mails from my side :) )

1. I think we usually use the prefix in the subject "tests/tcg/s390x: "

2. Make sure the patches are checkpatch clean as good as possible:

For this patch:

$ rm *.patch
$ git format-patch -1
$ ./scripts/checkpatch.pl *.patch
WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
#45:
new file mode 100644

ERROR: spaces required around that ':' (ctx:VxW)
#53: FILE: tests/tcg/s390x/mie3-compl.c:4:
+#define F_EPI "stg %%r0, %[res] ": [res] "+m" (res) : : "r0", "r2", "r3"
                                  ^

ERROR: unnecessary whitespace before a quoted newline
#57: FILE: tests/tcg/s390x/mie3-compl.c:8:
+    "lg %%r2, %[a] \n" \

ERROR: space prohibited before that close parenthesis ')'
#61: FILE: tests/tcg/s390x/mie3-compl.c:12:
+    : "r2", "r3" )

ERROR: unnecessary whitespace before a quoted newline
#67: FILE: tests/tcg/s390x/mie3-compl.c:18:
+FbinOp(_ncrk,  asm("ncrk  %%r0, %%r3, %%r2 \n" F_EPI))

ERROR: unnecessary whitespace before a quoted newline
#68: FILE: tests/tcg/s390x/mie3-compl.c:19:
+FbinOp(_ncgrk, asm("ncgrk %%r0, %%r3, %%r2 \n" F_EPI))

...

-- 
Thanks,

David / dhildenb


