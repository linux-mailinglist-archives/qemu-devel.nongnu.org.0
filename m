Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B06782C8A1F
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Nov 2020 17:59:25 +0100 (CET)
Received: from localhost ([::1]:52096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjmWK-0004CT-Hv
	for lists+qemu-devel@lfdr.de; Mon, 30 Nov 2020 11:59:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kjmUV-000309-JG
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 11:57:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:51733)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kjmUS-0005U7-T1
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 11:57:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606755448;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yPZNKs4SeqcpIKZYOIbWiY9Y9EupZ7FqqB5RnvbAsnw=;
 b=ZqP65hkLXPhPxlmRaAlWVSiBe+lG/mTpTO3lauLoeZqmMdhdAJ3UISfPG1xAUirRR173VZ
 AoG9mci2MuMD6YbLVloYgNavvQS/q6UxxrucHqlpFJZTnJ/4mFvjteeHzLOLF8jDZ/La9Z
 N44pKRVkB/U2zgMsSbqnF0egej7KG4c=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-584-xJiiXkPQMEWWBGGZv8haMQ-1; Mon, 30 Nov 2020 11:57:26 -0500
X-MC-Unique: xJiiXkPQMEWWBGGZv8haMQ-1
Received: by mail-ed1-f69.google.com with SMTP id bt2so7119234edb.12
 for <qemu-devel@nongnu.org>; Mon, 30 Nov 2020 08:57:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yPZNKs4SeqcpIKZYOIbWiY9Y9EupZ7FqqB5RnvbAsnw=;
 b=Rz4tQ3la1ze4faVV5yYClUVwkoE+YIf2YuHBObFb3ydKLHw/AysN8ZYbJmj+fEXO/t
 jyWNsKe/U1hsSZF2IbzoYhwFiCjPHsgzZqoxfrs74TYbGy0g8ATjHdExkIdsSDrFUYnM
 kHZ/8Wc1AyGopK3luNzI0/AMTJxdYY7xav9NorTwJdUAJeOHAjQ6iNOUxay7HYor7lCb
 NFkCgap453U5GkSH33VTvE0DGwMQXjiqXt+39wF67DkbxXW3IxFN03o1hK1zSeV+wRSY
 GcTSY7OlxxP9jOdKczHcRwkHO2aW6n/nWc2UoiabI6u9ancen8QmiYVyWQL4SallZSsY
 wGSQ==
X-Gm-Message-State: AOAM5320d+PazM9Zfddsmpf8I1F+gtF6+/cTC180VsRntv9H4uTU5eaB
 hd9YujdeMrH7rS8WjwH6HtKgQ/j5pPqqzpmHHufgoZrN7wC84V5JXz3/ssON2Khsvo1bTPFKmWE
 nZcQVZZw42MG+D5U=
X-Received: by 2002:a17:906:9452:: with SMTP id
 z18mr19572725ejx.389.1606755444963; 
 Mon, 30 Nov 2020 08:57:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwh7c/Ldbh42JtonZYBap8aQFXRzozYgBkJ/Q44lOTeYM1MZpTANzCn/Ah0HfCSjY0IZqD++Q==
X-Received: by 2002:a17:906:9452:: with SMTP id
 z18mr19572697ejx.389.1606755444704; 
 Mon, 30 Nov 2020 08:57:24 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id v9sm1974302ejk.48.2020.11.30.08.57.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Nov 2020 08:57:23 -0800 (PST)
To: Kevin Wolf <kwolf@redhat.com>
References: <20201130122538.27674-1-kwolf@redhat.com>
 <01d32c8c-5023-6323-bed8-ede08f6ac8a3@redhat.com>
 <20201130154605.GC5078@merkur.fritz.box>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 00/18] qapi/qom: QAPIfy object-add
Message-ID: <a9c1ebf3-ffcc-7312-ce66-a79902d1e9ba@redhat.com>
Date: Mon, 30 Nov 2020 17:57:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201130154605.GC5078@merkur.fritz.box>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.496,
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
Cc: lvivier@redhat.com, thuth@redhat.com, pkrempa@redhat.com,
 berrange@redhat.com, ehabkost@redhat.com, qemu-block@nongnu.org,
 libvir-list@redhat.com, armbru@redhat.com, jasowang@redhat.com,
 qemu-devel@nongnu.org, mreitz@redhat.com, kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 30/11/20 16:46, Kevin Wolf wrote:
> Am 30.11.2020 um 15:58 hat Paolo Bonzini geschrieben:
>> With this series it's basically pointless to have QOM properties at
>> all.
> 
> Not entirely, because there are still some writable properties that can
> be changed later on.

Are there really any (that are not bugs like opened/loaded)? That's also 
why Eduardo and I discussed a class-wide allow_set function for his 
field properties series.

> So with this in mind, I think I'm in favour of completely leaving the
> initialisation of properties on object creation to QAPI, and only
> providing individual setters if we actually intend to allow property
> changes after creation.

The main problem is that it wouldn't extend well, if at all, to machines 
and devices.  So those would still not be integrated into the QAPI schema.

>> So the question is, are we okay with shoveling half of QEMU's backend data
>> model into a single struct?  If so, there are important consequences.
> 
> Yeah, the single struct bothers me a bit, both in the QAPI schema and in
> the C source.

The single struct doesn't bother me _too much_ actually.  What bothers 
me is that it won't be a single source of all QOM objects, only those 
that happen to be created by object-add.  So I start to wonder if QOM as 
it exists now is the right solution for all kind of objects:

- backends and other object-add types (not per-target, relatively few 
classes and even fewer hierarchies)

- machine (per-target, many classes, no hierarchy)

- device (can be treated as not per-target, many many classes, very few 
hierarchies)

- accelerator (per-target, few classes, no hierarchy)

- chardev (ok those are the same as the first category)

If QOM is the right solution, this patch goes in the wrong direction.

If QOM is the wrong solution, this patch is okay but then we have 
another problem to solve. :)

>> The problem with this series is that you are fine with deduplicating things
>> as a third step, but you cannot be sure that such deduplication is possible
>> at all.  So while I don't have any problems in principle with the
>> ObjectOptions concept, I don't think it should be committed without a clear
>> idea of how to do the third step.
> 
> Do you have any specific concerns why the deduplication might not
> possible, or just because it's uncharted territory?

Mostly because it's more or less the same issue that you have with 
BlockdevOptions, with the extra complication that this series only deals 
with the easy one of the four above categories.

> Maybe if we don't want to commit to keeping the ObjectOptions schema,
> the part that should wait is object-add and I should do the command line
> options first? Then the schema remains an implementation detail for now
> that is invisible in introspection.

I don't see much benefit in converting _any_ of the three actually.  The 
only good reason I see for QAPIfying this is the documentation, and the 
promise of deduplicating QOM boilerplate.  The latter is only a promise, 
but documentation alone is a damn good reason and it's enough to get 
this work into a mergeable shape as soon as possible!

But maybe, we could start in the opposite direction: start with the use 
QAPI to eliminate QOM boilerplate.  Basing your work on Eduardo's field 
properties series, you could add a new 'object' "kind" to QAPI that 
would create an array of field properties (e.g. a macro expanding to a 
compound literal?)
.  Something like


+{ 'object': 'InputBarrier',
+  'data': { 'name': 'str',
+            'x-origin': 'int16',
+            'y-origin': 'int16',
+            'width': 'int16',
+            'height': 'int16' },
+  'properties': { 'server': 'str',
+                  'port': 'str' } }

would create a macro QOM_InputBarrier_FIELDS defining properties for the 
following fields of the InputBarrier struct:

     gchar *name;
     int16_t x_origin, y_origin;
     int16_t width, height;

while server and port would only appear in the documentation (or 
alternatively you could leave them out completely, as you wish).
The advantages would be noticeable:

1) the information would be moved in the QAPI schema JSON from the 
beginning, decoupling the conflict-heavy part from the complex question 
of how to expose the QOM schema in the introspection data

2) there would not be any more duplication than before (there would be 
duplication between structs and QAPI schema, but not between structs and 
C code that defines properties).

3) it would be opt-in, so it doesn't put on you the burden of keeping 
the series in sync with new objects that are added (I have one for the 
qtest server for example).  At the same time it would be quite appealing 
for owners of QOM code to convert their objects to field properties and 
get documentation for free.

4) we could special-case 'object' definitions and generate them in the 
system manual as well, since they are also useful to document -object.

Yes it's a huge change but you have the boring part already done.  What 
do you think?

Paolo

>> In the meanwhile, of course I have no problem with deprecating the opened
>> and loaded properties.
> 
> If we decide that we don't want to have the schema at all (which I hope
> we won't decide), I can split the deprecation into separate patches.
> 
> Kevin
> 


