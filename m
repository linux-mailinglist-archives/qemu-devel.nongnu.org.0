Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB482420716
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 10:13:01 +0200 (CEST)
Received: from localhost ([::1]:58922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXJ5o-0005WU-Qf
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 04:13:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mXIyq-00078V-Cv
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 04:05:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45975)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mXIyn-0003t4-Nt
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 04:05:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633334743;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=slfMiRI8yIsbj6y8gHoWoDRQToV+/o2ShBbAZIHwZf8=;
 b=YJaYfzfJ2oUNyJmt4n5O2JAl7qGUCudbraCcKhnBmTLtKnxYwjkBrOXimtgEFa72QZRTUI
 84ZngZdG2elUfQlZlcyurpExExQipRRHAbg4VuTkO5FvdMgtZBw8/MX9wNY69Y/e/RdyDR
 YebJIU6qPy2YbCBER5KyvMIsCblYSUM=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-63-x6P5UXVXMyWgPRueuUd5Aw-1; Mon, 04 Oct 2021 04:05:43 -0400
X-MC-Unique: x6P5UXVXMyWgPRueuUd5Aw-1
Received: by mail-ed1-f69.google.com with SMTP id
 x96-20020a50bae9000000b003d871ecccd8so1414117ede.18
 for <qemu-devel@nongnu.org>; Mon, 04 Oct 2021 01:05:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=slfMiRI8yIsbj6y8gHoWoDRQToV+/o2ShBbAZIHwZf8=;
 b=o/7dishtpXaIVPzUHaQKtx9tgXNeVV1pX7tJiKw7R58qC+/filUJRE7KJthyUMjrNi
 wh6BoU/ya7R2qwfVJMk0omfMHI7lSHilJ/HEcrYGtQdSsl0qAdT5lBtfeFttMj7csGFp
 cSemMprpelMxVX349HDx9BrTuwQfhBqjORjP9dHQdX5rTJXkInIzzy8QLvvRiu0mv75Z
 BcKYcwDXRSvHf1mOu1oZ7pmTu1BuCgzpIZgXw+SleeHg61Nl0C3K+oRIwftodt7jq98Q
 wgD99Q3/tI/y3BO93YdW2xNNiFWtjroMvMHJm6DEPDvAxzU2z+flPQqpDXFDtAplJ4uF
 dq7A==
X-Gm-Message-State: AOAM531B4GSGGxq+0HgCJYKz4r95TxnrMLtZGeG0U0kIg2ZrBuEBXCzO
 oGml8QjXiNuK5aLTmM5ee5yNjIUJ+Lp98azO4wjY5QK3zCF+dkbRXxeEX+RNk6kq9mnGG/sFtBe
 ECbccXrHLPxngqDg=
X-Received: by 2002:a05:6402:410:: with SMTP id
 q16mr16420215edv.286.1633334741389; 
 Mon, 04 Oct 2021 01:05:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwgSMDwVDhoo9oYCOfILVhORmQy41yqG5m8Z7uMCtAir4/VB5g48B74F4Ns1FeIIMAIDFL1+A==
X-Received: by 2002:a05:6402:410:: with SMTP id
 q16mr16420189edv.286.1633334741128; 
 Mon, 04 Oct 2021 01:05:41 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id bj21sm6172910ejb.42.2021.10.04.01.05.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Oct 2021 01:05:40 -0700 (PDT)
Message-ID: <569c9eae-6ad6-14f2-0e06-b3a0c0e5b31b@redhat.com>
Date: Mon, 4 Oct 2021 10:05:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v3 01/22] qapi/misc-target: Wrap long 'SEV Attestation
 Report' long lines
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20211002125317.3418648-1-philmd@redhat.com>
 <20211002125317.3418648-2-philmd@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20211002125317.3418648-2-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.055,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Brijesh Singh <brijesh.singh@amd.com>, kvm@vger.kernel.org,
 Sergio Lopez <slp@redhat.com>, James Bottomley <jejb@linux.ibm.com>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Dov Murik <dovmurik@linux.ibm.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 02/10/21 14:52, Philippe Mathieu-Daudé wrote:
> Wrap long lines before 70 characters for legibility.
> 
> Suggested-by: Markus Armbruster <armbru@redhat.com>
> Reviewed-by: Markus Armbruster <armbru@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>   qapi/misc-target.json | 17 ++++++++++-------
>   1 file changed, 10 insertions(+), 7 deletions(-)
> 
> diff --git a/qapi/misc-target.json b/qapi/misc-target.json
> index 594fbd1577f..ae5577e0390 100644
> --- a/qapi/misc-target.json
> +++ b/qapi/misc-target.json
> @@ -300,8 +300,8 @@
>   ##
>   # @SevAttestationReport:
>   #
> -# The struct describes attestation report for a Secure Encrypted Virtualization
> -# feature.
> +# The struct describes attestation report for a Secure Encrypted
> +# Virtualization feature.
>   #
>   # @data:  guest attestation report (base64 encoded)
>   #
> @@ -315,10 +315,11 @@
>   ##
>   # @query-sev-attestation-report:
>   #
> -# This command is used to get the SEV attestation report, and is supported on AMD
> -# X86 platforms only.
> +# This command is used to get the SEV attestation report, and is
> +# supported on AMD X86 platforms only.
>   #
> -# @mnonce: a random 16 bytes value encoded in base64 (it will be included in report)
> +# @mnonce: a random 16 bytes value encoded in base64 (it will be
> +#          included in report)
>   #
>   # Returns: SevAttestationReport objects.
>   #
> @@ -326,11 +327,13 @@
>   #
>   # Example:
>   #
> -# -> { "execute" : "query-sev-attestation-report", "arguments": { "mnonce": "aaaaaaa" } }
> +# -> { "execute" : "query-sev-attestation-report",
> +#                  "arguments": { "mnonce": "aaaaaaa" } }
>   # <- { "return" : { "data": "aaaaaaaabbbddddd"} }
>   #
>   ##
> -{ 'command': 'query-sev-attestation-report', 'data': { 'mnonce': 'str' },
> +{ 'command': 'query-sev-attestation-report',
> +  'data': { 'mnonce': 'str' },
>     'returns': 'SevAttestationReport',
>     'if': 'TARGET_I386' }
>   
> 

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>


