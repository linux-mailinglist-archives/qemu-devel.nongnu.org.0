Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C57E0327FD2
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 14:46:04 +0100 (CET)
Received: from localhost ([::1]:34344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGis7-0005IQ-Qo
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 08:46:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lGirE-0004q1-V7
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 08:45:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31967)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lGirC-0005X1-Oo
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 08:45:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614606305;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qBkEvHxE0hdCL0m4Znb06UBIQE5UTE85fF1PySmco5o=;
 b=XyXOmAMEq6VOa4zD7FDnkHXY9hGNTwMTz5QQea/qFHDMPEss4LgV8ARx9FbLGjU1c03rux
 oD/fH2dDOadKIcxOEePybAx0wLZIVNSr0z/Q6/gXnW7M6ACBkShyHEVM+uqe2ClNhyU6gh
 3FwEd7YvFINsp+seWVYfaGl+BbhtHlg=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-577-1AD7UnTdP_GAABeKPFl8BA-1; Mon, 01 Mar 2021 08:45:04 -0500
X-MC-Unique: 1AD7UnTdP_GAABeKPFl8BA-1
Received: by mail-wr1-f72.google.com with SMTP id z6so689765wrh.11
 for <qemu-devel@nongnu.org>; Mon, 01 Mar 2021 05:45:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qBkEvHxE0hdCL0m4Znb06UBIQE5UTE85fF1PySmco5o=;
 b=ZEltAkMFSosA4h5woOXiCJ2D2g4B6S7pgifxvVkqoQCF7P0mNvEk667O0cB+pDTapj
 j8nvKzdTK3DyjcCF+8545/afPTYNZAHuF2h+fVpHWJVSKB8OhMy3L7yNvOZeFqilCKrJ
 e0CD4CgnwNAMlLgTWn8KaiGhNqt5H2J6Ai7JrMneg0e3TwCTMNxyZqV2ohAAWExRXpyc
 JP9SAMmS1SMFF2A3GnfriRPvkUTwE7qFgjX3yyqG1BXmfT6BgawNK2osRAAr6GS1p+gw
 AP9MUz/wY8yHUzOpl/exI6GgQda76yLAtkJCN6EiZJMU3ISL+OcwIcyw/IvZNUuCZ28D
 z0/Q==
X-Gm-Message-State: AOAM5313fmsnIWsY7+La9BuQVldFZ42FAmr5a7XZH4L9U2DK6PdFO4JJ
 yK0/txggzw2bP4EZ+p872Htljywq3L8pjtAzCmR039WL2KFJ/k+RCfLN9aTVDUhCPrPsJ1+rexm
 c5weYczPswK5BrwlFstH59caA0+WorDJQp3595s0vXklDKgAS3T4f3Nq2vhSsjY1eI3E=
X-Received: by 2002:a1c:2403:: with SMTP id k3mr16123273wmk.130.1614606301609; 
 Mon, 01 Mar 2021 05:45:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwYjPr1bPuxGHO27ZUc2OpH2AcIWpuew+qRjPp24qL9Fl+5W9elaMaNofapG+K0eR8Jl444ew==
X-Received: by 2002:a1c:2403:: with SMTP id k3mr16123245wmk.130.1614606301337; 
 Mon, 01 Mar 2021 05:45:01 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id j12sm12651795wrt.27.2021.03.01.05.45.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Mar 2021 05:45:00 -0800 (PST)
To: Markus Armbruster <armbru@redhat.com>
References: <20210226080526.651705-1-pbonzini@redhat.com>
 <20210226080526.651705-28-pbonzini@redhat.com>
 <87r1kzl2vy.fsf@dusky.pond.sub.org>
 <94db680f-a43f-7f94-a897-5512ceef6b98@redhat.com>
 <878s77hunk.fsf@dusky.pond.sub.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PULL 27/29] vl: deprecate -writeconfig
Message-ID: <51d463b8-29ec-b0b9-fece-d8a7594f7dbe@redhat.com>
Date: Mon, 1 Mar 2021 14:45:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <878s77hunk.fsf@dusky.pond.sub.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 01/03/21 14:26, Markus Armbruster wrote:
>> Didn't really forget; being pretty sure that there's no usage in the
>> wild and having good reasons to remove the code, giving a firm removal
>> date should encourage people to speak up sooner rather than later.
> Second thoughts after agreeing to change something are okay.  Keeping
> them for yourself not so much, because it deprives your reviewers of a
> chance to raise further points.

Sorry about that.

> In this case, the point I didn't make because I wanted to reach
> agreement on contents before nitpicking form: you're not using
> warn_report() the way it wants to be used:
> 
>      /*
>       * Print a warning message to current monitor if we have one, else to stderr.
>       * Format arguments like sprintf(). The resulting message should be a
> ---> * single phrase, with no newline or trailing punctuation.
>       * Prepend the current location and append a newline.
>       */
>      void warn_report(const char *fmt, ...)

I knew about the rules for no newline or trailing punctuation, but I 
didn't remember the other.  I can certainly respin, that said:

- the comment should say "sentence", not "phrase".  For example "a 
single phrase" is a single phrase, while "the resulting message should 
be a single phrase" is a single sentence.

- I'm not sure how to interpret the rule above.  First of all, the 
sentence mixes part that are mandatory part ("no newline", checked by 
checkpatch.pl) is mixed with the style guide ("no trailing punctuation" 
and "a single sentence").  Second, whether a single sentence is better 
often depends on the case.  For example, comparing these four:

WARNING: -writeconfig foo: -writeconfig is deprecated.  It will go away 
in QEMU 6.2 with no replacement

WARNING: -writeconfig foo: -writeconfig is deprecated and will go away 
in QEMU 6.2 with no replacement

WARNING: -writeconfig foo: -writeconfig is deprecated; it will go away 
in QEMU 6.2 with no replacement

WARNING: -writeconfig foo: -writeconfig is deprecated
WARNING: -writeconfig foo: it will go away in QEMU 6.2 with no replacement

The first one is what was in this patch.

The second does sound fine to me and it's probably what I'll use in v2, 
with or without the "in QEMU 6.2" part.  However some could consider it 
to be worse style due to the longer sentence.

The third one is playing with the rules; a semicolon would be separating 
two sentences.  However usage of the semicolon is quite common in error 
messages, so maybe it would be good too?

The last one also complies, but it is not clear what "it" refers to so 
it seems to be the worst in this case.  In other cases it's the obvious 
choice, and we even have an API for it (error_append_hint... however it 
doesn't play well with error_fatal which I'm otherwise a big fan of). 
In this case, not so much.

Paolo


