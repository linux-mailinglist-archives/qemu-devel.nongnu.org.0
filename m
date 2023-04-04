Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96D636D5EEC
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Apr 2023 13:26:24 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjemU-0006w8-K0; Tue, 04 Apr 2023 07:24:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pjemS-0006vw-O0
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 07:24:52 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pjemR-0002Wq-6j
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 07:24:52 -0400
Received: by mail-wr1-x42c.google.com with SMTP id y14so32442391wrq.4
 for <qemu-devel@nongnu.org>; Tue, 04 Apr 2023 04:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680607489;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=N87mk8mRdOayl+ChZVFIelbjG/oXWu2x7UlDEIktud4=;
 b=Lhmagjj7NuCmNr9lXMkd6xtkZPotwRC9N8Xcabq7EJPqwjbhmhm42DMK2OqXQXSiLd
 D9HxaYrlYDcExj7pm9OJoXeTk8vxbBS35lQwpkhHkwCaRzOw9iPlZDRxDbGlUhzUA9Zx
 ikMNvPvd7RUfatGO99YYgixg6Lx62C002tpik4X0BM5jUGReTVlljPhIfhS7zitiz9j8
 XiMBbo+gTyScKATMNWpw20CGJ4IOjcEfNS51A1CfXI/QdbggIGFQEMfCvb0RoW/6QsFL
 5n5i1Xs5yQYFp+Un1+H0YUz3c02649NiWpjDXcdNl9K+44rE/bBnrQydsL9eVbmDlctU
 /YVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680607489;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=N87mk8mRdOayl+ChZVFIelbjG/oXWu2x7UlDEIktud4=;
 b=VSQXDBXv4rAlcAh25zZbe5QntbfCKwQwEXOEAc+QaYcwLfzXmdU+ky6d+Y4MEF+Q/z
 TNVYH/gUNcyiGT0KMwe0wNCH32Gy4nRI2F6nosXpxd+blddNkzlOG6/w5X8PE01Z7vXz
 B1kGVPLbiZA+qCeTClOY57yyrTaXyxZ1C4o59HgfORI+Cvqtu8L0mMYvTlQ0nzeKs5/z
 46Vp7rUGQJHc2Yogw1bmoRUSy6/D+KF0TnuO6p7FCMdUQdQ7NTZuk0fye+O8I8nSjSuH
 WfcOiEtNsPEVZ5SAsjkMkAzxFS4hvCQK9UA0s/tlKt+Q8S7nf6crZ8fvEibTpIf9qtpS
 gbzA==
X-Gm-Message-State: AAQBX9edoPpYHTv1pR+LCWDAvxg1PZ+2l8sp/DDWZHJn3k3ikvyszcej
 GcInLYxmJs1IorFFDGHuRVX9kA==
X-Google-Smtp-Source: AKy350bmUJLylVHqUnD5hN8Q9rm7xsIhoB5PavXlWhfUWYsXikCRIOibm3MeKksjOnaxzIPlkGXpBg==
X-Received: by 2002:adf:ed81:0:b0:2e6:ba1a:8d8 with SMTP id
 c1-20020adfed81000000b002e6ba1a08d8mr1431350wro.41.1680607489516; 
 Tue, 04 Apr 2023 04:24:49 -0700 (PDT)
Received: from [192.168.69.115] (gra94-h02-176-184-53-13.dsl.sta.abo.bbox.fr.
 [176.184.53.13]) by smtp.gmail.com with ESMTPSA id
 d9-20020adff849000000b002c56af32e8csm12074373wrq.35.2023.04.04.04.24.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Apr 2023 04:24:49 -0700 (PDT)
Message-ID: <72fdb847-46ec-93e3-dc55-2e87ac96367c@linaro.org>
Date: Tue, 4 Apr 2023 13:24:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.1
Subject: Re: [PATCH v2 09/11] tests/vm: use the default system python for
 NetBSD
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Reinoud Zandijk
 <reinoud@netbsd.org>, Ryo ONODERA <ryoon@netbsd.org>, qemu-block@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Warner Losh <imp@bsdimp.com>,
 Beraldo Leal <bleal@redhat.com>, Kyle Evans <kevans@freebsd.org>,
 kvm@vger.kernel.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>
References: <20230403134920.2132362-1-alex.bennee@linaro.org>
 <20230403134920.2132362-10-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230403134920.2132362-10-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.925,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 3/4/23 15:49, Alex Bennée wrote:
> From: Daniel P. Berrangé <berrange@redhat.com>
> 
> Currently our NetBSD VM recipe requests instal of the python37 package
> and explicitly tells QEMU to use that version of python. Since the
> NetBSD base ISO was updated to version 9.3 though, the default system
> python version is 3.9 which is sufficiently new for QEMU to rely on.
> Rather than requesting an older python, just test against the default
> system python which is what most users will have.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Message-Id: <20230329124601.822209-1-berrange@redhat.com>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> Message-Id: <20230330101141.30199-9-alex.bennee@linaro.org>
> ---
>   tests/vm/netbsd | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)

Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>


