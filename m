Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C8FC6D04E8
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Mar 2023 14:38:20 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phrXG-0003UT-TK; Thu, 30 Mar 2023 08:37:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1phrX3-0003Td-7U
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 08:37:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1phrX1-0002hO-Ob
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 08:37:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680179851;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sRT/tt7u3U27G0hnAPtryr8nUWpLINblkNOcQthDUKk=;
 b=NlwfK59cs+13sT1zK4eABFpq0iHuGhbmqiPitT1EG9tNUBzBVimL38IrA4qeDQ0g3vz6iG
 J18+nf4k16W/ROF8L4aTnFLXIoA0VROmPMcnyET97eCu3y7N8feTouQA8i5NBvWBOC8SPQ
 QN8SYSfed2lOP3ystOTOQ0w9UpmeGjE=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-518-FjsjaZZ1O8S-79HrbLf-_w-1; Thu, 30 Mar 2023 08:37:30 -0400
X-MC-Unique: FjsjaZZ1O8S-79HrbLf-_w-1
Received: by mail-qt1-f198.google.com with SMTP id
 a11-20020ac85b8b000000b003e3979be6abso12247458qta.12
 for <qemu-devel@nongnu.org>; Thu, 30 Mar 2023 05:37:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680179849;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sRT/tt7u3U27G0hnAPtryr8nUWpLINblkNOcQthDUKk=;
 b=Cxs1AGmPkvKIx+/J4s+Ne0k+2jPMr3LL9TAb0U/+i2QP3txiGZZy4KySvji0YwYEal
 vEI8/xUKhcZERibHxRkZnRwlyfb756AWoZxK7C7BhZvBbdeL2VQefe2lBjdthHIjf0pz
 3Tq4cWT+2yylATxb4MBOBQUlzckqoWwcY3q8Tbz/vfsybn8/GYYMeNSnYNKVB7UVDvOc
 /MRX3OILSf1ViYfaticqhC0gaPUjvf/Uq5qVIuv19ab80LvYPFJj/Bc36uMEgtBzy4IA
 FerBgSRXXaM8Yqu6pjTesDpU4Fv504fDuTOYJYWh5O4OjFRdhYvx3CV19b6X/hu3oLJf
 lBNg==
X-Gm-Message-State: AAQBX9dKVUDuNPAAq32UcZOaldgLFRbgvrVR9spqanSOOD8aPSsl6VoZ
 Itcqnndtqi7NMAU21VD4gA+Zx9LNHZNl50Y0UThGBsYuOzJU8QaOH54JF5z8AuZxYXzMnN0WyYg
 +iqzngYGF2Sfzo2w=
X-Received: by 2002:a05:6214:4103:b0:56f:1b7e:d87f with SMTP id
 kc3-20020a056214410300b0056f1b7ed87fmr34505633qvb.34.1680179849539; 
 Thu, 30 Mar 2023 05:37:29 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZdSJ0gCiYWLPLCAjdYlSawkfYxgbp1pOZ0bZeVVjgOYaes5rmqPvJr6EbLuDMvCFg7urVs0g==
X-Received: by 2002:a05:6214:4103:b0:56f:1b7e:d87f with SMTP id
 kc3-20020a056214410300b0056f1b7ed87fmr34505614qvb.34.1680179849326; 
 Thu, 30 Mar 2023 05:37:29 -0700 (PDT)
Received: from [10.33.192.205] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 f15-20020a0cc30f000000b005dd8b9345d6sm5388387qvi.110.2023.03.30.05.37.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Mar 2023 05:37:28 -0700 (PDT)
Message-ID: <4edd7fdb-a025-55e3-552d-a7f08ffccc6a@redhat.com>
Date: Thu, 30 Mar 2023 14:37:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 01/11] scripts/coverage: initial coverage comparison script
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Warner Losh <imp@bsdimp.com>, Ryo ONODERA <ryoon@netbsd.org>,
 Kevin Wolf <kwolf@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Kyle Evans <kevans@freebsd.org>, Reinoud Zandijk <reinoud@netbsd.org>,
 Kautuk Consul <kconsul@linux.vnet.ibm.com>
References: <20230330101141.30199-1-alex.bennee@linaro.org>
 <20230330101141.30199-2-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230330101141.30199-2-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 30/03/2023 12.11, Alex Bennée wrote:
> This is a very rough and ready first pass at comparing gcovr's json
> output between two different runs. At the moment it will give you a
> file level diff between two runs but hopefully it wont be too hard to
> extend to give better insight.
> 
> After generating the coverage results you run with something like:
> 
>    ./scripts/coverage/compare_gcov_json.py \
>      -a ./builds/gcov.config1/coverage.json \
>      -b ./builds/gcov.config2/coverage.json
> 
> My hope is we can use this to remove some redundancy from testing as
> well as evaluate if new tests are actually providing additional
> coverage or just burning our precious CI time.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

FWIW:
Acked-by: Thomas Huth <thuth@redhat.com>



