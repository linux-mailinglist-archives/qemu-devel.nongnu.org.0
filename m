Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C3DB525DC6
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 10:46:27 +0200 (CEST)
Received: from localhost ([::1]:48780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npQwM-0003a0-IF
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 04:46:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1npQrL-0000a7-NS; Fri, 13 May 2022 04:41:22 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:40765)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1npQrJ-0003dl-MT; Fri, 13 May 2022 04:41:15 -0400
Received: by mail-ej1-x62b.google.com with SMTP id l18so14818908ejc.7;
 Fri, 13 May 2022 01:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=QAvabkzIOLY2YDl1IfKouJOkwAZ+buJQoDUlBT1WXaI=;
 b=ENW4aSz33gv+AAevdnBH1W/8jwq/w88/AwbRxIbdW7DoByajM+o5Bb4Rw4ReyLthQt
 BEcIANNAzQWJoHXGtYDJqdD2Wojzl2ThU8iBAfrlOaewcSvURdnbmSiLffCfbboUiZmC
 KN4K//OpM+ndMeTxKXzZJFWqBkG7vjmLabqAfyYCXlij4nRZlXatOQLflnWwSuSaz4QX
 VBAhep3Pg/8Xenq8vMvye13WERnmUxzQKvQXxRzK1AVik/HT+JFW0um0YuGNI4oTI5nj
 BW7kxHqvgk8ySv2ywuos07wiPrdeDQlZPVFmjl25venILTrWEpBay9JaeGM1Xwea3TwV
 FHJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=QAvabkzIOLY2YDl1IfKouJOkwAZ+buJQoDUlBT1WXaI=;
 b=0sVk2BtB5nmMD0W41XhhvR6G2Q+9YdyhIaMEGQdpm0pCRR5WzvpR+Hjj7fMpw+wz0C
 kP71wk1yujZbY/bbwOaOXL2XL+8zCQ7luvjosx43RYrVLurkOyUlmv+ktH2ExDvtGQHU
 qUNNwVYy5Q50WX8OLVvmd2k9StNLB7DRsSxaKXIs9K0AmFDHn5AikSeQYZhn3Kl/8kS5
 nKeMtfUc4MbUBeHi+N26yG9MFE/YYgThjFd70F176IQBCbGNEVel0IFZhHNzJzBPzSWe
 EhSzf8zHlIU//dRy5eGeXsYYh/zjG6tvkXJbJpaoIf/xhf801cJx764vrj2SOjx1xZ4O
 ZLNQ==
X-Gm-Message-State: AOAM5307XLJqhqCzqH3W8EfI7tF4dGfrMUTzKH51KJ+sbaykWzl2F/Dd
 Bb8/HS3ps3/L98qmouolPL8=
X-Google-Smtp-Source: ABdhPJxH0zaOYGrwSGWx2H20x34y3HWly8TuVlxRmml0DTKt/P2m8YG/yr2CbTU1dZLeu2NqP9T6qA==
X-Received: by 2002:a17:906:58ca:b0:6f4:444f:31ef with SMTP id
 e10-20020a17090658ca00b006f4444f31efmr3225728ejs.135.1652431271861; 
 Fri, 13 May 2022 01:41:11 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id
 ig2-20020a1709072e0200b006f3ef214dc6sm537374ejc.44.2022.05.13.01.41.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 May 2022 01:41:11 -0700 (PDT)
Message-ID: <cce38c36-30d6-2868-8e50-570216891549@redhat.com>
Date: Fri, 13 May 2022 10:41:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [RFC PATCH 6/9] tests: add check-venv as a dependency of check
 and check-block
Content-Language: en-US
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Hanna Reitz <hreitz@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Daniel Berrange <berrange@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <20220513000609.197906-1-jsnow@redhat.com>
 <20220513000609.197906-7-jsnow@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220513000609.197906-7-jsnow@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On 5/13/22 02:06, John Snow wrote:
>   meson, create the python venv for block tests.
> +.PHONY: check-block
> +check-block: check-venv
> +	@echo  # Without some rule, this doesn't run at all. Why?
> +
> +
>   # Consolidated targets
>   
>   .PHONY: check check-clean get-vm-images
> -check:
> +check: check-venv
> +	@echo # ???
>   

I think you need instead:

# The do-meson-check and do-meson-bench targets are defined in Makefile.mtest
do-meson-check do-meson-bench: check-venv

and I would even add "all" to the targets that create the virtual environment.

Paolo

