Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41B0C4B6DC4
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 14:38:18 +0100 (CET)
Received: from localhost ([::1]:52592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJy24-0008Ji-QS
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 08:38:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nJxt0-0001jc-15
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 08:28:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23116)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nJxss-0005pa-Sa
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 08:28:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644931708;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FpUBHN1+RNci0IqUmjnEywyqomyoqhnl4GvykeD1GMk=;
 b=gPP0lus/X2mD7ZLIyxZi5q01FsG7UTlTl/aW3KusFrdfyJcxHxFLYeApbTtsVBWcKePZnU
 r+qp52zS9mUpqp3AFnPpv3G2gP77I1lIGhOCVDp9yKQZG+ob48fETqBfWbwkfxbdtlFQAw
 QXYDkot0Tj0w1jVIw/CjcdLq8wf5x9A=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-470-8Q-vMJNqNxCRN_T_wws9jQ-1; Tue, 15 Feb 2022 08:28:27 -0500
X-MC-Unique: 8Q-vMJNqNxCRN_T_wws9jQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 v17-20020adf8b51000000b001e336bf3be7so8393936wra.1
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 05:28:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=FpUBHN1+RNci0IqUmjnEywyqomyoqhnl4GvykeD1GMk=;
 b=cQGx3aVLwqc3e3TIWPYh6IeN+dnB7rCHclzbq0K2vRnwreaaaDrc7PGr71swZk2QAz
 gQEwxl66xRgqB6JopsylDDE7LtM/AYup+BCQlpzQcTdM4o/7Kz7rgX/78NKt1lt7IbxG
 GWJJQLWRma/XyWPB4+7qJ1z7R55PvAyKl/f9SpoCPW2hUcbj/3Z4645weEozP0EWbrvQ
 9WRLf7VknethPvhGYYUw0habQcGp2T1jSN3dmApNg7tZL3+rp2ATumNeVuO6z2+XKc8O
 bONnbEuZPVYDbIzbr3FW7+jC99SY45BIaWWSQfdFtXuKJoU+O9RjX2JI2E9sqaD4x66e
 vjHA==
X-Gm-Message-State: AOAM5327gVNmo/pSmgkvlP2saSsdKJ9GtLRCVGlNh1tnhYfhuYM+aQ2v
 g4TDgp/KXAuF6wBFOaxN4mRzas0a1HCZEoAhw5CZAwbZIp0t4qVb+2dj6BdWvr89YlypYu27TES
 NL2CyYWY/Vyb6r3w=
X-Received: by 2002:a05:6000:1010:: with SMTP id
 a16mr3365795wrx.278.1644931706491; 
 Tue, 15 Feb 2022 05:28:26 -0800 (PST)
X-Google-Smtp-Source: ABdhPJySMOkmoWPAATtWj3n9VSQdgOrj0TTPVQHbefABxJPRqclaVil/UDEVFYzMdrexcrWwCPWWZw==
X-Received: by 2002:a05:6000:1010:: with SMTP id
 a16mr3365766wrx.278.1644931706188; 
 Tue, 15 Feb 2022 05:28:26 -0800 (PST)
Received: from [10.33.192.183] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id c8sm19125547wmq.39.2022.02.15.05.28.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Feb 2022 05:28:25 -0800 (PST)
Message-ID: <804188e2-6426-6fe2-f8c3-70316e5c7c44@redhat.com>
Date: Tue, 15 Feb 2022 14:28:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/6] tests/qemu-iotests: Improve the check for GNU sed
From: Thomas Huth <thuth@redhat.com>
To: Eric Blake <eblake@redhat.com>
References: <20220208101311.1511083-1-thuth@redhat.com>
 <20220208101311.1511083-2-thuth@redhat.com>
 <8332fa43-9e77-34f3-c012-062342d62c92@redhat.com>
 <dd7f32dd-807c-d389-1f19-323141178bba@redhat.com>
 <1d5f544a-8362-6932-2f2a-6fd5f8e53978@redhat.com>
 <10264836-2ca6-c134-5eb9-018ef618edc1@redhat.com>
 <4cc4a814-3dba-11ab-3643-76ba974476c8@amsat.org>
 <80372081-ca28-7566-9fa7-6e6820a7b37f@redhat.com>
 <20220211161410.sbxfy7tf7patm25i@redhat.com>
 <e5d38a7d-93a2-beb9-c621-838c8ed43231@redhat.com>
In-Reply-To: <e5d38a7d-93a2-beb9-c621-838c8ed43231@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/02/2022 17.48, Thomas Huth wrote:
> On 11/02/2022 17.14, Eric Blake wrote:
>> On Tue, Feb 08, 2022 at 03:52:19PM +0100, Thomas Huth wrote:
>>>>> The current code with $SED has been introduced almost three years
>>>>> ago already...
>>>>>
>>>>>>    Can’t we just do `alias sed=gsed`?
>>>>>
>>>>> Maybe ... but let's ask Philippe and Kevin first, who Signed-off
>>>>> commit bde36af1ab4f476 that introduced the current way with $SED:
>>>>> What's your opinion about this?
>>>>
>>>> This commit was to have check-block working on the OpenBSD VM image.
>>>
>>> Sure. The question was whether using an alias as suggested by Hanna would be
>>> nicer instead of using $SED ?
>>
>> Scripting with aliases becomes a nightmare to debug, since it is
>> relatively uncommon.  In particular, in bash, you have to explicitly
>> opt in to using aliases (contrary to POSIX sh where aliases are
>> available to scripts at startup).
> 
> shopt -s expand_aliases
> ... as I just learnt the hard way ;-)
> 
>> Using $SED everywhere may require
>> more hunting, but it is more obvious when reading a test that "oh
>> yeah, I might be using extensions that the default 'sed' can't
>> support" than a script that blindly uses 'sed' and depends on it
>> aliasing to a more-capable sed at a distance.
>>
>> The other question is how many GNU sed features are we actually
>> depending on?  Which tests break if we have BSD sed or busybox sed?
>> Can we rewrite those sed scripts to avoid GNU extensions?  But
>> auditing for s/sed/$SED/ seems easier than auditing for which
>> non-portable sed extensions we depend on.
> 
> The most obvious part are the filter functions in common.filter - we're 
> using "-r" here that is not part of the POSIX sed as far as I can see.

Now that I stepped through the list, the other major part that is failing on 
non-GNU seds are the statements that use "\r" or "\n" or "\e" to replace 
special characters. That seems to be a non-POSIX extension, too.

But for running with Alpine, there is also the additional problems that the 
libc uses slightly different error strings, e.g. "I/O error" instead of 
"Input/output error", see e.g.:

  https://gitlab.com/thuth/qemu/-/jobs/2094869856

Maybe it could be fixed with some extensions to the filters, but I'm not 
sure whether we really want to go down that road...?

  Thomas


