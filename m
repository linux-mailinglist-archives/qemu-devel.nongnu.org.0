Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4AEA420726
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 10:15:46 +0200 (CEST)
Received: from localhost ([::1]:39568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXJ8T-00033m-R4
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 04:15:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mXIz9-0007PC-Jv
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 04:06:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48835)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mXIz8-0004AF-0o
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 04:06:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633334765;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hw+xbDWc7dtQn72C5ECQKBz7jDmamUcokktZX7IgWEo=;
 b=XRTAkEEXFuZvt5KjD8UFAW0R7113QBBLJ8sC7plYPFFjZsYkpF41mUUE//dhRG/b2uqqO3
 nJih1skGNBVbsyw5IBcU0f1SgaFdoab7i6Zgs9d6mNizMqWQM3jP78BnZm/E2fD0V/RKpZ
 aKPPr3Qcg6s6RSM3rpX3seXHX/lmuls=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-604-gMnT0hwONZOAyVYhnLie3g-1; Mon, 04 Oct 2021 04:06:02 -0400
X-MC-Unique: gMnT0hwONZOAyVYhnLie3g-1
Received: by mail-ed1-f69.google.com with SMTP id
 m20-20020aa7c2d4000000b003d1add00b8aso16429493edp.0
 for <qemu-devel@nongnu.org>; Mon, 04 Oct 2021 01:06:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=hw+xbDWc7dtQn72C5ECQKBz7jDmamUcokktZX7IgWEo=;
 b=gT3ehhGEwlvPfjTFZ1RgpG1u4G514u8t3f5hEngHIAzN9xScxGwDjIkFGFqQsU1mdA
 NGrmjuCLDnsoQFRw88pA2UOBTjQyhj7NF5tICfbVCGnxz3Z0UxoIcwEN3YTf/TRp7N3E
 mqCIRwCvhEfXB2abyP8jc2k81LZM/P3wvb3Ag1wnACWujkzbC9DQqb/wSsuoqk2yYqo6
 QunZdcJbOuMHRZZhZac8g3rMqu32c0RqFR5p/Tpgbe0+gssoCCrN4sX3RnJ4GoEoQ/Ux
 n9XOMTwnPnW4Eg2LMuCoLYbJHVd9jgpCvV9YLiU7DgkqcN9fiRW/Fi3KZGwn5CLds4wU
 qklg==
X-Gm-Message-State: AOAM532J0lAetR5gVJgDJ5M/a8OJG5eSdcs01uEqyJSuQ0Fi5JeBzmMI
 IcE2wSp2tbXoaz3Y0ATgVg3DRhdBqNocGNMyl1CKFnhRnPNh1isM0ECjIn8gERMbHVagttFi7Rq
 rbNP85CQ/zcBBNqY=
X-Received: by 2002:a17:907:a411:: with SMTP id
 sg17mr15692053ejc.412.1633334761305; 
 Mon, 04 Oct 2021 01:06:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw9YElamJHoHOVWhZSmRK0N3iqP1SylotX6RwYdcZ8fP4UXOoe1vZcZ5a3/Mg9aLskU8ulBig==
X-Received: by 2002:a17:907:a411:: with SMTP id
 sg17mr15692029ejc.412.1633334761079; 
 Mon, 04 Oct 2021 01:06:01 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id u18sm6291149ejc.26.2021.10.04.01.05.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Oct 2021 01:06:00 -0700 (PDT)
Message-ID: <df27af6d-e75a-916d-e8cc-4ac9fab2c104@redhat.com>
Date: Mon, 4 Oct 2021 10:05:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v3 02/22] qapi/misc-target: Group SEV QAPI definitions
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20211002125317.3418648-1-philmd@redhat.com>
 <20211002125317.3418648-3-philmd@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20211002125317.3418648-3-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
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
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Dov Murik <dovmurik@linux.ibm.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 02/10/21 14:52, Philippe Mathieu-Daudé wrote:
> There is already a section with various SEV commands / types,
> so move the SEV guest attestation together.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>   qapi/misc-target.json | 80 +++++++++++++++++++++----------------------
>   1 file changed, 40 insertions(+), 40 deletions(-)
> 
> diff --git a/qapi/misc-target.json b/qapi/misc-target.json
> index ae5577e0390..5aa2b95b7d4 100644
> --- a/qapi/misc-target.json
> +++ b/qapi/misc-target.json
> @@ -229,6 +229,46 @@
>     'data': { 'packet-header': 'str', 'secret': 'str', '*gpa': 'uint64' },
>     'if': 'TARGET_I386' }
>   
> +##
> +# @SevAttestationReport:
> +#
> +# The struct describes attestation report for a Secure Encrypted
> +# Virtualization feature.
> +#
> +# @data:  guest attestation report (base64 encoded)
> +#
> +#
> +# Since: 6.1
> +##
> +{ 'struct': 'SevAttestationReport',
> +  'data': { 'data': 'str'},
> +  'if': 'TARGET_I386' }
> +
> +##
> +# @query-sev-attestation-report:
> +#
> +# This command is used to get the SEV attestation report, and is
> +# supported on AMD X86 platforms only.
> +#
> +# @mnonce: a random 16 bytes value encoded in base64 (it will be
> +#          included in report)
> +#
> +# Returns: SevAttestationReport objects.
> +#
> +# Since: 6.1
> +#
> +# Example:
> +#
> +# -> { "execute" : "query-sev-attestation-report",
> +#                  "arguments": { "mnonce": "aaaaaaa" } }
> +# <- { "return" : { "data": "aaaaaaaabbbddddd"} }
> +#
> +##
> +{ 'command': 'query-sev-attestation-report',
> +  'data': { 'mnonce': 'str' },
> +  'returns': 'SevAttestationReport',
> +  'if': 'TARGET_I386' }
> +
>   ##
>   # @dump-skeys:
>   #
> @@ -297,46 +337,6 @@
>     'if': 'TARGET_ARM' }
>   
>   
> -##
> -# @SevAttestationReport:
> -#
> -# The struct describes attestation report for a Secure Encrypted
> -# Virtualization feature.
> -#
> -# @data:  guest attestation report (base64 encoded)
> -#
> -#
> -# Since: 6.1
> -##
> -{ 'struct': 'SevAttestationReport',
> -  'data': { 'data': 'str'},
> -  'if': 'TARGET_I386' }
> -
> -##
> -# @query-sev-attestation-report:
> -#
> -# This command is used to get the SEV attestation report, and is
> -# supported on AMD X86 platforms only.
> -#
> -# @mnonce: a random 16 bytes value encoded in base64 (it will be
> -#          included in report)
> -#
> -# Returns: SevAttestationReport objects.
> -#
> -# Since: 6.1
> -#
> -# Example:
> -#
> -# -> { "execute" : "query-sev-attestation-report",
> -#                  "arguments": { "mnonce": "aaaaaaa" } }
> -# <- { "return" : { "data": "aaaaaaaabbbddddd"} }
> -#
> -##
> -{ 'command': 'query-sev-attestation-report',
> -  'data': { 'mnonce': 'str' },
> -  'returns': 'SevAttestationReport',
> -  'if': 'TARGET_I386' }
> -
>   ##
>   # @SGXInfo:
>   #
> 

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>


