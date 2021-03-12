Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24FCF3387DF
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 09:50:09 +0100 (CET)
Received: from localhost ([::1]:46784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKdUm-0001PN-56
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 03:50:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lKdRq-0000AC-60
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 03:47:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55975)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lKdRo-0008UK-O1
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 03:47:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615538821;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dIVZs+1fGQsW6iD0vUhJUeyRs/A8KQfrg8+97NDdl7k=;
 b=ecaolHYJDOt/r8z8QZsPQilG5X3hffljMHhSXFumHaW8ytDmNm1UYT8tagCScjwmABXC8L
 fMp8MH9sCRv1+h3QdQwmfvt+EYHsJGRUndiqIJRUcMr1powKkbijUm5YXMNDwz2L1vpkfi
 3w977/V0WsSbsaEXqqJu3L0M6QVScBg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-93-939JT1CHOB60oDgmlE5n1w-1; Fri, 12 Mar 2021 03:46:57 -0500
X-MC-Unique: 939JT1CHOB60oDgmlE5n1w-1
Received: by mail-wm1-f72.google.com with SMTP id y9so1841218wma.4
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 00:46:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dIVZs+1fGQsW6iD0vUhJUeyRs/A8KQfrg8+97NDdl7k=;
 b=GKNcB0B0+iOOVFrvfzwBCB2TNdwdcQ4Y5yLlzwx0PiXLO6o3gTZeXIiQIfDOtupJyq
 65kSqXny/X53aWlgxdVzauTEIL6gl9ZBL4a5wPqxRZb0RcKFTW9D1EpvwPaHi6aGCsSo
 zHGROSo8rv3iVZ3gldGGjbUZqcKuQujQvaebHjjIaCev5mt/iZgBTmjL+9gVDxMTwqax
 AkA8Th4bwIkZVFXIYV6qv0fLmEyZsojIK3mszs8wRXjlrHM0BngnapEBAWWApWuaonlW
 J7lG6E6CrEQjmAVCtiqt+VjkWaAOhl8ARz4x2tCXx1ajKUBLNJQTNZg2A5mzhyFGneFe
 F0XA==
X-Gm-Message-State: AOAM5314jvuaCvlfKJL2XVic7G/QU49ZQh9ShHhIWos7IL2kxXkcA59E
 9FeW0hbBpKuW0A6QlLZ0xau9dEqAojPWHwGoTAXbZmIXblBtGA/TzIyWOfb9JuGEoJ/zlYV4bQI
 v6qoYK4LtpiTysN0=
X-Received: by 2002:a7b:c050:: with SMTP id u16mr12024380wmc.90.1615538816582; 
 Fri, 12 Mar 2021 00:46:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxdQc3QwkVpyhP8QwF2uhoeh7SmH2BUj/mSv8V4tZAeJeImqtgsMLQo//p1QafA1fL7O67oYA==
X-Received: by 2002:a7b:c050:: with SMTP id u16mr12024357wmc.90.1615538816417; 
 Fri, 12 Mar 2021 00:46:56 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:63a7:c72e:ea0e:6045?
 ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id c128sm23331761wme.3.2021.03.12.00.46.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Mar 2021 00:46:55 -0800 (PST)
Subject: Re: [PATCH v3 00/30] qapi/qom: QAPIfy --object and object-add
To: Markus Armbruster <armbru@redhat.com>
References: <20210308165440.386489-1-kwolf@redhat.com>
 <YEjWQnWKbr5teciB@angien.pipo.sk>
 <90130a0c-7f96-f344-b185-b790c5d6b78a@redhat.com>
 <20210310173044.GF6076@merkur.fritz.box> <87ft12q8kf.fsf@dusky.pond.sub.org>
 <e98a5eb7-4716-a0f4-0ad2-adaa4cd9cefa@redhat.com>
 <87h7lhbx6b.fsf@dusky.pond.sub.org>
 <10fd7cbf-9ee5-3869-22fd-352e42a980ba@redhat.com>
 <871rck7pqw.fsf@dusky.pond.sub.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <82b6906c-956e-89a2-e76f-7ad6695009b0@redhat.com>
Date: Fri, 12 Mar 2021 09:46:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <871rck7pqw.fsf@dusky.pond.sub.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, lvivier@redhat.com, thuth@redhat.com,
 Peter Krempa <pkrempa@redhat.com>, ehabkost@redhat.com, qemu-block@nongnu.org,
 libvir-list@redhat.com, jasowang@redhat.com, qemu-devel@nongnu.org,
 mreitz@redhat.com, kraxel@redhat.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/03/21 09:14, Markus Armbruster wrote:
> Paolo Bonzini <pbonzini@redhat.com> writes:
> 
>> On 11/03/21 15:08, Markus Armbruster wrote:
>>>> I would rather keep the OptsVisitor here.  Do the same check for JSON
>>>> syntax that you have in qobject_input_visitor_new_str, and whenever
>>>> you need to walk all -object arguments, use something like this:
>>>>
>>>>       typedef struct ObjectArgument {
>>>>           const char *id;
>>>>           QDict *json;    /* or NULL for QemuOpts */
>>>>           QSIMPLEQ_ENTRY(ObjectArgument) next;
>>>>       }
>>>>
>>>> I already had patches in my queue to store -object in a GSList of
>>>> dictionaries, changing it to use the above is easy enough.
>>>
>>> I think I'd prefer following -display's precedence.  See my reply to
>>> Kevin for details.
>>
>> Yeah, I got independently to the same conclusion and posted patches
>> for that.  I was scared that visit_type_ObjectOptions was too much for
>> OptsVisitor but it seems to work...
> 
> We have reason to be scared.  I'll try to cover this in my review.

Yes, it's a good reason to possibly even delay those 3 patches to 6.1.

Paolo


