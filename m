Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D345630ADF2
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 18:34:02 +0100 (CET)
Received: from localhost ([::1]:40122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6d5N-000832-Or
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 12:34:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l6cxL-0001SB-Po
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 12:25:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:40115)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l6cxI-0003cg-RC
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 12:25:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612200338;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZE6eoFm2QzrYmlBR6QbDRPSk/4ZwOcP9/SMv7gJ5Sho=;
 b=X3n4n+FCgsnITdWBTj97Z4yl2W4HxQXjsGzuFpXXDiO7i55zCuU6RJT8H245FIyPmEo5kX
 Y5G8jykKSd3vrGQ09UQvY/1fMEMxDMuCLskpEDEA2pp5yG88XhsrY+h0c4JczAhTwCK7rn
 zNMrv72GW5C/EgQ0pKof4VZxe0Zrzbw=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-172-JAN0ShEIOLq1WEkNfEVu4g-1; Mon, 01 Feb 2021 12:25:36 -0500
X-MC-Unique: JAN0ShEIOLq1WEkNfEVu4g-1
Received: by mail-ej1-f71.google.com with SMTP id d15so8584794ejc.21
 for <qemu-devel@nongnu.org>; Mon, 01 Feb 2021 09:25:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZE6eoFm2QzrYmlBR6QbDRPSk/4ZwOcP9/SMv7gJ5Sho=;
 b=uZp+/z9HKpSw8J+U/I+ATPCW06dLY6lnfAs/Y9xqqsi+oij7rSirQ4719dbn3XS1qb
 FXRajHLQH3omms0PuMhOsTX/cKG+2e6BZkAgEvHesQvnzO1MxW1FKyus7Tjxy5w7SNue
 iKvxG3d+unNKstTm6Pz+6G2UpaP1RYQSFubCPYqdrll9A/41XEjdyuzbgciSJyt5ZKA7
 d2FIJb8D9lUU9+k0JEW946UzhJvToJ4j6R67X4so8a4Sn7GgrBId919pYgzkNELzM0VM
 Gd4UtkNuZMTH/QThSkqeqTfYJlBQuoZX+OCZf0E1G4N7GXxk1RR7lfFjfK/xlwjsGhob
 Bchw==
X-Gm-Message-State: AOAM530K9P2UUEc5fppHyh3P82zMdg1vppERcy3pSXJDbxuLcxncDUTD
 W4aa2RpjkvqoZK8qbs7Ghy34Kln2U3KUmTBWb7+ayvdmzp7IMXOikQU5xOsnLjx0M96iZNGz2r9
 MW+mvtpSyoF25wgQ=
X-Received: by 2002:a17:907:35ca:: with SMTP id
 ap10mr2654778ejc.451.1612200335810; 
 Mon, 01 Feb 2021 09:25:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzIX+WaJISGlapwGbu88vT1nGh2x/jlCZQ8G/prjAtub/fc+yz0KTyO+3cB5w6HLATyIXlusg==
X-Received: by 2002:a17:907:35ca:: with SMTP id
 ap10mr2654761ejc.451.1612200335670; 
 Mon, 01 Feb 2021 09:25:35 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id m8sm8977082eds.70.2021.02.01.09.25.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Feb 2021 09:25:34 -0800 (PST)
Subject: Re: [PULL 10/11] trace: document how to specify multiple --trace
 patterns
To: Kevin Wolf <kwolf@redhat.com>, BALATON Zoltan <balaton@eik.bme.hu>
References: <20210201154703.180022-1-stefanha@redhat.com>
 <20210201154703.180022-11-stefanha@redhat.com>
 <d5e9b59a-f7df-5a7b-55bb-cc6066b18a70@eik.bme.hu>
 <20210201161352.GH13157@merkur.fritz.box>
 <cbab5846-b5d-d256-89d7-b2bf9f7c69f@eik.bme.hu>
 <20210201165445.GI13157@merkur.fritz.box>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <32b015e1-f182-8557-72d1-6827e4f0a09b@redhat.com>
Date: Mon, 1 Feb 2021 18:25:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210201165445.GI13157@merkur.fritz.box>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 01/02/21 17:54, Kevin Wolf wrote:
>> How does this option parsing work? Would then multiple patterns separated by
>> comma as in -trace pattern1,pattern2 also work?
> This would be interpreted as an implied "enable" option with a value of
> "pattern1,pattern2". I don't think anything splits that string at the
> comma, so it would look for a trace event matching that string.

Even worse, it would be interpreted as "-trace 
enable=pattern1,pattern2=on" (and raise a warning since recently).

Paolo


