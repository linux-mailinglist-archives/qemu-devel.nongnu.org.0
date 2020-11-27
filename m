Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C10F82C68D7
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 16:41:50 +0100 (CET)
Received: from localhost ([::1]:39586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kifsb-000338-PS
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 10:41:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kifqt-0002VQ-Rx
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 10:40:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:27099)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kifqp-000595-3O
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 10:40:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606491597;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OIuhoey/xiIFtAjPf3Gl2HhFkW0NNI/0/TlOxEigPa4=;
 b=ZDxoYvyS1v23H5dg0vaJ1tiPtVPv9vjXuCcUfeu2E4kj74vjqycC4BNKBAYu6BGPi92jzO
 3Qq2NUx2gm3ix2XDygwVPnaa+c1Yh6BWEvkhaZDgXNhfLyq+2MLV8w2q6W1c43cDxOErC8
 mMLW9c5C7PXZ7+9C1+C/nNRfSWL8l8c=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-98-BHtoiJSnOKCprWIkiB_lCQ-1; Fri, 27 Nov 2020 10:39:55 -0500
X-MC-Unique: BHtoiJSnOKCprWIkiB_lCQ-1
Received: by mail-ej1-f72.google.com with SMTP id k2so2059949eji.21
 for <qemu-devel@nongnu.org>; Fri, 27 Nov 2020 07:39:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OIuhoey/xiIFtAjPf3Gl2HhFkW0NNI/0/TlOxEigPa4=;
 b=kcsquG4P79KpnldyJoyjmk77sVQIlu6kgZkZRjVh3k95AqtZwuIjC+zHQ7+IbsRpxd
 mIAVWaTlXM62M0A7lgdF/pDqKMSs58QM0EeL3pYT2PvgcKe4AvTfikzxyC8n1eu7PFYa
 Nd3IH+8TFITuQwHyeu/uvJ4KJhSkmGMPeYaNhpZAPmlwPRCC9Rs17+TJjFCx7Aryduvx
 IcPGX/O6iGmSnpLtBhF0ANmYr67R2qKFbg5u54nUBAff2qoaiDZy2IEuQiOjHHv4m2Pj
 nV0dAmrtNP9OT/7Q4uKt3e4SAIVAbAuZA1KHh2kjFMnu0SbdPtMAPkMiU6k9fBh74uW5
 jNaw==
X-Gm-Message-State: AOAM531QqqU4DMzRw8+M8RyT7fTPuKMhprGyatrRkuukIOovKtQR54Nh
 ZyNaRghadi0VQlCYz4+mCV3B0u7yppDMZWfX9386BbJB1LjG1YAPatM1qzETG6rTCLB4CRtG2Rm
 8FlYNi3MDRDhEHCzNcQYHJDkZECoPYZYPJ789lal3nsRvoF/KKLnU8Viglosr3zhJZDg=
X-Received: by 2002:a17:906:a891:: with SMTP id
 ha17mr623062ejb.116.1606491593093; 
 Fri, 27 Nov 2020 07:39:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwuXDkSD3J5Ly5+EP26+hPR2lg6y7MXNz55id5G8fdIFWJ7wFgJSdA6hgd/PvfM/EZTxxT13A==
X-Received: by 2002:a17:906:a891:: with SMTP id
 ha17mr623036ejb.116.1606491592762; 
 Fri, 27 Nov 2020 07:39:52 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id v8sm5039462edt.3.2020.11.27.07.39.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Nov 2020 07:39:51 -0800 (PST)
To: Markus Armbruster <armbru@redhat.com>
References: <20201111104521.1179396-1-pbonzini@redhat.com>
 <20201111104521.1179396-2-pbonzini@redhat.com>
 <87h7pburdf.fsf@dusky.pond.sub.org>
 <0a15b86b-9ab8-d378-7578-a8304b32870a@redhat.com>
 <87360urhhs.fsf@dusky.pond.sub.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 1/2] keyval: accept escaped commas in implied option
Message-ID: <e07d377e-aeb7-cba0-232d-53726e0a6da2@redhat.com>
Date: Fri, 27 Nov 2020 16:39:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <87360urhhs.fsf@dusky.pond.sub.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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

On 27/11/20 15:39, Markus Armbruster wrote:
>> Nah, just lazy cut-and-paste of the existing error message.  I should
>> rename that error to something "No implicit parameter name for '.key'"
>> (again, different grammar -> different parser -> different error).  That
>> error message actually makes sense: "--object .key" would create an
>> object of type ".key" both without or with these changes.
> However, --object a=b,.key would not, because the sugar is available
> for the leftmost value only.
> 
> "No implicit parameter name" assumes the user intended .key as a value,
> and forgot to write the key.  We could instead assume the user intended
> .key as key, and messed it up (forgot a fragment, fat-fingered '.',
> whatever).  The absence of '=' makes the value assumption more
> plausible, but that's already lookahead.

To be fair, lookahead is a common trick to get better error messages.

The typical example is C's "id1 id2".  After "id1 id2" you already know 
it's a syntax error, but you do some lookahead because "id1 id2;" can be 
recovered as "id1 was supposed to be a type, so treat this as declaring 
a variable id2".  "id1 id2)" is not handled the same way.

Of course that's done for a completely different reason (cascading error 
messages---QEMU only reports the first), but it goes to show that 
parsing ahead is not necessarily a bad idea

> Error messages based on guesses what the user has in mind can be quite
> confusing when we guess wrong.  A strictly factual syntax error style
> like "I expected FOO instead of BAR here" may not be great, but has a
> relatively low risk of being confusing.

This is true.  That's a point in favor of "Expected '=' after parameter".

>>>
>>>
>>>      master:       Invalid parameter 'key.1a.b'
>>>      your patch:   same
>>>
>>>      Slightly better, I think:
>>>
>>>                    'key.1a' is not a valid parameter name
>>
>> Or just "Invalid parameter '1a'".  I'm not going to do that in v2 
>> though, since parameter parsing is not being
> 
> Sentence not being finished?

not being modified.

>> This invocation is useful (for some value of useful) to see which 
>> properties you can pass with -global.  So there *is* a valid (for some 
>> value of valid) use of escaped commas in implied options.  It can be 
>> fixed with deprecation etc. but that would be a more complicated 
>> endeavor than just adjusting keyval.
> 
> The question becomes whether CLI help syntax is subject to the
> compatibility promise.

Indeed.  But I still don't see it as a good reason _not_ to do the 
change, as I find the modified definition (grammar, code, etc.) to be 
easier on the brain too.

Paolo


