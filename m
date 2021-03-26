Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84FE334A6A3
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 12:51:29 +0100 (CET)
Received: from localhost ([::1]:35922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPkzw-0004xs-Ki
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 07:51:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lPkyH-00043E-SM
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 07:49:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53061)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lPkyD-0002c5-QY
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 07:49:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616759380;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wdXl5mpheIYY8JQNIoZh6aWnNm5WwVj4QGjmyO+tpBs=;
 b=IfYYde7+ExUp/XQqE8u42qC25EZkH1EUjCRM+ZHVr3NdiBQgaSVmcpkCStUA0B8EyiOezh
 pYLrMxdm+e4DzW7/0saXh/oSar6z60+BTptvr1CCYDjlbFEBG9SLMzSIxW9txuDaRtnLDv
 JWIMgeR3Sgxfu9Ia+dvQt5DEtThm4ZA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-489-1Q6EQAMNPpCYQALMYoucBA-1; Fri, 26 Mar 2021 07:49:38 -0400
X-MC-Unique: 1Q6EQAMNPpCYQALMYoucBA-1
Received: by mail-wm1-f71.google.com with SMTP id a3so648978wmm.0
 for <qemu-devel@nongnu.org>; Fri, 26 Mar 2021 04:49:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wdXl5mpheIYY8JQNIoZh6aWnNm5WwVj4QGjmyO+tpBs=;
 b=EUw76ygcOPNVFjzSYHcx4ImPHCsOfZXKnvx2t5tGd9iB+5DVys49Ch7id4cAsYvrBJ
 0FtRtNQBW3a008D3uqTigUoRC6JYvb4gkLtvGhVplA0oL23ju0epdeSs4PnCjJGpM+xC
 vIdO8pcwZphKTlYIPwKld/32Up5epPMZFEis/cuIBC5JeiDvetzf6EI0/IF5mSlGSd1f
 kUqvLJr3+bpUlFtYYDc7pazzAfZYCN3Xhm88/zKMD1A0H9UVGsfogGdhu7GHJ/GMfD7Y
 IH9sRwC/+gF0Nt4uNRsg9mrThrQffw0cKkwCTeaqFaJXNJkCablENIePUG4hWPvV3o7S
 6KDw==
X-Gm-Message-State: AOAM532o6Sg2GToyxzk2sotcfdmmU5+z/Xsuv8eHGY+uK8HULpWU9/aq
 Caew8sXzWUVitmYrFyI/xnJbdwAZksYitbNUBY8K/Ktr3hGnIikh6wp4FSMz1hUMZBSJgpXvYxX
 +Q6m1ioImsjXzhYQ=
X-Received: by 2002:a05:600c:214d:: with SMTP id
 v13mr12747302wml.162.1616759377368; 
 Fri, 26 Mar 2021 04:49:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwOd3Hq/Zvzqe9L4kJdeqJzEJJGNUBrzz0qeGriv8MKioyA440TB4pflVNn0ORdxjjCGyDw/A==
X-Received: by 2002:a05:600c:214d:: with SMTP id
 v13mr12747286wml.162.1616759377155; 
 Fri, 26 Mar 2021 04:49:37 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id f2sm12511691wrq.34.2021.03.26.04.49.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Mar 2021 04:49:36 -0700 (PDT)
Subject: Re: [PATCH for-6.0] qapi: qom: do not use target-specific conditionals
To: Markus Armbruster <armbru@redhat.com>
References: <20210326100357.2715571-1-pbonzini@redhat.com>
 <87r1k2tc70.fsf@dusky.pond.sub.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <87a68ae5-74fc-cb36-f78e-d40128a23e3c@redhat.com>
Date: Fri, 26 Mar 2021 12:49:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <87r1k2tc70.fsf@dusky.pond.sub.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Tom Lendacky <thomas.lendacky@amd.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 26/03/21 11:57, Markus Armbruster wrote:
>>         'rng-random':                 'RngRandomProperties',
>>         'secret':                     'SecretProperties',
>>         'secret_keyring':             'SecretKeyringProperties',
>> -      'sev-guest':                  { 'type': 'SevGuestProperties',
>> -                                      'if': 'defined(CONFIG_SEV)' },
>> +      'sev-guest':                  'SevGuestProperties',
>>         'throttle-group':             'ThrottleGroupProperties',
>>         'tls-creds-anon':             'TlsCredsAnonProperties',
>>         'tls-creds-psk':              'TlsCredsPskProperties',
> 
> No branch for tag value 'pef-guest', i.e. no tag-specific members.
> There are two more: can_bus, s390_pv_guest.  I assume this is
> intentional.

Yes, they have no properties.

> Links a bit of dead code into the other qemu-system-FOO, but that's
> okay.
> 
> If we genuinely needed (or wanted) target-dependent -object, we'd split
> qom-target.json off qom.json, and put the target-dependent parts there,
> including the enum and the union, with the obvious ripple effects.  Not
> now, maybe not ever.
> 
> Would adding "only for CONFIG_MUMBLE" to the doc comments make sense?
> It's what we did before we had 'if'.

In this specific case we had not documentation at all for objects.  We 
can add the information on relevant targets in the documentation for the 
*Properties types.

Paolo


