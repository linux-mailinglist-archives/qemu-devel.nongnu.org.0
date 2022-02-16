Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7182F4B9284
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 21:38:14 +0100 (CET)
Received: from localhost ([::1]:39498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKR41-0005nZ-9B
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 15:38:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nKQmr-0007bG-8u
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 15:20:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23608)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nKQmo-0003cv-4c
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 15:20:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645042821;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nk8mono7lIda3fwrI4BCghpAaXomfc91+Xn5MWXJxBM=;
 b=OIzMDDBygyrHODsdt2C1Y7EnvXSYaaxmPtu0Pdfk1ROXEetDMJzeruEOFKc0Ji889u9nbC
 d+yv4MKXgXP6SQ5jP4x/sEeYByGibcWgQgb5pO+y4Xb4jy9NyftFaFN/51DmYvlG+G5v2F
 uwhV3MhLnAYyCEWPjq4dbkjCS6g0lbg=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-558-U-ywEqXZMuqy_GuJpjpNFw-1; Wed, 16 Feb 2022 15:20:20 -0500
X-MC-Unique: U-ywEqXZMuqy_GuJpjpNFw-1
Received: by mail-qk1-f199.google.com with SMTP id
 u17-20020a05620a431100b004765c0dc33cso2188916qko.14
 for <qemu-devel@nongnu.org>; Wed, 16 Feb 2022 12:20:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=nk8mono7lIda3fwrI4BCghpAaXomfc91+Xn5MWXJxBM=;
 b=5jaHiNp1SFnYljMrLT9or262Esz70aNb1GffKfpRrTp2HrZ0tQhZFBMogGya/Nq7pX
 KFDKGGYB69aIxfDCEtFfgIewVsWIjmPBCPUBnwaY8IrpB/YMjuddANJrjeJAlNYiIFwT
 rjSK1xFrJvB7ruI2OH+dEP5drPWoHaAHzkEcdpA7OiWiEnbGLt3qEHXhkCQzzPDlwNCJ
 2nb7CzA9dyQ98xwsnBAS8AOiwHoEmn5D9/l1SsgsC62pa6at2HLwx1c/IXgCMNDtPM0X
 VZ2UIzsaLYoQ96qTOvAfhVV5sT7yi6wLeD7NZHXShhNViZq5uFLVNqxvsdhPp1wXuIuJ
 3vpw==
X-Gm-Message-State: AOAM530c4NGD9rycWtJo+mgq4HTqHaWt0b1MAKI8ImSgAYXmYY47yfe4
 0N1aRVkf20w+VI8tGii3/sVd+WP47jwDUVuMhQdBePoavMPMFyEKaS951nLoavSbyNgeu9RrEA6
 DJ+0AmNYLA60g6dw=
X-Received: by 2002:a05:622a:1820:b0:2dc:93dd:19f8 with SMTP id
 t32-20020a05622a182000b002dc93dd19f8mr3365082qtc.301.1645042819970; 
 Wed, 16 Feb 2022 12:20:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz9h43ODOpFFXmROHf0SRjbT0Am80NSRxjk5XZpndAMzUSUHVUSaJsKXnkHMzrx2zf3cjKK1g==
X-Received: by 2002:a05:622a:1820:b0:2dc:93dd:19f8 with SMTP id
 t32-20020a05622a182000b002dc93dd19f8mr3365059qtc.301.1645042819745; 
 Wed, 16 Feb 2022 12:20:19 -0800 (PST)
Received: from ?IPV6:2003:cb:c70b:600:4ff7:25c:5aad:2711?
 (p200300cbc70b06004ff7025c5aad2711.dip0.t-ipconnect.de.
 [2003:cb:c70b:600:4ff7:25c:5aad:2711])
 by smtp.gmail.com with ESMTPSA id i4sm20549814qkn.13.2022.02.16.12.20.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Feb 2022 12:20:18 -0800 (PST)
Message-ID: <06935d17-7264-8adc-2629-0e76c72ac21b@redhat.com>
Date: Wed, 16 Feb 2022 21:20:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v4 3/3] tests/tcg/s390x: Tests for
 Miscellaneous-Instruction-Extensions Facility 3
To: David Miller <dmiller423@gmail.com>
References: <20220216200355.128731-1-dmiller423@gmail.com>
 <20220216200355.128731-4-dmiller423@gmail.com>
 <12b765a8-f443-19de-0ddb-95182debcf3c@redhat.com>
 <CAEgyohVsfrhDWeSbksn5UUObiP+fKjmWEdt-0xtmg7XzM19QTg@mail.gmail.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <CAEgyohVsfrhDWeSbksn5UUObiP+fKjmWEdt-0xtmg7XzM19QTg@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
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
Cc: thuth@redhat.com, farman@linux.ibm.com, cohuck@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 pasic@linux.ibm.com, qemu-s390x@nongnu.org,
 Christian Borntraeger <borntraeger@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16.02.22 21:18, David Miller wrote:
> That is strange, if I unstage them show status they are set to be committed:
> 
> null@rygar:~/projects/qemu/build$ git reset --soft HEAD~1
> null@rygar:~/projects/qemu/build$ git status
> On branch t2
> Changes to be committed:
>   (use "git restore --staged <file>..." to unstage)
>         modified:   ../tests/tcg/s390x/Makefile.target
>         new file:   ../tests/tcg/s390x/mie3-compl.c
>         new file:   ../tests/tcg/s390x/mie3-mvcrl.c
>         new file:   ../tests/tcg/s390x/mie3-sel.c

Maybe you did a "git add" but not a "git commit --amend" to squash them
into the previous commit?

-- 
Thanks,

David / dhildenb


